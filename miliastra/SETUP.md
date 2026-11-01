# 一閃 ISSEN 幻境版 セットアップ

`issen.html` を、原神「星々の幻境」（Ver. 7.1 以降の Client Controls と Lua）に移植したものです。ゲーム本体はクライアントの Lua で動きます。保存・日付・ランキング・実績はサーバーのノードグラフが担当します。

想定は **1人用ステージ**です。Lua から送ったシグナルの送信元は常にステージになるので、サーバー側は `player(1)` を前提にしています。

## 全体の構成

```
[クライアント] miliastra/lua/Issen/Main.lua
   │ 読む: プレイヤーのカスタム変数 iss_ready / iss_save / iss_now / iss_tz
   │ 送る: シグナル issen_save（Integer List）、issen_run（Integer × 7）
   ▼
[サーバー]
   ├ SaveBridge（エディタで手組み）
   │    In-game Save ⇄ iss_save の受け渡し。構造体を扱うのでここだけ手組みになる
   └ _GSTS_Issen（genshin-ts: miliastra/server/src/issen.ts）
        日付（iss_now / iss_tz）、ランキング、実績
```

保存データは Lua が組み立てる 24 個の整数リストで、中身は Lua だけが解釈します。サーバーは受け取ったリストをそのまま保存し、次回入場時に返すだけです。

| 位置 | 内容 | 位置 | 内容 |
| --- | --- | --- | --- |
| 1 | 形式（1 固定） | 10 | 消音（0/1） |
| 2 | ベストスコア | 11 | ミッションの日 |
| 3 | 累計 XP | 12–14 | ミッション進捗 |
| 4 | 累計撃破 | 15–17 | ミッション達成（0/1） |
| 5 | プレイ回数 | 18 | 最長の連続日数 |
| 6 | 最大コンボ | 19 | 紙一重の累計回数 |
| 7 | 選んだ色 | 20–24 | 予備 |
| 8 | 連続日数 | | |
| 9 | 最後に遊んだ日 | | |

日の区切りは、サーバー時刻の 04:00 です（原神のデイリー更新と同じ）。ミッション3つは、日付を種にした乱数で Lua 側が決めます。

---

## 1. 画像を3つ用意する

UI の画像ライブラリから、**白（か白に近い色）** の次の3つを選びます。色は Lua で付けるので、元画像は白にしてください。

| 用途 | 形 | 使う場所 |
| --- | --- | --- |
| Dot | 塗りつぶしの円 | 自機、速い敵、半分に割れる演出 |
| Ring | 円の輪郭（線の円） | 普通の敵、衝撃波、開始の輪 |
| Rect | 塗りつぶしの正方形 | 軌跡、火花、斬撃線、ゲージ、背景、四角い敵 |

画像の余白が大きいと当たり判定と見た目がずれます。できるだけ余白のない画像を選んでください。

次の画像は、Lua が `SetImage`（StaticReference）で Dot テンプレートの絵を差し替えて使うので、用意は不要です。ID は Hajiki で確認済みのものです。

| ID | 絵柄 | 使う場所 |
| --- | --- | --- |
| 103001〜103007 | 元素アイコン | タイトルの色選び（雷 103001／炎 103002／氷 103003／草 103004／岩 103005／水 103006／風 103007） |
| 104002 | 四芒星のきらめき | 氷元素のヒットエフェクト |

## 2. Client Control Template を6つ作る

UI Control Group Library の Client Control Templates に作り、それぞれの **Template Index** を控えておきます。

| 名前（任意） | 種類 | 設定 |
| --- | --- | --- |
| ISS_Dot | ImageControl | 画像 = Dot |
| ISS_Ring | ImageControl | 画像 = Ring |
| ISS_Rect | ImageControl | 画像 = Rect |
| ISS_Text | TextBoxControl | 文字色は何でもよい（Lua が上書きする） |
| ISS_Group | ContainerControl | 空のまま |
| ISS_Btn | KeyHintControl（Button Hint） | 操作キーはLuaが設定 |

位置・大きさ・アンカー・色は、すべて Lua が実行時に設定します。

## 3. Client Control Container を置く

1. Interface Layout に **Client Control Container** を追加し、画面全体を覆う大きさにします。ステージ開始時から表示される状態にしてください。
   - Control Group テンプレート経由で出す場合は、プレイヤー生成時に「Activate UI Control Group in Control Group Library」で有効化します。
2. コンテナのキャンバスに、画面全体に広げた **ContainerControl** を1つ置きます（これがルート）。
3. ルートの子に **CursorEventArea** を置き、名前を `Input` にします（大きさは Lua が画面全体に広げます）。

ルートの次の設定は、Lua が起動時に上書きします。
- `showCursor = true`
- `disableCursorEventPassthrough = true`
- `disableKeyEventPassthrough = true`

最後の設定は、プレイ中にキャラクターが動いたり攻撃したりしないようにするためのものです。

## 4. Lua スクリプトを登録する

1. `miliastra/lua/Issen/Main.lua` を、セーブの `external_lua_file/Issen/Main.lua` にコピーします。
2. Client Script Resource Explorer で Script Mapping を作り、そのファイルを紐付けます。
3. 手順3のルート ContainerControl の Script タブで、このスクリプトを付けます。
4. 「Edit Script Variables」で次の変数を作ります。

| 変数名 | 型 | 値 |
| --- | --- | --- |
| `TPL_DOT` | Client Control ID | ISS_Dot の Template Index |
| `TPL_RING` | Client Control ID | ISS_Ring の Template Index |
| `TPL_RECT` | Client Control ID | ISS_Rect の Template Index |
| `TPL_TEXT` | Client Control ID | ISS_Text の Template Index |
| `TPL_GROUP` | Client Control ID | ISS_Group の Template Index |
| `TPL_BTN` | Client Control ID | ISS_Btn の Template Index。コントローラーのボタン記号表示に使用 |
| `TPL_INPUT` | Client Control ID | （任意）`Input` を置かずテンプレートから作る場合のみ |

効果音は Integer 型の変数で、音声ライブラリの ID を入れます。未設定や 0 の音は鳴りません。

| 変数名 | 鳴る場面 | 選び方の目安 |
| --- | --- | --- |
| `SFX_DASH` | ダッシュ | 短い風切り音 |
| `SFX_KILL1`〜`SFX_KILL5` | 斬ったとき | **音程が段々上がる5音**。コンボ4ごとに1段上がる |
| `SFX_WHIFF` | 空振り | 低く鈍い音 |
| `SFX_BOOM` | 四角い敵の爆発 | 爆発音 |
| `SFX_MULTI` | 1回で2体以上 | 和音・キラッとした音 |
| `SFX_COMBO` | コンボ 10・25・50… | 上昇するアルペジオ |
| `SFX_DEATH` | 死亡 | 重い衝撃音 |
| `SFX_TICK` | 結果画面のカウントアップ | ごく短いクリック音 |
| `SFX_MISSION` | ミッション達成 | 2音のチャイム |
| `SFX_LEVEL` | レベルアップ | ファンファーレ |
| `SFX_BEST` | 自己ベスト更新 | 祝福音 |
| `SFX_UI` | 色の変更・消音・リトライ | 軽いクリック音 |

Web 版はコンボに合わせて音程を合成していました。幻境ではピッチを変えられないので、`SFX_KILL1`〜`5` に高さの違う音を割り当てて代わりにします。

## 5. シグナルを定義する（Signal Manager）

パラメータの**順番と型**を、この通りに合わせてください。

| シグナル名 | パラメータ |
| --- | --- |
| `issen_save` | `v`: Integer List |
| `issen_best` | `score`: Integer（プレイ終了ごとの保存済みベストスコア） |
| `issen_run` | `score`, `best`, `maxCombo`, `maxStreak`, `level`, `kills`, `closeCalls`: すべて Integer |
| `issen_exit` | なし（タイトルの「ステージを終了」） |

## 6. プレイヤーのカスタム変数を作る

プレイヤーエンティティの Custom Variable コンポーネントに追加します。

| 変数名 | 型 | 書く側 | 用途 |
| --- | --- | --- | --- |
| `iss_ready` | Integer | SaveBridge | 1 になったら Lua が保存データを読む |
| `iss_save` | Integer List | SaveBridge | 保存データ（24 個） |
| `iss_now` | Integer | _GSTS_Issen | 入場時の時刻（UTC+0 のタイムスタンプ） |
| `iss_tz` | Integer | _GSTS_Issen | サーバーのタイムゾーン |

## 7. In-game Save を設定する（Manage In-game Save）

1. In-game Save 構造体 `IssenSave` を作ります。メンバーは `v`（Integer List、**長さ 24**、既定値はすべて 0）の1つだけです。
2. In-game Save テンプレートを作り、データ項目を1つ追加します。名前は例として `IssenSaveData`、構造体は `IssenSave`、**最大長 1** にします。
3. そのテンプレートの In-game Save スイッチをオンにします。保存項目の表示名と、ノードから参照する内部変数名は異なります。対象ステージ `1073741834` の内部名は `1_chip_1` です（保存できている `1073741829` でも同じ）。Get / Set Custom Variable では表示名 `IssenSaveData` ではなく、この内部名を指定してください。別ステージでは保存項目を選択して実際の内部名を確認します。

公開後に構造を変えるときは、追加だけにしてください。メンバーの削除や型の変更をすると、プレイヤーの保存データがリセットされます。保存データ内の位置 20〜24 は、将来の追加用に空けてあります。位置 19 は紙一重の累計回数で、未記録の旧データは 0 回として読み込みます。

## 8. SaveBridge を手で組む

プレイヤーエンティティにノードグラフを1つ追加し、名前を `SaveBridge` にします。

> 名前を `_GSTS` で始めないでください。genshin-ts の inject に上書きされます。

genshin-ts は構造体ノード（Split / Assemble Structure）に対応していないので、このグラフだけ手で組みます。

**A. 入場時に保存データを Lua へ渡す**

```
When Entity Is Created
 → Get Custom Variable（Self, "1_chip_1"）                … 構造体のリスト
 → Get Corresponding Value From List（index 0）
 → Split Structure（IssenSave）→ v
 → Set Custom Variable（Self, "iss_save", v）
 → Set Custom Variable（Self, "iss_ready", 1, Trigger Event = はい）
```

初めて遊ぶ人は v がすべて 0 です。その場合、Lua は新規データとして扱います。

**B. Lua から届いた保存データを書き込む**

```
Monitor Signal（issen_save）→ v
 → Assemble Structure（IssenSave, v）
 → Assembly List（その構造体1つ）
 → Set Custom Variable（Self, "1_chip_1", リスト）
 → Set Custom Variable（Self, "iss_save", v）     … 再接続後の Lua が最新を読めるように
```

`iss_ready` を立てるまで、Lua はタイトルに「読み込み中」と表示し、保存データを送りません。4秒たっても立たない場合はオフラインで遊べますが、そのときの進行は保存されません。読み込む前に既定値で上書きして、本来の保存データを消してしまわないための仕組みです。

## 9. ランキングと実績を作る（Manage Peripheral System）

- **Leaderboard**: 「ベストスコア」（整数、大きい方が上位）を1つ作ります。
  - ランキングの序号は **1** です。プレイ終了のたびに、`issen_best` で保存済みベストスコアを記録します。同点・未更新でも送るため、ランキング導入前のベストも次のプレイ終了時に登録されます。オフライン時は送信しません。
- **Achievements**: 次の ID で進捗カウント型の実績を6つ作ります。

| ID | 実績 | 送られる値 | 達成条件 |
| --- | --- | --- | --- |
| 2 | 撃破 | 累計撃破数 | 例: 1000 体 |
| 3 | コンボ | 最大コンボ | 例: 50 |
| 4 | 連続プレイ | 最長の連続日数 | 例: 7 日 |
| 5 | レベル | レベル | 例: Lv 10 |
| 6 | 初プレイ | プレイ終了時に 1 | 1 |
| 7 | 紙一重を累計100回起こす | 紙一重の累計回数 | 100 回 |

実績はプレイ終了時に更新します。紙一重の回数は終了したプレイをまたいで累積し、保存データの位置 19 に記録します。中断してタイトルに戻ったプレイは、既存の撃破数と同じく累計に含めません。旧データに記録のない過去の回数は復元しません。`issen_run` の末尾には `closeCalls`（Integer）を追加してください。

送る値はどれも増えるだけの累計なので、実績の進捗が下がることはありません。

## 10. genshin-ts のグラフを入れる

1. プレイヤーエンティティにノードグラフをもう1つ追加し、名前を空のままにします（inject で `_GSTS_Issen` になります）。ID を控えておきます。
2. `miliastra/server/src/issen.ts` 冒頭の値を、ステージに合わせて書き換えます。
   - `GRAPH_ID`: 手順1のグラフ ID
   - `LEADERBOARD_BEST`: ランキングの序号
   - `ACH_*`: 実績の序号
3. `miliastra/server/gsts.config.ts` の `inject` のコメントを外し、`playerId` と `mapId` を入れます。`mapId` は `npm run maps` で確認できます。
4. Stage Settings の精算の設定で、Settlement Screen Type を **Personal Settlement**（個人で精算）にします。
   - タイトルの「ステージを終了」を押すと、このグラフが `issen_exit` を受けて **Settle Stage** を呼び、ステージが終わります。
   - ステージを出るときに In-game Save が書き込まれます。
5. **エディタを閉じてから**ビルドし、エディタを開き直します。

   ```bash
   cd miliastra/server
   npm install
   npm run build
   ```

## 11. 英語に対応させる（多言語テキスト）

画面の文字はすべて Lua の `tr("キー")` を通して出ています。

- `tr` は Script Text Variable `issen.<キー>` を `game.GetText` で引き、クライアントの言語に合った文字を返します。
- 登録がないキーや翻訳がない言語では、Lua に書いてある日本語（`SOURCES`）を出します。CSV を取り込む前でも表示は崩れません。

1. Manage Multi-language Text の Script Text Variables に、[translation-lua.csv](translation-lua.csv) を取り込みます。Hajiki と同じ形式です（UTF-8 BOM 付き、列はテキストマッピングID／翻訳が必要かどうか／日本語／英語）。
2. Test Play でゲームの言語を英語にし、英語で表示されるか確かめます。

文字を足したり直したりするときの手順:

1. `lua/Issen/Main.lua` の `SOURCES` に日本語を書く。
2. [tools/make-translation-csv.js](tools/make-translation-csv.js) の `EN` に英語を書く。
3. `miliastra/` で `node tools/make-translation-csv.js` を実行して CSV を作り直す。英語が抜けていたり、`%s` の数が日本語と違ったりすると、エラーで止まります。
4. エディタに取り込み直す。

他の言語を足すときは、CSV に列を足してください。ロゴの「一閃」は翻訳しません。

## 12. Test Play で確かめること

Sandbox Log の Client Scripts を見ながら遊んでください。Lua の問題は `issen:` で始まるログに出ます。

| 確認すること | ずれていたときの直し方 |
| --- | --- |
| タップした位置と自機の向かう先が合っているか | `CursorEventData:GetUIPos()` とキャンバス座標のずれ。ルートのコンテナが画面全体を覆っているか確認 |
| 敵を斬ったとき、輪が斬撃線に沿って**左右に**割れるか | `halfSetup` の `Enum.ImageFillRadialType.Right` を Top/Left/Bottom に変えて合わせる |
| 文字の大きさと位置 | `text()` の幅計算（`size * (文字数 * 1.1 + 1)`）を調整 |
| 一度ステージを出て入り直すと、ベストや XP が残っているか | SaveBridge の B が動いているか、`IssenSaveData` が有効か確認 |
| タイトルの「更新まで」がサーバー時刻 04:00 までの残り時間になっているか | `iss_tz` の単位（時間／分／秒）は Lua が自動判定する。おかしければ `tzSeconds()` を確認 |
| ランキングと実績が更新されるか | `issen_run` の定義順と `issen.ts` の ID |
| コントローラーで遊べるか | 下の操作表 |
| タイトルの元素アイコンが正しい絵で出るか | `COLORS` の `icon` の ID |
| 「ステージを終了」を2回押すと、精算画面が出てステージが終わるか | `issen_exit` の定義と、`_GSTS_Issen` が inject されているか |
| 右上の「中断」が、右上隅の敵を狙ったタップを邪魔しすぎないか | `drawHUD` のボタン位置と大きさ |

## 操作

| 操作 | マウス・タッチ | コントローラー |
| --- | --- | --- |
| 狙う | タップした場所 | 左スティック（自機から照準線が出る） |
| 斬り抜ける | タップ | A または RT |
| ゲーム開始 | 輪を斬る | A（スティックを倒していなければ輪を狙う） |
| 元素（色）を変える | タイトル下のアイコン | RB |
| 消音 | 右上の「音」 | X |
| 中断 | 右上の「中断」 | B |
| 中断から戻る／タイトルへ | 「続ける」／「タイトルへ」 | A／B |
| もう一度 | 結果画面をタップ（PC は Space も） | A |
| 結果からタイトルへ | 「タイトルへ」 | B |
| ステージを終了 | タイトル左上のボタンを3秒以内に2回 | タイトルで B を2回 |

ボタンは幻境の既定のキー割り当てに合わせています（A = Jump、B = Normal Attack、X = Interact、RB = Sprint、RT = Skill 1）。

上の操作表はXbox表記の例です。ゲーム内の記号は `TPL_BTN` のKey Hint Controlで表示し、操作名は翻訳テキストを使います。続ける・斬る・再挑戦は `JumpKey`、中断・タイトルへ・終了は `NormalAttackKey`、元素は `SprintKey`、音は `InteractKey` を指定します。Xbox／PlayStationそれぞれの記号表示はTest Playで確認してください。追加文言 `issen.action.*` を使うため、更新した `translation-lua.csv` をScript Text Variablesに再インポートしてください。

`TPL_BTN` 未設定の環境では記号を省略し、操作名だけを表示します（Playgroundの既成テンプレートIDは未確認のため補完しません）。

中断からタイトルへ戻ったプレイは記録しません（ミッションの進捗や XP も入りません）。

## 難易度の上昇

プレイ開始時のレベルに応じて、難易度用の時間を `(レベル - 1) × 0.5秒` 進めて開始します。上乗せは最大10秒（Lv21以降）です。Lv1は従来どおり、Lv10は4.5秒、Lv20は9.5秒進んだ出現頻度・敵種・速度から始まります。プレイ途中のレベル変更では難易度を飛ばさず、次のプレイに適用します。

敵の速度上昇は難易度用の時間が300秒になるまで続きます。上昇率は従来のままなので、2分以降は従来より速くなります。出現間隔の下限は従来どおり基準0.32秒（乱数の揺らぎあり）です。実プレイ時間は別に計測し、中断やスローの扱いは従来と同じです。

## 色と元素

初めは墨（黒）です。レベルが上がると、7元素の色が Hajiki と同じ配色で手に入ります。元素の色を選ぶと、敵を斬るたびにその元素のヒットエフェクトが出ます。演出は Hajiki と同じものを、Issen の大きさに合わせて移しました。

| Lv | 元素 | ヒットエフェクト |
| --- | --- | --- |
| 2 | 炎 | 火の粉が舞い上がって消える |
| 4 | 水 | 波紋が3重に広がり、しずくが落ちる |
| 6 | 氷 | ひびが走り、きらめきが残る。ヒットストップが少し長い |
| 9 | 雷 | 前に斬った敵（またはダッシュの始点）から稲妻が走る |
| 12 | 風 | 破片が渦を巻いて飛び、弧が回る |
| 16 | 岩 | 四角いかけらが落ちて跳ね、画面が重く揺れる |
| 20 | 草 | 葉が裏返りながらひらひら落ちる |

## Web 版との違い

- **音**: 効果音は合成ではなく音声ライブラリの音を使います。コンボで音程が上がる演出は、5段階の音の切り替えで近づけています。
- **端末の振動**: ありません。
- **保存先**: ブラウザの保存ではなく、幻境の In-game Save に保存します。
- **ランキングと実績**: 幻境標準の機能で追加しました。
- **元素の色とヒットエフェクト、中断、ステージ終了**: 幻境版だけにあります。Web 版の解放色は、元の8色のままです。
- **見た目**: 紙色の背景は Lua が全画面に描きます。フォントは幻境標準です。衝撃波の輪は、太さが変わらないよう短い線をつないで描いています。
- **動きを減らす設定**: Web 版にあった、端末の設定に合わせて揺れを弱める処理はありません。

## MiliUI Playground で見た目を確認する

Script Variables の `TPL_*` が1つも設定されていないとき、`Main.lua` は MiliUI Playground 組み込みのテンプレートを使います。
- 使う ID は 910001 コンテナ／910002 画像／910003 文字／910005 クリック領域です。
- 画像は `SetImage` で 100002 円／100006 輪／100001 四角に差し替えます。

1. https://mypingo.github.io/MiliUI-Playground/ を開き、`Main.lua` の中身をエディタに貼って Run します。
2. 4秒ほどでオフライン状態のタイトルが出ます。
3. 保存データがある状態（全元素解放など）を試すときは、Signals → Custom Variables で次を設定します。`iss_ready` を最後に入れると、その場で読み込みます。
   - `iss_save`: List で `[1,120,9200,10,2,5,1,2,0,0,0,0,0,0,0,0,0,0]`（Lv 20・炎を選択）
   - `iss_now`: Integer で現在の UNIX 秒
   - `iss_tz`: Integer で 9
   - `iss_ready`: Integer で 1

2026-10-21 に Playground（0.1.0-alpha.32）で、次のことを確認しました。
- タイトル、プレイ、結果、中断の画面が表示されること
- 保存データの読み込みと日付の扱い（「連続 1 日プレイ中」、更新までの残り時間）
- 7元素すべてのヒットエフェクト
- 「ステージを終了」の2回押し

Playground では再現できないこと:

- **扇形の塗り**（`SetFillRadial360`）: 半分に割れる輪と風の弧が、全周の輪に見えます。Lua は `pcall` で呼んでいるので止まりません。
- **`AddIntList`**: 保存のシグナル `issen_save` は失敗します（ログに出るだけで、ゲームは続きます）。`issen_run` と `issen_exit` は送れます。

## Lua の自動テスト

幻境 API の厳密なモックの上で、ボットが `Main.lua` を遊びます。存在しない API を呼んだり、NaN を渡したり、整数でない値をシグナルで送ったりすると失敗します。

```bash
git clone https://github.com/haminpants/miliastra-lua-api
cd miliastra/test
npm install
MILILUA=<clone先>/library npm test
```

付けられる環境変数:

- `OFFLINE=1`: サーバーが保存データを返さない場合の動きを確かめます。
- `EN=1`: `translation-lua.csv` の英語で遊び、日本語が残った表示を一覧にします（ロゴの「一閃」だけが残るのが正常です）。

幻境はスクリプト本体のローカル変数に自前の分を足すため、テストでも先頭に 50 個のローカル変数を足して読み込みます。Lua の上限（1関数 200 個）に近づくと、実機より先にテストが失敗します。

モックは API 定義をもとに作ったもので、実機の描画や入力の細かい挙動までは再現しません。最終確認は Test Play で行ってください。
