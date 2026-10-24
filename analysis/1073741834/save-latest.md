# .gil 解析レポート — (無題)

- **ファイル**: `1073741834.gil`
- **パス**: `C:\Users\Hyoira\AppData\LocalLow\miHoYo\Genshin Impact\BeyondLocal\801397766\Beyond_Local_Save_Level\1073741834\1073741834.gil`
- **サイズ**: 133,506 bytes
- **最終更新**: 2026-10-21 17:26:41
- **解析日時**: 2026-10-21T17:29:56+09:00

## 1. ファイルヘッダー

| 項目 | 値 |
|---|---|
| ファイルタイプ | 2 (`.gil` レベル) |
| バージョン | 1 |
| 先頭マジック | 0x00000326 |
| 末尾マジック | 0x00000679 |
| コンテンツ長 | 133,482 bytes |
| 妥当性 | OK |

## 2. セクション一覧

| F# | セクション名 | サイズ | エントリ数 | 概要 |
|---:|---|---:|---:|---|
| F1 | unknown_F1 | 0 |  | 1073741834 |
| F2 | level_name | 5 |  |  |
| F4 | templates | 1,473 | 2 | デフォルトテンプレート, デフォルトテンプレート(キャラ編集) |
| F5 | entities | 5,013 | 11 | ステージエンティティ, デフォルトテンプレート, デフォルトテンプレート(キャラ編集) … +8件 |
| F6 | tabs | 1,678 | 0 |  |
| F7 | unknown_F7 | 3,642 |  |  |
| F9 | ui_controls | 16,475 |  | Dot, Container, Textbox |
| F10 | node_graphs | 26,898 | 2 | SaveBridge, _GSTS_Issen |
| F11 | preset_points | 408 | 0 |  |
| F14 | tags | 78 | 0 |  |
| F15 | configurations | 8,445 | 5 | バッグテンプレート, 環境設定, カスタムジョブ … +2件 |
| F16 | unknown_F16 | 83 |  |  |
| F18 | cameras | 89 | 0 |  |
| F21 | unknown_F21 | 7 |  |  |
| F23 | unknown_F23 | 7 |  |  |
| F25 | unknown_F25 | 221 |  |  |
| F29 | version_info | 55 |  | OSRELWin7.1.0, 48145775, 48652077 |
| F31 | unknown_F31 | 120 |  |  |
| F35 | unknown_F35 | 4,780 |  |  |
| F36 | globals_defs | 80 | 0 |  |
| F38 | unknown_F38 | 4 |  |  |
| F39 | player_uid | 0 |  | 801397766 |
| F40 | build_hash | 0 |  | 1792567076 |
| F41 | mode_flag | 0 |  | 1 |
| F43 | game_version | 0 |  | 7.1.0 |
| F46 | globals_b | 110 | 0 |  |
| F50 | unknown_F50 | 63,651 |  |  |
| F52 | unknown_F52 | 0 |  | 1073741834 |
| F53 | unknown_F53 | 0 |  | 1792567076 |

## 3. レベルメタ情報

- **レベル名**: (無題)
- **プレイヤーUID**: `801397766`
- **ゲームバージョン**: `7.1.0`
- **ビルドハッシュ**: `1792567076`
- **ビルド情報**: `OSRELWin7.1.0, 48145775, 48652077, 48511369, 48533839`

## 4. エンティティ (entities)

| 名前 | GUID | type_id | 位置 (x,y,z) | コンポーネント数 |
|---|---|---:|---|---:|
| ステージエンティティ | `1094713345` | 10003004 | 0, 0, 0 | 4 |
| デフォルトテンプレート | `1086324737` | 1086324737 | 0, 2000, 0 | 9 |
| デフォルトテンプレート(キャラ編集) | `1090519041` | 1090519041 | 0, 2000, 0 | 13 |
| デフォルトテンプレート | `1086324738` | 1086324737 | 0, 2000, 0 | 9 |
| デフォルトテンプレート | `1086324739` | 1086324737 | 0, 2000, 0 | 9 |
| デフォルトテンプレート | `1086324740` | 1086324737 | 0, 2000, 0 | 9 |
| デフォルトテンプレート | `1086324741` | 1086324737 | 0, 2000, 0 | 9 |
| デフォルトテンプレート | `1086324742` | 1086324737 | 0, 2000, 0 | 9 |
| デフォルトテンプレート | `1086324743` | 1086324737 | 0, 2000, 0 | 9 |
| デフォルトテンプレート | `1086324744` | 1086324737 | 0, 2000, 0 | 9 |
| デフォルトテンプレート | `1086324745` | 1086324737 | 0, 2000, 0 | 9 |

### 4.1 エンティティのコンポーネント詳細

#### ステージエンティティ (GUID `1094713345`)

- **位置**: (0, 0, 0)
- **スケール**: (1, 1, 1)

**コンポーネントスロット:**

- slot F6 tag=4
- slot F6 tag=7
- slot F7 tag=1
- slot F7 tag=3

#### デフォルトテンプレート (GUID `1086324737`)

- **位置**: (0, 2000, 0)
- **スケール**: (1, 1, 1)

**コンポーネントスロット:**

- slot F5 tag=3
- slot F5 tag=110
- slot F5 tag=5
- slot F5 tag=13
- slot F6 tag=3
- slot F6 tag=15
- slot F7 tag=40
- slot F7 tag=1
- slot F7 tag=3

#### デフォルトテンプレート(キャラ編集) (GUID `1090519041`)

- **位置**: (0, 2000, 0)
- **スケール**: (1, 1, 1)

**コンポーネントスロット:**

- slot F5 tag=13
- slot F6 tag=5
- slot F6 tag=7
- slot F6 tag=11 — GI_MoveHead
- slot F6 tag=19
- slot F7 tag=22
- slot F7 tag=18 — 被ダメエフェクト
- slot F7 tag=1
- slot F7 tag=3
- slot F7 tag=6
- slot F7 tag=14
- slot F7 tag=21
- slot F7 tag=32

**ボーン定義 (12件):**

- `GI_MoveHead` (頭上)
- `GI_FootR` (右足)
- `GI_FootL` (左足)
- `GI_HandL` (左手)
- `GI_HandR` (右手)
- `GI_CineHead` (ヘッドノード、カメラ戦闘追従ポイント)
- `GI_AvatarRoot` (ルートノード)
- `GI_FocusAnchor` (投射物初期位置)
- `GI_WeaponR` (右手武器)
- `GI_WeaponL` (左手武器)
- `GI_RootNode` (中心原点)
- `GI_Chest` (胸部)

#### デフォルトテンプレート (GUID `1086324738`)

- **位置**: (0, 2000, 0)
- **スケール**: (1, 1, 1)

**コンポーネントスロット:**

- slot F5 tag=3
- slot F5 tag=110
- slot F5 tag=5
- slot F5 tag=13
- slot F6 tag=3
- slot F6 tag=15
- slot F7 tag=40
- slot F7 tag=1
- slot F7 tag=3

#### デフォルトテンプレート (GUID `1086324739`)

- **位置**: (0, 2000, 0)
- **スケール**: (1, 1, 1)

**コンポーネントスロット:**

- slot F5 tag=3
- slot F5 tag=110
- slot F5 tag=5
- slot F5 tag=13
- slot F6 tag=3
- slot F6 tag=15
- slot F7 tag=40
- slot F7 tag=1
- slot F7 tag=3

#### デフォルトテンプレート (GUID `1086324740`)

- **位置**: (0, 2000, 0)
- **スケール**: (1, 1, 1)

**コンポーネントスロット:**

- slot F5 tag=3
- slot F5 tag=110
- slot F5 tag=5
- slot F5 tag=13
- slot F6 tag=3
- slot F6 tag=15
- slot F7 tag=40
- slot F7 tag=1
- slot F7 tag=3

#### デフォルトテンプレート (GUID `1086324741`)

- **位置**: (0, 2000, 0)
- **スケール**: (1, 1, 1)

**コンポーネントスロット:**

- slot F5 tag=3
- slot F5 tag=110
- slot F5 tag=5
- slot F5 tag=13
- slot F6 tag=3
- slot F6 tag=15
- slot F7 tag=40
- slot F7 tag=1
- slot F7 tag=3

#### デフォルトテンプレート (GUID `1086324742`)

- **位置**: (0, 2000, 0)
- **スケール**: (1, 1, 1)

**コンポーネントスロット:**

- slot F5 tag=3
- slot F5 tag=110
- slot F5 tag=5
- slot F5 tag=13
- slot F6 tag=3
- slot F6 tag=15
- slot F7 tag=40
- slot F7 tag=1
- slot F7 tag=3

#### デフォルトテンプレート (GUID `1086324743`)

- **位置**: (0, 2000, 0)
- **スケール**: (1, 1, 1)

**コンポーネントスロット:**

- slot F5 tag=3
- slot F5 tag=110
- slot F5 tag=5
- slot F5 tag=13
- slot F6 tag=3
- slot F6 tag=15
- slot F7 tag=40
- slot F7 tag=1
- slot F7 tag=3

#### デフォルトテンプレート (GUID `1086324744`)

- **位置**: (0, 2000, 0)
- **スケール**: (1, 1, 1)

**コンポーネントスロット:**

- slot F5 tag=3
- slot F5 tag=110
- slot F5 tag=5
- slot F5 tag=13
- slot F6 tag=3
- slot F6 tag=15
- slot F7 tag=40
- slot F7 tag=1
- slot F7 tag=3

#### デフォルトテンプレート (GUID `1086324745`)

- **位置**: (0, 2000, 0)
- **スケール**: (1, 1, 1)

**コンポーネントスロット:**

- slot F5 tag=3
- slot F5 tag=110
- slot F5 tag=5
- slot F5 tag=13
- slot F6 tag=3
- slot F6 tag=15
- slot F7 tag=40
- slot F7 tag=1
- slot F7 tag=3

## 5. テンプレート (templates)

| 名前 | GUID | type_id | コンポーネント数 |
|---|---|---:|---:|
| デフォルトテンプレート | `1086324737` | 1000000 | 9 |
| デフォルトテンプレート(キャラ編集) | `1090519041` | 1000001 | 13 |

## 6. ノードグラフ (node_graphs)

| 名前 | GUID | ノード数 | 参照変数 | 参照シグナル |
|---|---|---:|---|---|
| SaveBridge | `1073741825` | 12 | IssenSaveData |  |
| _GSTS_Issen | `1073741826` | 22 | issen_exit |  |

### 6.x `SaveBridge` 詳細 (GUID `1073741825`)

- **ノード数**: 12
- **参照変数**: `IssenSaveData`

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | When_Entity_Is_Created (71) | -1116.0, -368.0 |  |  |  | 1 |  |
| 2 | Set_Custom_Variable__Int (22) | 606.0, -385.0 |  |  | 7 | 4 |  |
| 3 | Get_Self_Entity (73) | -1202.0, -132.0 |  |  |  | 0 |  |
| 4 | Get_Custom_Variable__Int (50) | -817.0, -90.0 | IssenSaveData |  | 22 | 3 |  |
| 5 | Get_Corresponding_Value_From_List__Int (128) | -226.0, 56.0 |  |  | 10, 10 | 3 |  |
| 6 | type 1610612750 | 269.0, 133.0 |  |  |  | 1 |  |
| 7 | Set_Custom_Variable__Int (22) | 1241.0, -383.0 |  |  |  | 3 |  |
| 9 | type 1610612738 | -1336.0, 394.0 |  |  |  | 2 | flag9=1, SIGNAL_SEND |
| 11 | type 1610612749 | -780.0, 731.0 |  |  |  | 1 |  |
| 12 | Assembly_List__Int (169) | -360.0, 736.0 |  |  | 10 ×101 | 101 |  |
| 13 | Set_Custom_Variable__Int (22) | 168.0, 385.0 | IssenSaveData |  | 22 | 4 |  |
| 14 | Set_Custom_Variable__Int (22) | 752.0, 386.0 |  |  | 7 | 3 |  |

### 6.x `_GSTS_Issen` 詳細 (GUID `1073741826`)

- **ノード数**: 22
- **参照変数**: `issen_exit`

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | When_Entity_Is_Created (71) | 2.91, 2.14 |  |  |  | 1 |  |
| 2 | Get_Local_Variable__Bool (18) | 505.56, 252.0 |  |  | 3, 3 | 2 |  |
| 3 | Get_Self_Entity (73) | 504.4, 506.23 |  |  |  | 0 |  |
| 4 | Set_Local_Variable__Bool (19) | 802.15, 2.01 |  |  | 3 | 3 |  |
| 5 | Query_Server_Time_Zone (756) | 1309.92, 255.03 |  |  |  | 0 |  |
| 6 | Set_Custom_Variable__Int (22) | 1602.9, 1.5 |  |  |  | 5 |  |
| 7 | Query_Timestamp_UTC_0 (755) | 2100.03, 256.75 |  |  |  | 0 |  |
| 8 | Set_Custom_Variable__Int (22) | 2407.43, 7.3 |  |  |  | 4 |  |
| 9 | type 1610612742 | 5.52, 1109.39 |  |  |  | 2 | flag9=1, SIGNAL_SEND |
| 10 | Assembly_List__Int (169) | 505.57, 1352.03 |  |  |  | 102 |  |
| 11 | Set_Player_Leaderboard_Score_as_an_Integer (761) | 807.68, 1101.94 |  |  |  | 4 |  |
| 12 | Get_Local_Variable__Bool (18) | 1304.18, 1354.32 |  |  | 3, 3 | 2 |  |
| 13 | Get_Player_GUID_by_Player_ID (750) | 1002.04, 1600.25 |  |  |  | 1 |  |
| 14 | Query_Entity_by_GUID (75) | 1305.34, 1605.11 |  |  |  | 1 |  |
| 15 | Set_Local_Variable__Bool (19) | 1605.06, 1102.99 |  |  | 3 | 3 |  |
| 16 | Set_Achievement_Progress_Tally (645) | 2400.9, 1102.27 |  |  |  | 4 |  |
| 17 | Set_Achievement_Progress_Tally (645) | 3209.63, 1102.88 |  |  |  | 4 |  |
| 18 | Set_Achievement_Progress_Tally (645) | 4000.12, 1105.64 |  |  |  | 4 |  |
| 19 | Set_Achievement_Progress_Tally (645) | 4800.48, 1104.41 |  |  |  | 3 |  |
| 20 | type 1610612746 | 9.95, 2201.86 | issen_exit |  |  | 2 | flag9=1, SIGNAL_SEND |
| 21 | Settle_Stage (77) | 1020.73, 2209.48 |  |  |  | 0 |  |
| 22 | Set_Player_Settlement_Success_Status (652) | 584.0, 2207.0 |  |  | 4101 | 2 |  |

## 8. 設定 (configurations)

| 名前 | GUID | type_id |
|---|---|---:|
| バッグテンプレート | `1119879169` | 12 |
| 環境設定 | `1186988033` | 26 |
| カスタムジョブ | `1090519041` | 4 |
| カスタム成長曲線 | `1094713345` | 5 |
| 移動禁止 | `1077936129` | 1 |

---

> 完全な protobuf ツリーは同名の `.json` ファイル参照。