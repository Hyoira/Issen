# .gil 解析レポート — スペシャルコンテンツ

- **ファイル**: `1073741829.gil`
- **パス**: `C:\Users\Hyoira\AppData\LocalLow\miHoYo\Genshin Impact\BeyondLocal\801397766\Beyond_Local_Save_Level\1073741829\1073741829.gil`
- **サイズ**: 3,405,815 bytes
- **最終更新**: 2026-10-08 20:28:15
- **解析日時**: 2026-10-21T17:33:26+09:00

## 1. ファイルヘッダー

| 項目 | 値 |
|---|---|
| ファイルタイプ | 2 (`.gil` レベル) |
| バージョン | 1 |
| 先頭マジック | 0x00000326 |
| 末尾マジック | 0x00000679 |
| コンテンツ長 | 3,405,791 bytes |
| 妥当性 | OK |

## 2. セクション一覧

| F# | セクション名 | サイズ | エントリ数 | 概要 |
|---:|---|---:|---:|---|
| F1 | unknown_F1 | 0 |  | 1073741829 |
| F2 | level_name | 0 |  | スペシャルコンテンツ |
| F4 | templates | 233,453 | 22 | デフォルトテンプレート, デフォルトテンプレート(キャラ編集), キャラ本体 … +19件 |
| F5 | entities | 147,082 | 12 | ステージエンティティ, デフォルトテンプレート, デフォルトテンプレート(キャラ編集) … +9件 |
| F6 | tabs | 2,867 | 0 |  |
| F7 | unknown_F7 | 3,642 |  |  |
| F8 | action_groups | 91,821 | 21 | キャラ本体, 石柱, 木製の柱 … +18件 |
| F9 | ui_controls | 2,251,253 |  | キョリ, 現在のキョリ: , 黒背景 |
| F10 | node_graphs | 466,618 | 12 | _GSTS_BirdController, _GSTS_ObstacleManager, _GSTS_CollisionDetection … +9件 |
| F11 | preset_points | 396 | 0 |  |
| F14 | tags | 78 | 0 |  |
| F15 | configurations | 8,713 | 5 | バッグテンプレート, 環境設定, カスタムジョブ … +2件 |
| F16 | unknown_F16 | 201 |  |  |
| F18 | cameras | 177 | 0 |  |
| F21 | unknown_F21 | 7 |  |  |
| F22 | property_defs | 280 |  | PropertyTransform, PropertyGadgetCombat… |
| F23 | unknown_F23 | 9 |  |  |
| F25 | unknown_F25 | 223 |  |  |
| F29 | version_info | 55 |  | OSRELWin7.1.0, 48145775, 48379043 |
| F31 | unknown_F31 | 209 |  |  |
| F35 | unknown_F35 | 154,541 |  |  |
| F36 | globals_defs | 80 | 0 |  |
| F38 | unknown_F38 | 4 |  |  |
| F39 | player_uid | 0 |  | 801397766 |
| F40 | build_hash | 0 |  | 1782480548 |
| F41 | mode_flag | 0 |  | 1 |
| F43 | game_version | 0 |  | 7.1.0 |
| F45 | globals_a | 324 | 0 |  |
| F46 | globals_b | 110 | 0 |  |
| F50 | unknown_F50 | 43,461 |  |  |

## 3. レベルメタ情報

- **レベル名**: スペシャルコンテンツ
- **プレイヤーUID**: `801397766`
- **ゲームバージョン**: `7.1.0`
- **ビルドハッシュ**: `1782480548`
- **ビルド情報**: `OSRELWin7.1.0, 48145775, 48379043, 48511369, 48533839`

## 4. エンティティ (entities)

| 名前 | GUID | type_id | 位置 (x,y,z) | コンポーネント数 |
|---|---|---:|---|---:|
| ステージエンティティ | `1094713345` | 10003004 | -0.6516, 0.45, 0.2 | 5 |
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
| カメラ注視点 | `1077936151` | 10005018 | 0, 4, 0 | 18 |

### 4.1 エンティティのコンポーネント詳細

#### ステージエンティティ (GUID `1094713345`)

- **位置**: (-0.6516, 0.45, 0.2)
- **スケール**: (1, 1, 1)

**コンポーネントスロット:**

- slot F6 tag=3
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
- slot F7 tag=1 — Life
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
- slot F7 tag=1 — Life
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
- slot F7 tag=1 — Life
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
- slot F7 tag=1 — Life
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
- slot F7 tag=1 — Life
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
- slot F7 tag=1 — Life
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
- slot F7 tag=1 — Life
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
- slot F7 tag=1 — Life
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
- slot F7 tag=1 — Life
- slot F7 tag=3

#### カメラ注視点 (GUID `1077936151`)

- **位置**: (0, 4, 0)
- **スケール**: (1, 1, 1)

**コンポーネントスロット:**

- slot F5 tag=13
- slot F5 tag=14
- slot F5 tag=38
- slot F6 tag=4
- slot F6 tag=5
- slot F6 tag=7
- slot F6 tag=8
- slot F6 tag=11 — GI_RootNode
- slot F6 tag=12
- slot F6 tag=19
- slot F6 tag=22
- slot F7 tag=18 — 被ダメエフェクト
- slot F7 tag=1
- slot F7 tag=3
- slot F7 tag=19
- slot F7 tag=6
- slot F7 tag=14
- slot F7 tag=13 — オブジェクトカメラ

**ボーン定義 (1件):**

- `GI_RootNode` (中心原点)

## 5. テンプレート (templates)

| 名前 | GUID | type_id | コンポーネント数 |
|---|---|---:|---:|
| デフォルトテンプレート | `1086324737` | 1000000 | 9 |
| デフォルトテンプレート(キャラ編集) | `1090519041` | 1000001 | 13 |
| キャラ本体 | `1077936129` | 20001106 | 19 |
| 木製の柱 | `1077936130` | 20001357 | 19 |
| 石柱 | `1077936131` | 20001320 | 19 |
| 固体燃素 | `1077936132` | 20002685 | 19 |
| 固体燃素_1 | `1077936133` | 20002760 | 19 |
| 固体燃素_2 | `1077936134` | 20002755 | 19 |
| 固体燃素_3 | `1077936135` | 20002762 | 19 |
| Element_Pyro_obj | `1077936201` | 10005018 | 17 |
| Element_Geo_obj | `1077936199` | 10005018 | 18 |
| Element_Electro_obj | `1077936198` | 10005018 | 17 |
| Element_Dendro_obj | `1077936197` | 10005018 | 17 |
| Element_Cryo_obj | `1077936196` | 10005018 | 17 |
| Element_Anemo_obj | `1077936195` | 10005018 | 17 |
| Element_Hydro_obj | `1077936200` | 10005018 | 17 |
| 岩石 | `1077936216` | 20001045 | 18 |
| 岩石_1 | `1077936217` | 20001044 | 17 |
| 山石 | `1077936218` | 20002620 | 17 |
| 山石_1 | `1077936219` | 20002615 | 17 |
| 山石_2 | `1077936220` | 20002613 | 17 |
| 山石_3 | `1077936221` | 20002621 | 17 |

## 6. ノードグラフ (node_graphs)

| 名前 | GUID | ノード数 | 参照変数 | 参照シグナル |
|---|---|---:|---|---|
| _GSTS_BirdController | `1073741828` | 516 | Distance, GamePhase, HitStop, Scroll, Vel, __gsts_interval_0_0, __gsts_stage, angrySpriteToggle, distance, gamePhase, maxDistance, オブジェクトカメラ | angrySpriteTimer, hitStopTimer |
| _GSTS_ObstacleManager | `1073741829` | 140 | GamePhase, Scroll, __gsts_interval_1_0, __gsts_stage, countdown, lastBottomRoll, lastObstacleSide, lastTopRoll, sameSideCount, tempRoll, tempSide |  |
| _GSTS_CollisionDetection | `1073741830` | 4 | HitStop |  |
| Crystall: Hydro | `1073741832` | 2 | GI_RootNode |  |
| Crystall: Pyro | `1073741833` | 2 | GI_RootNode |  |
| ☑ Special Music Player | `1073741835` | 9 |  |  |
| Door | `1073741831` | 20 | GI_RootNode, char, door |  |
| Crystall: Electro | `1073741834` | 2 | GI_RootNode |  |
| _GSTS_GameManager | `1073741837` | 280 | GamePhase, __gsts_interval_3_0, __gsts_stage |  |
| SaveDataManager | `1073741838` | 19 | maxDistance |  |
| _GSTS_AchievementManager | `1073741839` | 56 | GamePhase, __gsts_interval_2_0 |  |
| _GSTS_PersonalBest | `1073741841` | 34 | FLAPPY_BGM, FLAPPY_QUIT, PB_SUBMIT, [Flappy Save] No new best; update skipped, [Flappy Save] PB_SUBMIT received; distance:, [Flappy Save] Stage settlement requested (not a persistence confirmation), [Flappy Save] maxDistance updated; SaveDataManager notified (persistence pending stage exit), maxDistance |  |

### 6.x `_GSTS_BirdController` 詳細 (GUID `1073741828`)

- **ノード数**: 516
- **参照変数**: `Distance`, `GamePhase`, `HitStop`, `Scroll`, `Vel`, `__gsts_interval_0_0`, `__gsts_stage`, `angrySpriteToggle`, `distance`, `gamePhase`, `maxDistance`, `オブジェクトカメラ`
- **参照シグナル**: `angrySpriteTimer`, `hitStopTimer`

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | When_Entity_Is_Created (71) | 7.02, 4.58 |  |  |  | 1 |  |
| 2 | Query_Entity_by_GUID (75) | 1301.08, 258.48 |  |  |  | 1 |  |
| 3 | Get_Player_GUID_by_Player_ID (750) | 1006.82, 502.42 |  |  |  | 1 |  |
| 4 | Query_Entity_by_GUID (75) | 1306.63, 507.07 |  |  |  | 1 |  |
| 5 | Set_Player_Camera_to_Follow_Entity (818) | 1600.3, 1.12 | オブジェクトカメラ |  |  | 4 |  |
| 6 | Assembly_List__Int (169) | 2101.52, 250.85 |  |  | 4 ×101 | 102 |  |
| 7 | Get_Self_Entity (73) | 2107.87, 509.12 |  |  |  | 0 |  |
| 8 | Start_Timer (79) | 2409.32, 8.98 | __gsts_interval_0_0 |  |  | 4 |  |
| 9 | When_Timer_Is_Triggered (83) | 4.16, 1101.48 |  |  |  | 1 |  |
| 10 | Equal__Str (14) | 500.43, 1355.97 |  |  |  | 2 |  |
| 11 | Double_Branch (2) | 804.09, 1101.32 |  |  |  | 2 |  |
| 12 | Get_Local_Variable__Bool (18) | 1305.59, 1359.0 |  |  | 5, 5 | 2 |  |
| 13 | Get_Node_Graph_Variable__Entity (337) | 1300.69, 1600.38 | gamePhase |  | 4 | 2 |  |
| 14 | Set_Local_Variable__Bool (19) | 1607.92, 1100.99 |  |  | 5 | 3 |  |
| 15 | Equal__Str (14) | 2102.32, 1357.48 |  |  | 6, 6 | 2 |  |
| 16 | Double_Branch (2) | 2407.79, 1105.41 |  |  |  | 3 |  |
| 17 | Get_Local_Variable__Bool (18) | 2906.13, 1350.23 |  |  | 5, 5 | 2 |  |
| 18 | Get_Node_Graph_Variable__Entity (337) | 2901.47, 1604.29 |  |  | 4 | 2 |  |
| 19 | Set_Local_Variable__Bool (19) | 3209.14, 1103.0 |  |  | 5 | 3 |  |
| 20 | Subtraction__Int (202) | 3704.53, 1354.22 |  |  |  | 3 |  |
| 21 | Set_Local_Variable__Bool (19) | 4004.74, 1106.44 |  |  | 5 | 3 |  |
| 22 | Set_Node_Graph_Variable__Int (323) | 4800.15, 1105.08 |  |  |  | 4 |  |
| 23 | Get_Local_Variable__Bool (18) | 5300.58, 1353.33 |  |  | 9, 9 | 2 |  |
| 24 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 5304.12, 1600.8 |  |  |  | 1 |  |
| 25 | Set_Local_Variable__Bool (19) | 5607.44, 1107.95 |  |  | 9 | 3 |  |
| 26 | List_Iteration_Loop__Bool (509) | 6405.8, 1105.96 |  |  |  | 4 |  |
| 27 | Stop_and_Delete_Basic_Motion_Device (86) | 7200.54, 1105.23 | Vel |  |  | 4 |  |
| 28 | Create_3D_Vector (225) | 7705.71, 1354.72 |  |  |  | 3 |  |
| 29 | Add_Uniform_Basic_Linear_Motion_Device (84) | 8009.63, 1105.99 | Vel | 999.0 |  | 5 |  |
| 30 | Get_Entity_Location_and_Rotation (99) | 7902.13, 1359.9 |  |  |  | 1 |  |
| 31 | Split_3D_Vector (9) | 8201.68, 1355.15 |  |  |  | 1 |  |
| 32 | Less_Than_or_Equal_To__Int (231) | 8507.91, 1353.32 |  |  |  | 2 |  |
| 33 | Double_Branch (2) | 8805.9, 1105.25 |  |  |  | 2 |  |
| 34 | Stop_and_Delete_Basic_Motion_Device (86) | 9607.17, 1103.5 | Vel |  |  | 4 |  |
| 35 | Set_Node_Graph_Variable__Int (323) | 10408.1, 1109.29 |  |  |  | 4 |  |
| 36 | Add_Uniform_Basic_Linear_Motion_Device (84) | 11208.66, 1108.59 | Vel | 999.0 |  | 5 |  |
| 37 | Set_Node_Graph_Variable__Int (323) | 12000.75, 1101.23 | gamePhase |  |  | 4 |  |
| 38 | Get_Player_GUID_by_Player_ID (750) | 12205.59, 1355.09 |  |  |  | 1 |  |
| 39 | Query_Entity_by_GUID (75) | 12509.67, 1355.95 |  |  |  | 1 |  |
| 40 | Set_Custom_Variable__Int (22) | 12801.19, 1103.79 | GamePhase |  |  | 4 |  |
| 41 | Get_Local_Variable__Bool (18) | 6905.42, 1712.52 |  |  | 5, 5 | 2 |  |
| 42 | Get_Node_Graph_Variable__Entity (337) | 6902.8, 1964.79 |  |  | 4 | 2 |  |
| 43 | Set_Local_Variable__Bool (19) | 7200.03, 1460.77 |  |  | 5 | 3 |  |
| 44 | Greater_Than__Int (232) | 7700.94, 1715.18 |  |  |  | 2 |  |
| 45 | Double_Branch (2) | 8000.8, 1465.93 |  |  |  | 3 |  |
| 46 | Subtraction__Int (202) | 8501.71, 1712.98 |  |  |  | 3 |  |
| 47 | Set_Local_Variable__Bool (19) | 8800.53, 1464.55 |  |  | 5 | 3 |  |
| 48 | Set_Node_Graph_Variable__Int (323) | 9609.96, 1461.13 |  |  |  | 4 |  |
| 49 | Less_Than_or_Equal_To__Int (231) | 10106.1, 1717.95 |  |  |  | 2 |  |
| 50 | Double_Branch (2) | 10400.32, 1467.18 |  |  |  | 3 |  |
| 51 | Query_Entity_by_GUID (75) | 10902.12, 1717.5 |  |  |  | 1 |  |
| 52 | Assembly_List__Int (169) | 10905.3, 1962.01 |  |  | 7 ×101 | 102 |  |
| 53 | Set_Entity_Active_Nameplate (617) | 11208.3, 1461.84 |  |  |  | 3 |  |
| 54 | Query_Entity_by_GUID (75) | 11706.4, 1717.28 |  |  |  | 1 |  |
| 55 | Get_Local_Variable__Bool (18) | 11709.1, 1964.21 |  |  | 16, 16 | 2 |  |
| 56 | Set_Entity_Active_Nameplate (617) | 12000.59, 1460.45 |  |  |  | 3 |  |
| 57 | Equal__Str (14) | 12509.55, 1712.17 |  |  | 6, 6 | 2 |  |
| 58 | Double_Branch (2) | 12805.7, 1469.63 |  |  |  | 3 |  |
| 59 | Get_Player_GUID_by_Player_ID (750) | 12405.43, 1719.27 |  |  |  | 1 |  |
| 60 | Query_Entity_by_GUID (75) | 12706.27, 1715.97 |  |  |  | 1 |  |
| 61 | Get_Custom_Variable__Int (50) | 13007.35, 1711.07 | HitStop |  |  | 3 |  |
| 62 | Equal__Str (14) | 13301.07, 1712.86 |  |  | 5, 5 | 2 |  |
| 63 | Double_Branch (2) | 13607.22, 1461.87 |  |  |  | 3 |  |
| 64 | Get_Player_GUID_by_Player_ID (750) | 13804.11, 1711.03 |  |  |  | 1 |  |
| 65 | Query_Entity_by_GUID (75) | 14104.4, 1714.22 |  |  |  | 1 |  |
| 66 | Set_Custom_Variable__Int (22) | 14401.06, 1463.52 | HitStop |  |  | 5 |  |
| 67 | Get_Player_GUID_by_Player_ID (750) | 14607.1, 1710.4 |  |  |  | 1 |  |
| 68 | Query_Entity_by_GUID (75) | 14903.03, 1717.85 |  |  |  | 1 |  |
| 69 | Player_Plays_One_Shot_2D_Sound_Effect (598) | 15206.57, 1464.53 |  | 1.0 |  | 5 |  |
| 70 | Set_Node_Graph_Variable__Int (323) | 16001.76, 1462.08 | hitStopTimer |  |  | 4 |  |
| 71 | Set_Node_Graph_Variable__Int (323) | 16809.19, 1463.31 |  |  |  | 4 |  |
| 72 | Set_Node_Graph_Variable__Int (323) | 17603.18, 1463.93 | gamePhase |  |  | 4 |  |
| 73 | Get_Player_GUID_by_Player_ID (750) | 17802.03, 1710.27 |  |  |  | 1 |  |
| 74 | Query_Entity_by_GUID (75) | 18104.94, 1710.42 |  |  |  | 1 |  |
| 75 | Set_Custom_Variable__Int (22) | 18404.27, 1465.77 | GamePhase |  |  | 5 |  |
| 76 | Get_Local_Variable__Bool (18) | 18902.56, 1717.09 |  |  | 9, 9 | 2 |  |
| 77 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 18906.85, 1964.14 |  |  |  | 1 |  |
| 78 | Set_Local_Variable__Bool (19) | 19203.18, 1460.68 |  |  | 9 | 3 |  |
| 79 | List_Iteration_Loop__Bool (509) | 20008.94, 1469.79 |  |  |  | 4 |  |
| 80 | Stop_and_Delete_Basic_Motion_Device (86) | 20806.98, 1463.93 | Vel |  |  | 3 |  |
| 81 | Get_Local_Variable__Bool (18) | 20506.6, 2075.71 |  |  | 9, 9 | 2 |  |
| 82 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 20505.01, 2321.74 |  |  |  | 1 |  |
| 83 | Set_Local_Variable__Bool (19) | 20808.15, 1821.51 |  |  | 9 | 3 |  |
| 84 | List_Iteration_Loop__Bool (509) | 21603.75, 1828.74 |  |  |  | 4 |  |
| 85 | Stop_and_Delete_Basic_Motion_Device (86) | 22402.64, 1822.05 | Scroll |  |  | 3 |  |
| 86 | Get_Local_Variable__Bool (18) | 22107.84, 2435.6 |  |  | 9, 9 | 2 |  |
| 87 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 22106.65, 2689.39 |  |  |  | 1 |  |
| 88 | Set_Local_Variable__Bool (19) | 22408.12, 2181.89 |  |  | 9 | 3 |  |
| 89 | List_Iteration_Loop__Bool (509) | 23203.87, 2184.03 |  |  |  | 4 |  |
| 90 | Stop_and_Delete_Basic_Motion_Device (86) | 24004.89, 2180.77 | Scroll |  |  | 3 |  |
| 91 | Get_Local_Variable__Bool (18) | 23702.98, 2794.58 |  |  | 9, 9 | 2 |  |
| 92 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 23701.85, 3049.94 |  |  |  | 1 |  |
| 93 | Set_Local_Variable__Bool (19) | 24000.96, 2540.75 |  |  | 9 | 3 |  |
| 94 | List_Iteration_Loop__Bool (509) | 24806.84, 2542.3 |  |  |  | 4 |  |
| 95 | Stop_and_Delete_Basic_Motion_Device (86) | 25608.93, 2543.72 | Scroll |  |  | 3 |  |
| 96 | Get_Local_Variable__Bool (18) | 25300.38, 3156.24 |  |  | 9, 9 | 2 |  |
| 97 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 25307.77, 3402.27 |  |  |  | 1 |  |
| 98 | Set_Local_Variable__Bool (19) | 25605.36, 2905.05 |  |  | 9 | 3 |  |
| 99 | List_Iteration_Loop__Bool (509) | 26406.1, 2901.74 |  |  |  | 4 |  |
| 100 | Stop_and_Delete_Basic_Motion_Device (86) | 27209.61, 2904.52 | Scroll |  |  | 3 |  |
| 101 | Get_Node_Graph_Variable__Entity (337) | 26606.3, 3514.71 | gamePhase |  | 4 | 2 |  |
| 102 | Equal__Str (14) | 26909.84, 3510.52 |  |  | 6, 6 | 2 |  |
| 103 | Double_Branch (2) | 27206.0, 3261.86 |  |  |  | 3 |  |
| 104 | Get_Local_Variable__Bool (18) | 27700.69, 3518.71 |  |  | 5, 5 | 2 |  |
| 105 | Get_Node_Graph_Variable__Entity (337) | 27709.44, 3760.85 |  |  | 4 | 2 |  |
| 106 | Set_Local_Variable__Bool (19) | 28006.82, 3263.6 |  |  | 5 | 3 |  |
| 107 | Subtraction__Int (202) | 28508.94, 3512.88 |  |  |  | 3 |  |
| 108 | Set_Local_Variable__Bool (19) | 28800.18, 3265.23 |  |  | 5 | 3 |  |
| 109 | Set_Node_Graph_Variable__Int (323) | 29607.54, 3262.91 |  |  |  | 4 |  |
| 110 | Get_Local_Variable__Bool (18) | 30109.01, 3517.39 |  |  | 9, 9 | 2 |  |
| 111 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 30102.55, 3763.11 |  |  |  | 1 |  |
| 112 | Set_Local_Variable__Bool (19) | 30407.79, 3264.62 |  |  | 9 | 3 |  |
| 113 | List_Iteration_Loop__Bool (509) | 31202.64, 3265.43 |  |  |  | 4 |  |
| 114 | Stop_and_Delete_Basic_Motion_Device (86) | 32004.01, 3269.15 | Vel |  |  | 4 |  |
| 115 | Create_3D_Vector (225) | 32508.07, 3516.96 |  |  |  | 3 |  |
| 116 | Add_Uniform_Basic_Linear_Motion_Device (84) | 32803.86, 3262.96 | Vel | 999.0 |  | 5 |  |
| 117 | Get_Entity_Location_and_Rotation (99) | 32706.51, 3510.84 |  |  |  | 1 |  |
| 118 | Split_3D_Vector (9) | 33009.07, 3515.42 |  |  |  | 1 |  |
| 119 | Less_Than__Int (230) | 33308.93, 3514.14 |  |  |  | 2 |  |
| 120 | Double_Branch (2) | 33602.49, 3266.93 |  |  |  | 3 |  |
| 121 | Get_Player_GUID_by_Player_ID (750) | 33809.33, 3513.01 |  |  |  | 1 |  |
| 122 | Query_Entity_by_GUID (75) | 34109.93, 3511.66 |  |  |  | 1 |  |
| 123 | Set_Custom_Variable__Int (22) | 34408.12, 3267.71 | HitStop |  |  | 5 |  |
| 124 | Greater_Than__Int (232) | 34907.86, 3511.41 |  |  |  | 2 |  |
| 125 | Double_Branch (2) | 35204.7, 3267.85 |  |  |  | 2 |  |
| 126 | Get_Player_GUID_by_Player_ID (750) | 35407.31, 3510.86 |  |  |  | 1 |  |
| 127 | Query_Entity_by_GUID (75) | 35703.47, 3516.21 |  |  |  | 1 |  |
| 128 | Set_Custom_Variable__Int (22) | 36008.33, 3264.26 | HitStop |  |  | 4 |  |
| 129 | Get_Local_Variable__Bool (18) | 31700.13, 3875.18 |  |  | 5, 5 | 2 |  |
| 130 | Get_Node_Graph_Variable__Entity (337) | 31703.87, 4120.92 | distance |  | 4 | 2 |  |
| 131 | Set_Local_Variable__Bool (19) | 32000.15, 3622.67 |  |  | 5 | 3 |  |
| 132 | Addition__Int (200) | 32502.56, 3871.92 |  |  |  | 3 |  |
| 133 | Set_Local_Variable__Bool (19) | 32801.74, 3622.32 |  |  | 5 | 3 |  |
| 134 | Set_Node_Graph_Variable__Int (323) | 33600.24, 3621.89 | distance |  |  | 4 |  |
| 135 | Get_Player_GUID_by_Player_ID (750) | 33804.71, 3873.81 |  |  |  | 1 |  |
| 136 | Query_Entity_by_GUID (75) | 34100.31, 3878.67 |  |  |  | 1 |  |
| 137 | Set_Custom_Variable__Int (22) | 34404.25, 3620.14 |  |  | 4 | 5 |  |
| 138 | Round_to_Integer_Operation (224) | 34909.76, 3874.23 |  |  | 703 | 2 |  |
| 139 | Get_Player_GUID_by_Player_ID (750) | 34602.91, 4128.95 |  |  |  | 1 |  |
| 140 | Query_Entity_by_GUID (75) | 34905.12, 4122.99 |  |  |  | 1 |  |
| 141 | Set_Custom_Variable__Int (22) | 35203.28, 3621.94 | Distance |  |  | 5 |  |
| 142 | Get_Local_Variable__Bool (18) | 35704.56, 3870.12 |  |  | 5, 5 | 2 |  |
| 143 | Get_Node_Graph_Variable__Entity (337) | 35706.2, 4124.48 |  |  | 4 | 2 |  |
| 144 | Set_Local_Variable__Bool (19) | 36003.41, 3629.17 |  |  | 5 | 3 |  |
| 145 | Greater_Than__Int (232) | 36509.39, 3871.46 |  |  |  | 2 |  |
| 146 | Double_Branch (2) | 36805.09, 3620.2 |  |  |  | 3 |  |
| 147 | Subtraction__Int (202) | 37302.99, 3875.96 |  |  |  | 3 |  |
| 148 | Set_Local_Variable__Bool (19) | 37600.66, 3625.45 |  |  | 5 | 3 |  |
| 149 | Set_Node_Graph_Variable__Int (323) | 38406.98, 3620.19 |  |  |  | 4 |  |
| 150 | Less_Than_or_Equal_To__Int (231) | 38907.14, 3872.44 |  |  |  | 2 |  |
| 151 | Double_Branch (2) | 39206.38, 3622.56 |  |  |  | 3 |  |
| 152 | Query_Entity_by_GUID (75) | -299.5, 4479.88 |  |  |  | 1 |  |
| 153 | Assembly_List__Int (169) | -295.73, 4729.8 |  |  | 7 ×101 | 102 |  |
| 154 | Set_Entity_Active_Nameplate (617) | 7.95, 4221.54 |  |  |  | 3 |  |
| 155 | Query_Entity_by_GUID (75) | 507.31, 4476.38 |  |  |  | 1 |  |
| 156 | Get_Local_Variable__Bool (18) | 504.03, 4727.44 |  |  | 16, 16 | 2 |  |
| 157 | Set_Entity_Active_Nameplate (617) | 804.83, 4228.76 |  |  |  | 3 |  |
| 158 | Equal__Str (14) | 1302.47, 4473.43 |  |  | 6, 6 | 2 |  |
| 159 | Double_Branch (2) | 1607.73, 4222.49 |  |  |  | 3 |  |
| 160 | Get_Local_Variable__Bool (18) | 2108.06, 4477.93 |  |  | 5, 5 | 2 |  |
| 161 | Get_Node_Graph_Variable__Entity (337) | 2108.38, 4725.03 | hitStopTimer |  | 4 | 2 |  |
| 162 | Set_Local_Variable__Bool (19) | 2406.51, 4224.11 |  |  | 5 | 3 |  |
| 163 | Subtraction__Int (202) | 2900.81, 4471.46 |  |  |  | 3 |  |
| 164 | Set_Local_Variable__Bool (19) | 3205.36, 4229.91 |  |  | 5 | 3 |  |
| 165 | Set_Node_Graph_Variable__Int (323) | 4004.67, 4226.74 | hitStopTimer |  |  | 4 |  |
| 166 | Less_Than_or_Equal_To__Int (231) | 4502.43, 4477.97 |  |  |  | 2 |  |
| 167 | Double_Branch (2) | 4803.15, 4225.1 |  |  |  | 3 |  |
| 168 | Set_Node_Graph_Variable__Int (323) | 5600.64, 4228.42 | hitStopTimer |  |  | 4 |  |
| 169 | Set_Node_Graph_Variable__Int (323) | 6409.79, 4226.12 | gamePhase |  |  | 4 |  |
| 170 | Get_Player_GUID_by_Player_ID (750) | 6602.87, 4479.74 |  |  |  | 1 |  |
| 171 | Query_Entity_by_GUID (75) | 6908.74, 4477.72 |  |  |  | 1 |  |
| 172 | Set_Custom_Variable__Int (22) | 7203.57, 4225.85 | GamePhase |  |  | 5 |  |
| 173 | Set_Node_Graph_Variable__Int (323) | 8007.24, 4221.27 | angrySpriteTimer |  |  | 4 |  |
| 174 | Set_Node_Graph_Variable__Int (323) | 8803.9, 4229.16 | angrySpriteToggle |  | 2 | 4 |  |
| 175 | Query_Entity_by_GUID (75) | 9303.82, 4473.51 |  |  |  | 1 |  |
| 176 | Get_Local_Variable__Bool (18) | 9307.83, 4723.92 |  |  | 16, 16 | 2 |  |
| 177 | Set_Entity_Active_Nameplate (617) | 9609.52, 4220.17 |  |  |  | 3 |  |
| 178 | Query_Entity_by_GUID (75) | 10105.62, 4475.85 |  |  |  | 1 |  |
| 179 | Get_Local_Variable__Bool (18) | 10109.44, 4727.48 |  |  | 16, 16 | 2 |  |
| 180 | Set_Entity_Active_Nameplate (617) | 10402.2, 4222.66 |  |  |  | 3 |  |
| 181 | Double_Branch (2) | 11204.8, 4223.96 |  |  |  | 3 |  |
| 182 | Query_Entity_by_GUID (75) | 11706.6, 4473.48 |  |  |  | 1 |  |
| 183 | Assembly_List__Int (169) | 11701.96, 4729.32 |  |  | 7 ×101 | 102 |  |
| 184 | Set_Entity_Active_Nameplate (617) | 12000.3, 4221.79 |  |  |  | 3 |  |
| 185 | Get_Local_Variable__Bool (18) | 12506.55, 4471.67 |  |  | 9, 9 | 2 |  |
| 186 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 12502.53, 4729.31 |  |  |  | 1 |  |
| 187 | Set_Local_Variable__Bool (19) | 12809.05, 4226.64 |  |  | 9 | 3 |  |
| 188 | List_Iteration_Loop__Bool (509) | 13601.57, 4223.22 |  |  |  | 4 |  |
| 189 | Add_Uniform_Basic_Linear_Motion_Device (84) | 14406.28, 4225.93 | Vel | 999.0 |  | 4 |  |
| 190 | Equal__Str (14) | 14109.39, 4832.32 |  |  | 6, 6 | 2 |  |
| 191 | Double_Branch (2) | 14407.37, 4588.0 |  |  |  | 2 |  |
| 192 | Get_Local_Variable__Bool (18) | 14903.23, 4831.18 |  |  | 5, 5 | 2 |  |
| 193 | Get_Node_Graph_Variable__Entity (337) | 14906.92, 5089.97 |  |  | 4 | 2 |  |
| 194 | Set_Local_Variable__Bool (19) | 15207.95, 4589.09 |  |  | 5 | 3 |  |
| 195 | Subtraction__Int (202) | 15704.83, 4835.08 |  |  |  | 3 |  |
| 196 | Set_Local_Variable__Bool (19) | 16007.56, 4585.13 |  |  | 5 | 3 |  |
| 197 | Set_Node_Graph_Variable__Int (323) | 16805.48, 4584.87 |  |  |  | 4 |  |
| 198 | Get_Local_Variable__Bool (18) | 17304.28, 4834.55 |  |  | 9, 9 | 2 |  |
| 199 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 17306.64, 5087.14 |  |  |  | 1 |  |
| 200 | Set_Local_Variable__Bool (19) | 17609.22, 4584.4 |  |  | 9 | 3 |  |
| 201 | List_Iteration_Loop__Bool (509) | 18405.85, 4589.26 |  |  |  | 4 |  |
| 202 | Stop_and_Delete_Basic_Motion_Device (86) | 19209.1, 4587.62 | Vel |  |  | 4 |  |
| 203 | Create_3D_Vector (225) | 19701.6, 4831.27 |  |  |  | 3 |  |
| 204 | Add_Uniform_Basic_Linear_Motion_Device (84) | 20008.78, 4586.24 | Vel | 999.0 |  | 5 |  |
| 205 | Get_Entity_Location_and_Rotation (99) | 19902.83, 4837.65 |  |  |  | 1 |  |
| 206 | Split_3D_Vector (9) | 20208.93, 4834.76 |  |  |  | 1 |  |
| 207 | Less_Than__Int (230) | 20500.68, 4835.99 |  |  |  | 2 |  |
| 208 | Double_Branch (2) | 20806.01, 4580.65 |  |  |  | 2 |  |
| 209 | Destroy_Entity (69) | 21605.71, 4581.79 |  |  |  | 2 |  |
| 210 | Set_Node_Graph_Variable__Int (323) | 22403.52, 4586.03 | gamePhase |  |  | 4 |  |
| 211 | Get_Player_GUID_by_Player_ID (750) | 22607.96, 4839.9 |  |  |  | 1 |  |
| 212 | Query_Entity_by_GUID (75) | 22905.78, 4831.1 |  |  |  | 1 |  |
| 213 | Set_Custom_Variable__Int (22) | 23201.14, 4586.09 | GamePhase |  |  | 5 |  |
| 214 | Get_Local_Variable__Bool (18) | 23705.74, 4832.84 |  |  | 5, 5 | 2 |  |
| 215 | Get_Node_Graph_Variable__Entity (337) | 23708.21, 5080.74 | distance |  | 4 | 2 |  |
| 216 | Set_Local_Variable__Bool (19) | 24009.67, 4589.58 |  |  | 5 | 3 |  |
| 217 | Get_Player_GUID_by_Player_ID (750) | 23602.69, 4837.04 |  |  |  | 1 |  |
| 218 | Query_Entity_by_GUID (75) | 23907.32, 4838.99 |  |  |  | 1 |  |
| 219 | Get_Custom_Variable__Int (50) | 24208.42, 4838.5 | maxDistance |  | 4 | 3 |  |
| 220 | Greater_Than__Int (232) | 24503.79, 4830.01 |  |  |  | 2 |  |
| 221 | Double_Branch (2) | 24806.45, 4588.34 |  |  |  | 3 |  |
| 222 | Get_Player_GUID_by_Player_ID (750) | 25006.07, 4831.11 |  |  |  | 1 |  |
| 223 | Query_Entity_by_GUID (75) | 25300.93, 4839.42 |  |  |  | 1 |  |
| 224 | Set_Custom_Variable__Int (22) | 25608.79, 4581.14 | maxDistance |  | 4 | 5 |  |
| 225 | Double_Branch (2) | 26407.39, 4584.31 |  |  |  | 3 |  |
| 226 | Query_Entity_by_GUID (75) | 26906.87, 4831.4 |  |  |  | 1 |  |
| 227 | Get_Local_Variable__Bool (18) | 26909.49, 5083.83 |  |  | 16, 16 | 2 |  |
| 228 | Set_Entity_Active_Nameplate (617) | 27200.76, 4588.36 |  |  |  | 3 |  |
| 229 | Double_Branch (2) | 28000.6, 4587.89 |  |  |  | 3 |  |
| 230 | Query_Entity_by_GUID (75) | 28505.07, 4837.34 |  |  |  | 1 |  |
| 231 | Get_Local_Variable__Bool (18) | 28500.33, 5089.29 |  |  | 16, 16 | 2 |  |
| 232 | Set_Entity_Active_Nameplate (617) | 28807.99, 4583.03 |  |  |  | 3 |  |
| 233 | Get_Local_Variable__Bool (18) | 29306.52, 4838.05 |  |  | 9, 9 | 2 |  |
| 234 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 29307.32, 5088.08 |  |  |  | 1 |  |
| 235 | Set_Local_Variable__Bool (19) | 29604.01, 4580.37 |  |  | 9 | 3 |  |
| 236 | List_Iteration_Loop__Bool (509) | 30408.98, 4586.43 |  |  |  | 4 |  |
| 237 | Destroy_Entity (69) | 31200.51, 4585.11 |  |  |  | 1 |  |
| 238 | Get_Local_Variable__Bool (18) | 30901.93, 5192.75 |  |  | 9, 9 | 2 |  |
| 239 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 30901.14, 5445.36 |  |  |  | 1 |  |
| 240 | Set_Local_Variable__Bool (19) | 31203.64, 4948.39 |  |  | 9 | 3 |  |
| 241 | List_Iteration_Loop__Bool (509) | 32007.15, 4948.69 |  |  |  | 4 |  |
| 242 | Destroy_Entity (69) | 32809.56, 4946.39 |  |  |  | 1 |  |
| 243 | Get_Local_Variable__Bool (18) | 32506.77, 5554.33 |  |  | 9, 9 | 2 |  |
| 244 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 32506.56, 5802.52 |  |  |  | 1 |  |
| 245 | Set_Local_Variable__Bool (19) | 32805.58, 5307.95 |  |  | 9 | 3 |  |
| 246 | List_Iteration_Loop__Bool (509) | 33608.94, 5301.41 |  |  |  | 4 |  |
| 247 | Destroy_Entity (69) | 34406.6, 5300.04 |  |  |  | 1 |  |
| 248 | Get_Local_Variable__Bool (18) | 34109.46, 5920.0 |  |  | 9, 9 | 2 |  |
| 249 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 34108.45, 6164.96 |  |  |  | 1 |  |
| 250 | Set_Local_Variable__Bool (19) | 34401.89, 5661.62 |  |  | 9 | 3 |  |
| 251 | List_Iteration_Loop__Bool (509) | 35209.43, 5660.59 |  |  |  | 4 |  |
| 252 | Destroy_Entity (69) | 36001.73, 5661.87 |  |  |  | 1 |  |
| 253 | Get_Player_GUID_by_Player_ID (750) | 35409.4, 6276.33 |  |  |  | 1 |  |
| 254 | Query_Entity_by_GUID (75) | 35703.07, 6273.36 |  |  |  | 1 |  |
| 255 | Start_Pause_Player_Background_Music (595) | 36000.39, 6029.41 |  |  |  | 3 |  |
| 256 | Get_Player_GUID_by_Player_ID (750) | 36204.02, 6273.29 |  |  |  | 1 |  |
| 257 | Query_Entity_by_GUID (75) | 36508.65, 6275.79 |  |  |  | 1 |  |
| 258 | Show_Floating_Interaction_Page (828) | 36801.4, 6026.11 |  |  |  | 3 |  |
| 259 | Get_Player_GUID_by_Player_ID (750) | 37006.99, 6278.28 |  |  |  | 1 |  |
| 260 | Query_Entity_by_GUID (75) | 37301.64, 6279.02 |  |  |  | 1 |  |
| 261 | Set_Player_Settlement_Success_Status (652) | 37604.86, 6026.69 |  |  | 4101 | 2 |  |
| 262 | Double_Branch (2) | 19200.16, 4941.16 |  |  |  | 2 |  |
| 263 | Get_Local_Variable__Bool (18) | 19706.61, 5196.12 |  |  | 5, 5 | 2 |  |
| 264 | Get_Node_Graph_Variable__Entity (337) | 19704.39, 5448.87 | angrySpriteTimer |  | 4 | 2 |  |
| 265 | Set_Local_Variable__Bool (19) | 20005.16, 4945.53 |  |  | 5 | 3 |  |
| 266 | Addition__Int (200) | 20507.95, 5190.02 |  |  |  | 3 |  |
| 267 | Set_Local_Variable__Bool (19) | 20802.12, 4947.12 |  |  | 5 | 3 |  |
| 268 | Greater_Than_or_Equal_To__Int (233) | 21308.34, 5190.22 |  |  |  | 2 |  |
| 269 | Double_Branch (2) | 21600.1, 4947.68 |  |  |  | 3 |  |
| 270 | Set_Node_Graph_Variable__Int (323) | 22400.48, 4943.06 | angrySpriteTimer |  |  | 4 |  |
| 271 | Get_Node_Graph_Variable__Entity (337) | 22907.47, 5191.44 | angrySpriteToggle |  | 3 | 2 |  |
| 272 | Double_Branch (2) | 23206.02, 4947.77 |  |  |  | 3 |  |
| 273 | Set_Node_Graph_Variable__Int (323) | 24003.3, 4948.25 | angrySpriteToggle |  | 2 | 4 |  |
| 274 | Query_Entity_by_GUID (75) | 24506.25, 5190.04 |  |  |  | 1 |  |
| 275 | Assembly_List__Int (169) | 24505.48, 5444.22 |  |  | 7 ×101 | 102 |  |
| 276 | Set_Entity_Active_Nameplate (617) | 24806.24, 4940.37 |  |  |  | 3 |  |
| 277 | Double_Branch (2) | 25608.41, 4948.13 |  |  |  | 2 |  |
| 278 | Query_Entity_by_GUID (75) | 26101.65, 5190.47 |  |  |  | 1 |  |
| 279 | Get_Local_Variable__Bool (18) | 26103.02, 5447.43 |  |  | 16, 16 | 2 |  |
| 280 | Set_Entity_Active_Nameplate (617) | 26401.91, 4946.06 |  |  |  | 2 |  |
| 281 | Set_Node_Graph_Variable__Int (323) | 24001.95, 5304.13 | angrySpriteToggle |  | 2 | 4 |  |
| 282 | Query_Entity_by_GUID (75) | 24502.65, 5557.13 |  |  |  | 1 |  |
| 283 | Get_Local_Variable__Bool (18) | 24502.82, 5808.38 |  |  | 16, 16 | 2 |  |
| 284 | Set_Entity_Active_Nameplate (617) | 24807.06, 5306.71 |  |  |  | 3 |  |
| 285 | Double_Branch (2) | 25607.55, 5304.48 |  |  |  | 2 |  |
| 286 | Query_Entity_by_GUID (75) | 26103.5, 5555.54 |  |  |  | 1 |  |
| 287 | Assembly_List__Int (169) | 26102.37, 5808.04 |  |  | 7 ×101 | 102 |  |
| 288 | Set_Entity_Active_Nameplate (617) | 26400.87, 5306.57 |  |  |  | 2 |  |
| 289 | Set_Node_Graph_Variable__Int (323) | 22407.35, 5300.8 | angrySpriteTimer |  |  | 3 |  |
| 290 | When_UI_Control_Group_Is_Triggered (316) | 9.46, 6875.91 |  |  |  | 1 |  |
| 291 | Equal__Str (14) | 500.06, 7126.18 |  |  | 5, 5 | 2 |  |
| 292 | Double_Branch (2) | 802.55, 6871.52 |  |  |  | 3 |  |
| 293 | Get_Node_Graph_Variable__Entity (337) | 703.42, 7126.26 | gamePhase |  | 4 | 2 |  |
| 294 | Equal__Str (14) | 1008.27, 7120.9 |  |  | 6, 6 | 2 |  |
| 295 | Logical_NOT_Operation (229) | 1308.33, 7129.87 |  |  |  | 1 |  |
| 296 | Double_Branch (2) | 1604.31, 6873.69 |  |  |  | 3 |  |
| 297 | Get_Local_Variable__Bool (18) | 2103.41, 7120.11 |  |  |  | 2 |  |
| 298 | Set_Local_Variable__Bool (19) | 2403.32, 6871.72 |  |  |  | 2 |  |
| 299 | Get_Local_Variable__Bool (18) | 2904.58, 7485.35 |  |  | 3, 3 | 2 |  |
| 300 | Get_Node_Graph_Variable__Entity (337) | 2102.29, 7488.85 | __gsts_stage |  |  | 2 |  |
| 301 | Get_Local_Variable__Bool (18) | 2101.8, 7731.53 |  |  | 7, 7 | 2 |  |
| 302 | Create_Prefab (252) | 2408.74, 7235.93 |  |  |  | 8 |  |
| 303 | Set_Local_Variable__Bool (19) | 3209.66, 7232.89 |  |  | 3 | 3 |  |
| 304 | Set_Node_Graph_Variable__Int (323) | 4000.45, 7231.84 |  |  |  | 4 |  |
| 305 | Set_Node_Graph_Variable__Int (323) | 4802.13, 7234.91 | gamePhase |  |  | 4 |  |
| 306 | Set_Node_Graph_Variable__Int (323) | 5606.14, 7233.58 | distance |  |  | 4 |  |
| 307 | Set_Node_Graph_Variable__Int (323) | 6407.07, 7238.26 | hitStopTimer |  |  | 4 |  |
| 308 | Set_Node_Graph_Variable__Int (323) | 7201.68, 7233.8 |  |  |  | 4 |  |
| 309 | Set_Node_Graph_Variable__Int (323) | 8005.41, 7234.41 | angrySpriteTimer |  |  | 4 |  |
| 310 | Set_Node_Graph_Variable__Int (323) | 8801.26, 7235.08 | angrySpriteToggle |  | 2 | 4 |  |
| 311 | Get_Player_GUID_by_Player_ID (750) | 9000.23, 7480.95 |  |  |  | 1 |  |
| 312 | Query_Entity_by_GUID (75) | 9306.39, 7487.51 |  |  |  | 1 |  |
| 313 | Set_Custom_Variable__Int (22) | 9608.42, 7230.88 | GamePhase |  |  | 5 |  |
| 314 | Get_Player_GUID_by_Player_ID (750) | 9806.64, 7481.07 |  |  |  | 1 |  |
| 315 | Query_Entity_by_GUID (75) | 10101.81, 7487.27 |  |  |  | 1 |  |
| 316 | Set_Custom_Variable__Int (22) | 10402.67, 7238.85 | HitStop |  |  | 5 |  |
| 317 | Get_Player_GUID_by_Player_ID (750) | 10607.05, 7482.28 |  |  |  | 1 |  |
| 318 | Query_Entity_by_GUID (75) | 10901.33, 7480.24 |  |  |  | 1 |  |
| 319 | Set_Custom_Variable__Int (22) | 11207.13, 7235.61 |  |  | 4 | 5 |  |
| 320 | Get_Player_GUID_by_Player_ID (750) | 11409.64, 7487.71 |  |  |  | 1 |  |
| 321 | Query_Entity_by_GUID (75) | 11700.46, 7481.52 |  |  |  | 1 |  |
| 322 | Set_Custom_Variable__Int (22) | 12002.79, 7232.07 | Distance |  |  | 5 |  |
| 323 | Get_Local_Variable__Bool (18) | 12508.16, 7480.02 |  |  | 3, 3 | 2 |  |
| 324 | Query_Entity_by_GUID (75) | 12502.42, 7739.74 |  |  |  | 1 |  |
| 325 | Set_Local_Variable__Bool (19) | 12809.26, 7233.16 |  |  | 3 | 3 |  |
| 326 | Switch_Follow_Motion_Device_Target_by_Entity (668) | 13606.57, 7236.73 |  |  | 1201, 1101 | 8 |  |
| 327 | Activate_Disable_Follow_Motion_Device (365) | 14401.41, 7237.73 |  |  |  | 3 |  |
| 328 | Assembly_List__Int (169) | 14905.9, 7484.55 |  |  | 7 ×101 | 102 |  |
| 329 | Set_Entity_Active_Nameplate (617) | 15208.15, 7239.17 |  |  |  | 3 |  |
| 330 | Get_Local_Variable__Bool (18) | 15704.59, 7480.99 |  |  | 3, 3 | 2 |  |
| 331 | Query_Entity_by_GUID (75) | 15706.27, 7736.95 |  |  |  | 1 |  |
| 332 | Set_Local_Variable__Bool (19) | 16006.76, 7230.04 |  |  | 3 | 3 |  |
| 333 | Switch_Follow_Motion_Device_Target_by_Entity (668) | 16803.63, 7239.21 |  |  | 1201, 1101 | 8 |  |
| 334 | Activate_Disable_Follow_Motion_Device (365) | 17609.36, 7230.61 |  |  |  | 3 |  |
| 335 | Get_Local_Variable__Bool (18) | 18104.1, 7484.73 |  |  | 16, 16 | 2 |  |
| 336 | Set_Entity_Active_Nameplate (617) | 18403.59, 7237.85 |  |  |  | 3 |  |
| 337 | Double_Branch (2) | 19207.88, 7230.1 |  |  |  | 3 |  |
| 338 | Get_Local_Variable__Bool (18) | 19702.24, 7486.23 |  |  | 3, 3 | 2 |  |
| 339 | Query_Entity_by_GUID (75) | 19700.23, 7737.35 |  |  |  | 1 |  |
| 340 | Set_Local_Variable__Bool (19) | 20008.12, 7237.6 |  |  | 3 | 3 |  |
| 341 | Switch_Follow_Motion_Device_Target_by_Entity (668) | 20804.09, 7234.27 |  |  | 1201, 1101 | 8 |  |
| 342 | Activate_Disable_Follow_Motion_Device (365) | 21608.98, 7237.3 |  |  |  | 3 |  |
| 343 | Get_Local_Variable__Bool (18) | 22107.03, 7488.72 |  |  | 16, 16 | 2 |  |
| 344 | Set_Entity_Active_Nameplate (617) | 22404.62, 7231.5 |  |  |  | 3 |  |
| 345 | Double_Branch (2) | 23206.43, 7232.95 |  |  |  | 3 |  |
| 346 | Get_Local_Variable__Bool (18) | 23709.66, 7487.48 |  |  | 3, 3 | 2 |  |
| 347 | Query_Entity_by_GUID (75) | 23700.49, 7738.54 |  |  |  | 1 |  |
| 348 | Set_Local_Variable__Bool (19) | 24001.36, 7232.99 |  |  | 3 | 3 |  |
| 349 | Switch_Follow_Motion_Device_Target_by_Entity (668) | 24802.16, 7234.84 |  |  | 1201, 1101 | 8 |  |
| 350 | Activate_Disable_Follow_Motion_Device (365) | 25606.78, 7233.58 |  |  |  | 3 |  |
| 351 | Get_Local_Variable__Bool (18) | 26100.8, 7486.75 |  |  | 16, 16 | 2 |  |
| 352 | Set_Entity_Active_Nameplate (617) | 26402.14, 7239.9 |  |  |  | 3 |  |
| 353 | Get_Player_GUID_by_Player_ID (750) | 26603.22, 7481.21 |  |  |  | 1 |  |
| 354 | Query_Entity_by_GUID (75) | 26906.27, 7486.05 |  |  |  | 1 |  |
| 355 | Modify_Player_Background_Music (597) | 27201.82, 7233.35 |  | 999.0, 1.0 |  | 10 |  |
| 356 | Get_Player_GUID_by_Player_ID (750) | 27404.98, 7481.55 |  |  |  | 1 |  |
| 357 | Query_Entity_by_GUID (75) | 27707.37, 7485.1 |  |  |  | 1 |  |
| 358 | Start_Pause_Player_Background_Music (595) | 28003.62, 7230.32 |  |  |  | 3 |  |
| 359 | Get_Player_GUID_by_Player_ID (750) | 28202.34, 7483.22 |  |  |  | 1 |  |
| 360 | Query_Entity_by_GUID (75) | 28508.85, 7481.06 |  |  |  | 1 |  |
| 361 | Modify_UI_Control_Status_Within_the_Interface_Layout (384) | 28801.63, 7239.74 |  |  | 1900 | 4 |  |
| 362 | Get_Player_GUID_by_Player_ID (750) | 29006.62, 7480.87 |  |  |  | 1 |  |
| 363 | Query_Entity_by_GUID (75) | 29302.44, 7481.58 |  |  |  | 1 |  |
| 364 | Modify_UI_Control_Status_Within_the_Interface_Layout (384) | 29605.81, 7239.08 |  |  | 1900 | 4 |  |
| 365 | Add_Uniform_Basic_Linear_Motion_Device (84) | 30404.04, 7238.18 | Vel | 999.0 |  | 5 |  |
| 366 | Equal__Str (14) | 30907.68, 7486.21 |  |  | 5, 5 | 2 |  |
| 367 | Double_Branch (2) | 31205.2, 7238.5 |  |  |  | 3 |  |
| 368 | Get_Node_Graph_Variable__Entity (337) | 31400.58, 7486.75 | gamePhase |  | 4 | 2 |  |
| 369 | Equal__Str (14) | 31705.28, 7481.94 |  |  | 6, 6 | 2 |  |
| 370 | Double_Branch (2) | 32009.34, 7231.11 |  |  |  | 3 |  |
| 371 | Settle_Stage (77) | 32804.69, 7237.49 |  |  |  | 1 |  |
| 372 | Equal__Str (14) | 33307.87, 7487.95 |  |  | 5, 5 | 2 |  |
| 373 | Double_Branch (2) | 33600.17, 7235.22 |  |  |  | 2 |  |
| 374 | Get_Node_Graph_Variable__Entity (337) | 33800.88, 7486.96 | gamePhase |  | 4 | 2 |  |
| 375 | Equal__Str (14) | 34100.6, 7484.08 |  |  | 6, 6 | 2 |  |
| 376 | Double_Branch (2) | 34404.87, 7238.11 |  |  |  | 2 |  |
| 377 | Get_Player_GUID_by_Player_ID (750) | 34603.97, 7482.42 |  |  |  | 1 |  |
| 378 | Query_Entity_by_GUID (75) | 34901.1, 7488.4 |  |  |  | 1 |  |
| 379 | Player_Plays_One_Shot_2D_Sound_Effect (598) | 35206.04, 7237.03 |  | 1.0 |  | 5 |  |
| 380 | Set_Node_Graph_Variable__Int (323) | 36008.1, 7236.76 |  |  |  | 4 |  |
| 381 | Set_Node_Graph_Variable__Int (323) | 36802.82, 7231.54 |  |  |  | 4 |  |
| 382 | Query_Entity_by_GUID (75) | 37301.96, 7484.16 |  |  |  | 1 |  |
| 383 | Get_Local_Variable__Bool (18) | 37301.02, 7738.73 |  |  | 16, 16 | 2 |  |
| 384 | Set_Entity_Active_Nameplate (617) | 37604.13, 7239.85 |  |  |  | 3 |  |
| 385 | Query_Entity_by_GUID (75) | 38101.47, 7485.96 |  |  |  | 1 |  |
| 386 | Assembly_List__Int (169) | 38103.55, 7732.07 |  |  | 7 ×101 | 102 |  |
| 387 | Set_Entity_Active_Nameplate (617) | 38405.77, 7232.03 |  |  |  | 3 |  |
| 388 | Get_Local_Variable__Bool (18) | 38907.82, 7489.09 |  |  | 9, 9 | 2 |  |
| 389 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 38904.59, 7736.69 |  |  |  | 1 |  |
| 390 | Set_Local_Variable__Bool (19) | 39205.55, 7234.87 |  |  | 9 | 3 |  |
| 391 | List_Iteration_Loop__Bool (509) | 7.06, 7837.74 |  |  |  | 3 |  |
| 392 | Stop_and_Delete_Basic_Motion_Device (86) | 809.19, 7833.08 | Vel |  |  | 4 |  |
| 393 | Add_Uniform_Basic_Linear_Motion_Device (84) | 1606.92, 7832.35 | Vel | 999.0 |  | 4 |  |
| 394 | When_Floating_Interaction_Page_is_Triggered (826) | 0.32, 8434.99 |  |  |  | 1 |  |
| 395 | Equal__Str (14) | 203.63, 8687.08 |  |  | 5, 5 | 2 |  |
| 396 | Logical_NOT_Operation (229) | 503.62, 8686.88 |  |  |  | 1 |  |
| 397 | Double_Branch (2) | 809.08, 8435.82 |  |  |  | 3 |  |
| 398 | Get_Local_Variable__Bool (18) | 1305.07, 8687.0 |  |  |  | 2 |  |
| 399 | Set_Local_Variable__Bool (19) | 1609.09, 8432.15 |  |  |  | 2 |  |
| 400 | Equal__Str (14) | 1302.46, 9042.8 |  |  | 5, 5 | 2 |  |
| 401 | Double_Branch (2) | 1608.58, 8798.34 |  |  |  | 3 |  |
| 402 | Get_Player_GUID_by_Player_ID (750) | 1801.22, 9044.88 |  |  |  | 1 |  |
| 403 | Query_Entity_by_GUID (75) | 2100.86, 9046.43 |  |  |  | 1 |  |
| 404 | Show_Floating_Interaction_Page (828) | 2409.34, 8790.01 |  |  |  | 3 |  |
| 405 | Equal__Str (14) | 2900.41, 9042.41 |  |  | 5, 5 | 2 |  |
| 406 | Double_Branch (2) | 3202.97, 8790.22 |  |  |  | 3 |  |
| 407 | Get_Node_Graph_Variable__Entity (337) | 3407.63, 9046.41 | gamePhase |  | 4 | 2 |  |
| 408 | Equal__Str (14) | 3706.07, 9047.4 |  |  | 6, 6 | 2 |  |
| 409 | Double_Branch (2) | 4003.41, 8797.01 |  |  |  | 3 |  |
| 410 | Get_Player_GUID_by_Player_ID (750) | 4207.56, 9041.43 |  |  |  | 1 |  |
| 411 | Query_Entity_by_GUID (75) | 4504.4, 9040.21 |  |  |  | 1 |  |
| 412 | Close_Floating_Interaction_Page (824) | 4800.19, 8794.6 |  |  |  | 3 |  |
| 413 | Get_Local_Variable__Bool (18) | 6109.87, 9040.18 |  |  | 3, 3 | 2 |  |
| 414 | Get_Node_Graph_Variable__Entity (337) | 5302.43, 9040.66 | __gsts_stage |  |  | 2 |  |
| 415 | Get_Local_Variable__Bool (18) | 5300.19, 9298.73 |  |  | 7, 7 | 2 |  |
| 416 | Create_Prefab (252) | 5600.24, 8790.75 |  |  |  | 8 |  |
| 417 | Set_Local_Variable__Bool (19) | 6405.83, 8792.91 |  |  | 3 | 3 |  |
| 418 | Set_Node_Graph_Variable__Int (323) | 7209.73, 8796.75 |  |  |  | 4 |  |
| 419 | Set_Node_Graph_Variable__Int (323) | 8003.99, 8790.46 | gamePhase |  |  | 4 |  |
| 420 | Set_Node_Graph_Variable__Int (323) | 8800.05, 8798.0 | distance |  |  | 4 |  |
| 421 | Set_Node_Graph_Variable__Int (323) | 9607.22, 8796.31 | hitStopTimer |  |  | 4 |  |
| 422 | Set_Node_Graph_Variable__Int (323) | 10403.16, 8790.23 |  |  |  | 4 |  |
| 423 | Set_Node_Graph_Variable__Int (323) | 11202.49, 8790.9 | angrySpriteTimer |  |  | 4 |  |
| 424 | Set_Node_Graph_Variable__Int (323) | 12000.65, 8797.84 | angrySpriteToggle |  | 2 | 4 |  |
| 425 | Get_Player_GUID_by_Player_ID (750) | 12200.49, 9040.86 |  |  |  | 1 |  |
| 426 | Query_Entity_by_GUID (75) | 12503.62, 9041.09 |  |  |  | 1 |  |
| 427 | Set_Custom_Variable__Int (22) | 12800.52, 8791.84 | GamePhase |  |  | 5 |  |
| 428 | Get_Player_GUID_by_Player_ID (750) | 13006.33, 9041.76 |  |  |  | 1 |  |
| 429 | Query_Entity_by_GUID (75) | 13300.73, 9042.04 |  |  |  | 1 |  |
| 430 | Set_Custom_Variable__Int (22) | 13602.15, 8791.33 | HitStop |  |  | 5 |  |
| 431 | Get_Player_GUID_by_Player_ID (750) | 13801.38, 9042.84 |  |  |  | 1 |  |
| 432 | Query_Entity_by_GUID (75) | 14100.83, 9046.18 |  |  |  | 1 |  |
| 433 | Set_Custom_Variable__Int (22) | 14404.84, 8794.94 |  |  | 4 | 5 |  |
| 434 | Get_Player_GUID_by_Player_ID (750) | 14603.17, 9040.31 |  |  |  | 1 |  |
| 435 | Query_Entity_by_GUID (75) | 14904.45, 9043.16 |  |  |  | 1 |  |
| 436 | Set_Custom_Variable__Int (22) | 15207.4, 8792.59 | Distance |  |  | 5 |  |
| 437 | Get_Local_Variable__Bool (18) | 15708.07, 9041.73 |  |  | 3, 3 | 2 |  |
| 438 | Query_Entity_by_GUID (75) | 15700.49, 9291.15 |  |  |  | 1 |  |
| 439 | Set_Local_Variable__Bool (19) | 16008.04, 8799.68 |  |  | 3 | 3 |  |
| 440 | Switch_Follow_Motion_Device_Target_by_Entity (668) | 16808.77, 8791.55 |  |  | 1201, 1101 | 8 |  |
| 441 | Activate_Disable_Follow_Motion_Device (365) | 17602.2, 8799.35 |  |  |  | 3 |  |
| 442 | Assembly_List__Int (169) | 18106.33, 9049.18 |  |  | 7 ×101 | 102 |  |
| 443 | Set_Entity_Active_Nameplate (617) | 18408.16, 8795.95 |  |  |  | 3 |  |
| 444 | Get_Local_Variable__Bool (18) | 18905.22, 9041.14 |  |  | 3, 3 | 2 |  |
| 445 | Query_Entity_by_GUID (75) | 18908.61, 9299.02 |  |  |  | 1 |  |
| 446 | Set_Local_Variable__Bool (19) | 19209.26, 8795.74 |  |  | 3 | 3 |  |
| 447 | Switch_Follow_Motion_Device_Target_by_Entity (668) | 20007.54, 8794.17 |  |  | 1201, 1101 | 8 |  |
| 448 | Activate_Disable_Follow_Motion_Device (365) | 20801.73, 8798.9 |  |  |  | 3 |  |
| 449 | Get_Local_Variable__Bool (18) | 21305.56, 9040.91 |  |  | 16, 16 | 2 |  |
| 450 | Set_Entity_Active_Nameplate (617) | 21603.61, 8799.93 |  |  |  | 3 |  |
| 451 | Double_Branch (2) | 22401.99, 8792.19 |  |  |  | 3 |  |
| 452 | Get_Local_Variable__Bool (18) | 22901.05, 9042.98 |  |  | 3, 3 | 2 |  |
| 453 | Query_Entity_by_GUID (75) | 22901.68, 9299.56 |  |  |  | 1 |  |
| 454 | Set_Local_Variable__Bool (19) | 23200.28, 8792.52 |  |  | 3 | 3 |  |
| 455 | Switch_Follow_Motion_Device_Target_by_Entity (668) | 24009.29, 8791.06 |  |  | 1201, 1101 | 8 |  |
| 456 | Activate_Disable_Follow_Motion_Device (365) | 24808.94, 8798.27 |  |  |  | 3 |  |
| 457 | Get_Local_Variable__Bool (18) | 25303.71, 9043.45 |  |  | 16, 16 | 2 |  |
| 458 | Set_Entity_Active_Nameplate (617) | 25606.94, 8795.88 |  |  |  | 3 |  |
| 459 | Double_Branch (2) | 26402.94, 8793.09 |  |  |  | 3 |  |
| 460 | Get_Local_Variable__Bool (18) | 26907.82, 9045.68 |  |  | 3, 3 | 2 |  |
| 461 | Query_Entity_by_GUID (75) | 26901.51, 9290.11 |  |  |  | 1 |  |
| 462 | Set_Local_Variable__Bool (19) | 27208.62, 8799.56 |  |  | 3 | 3 |  |
| 463 | Switch_Follow_Motion_Device_Target_by_Entity (668) | 28001.63, 8791.65 |  |  | 1201, 1101 | 8 |  |
| 464 | Activate_Disable_Follow_Motion_Device (365) | 28800.53, 8796.43 |  |  |  | 3 |  |
| 465 | Get_Local_Variable__Bool (18) | 29304.7, 9046.3 |  |  | 16, 16 | 2 |  |
| 466 | Set_Entity_Active_Nameplate (617) | 29605.64, 8798.19 |  |  |  | 3 |  |
| 467 | Get_Player_GUID_by_Player_ID (750) | 29808.93, 9048.96 |  |  |  | 1 |  |
| 468 | Query_Entity_by_GUID (75) | 30101.85, 9048.6 |  |  |  | 1 |  |
| 469 | Modify_Player_Background_Music (597) | 30404.59, 8793.53 |  | 999.0, 1.0 |  | 10 |  |
| 470 | Get_Player_GUID_by_Player_ID (750) | 30600.39, 9048.87 |  |  |  | 1 |  |
| 471 | Query_Entity_by_GUID (75) | 30900.88, 9045.96 |  |  |  | 1 |  |
| 472 | Start_Pause_Player_Background_Music (595) | 31200.09, 8795.11 |  |  |  | 3 |  |
| 473 | Get_Player_GUID_by_Player_ID (750) | 31402.25, 9045.88 |  |  |  | 1 |  |
| 474 | Query_Entity_by_GUID (75) | 31707.61, 9043.66 |  |  |  | 1 |  |
| 475 | Set_Player_Settlement_Success_Status (652) | 32005.05, 8799.62 |  |  | 4100 | 3 |  |
| 476 | Add_Uniform_Basic_Linear_Motion_Device (84) | 32807.03, 8793.73 | Vel | 999.0 |  | 5 |  |
| 477 | Equal__Str (14) | 33302.88, 9041.92 |  |  | 5, 5 | 2 |  |
| 478 | Double_Branch (2) | 33604.51, 8794.0 |  |  |  | 2 |  |
| 479 | Get_Node_Graph_Variable__Entity (337) | 33804.04, 9047.52 | gamePhase |  | 4 | 2 |  |
| 480 | Equal__Str (14) | 34102.23, 9048.68 |  |  | 6, 6 | 2 |  |
| 481 | Double_Branch (2) | 34401.12, 8797.63 |  |  |  | 2 |  |
| 482 | Settle_Stage (77) | 35206.32, 8792.61 |  |  |  | 0 |  |
| 483 | Get_Specified_Type_of_Entities_on_the_Field (319) | 201.83, 256.61 |  |  | 1401 | 1 |  |
| 484 | Get_Corresponding_Value_From_List__Int (128) | 500.05, 253.45 |  |  | 2, 2 | 3 |  |
| 485 | Set_Node_Graph_Variable__Int (323) | 800.2, 8.57 | __gsts_stage |  | 5 | 4 |  |
| 486 | Assembly_List__Int (169) | 5009.5, 1352.81 |  |  | 2 ×101 | 102 |  |
| 487 | Assembly_List__Int (169) | 11401.28, 1964.34 |  |  | 7 ×101 | 102 |  |
| 488 | Assembly_List__Int (169) | 18609.23, 1719.19 |  |  | 2 ×101 | 102 |  |
| 489 | Assembly_List__Int (169) | 20201.62, 2079.27 |  |  | 2 ×101 | 102 |  |
| 490 | Assembly_List__Int (169) | 21802.7, 2435.0 |  |  | 2 ×101 | 102 |  |
| 491 | Assembly_List__Int (169) | 23408.45, 2796.59 |  |  | 2 ×101 | 102 |  |
| 492 | Assembly_List__Int (169) | 25000.07, 3157.21 |  |  | 2 ×101 | 102 |  |
| 493 | Assembly_List__Int (169) | 29800.91, 3518.79 |  |  | 2 ×101 | 102 |  |
| 494 | Assembly_List__Int (169) | 209.47, 4720.58 |  |  | 7 ×101 | 102 |  |
| 495 | Assembly_List__Int (169) | 9006.2, 4729.76 |  |  | 7 ×101 | 102 |  |
| 496 | Assembly_List__Int (169) | 9804.1, 4724.0 |  |  | 7 ×101 | 102 |  |
| 497 | Assembly_List__Int (169) | 12208.0, 4478.13 |  |  | 2 ×101 | 102 |  |
| 498 | Assembly_List__Int (169) | 17005.83, 4837.2 |  |  | 2 ×101 | 102 |  |
| 499 | Assembly_List__Int (169) | 26605.09, 5085.68 |  |  | 7 ×101 | 102 |  |
| 500 | Assembly_List__Int (169) | 28205.41, 5082.87 |  |  | 7 ×101 | 102 |  |
| 501 | Assembly_List__Int (169) | 29002.54, 4837.92 |  |  | 2 ×101 | 102 |  |
| 502 | Assembly_List__Int (169) | 30601.96, 5194.76 |  |  | 2 ×101 | 102 |  |
| 503 | Assembly_List__Int (169) | 32201.2, 5554.32 |  |  | 2 ×101 | 102 |  |
| 504 | Assembly_List__Int (169) | 33803.11, 5910.48 |  |  | 2 ×101 | 102 |  |
| 505 | Assembly_List__Int (169) | 25800.56, 5442.99 |  |  | 7 ×101 | 102 |  |
| 506 | Assembly_List__Int (169) | 24201.48, 5800.16 |  |  | 7 ×101 | 102 |  |
| 507 | Assembly_List__Int (169) | 1803.66, 7737.55 |  |  |  | 102 |  |
| 508 | Assembly_List__Int (169) | 17808.45, 7481.6 |  |  | 7 ×101 | 102 |  |
| 509 | Assembly_List__Int (169) | 21805.41, 7483.23 |  |  | 7 ×101 | 102 |  |
| 510 | Assembly_List__Int (169) | 25806.75, 7482.49 |  |  | 7 ×101 | 102 |  |
| 511 | Assembly_List__Int (169) | 37003.69, 7730.81 |  |  | 7 ×101 | 102 |  |
| 512 | Assembly_List__Int (169) | 38602.08, 7486.14 |  |  | 2 ×101 | 102 |  |
| 513 | Assembly_List__Int (169) | 5005.51, 9293.18 |  |  |  | 102 |  |
| 514 | Assembly_List__Int (169) | 21000.2, 9046.12 |  |  | 7 ×101 | 102 |  |
| 515 | Assembly_List__Int (169) | 25002.82, 9048.24 |  |  | 7 ×101 | 102 |  |
| 516 | Assembly_List__Int (169) | 29001.82, 9043.09 |  |  | 7 ×101 | 102 |  |

**抽出された数値パラメータ:**

- Node 29: `999.0`
- Node 36: `999.0`
- Node 69: `1.0`
- Node 116: `999.0`
- Node 189: `999.0`
- Node 204: `999.0`
- Node 355: `999.0`
- Node 355: `1.0`
- Node 365: `999.0`
- Node 379: `1.0`
- Node 393: `999.0`
- Node 469: `999.0`
- Node 469: `1.0`
- Node 476: `999.0`

### 6.x `_GSTS_ObstacleManager` 詳細 (GUID `1073741829`)

- **ノード数**: 140
- **参照変数**: `GamePhase`, `Scroll`, `__gsts_interval_1_0`, `__gsts_stage`, `countdown`, `lastBottomRoll`, `lastObstacleSide`, `lastTopRoll`, `sameSideCount`, `tempRoll`, `tempSide`

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | When_Entity_Is_Created (71) | 6.64, 7.27 |  |  |  | 1 |  |
| 2 | Get_Random_Floating_Point_Number (7) | 1300.19, 255.35 |  | 800.0, 1500.0 |  | 2 |  |
| 3 | Set_Node_Graph_Variable__Int (323) | 1606.95, 3.75 | countdown |  |  | 4 |  |
| 4 | Assembly_List__Int (169) | 2107.45, 255.22 |  |  | 4 ×101 | 102 |  |
| 5 | Get_Self_Entity (73) | 2103.71, 504.27 |  |  |  | 0 |  |
| 6 | Start_Timer (79) | 2405.09, 8.58 | __gsts_interval_1_0 |  |  | 4 |  |
| 7 | When_Timer_Is_Triggered (83) | 3.85, 1108.43 |  |  |  | 1 |  |
| 8 | Equal__Str (14) | 507.03, 1352.01 |  |  |  | 2 |  |
| 9 | Double_Branch (2) | 808.46, 1108.77 |  |  |  | 2 |  |
| 10 | Get_Player_GUID_by_Player_ID (750) | 401.37, 1359.4 |  |  |  | 1 |  |
| 11 | Query_Entity_by_GUID (75) | 708.27, 1353.76 |  |  |  | 1 |  |
| 12 | Get_Custom_Variable__Int (50) | 1007.0, 1357.55 | GamePhase |  |  | 3 |  |
| 13 | Equal__Str (14) | 1308.89, 1352.67 |  |  | 5, 5 | 2 |  |
| 14 | Double_Branch (2) | 1604.69, 1101.81 |  |  |  | 2 |  |
| 15 | Get_Local_Variable__Bool (18) | 2101.01, 1352.78 |  |  | 5, 5 | 2 |  |
| 16 | Get_Node_Graph_Variable__Entity (337) | 2109.57, 1607.02 | countdown |  | 4 | 2 |  |
| 17 | Set_Local_Variable__Bool (19) | 2400.33, 1102.43 |  |  | 5 | 3 |  |
| 18 | Subtraction__Int (202) | 2901.91, 1359.64 |  |  |  | 3 |  |
| 19 | Set_Local_Variable__Bool (19) | 3208.51, 1103.97 |  |  | 5 | 3 |  |
| 20 | Set_Node_Graph_Variable__Int (323) | 4000.42, 1104.44 | countdown |  |  | 4 |  |
| 21 | Less_Than_or_Equal_To__Int (231) | 4506.35, 1358.01 |  |  |  | 2 |  |
| 22 | Double_Branch (2) | 4808.86, 1105.27 |  |  |  | 2 |  |
| 23 | Get_Random_Floating_Point_Number (7) | 5302.84, 1350.5 |  | 800.0, 1500.0 |  | 2 |  |
| 24 | Set_Node_Graph_Variable__Int (323) | 5604.04, 1108.47 | countdown |  |  | 4 |  |
| 25 | Get_Local_Variable__Bool (18) | 6106.28, 1359.04 |  |  |  | 2 |  |
| 26 | Get_Random_Integer (257) | 6101.75, 1608.48 |  |  |  | 2 |  |
| 27 | Set_Local_Variable__Bool (19) | 6403.52, 1108.44 |  |  |  | 3 |  |
| 28 | Data_Type_Conversion__Generic (180) | 6901.59, 1353.02 |  |  |  | 2 |  |
| 29 | Set_Node_Graph_Variable__Int (323) | 7201.81, 1107.25 | tempSide |  |  | 4 |  |
| 30 | Get_Local_Variable__Bool (18) | 7708.97, 1353.75 |  |  |  | 2 |  |
| 31 | Get_Node_Graph_Variable__Entity (337) | 7406.84, 1607.72 | lastObstacleSide |  | 4 | 2 |  |
| 32 | Round_to_Integer_Operation (224) | 7700.72, 1601.56 |  |  | 703 | 2 |  |
| 33 | Set_Local_Variable__Bool (19) | 8006.93, 1102.0 |  |  |  | 3 |  |
| 34 | Greater_Than_or_Equal_To__Int (233) | 8501.72, 1353.01 |  |  |  | 2 |  |
| 35 | Double_Branch (2) | 8800.69, 1105.44 |  |  |  | 3 |  |
| 36 | Equal__Str (14) | 9301.48, 1356.64 |  |  | 5, 5 | 2 |  |
| 37 | Double_Branch (2) | 9605.83, 1106.95 |  |  |  | 3 |  |
| 38 | Get_Node_Graph_Variable__Entity (337) | 9803.51, 1350.37 | sameSideCount |  | 4 | 2 |  |
| 39 | Greater_Than_or_Equal_To__Int (233) | 10102.31, 1351.14 |  |  |  | 2 |  |
| 40 | Double_Branch (2) | 10400.56, 1105.48 |  |  |  | 3 |  |
| 41 | Equal__Str (14) | 10901.35, 1351.21 |  |  | 5, 5 | 2 |  |
| 42 | Double_Branch (2) | 11201.74, 1104.18 |  |  |  | 3 |  |
| 43 | Set_Node_Graph_Variable__Int (323) | 12003.54, 1104.1 | tempSide |  |  | 4 |  |
| 44 | Set_Node_Graph_Variable__Int (323) | 12005.3, 1469.16 | tempSide |  |  | 4 |  |
| 45 | Set_Node_Graph_Variable__Int (323) | 12806.92, 1100.63 | sameSideCount |  |  | 4 |  |
| 46 | Get_Node_Graph_Variable__Entity (337) | 10600.88, 1711.63 | sameSideCount |  | 4 | 2 |  |
| 47 | Addition__Int (200) | 10901.55, 1711.78 |  |  |  | 3 |  |
| 48 | Set_Node_Graph_Variable__Int (323) | 11208.56, 1465.52 | sameSideCount |  |  | 4 |  |
| 49 | Set_Node_Graph_Variable__Int (323) | 10406.71, 1462.38 | sameSideCount |  |  | 4 |  |
| 50 | Set_Node_Graph_Variable__Int (323) | 9600.43, 1467.01 | sameSideCount |  |  | 4 |  |
| 51 | Get_Node_Graph_Variable__Entity (337) | 13304.63, 1353.06 | tempSide |  | 4 | 2 |  |
| 52 | Set_Node_Graph_Variable__Int (323) | 13605.35, 1105.4 | lastObstacleSide |  |  | 4 |  |
| 53 | Get_Local_Variable__Bool (18) | 14103.97, 1351.63 |  |  |  | 2 |  |
| 54 | Get_Node_Graph_Variable__Entity (337) | 13809.47, 1600.94 | tempSide |  | 4 | 2 |  |
| 55 | Round_to_Integer_Operation (224) | 14102.26, 1604.18 |  |  | 703 | 2 |  |
| 56 | Set_Local_Variable__Bool (19) | 14402.31, 1105.96 |  |  |  | 3 |  |
| 57 | Get_Local_Variable__Bool (18) | 14902.33, 1359.08 |  |  | 5, 5 | 2 |  |
| 58 | Set_Local_Variable__Bool (19) | 15202.14, 1102.51 |  |  | 5 | 3 |  |
| 59 | Get_Local_Variable__Bool (18) | 15702.44, 1358.67 |  |  | 5, 5 | 2 |  |
| 60 | Set_Local_Variable__Bool (19) | 16001.27, 1106.32 |  |  | 5 | 3 |  |
| 61 | Equal__Str (14) | 16505.53, 1351.76 |  |  | 5, 5 | 2 |  |
| 62 | Double_Branch (2) | 16802.53, 1105.57 |  |  |  | 3 |  |
| 63 | Set_Local_Variable__Bool (19) | 17601.57, 1107.12 |  |  | 5 | 3 |  |
| 64 | Set_Local_Variable__Bool (19) | 18403.06, 1101.55 |  |  | 5 | 3 |  |
| 65 | Get_Local_Variable__Bool (18) | 18902.71, 1350.61 |  |  | 6, 6 | 2 |  |
| 66 | Create_3D_Vector (225) | 18905.02, 1609.47 |  | 15.0, 3.0 |  | 3 |  |
| 67 | Set_Local_Variable__Bool (19) | 19204.9, 1103.78 |  |  | 6 | 3 |  |
| 68 | Get_Local_Variable__Bool (18) | 19704.33, 1359.55 |  |  | 6, 6 | 2 |  |
| 69 | Create_3D_Vector (225) | 19705.89, 1608.61 |  |  |  | 3 |  |
| 70 | Set_Local_Variable__Bool (19) | 20004.21, 1108.44 |  |  | 6 | 3 |  |
| 71 | Get_Local_Variable__Bool (18) | 20509.66, 1352.67 |  |  |  | 2 |  |
| 72 | Get_Random_Integer (257) | 20508.54, 1609.85 |  |  |  | 2 |  |
| 73 | Set_Local_Variable__Bool (19) | 20804.81, 1101.6 |  |  |  | 3 |  |
| 74 | Data_Type_Conversion__Generic (180) | 21306.5, 1353.46 |  |  |  | 2 |  |
| 75 | Set_Node_Graph_Variable__Int (323) | 21603.37, 1105.14 | tempRoll |  |  | 4 |  |
| 76 | Equal__Str (14) | 22105.45, 1353.55 |  |  | 5, 5 | 2 |  |
| 77 | Double_Branch (2) | 22408.41, 1100.44 |  |  |  | 3 |  |
| 78 | Get_Node_Graph_Variable__Entity (337) | 22306.77, 1354.3 | lastBottomRoll |  | 4 | 2 |  |
| 79 | Round_to_Integer_Operation (224) | 22600.09, 1357.18 |  |  | 703 | 2 |  |
| 80 | Equal__Str (14) | 22903.32, 1357.86 |  |  | 5, 5 | 2 |  |
| 81 | Double_Branch (2) | 23204.57, 1101.58 |  |  |  | 3 |  |
| 82 | Less_Than__Int (230) | 23700.12, 1358.44 |  |  |  | 2 |  |
| 83 | Double_Branch (2) | 24007.94, 1100.56 |  |  |  | 3 |  |
| 84 | Addition__Int (200) | 24202.06, 1353.76 |  |  |  | 3 |  |
| 85 | Data_Type_Conversion__Generic (180) | 24501.87, 1357.86 |  |  |  | 2 |  |
| 86 | Set_Node_Graph_Variable__Int (323) | 24805.12, 1103.16 | tempRoll |  |  | 4 |  |
| 87 | Set_Node_Graph_Variable__Int (323) | 24808.0, 1466.18 | tempRoll |  |  | 4 |  |
| 88 | Get_Node_Graph_Variable__Entity (337) | 25305.98, 1355.24 | tempRoll |  | 4 | 2 |  |
| 89 | Set_Node_Graph_Variable__Int (323) | 25608.76, 1107.83 | lastBottomRoll |  |  | 4 |  |
| 90 | Equal__Str (14) | 26101.96, 1353.21 |  |  | 5, 5 | 2 |  |
| 91 | Double_Branch (2) | 26402.19, 1107.94 |  |  |  | 3 |  |
| 92 | Get_Node_Graph_Variable__Entity (337) | 26306.6, 1359.96 | lastTopRoll |  | 4 | 2 |  |
| 93 | Round_to_Integer_Operation (224) | 26600.92, 1357.32 |  |  | 703 | 2 |  |
| 94 | Equal__Str (14) | 26909.06, 1351.09 |  |  | 5, 5 | 2 |  |
| 95 | Double_Branch (2) | 27201.59, 1108.89 |  |  |  | 3 |  |
| 96 | Less_Than__Int (230) | 27705.07, 1357.17 |  |  |  | 2 |  |
| 97 | Double_Branch (2) | 28002.68, 1105.57 |  |  |  | 3 |  |
| 98 | Addition__Int (200) | 28207.04, 1359.76 |  |  |  | 3 |  |
| 99 | Data_Type_Conversion__Generic (180) | 28506.47, 1354.15 |  |  |  | 2 |  |
| 100 | Set_Node_Graph_Variable__Int (323) | 28805.34, 1102.26 | tempRoll |  |  | 4 |  |
| 101 | Set_Node_Graph_Variable__Int (323) | 28805.64, 1469.59 | tempRoll |  |  | 4 |  |
| 102 | Get_Node_Graph_Variable__Entity (337) | 29301.05, 1353.41 | tempRoll |  | 4 | 2 |  |
| 103 | Set_Node_Graph_Variable__Int (323) | 29601.46, 1100.15 | lastTopRoll |  |  | 4 |  |
| 104 | Get_Local_Variable__Bool (18) | 30104.75, 1353.23 |  |  |  | 2 |  |
| 105 | Get_Node_Graph_Variable__Entity (337) | 29809.59, 1606.81 | tempRoll |  | 4 | 2 |  |
| 106 | Round_to_Integer_Operation (224) | 30104.86, 1606.59 |  |  | 703 | 2 |  |
| 107 | Set_Local_Variable__Bool (19) | 30406.02, 1107.63 |  |  |  | 3 |  |
| 108 | Equal__Str (14) | 30902.99, 1357.47 |  |  | 5, 5 | 2 |  |
| 109 | Double_Branch (2) | 31205.8, 1102.01 |  |  |  | 3 |  |
| 110 | Get_Node_Graph_Variable__Entity (337) | 31706.64, 1353.35 | __gsts_stage |  |  | 2 |  |
| 111 | Get_Local_Variable__Bool (18) | 31703.71, 1609.7 |  |  | 7, 7 | 2 |  |
| 112 | Create_Prefab (252) | 32003.83, 1101.17 |  |  |  | 8 |  |
| 113 | Add_Uniform_Basic_Linear_Motion_Device (84) | 32802.89, 1106.73 | Scroll | 15.0 |  | 5 |  |
| 114 | Equal__Str (14) | 33308.04, 1352.73 |  |  | 5, 5 | 2 |  |
| 115 | Double_Branch (2) | 33602.48, 1102.29 |  |  |  | 3 |  |
| 116 | Get_Node_Graph_Variable__Entity (337) | 34108.29, 1357.89 | __gsts_stage |  |  | 2 |  |
| 117 | Get_Local_Variable__Bool (18) | 34101.54, 1606.64 |  |  | 7, 7 | 2 |  |
| 118 | Create_Prefab (252) | 34404.01, 1108.34 |  |  |  | 8 |  |
| 119 | Add_Uniform_Basic_Linear_Motion_Device (84) | 35201.09, 1103.24 | Scroll | 15.0 |  | 5 |  |
| 120 | Equal__Str (14) | 35705.79, 1353.77 |  |  | 5, 5 | 2 |  |
| 121 | Double_Branch (2) | 36008.61, 1101.01 |  |  |  | 3 |  |
| 122 | Get_Node_Graph_Variable__Entity (337) | 36507.57, 1359.74 | __gsts_stage |  |  | 2 |  |
| 123 | Get_Local_Variable__Bool (18) | 36501.4, 1606.5 |  |  | 7, 7 | 2 |  |
| 124 | Create_Prefab (252) | 36809.23, 1106.43 |  |  |  | 8 |  |
| 125 | Add_Uniform_Basic_Linear_Motion_Device (84) | 37602.64, 1103.82 | Scroll | 15.0 |  | 5 |  |
| 126 | Equal__Str (14) | 38109.82, 1351.28 |  |  | 5, 5 | 2 |  |
| 127 | Double_Branch (2) | 38406.85, 1106.56 |  |  |  | 2 |  |
| 128 | Get_Node_Graph_Variable__Entity (337) | 38901.32, 1354.19 | __gsts_stage |  |  | 2 |  |
| 129 | Get_Local_Variable__Bool (18) | 38901.33, 1609.5 |  |  | 7, 7 | 2 |  |
| 130 | Create_Prefab (252) | 39205.3, 1104.53 |  |  |  | 8 |  |
| 131 | Add_Uniform_Basic_Linear_Motion_Device (84) | 8.56, 1705.61 | Scroll | 15.0 |  | 4 |  |
| 132 | When_Basic_Motion_Device_Stops (89) | 7.21, 2319.39 |  |  |  | 1 |  |
| 133 | Destroy_Entity (69) | 801.62, 2311.21 |  |  |  | 1 |  |
| 134 | Get_Specified_Type_of_Entities_on_the_Field (319) | 203.38, 251.54 |  |  | 1401 | 1 |  |
| 135 | Get_Corresponding_Value_From_List__Int (128) | 504.83, 252.12 |  |  | 2, 2 | 3 |  |
| 136 | Set_Node_Graph_Variable__Int (323) | 800.23, 3.0 | __gsts_stage |  | 5 | 4 |  |
| 137 | Assembly_List__Int (169) | 31406.79, 1609.04 |  |  |  | 102 |  |
| 138 | Assembly_List__Int (169) | 33802.57, 1606.75 |  |  |  | 102 |  |
| 139 | Assembly_List__Int (169) | 36200.89, 1607.61 |  |  |  | 102 |  |
| 140 | Assembly_List__Int (169) | 38608.88, 1606.46 |  |  |  | 102 |  |

**抽出された数値パラメータ:**

- Node 2: `800.0`
- Node 2: `1500.0`
- Node 23: `800.0`
- Node 23: `1500.0`
- Node 66: `15.0`
- Node 66: `3.0`
- Node 113: `15.0`
- Node 119: `15.0`
- Node 125: `15.0`
- Node 131: `15.0`

### 6.x `_GSTS_CollisionDetection` 詳細 (GUID `1073741830`)

- **ノード数**: 4
- **参照変数**: `HitStop`

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | When_Entering_Collision_Trigger (92) | 6.2, 6.56 |  |  |  | 1 |  |
| 2 | Get_Player_GUID_by_Player_ID (750) | 209.88, 255.13 |  |  |  | 1 |  |
| 3 | Query_Entity_by_GUID (75) | 501.08, 252.48 |  |  |  | 1 |  |
| 4 | Set_Custom_Variable__Int (22) | 809.91, 0.55 | HitStop |  |  | 4 |  |

### 6.x `Crystall: Hydro` 詳細 (GUID `1073741832`)

- **ノード数**: 2
- **参照変数**: `GI_RootNode`

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | When_Tab_Is_Selected (307) | -242.0, -198.0 |  |  |  | 1 |  |
| 2 | Play_Timed_Effects (93) | 181.0, -389.0 | GI_RootNode | 2.0 |  | 6 |  |

**抽出された数値パラメータ:**

- Node 2: `2.0`

### 6.x `Crystall: Pyro` 詳細 (GUID `1073741833`)

- **ノード数**: 2
- **参照変数**: `GI_RootNode`

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | When_Tab_Is_Selected (307) | -242.0, -198.0 |  |  |  | 1 |  |
| 2 | Play_Timed_Effects (93) | 181.0, -389.0 | GI_RootNode | 0.2 |  | 6 |  |

**抽出された数値パラメータ:**

- Node 2: `0.2`

### 6.x `☑ Special Music Player` 詳細 (GUID `1073741835`)

- **ノード数**: 9

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | Modify_Player_Background_Music (597) | 916.25, 204.8 |  | 93.14, 1.0 |  | 9 |  |
| 2 | When_Tab_Is_Selected (307) | -841.92, -343.89 |  |  |  | 1 |  |
| 3 | Set_Node_Graph_Variable__Int (323) | -498.61, -877.98 |  |  | 5 | 4 |  |
| 4 | Get_Player_Entity_to_Which_the_Character_Belongs (259) | -118.5, -182.0 |  |  |  | 1 |  |
| 5 | Multiple_Branches__Int (3) | -16.39, -711.11 |  |  |  | 7 |  |
| 8 | Modify_Player_Background_Music (597) | 896.77, -1391.67 |  | 81.55, 1.0 |  | 9 |  |
| 9 | Modify_Player_Background_Music (597) | 900.61, -601.5 |  | 213.78, 1.0 |  | 9 |  |
| 10 | Modify_Player_Background_Music (597) | 850.84, 1062.98 |  | 253.76, 1.0 |  | 9 |  |
| 13 | Modify_Player_Background_Music (597) | 886.58, -2176.11 |  | 140.34, 1.0 |  | 9 |  |

**抽出された数値パラメータ:**

- Node 1: `93.139999`
- Node 1: `1.0`
- Node 8: `81.550003`
- Node 8: `1.0`
- Node 9: `213.779999`
- Node 9: `1.0`
- Node 10: `253.759995`
- Node 10: `1.0`
- Node 13: `140.339996`
- Node 13: `1.0`

### 6.x `Door` 詳細 (GUID `1073741831`)

- **ノード数**: 20
- **参照変数**: `GI_RootNode`, `char`, `door`

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | When_Tab_Is_Selected (307) | -1240.0, -134.67 |  |  |  | 1 |  |
| 2 | Play_Timed_Effects (93) | 45.0, -146.0 | GI_RootNode | 0.5 |  | 7 |  |
| 3 | Switch_Active_Text_Bubble (631) | 968.0, -821.0 |  |  |  | 3 |  |
| 4 | Multiple_Branches__Int (3) | 495.0, -154.0 |  |  |  | 7 |  |
| 5 | Activate_Disable_Tab (306) | 1376.67, -900.67 |  |  |  | 4 |  |
| 6 | Activate_Disable_Tab (306) | 1801.67, -894.0 |  |  |  | 3 |  |
| 7 | Set_Node_Graph_Variable__Int (323) | -410.0, -134.0 | door |  | 5 | 4 |  |
| 8 | Get_Node_Graph_Variable__Entity (337) | 820.0, -4.0 | door |  |  | 2 |  |
| 9 | Activate_Disable_Tab (306) | 1951.22, -497.78 |  |  |  | 3 |  |
| 10 | Activate_Disable_Tab (306) | 1526.22, -504.44 |  |  |  | 4 |  |
| 11 | Switch_Active_Text_Bubble (631) | 1075.89, -471.44 |  |  |  | 3 |  |
| 12 | Switch_Active_Text_Bubble (631) | 1313.11, -62.56 |  |  |  | 3 |  |
| 13 | Activate_Disable_Tab (306) | 1763.44, -95.56 |  |  |  | 4 |  |
| 14 | Activate_Disable_Tab (306) | 2188.44, -88.89 |  |  |  | 3 |  |
| 15 | Activate_Disable_Tab (306) | 2228.44, 286.11 |  |  |  | 3 |  |
| 16 | Activate_Disable_Tab (306) | 1803.44, 279.44 |  |  |  | 4 |  |
| 17 | Switch_Active_Text_Bubble (631) | 1353.11, 312.44 |  |  |  | 3 |  |
| 18 | Switch_Active_Text_Bubble (631) | 1274.83, 703.33 |  |  |  | 3 |  |
| 19 | Activate_Disable_Tab (306) | 1725.17, 670.33 |  |  |  | 3 |  |
| 21 | Set_Node_Graph_Variable__Int (323) | -881.52, -143.89 | char |  | 5 | 4 |  |

**抽出された数値パラメータ:**

- Node 2: `0.5`

### 6.x `Crystall: Electro` 詳細 (GUID `1073741834`)

- **ノード数**: 2
- **参照変数**: `GI_RootNode`

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | When_Tab_Is_Selected (307) | -242.0, -198.0 |  |  |  | 1 |  |
| 2 | Play_Timed_Effects (93) | 181.0, -389.0 | GI_RootNode | 0.2 |  | 6 |  |

**抽出された数値パラメータ:**

- Node 2: `0.2`

### 6.x `_GSTS_GameManager` 詳細 (GUID `1073741837`)

- **ノード数**: 280
- **参照変数**: `GamePhase`, `__gsts_interval_3_0`, `__gsts_stage`

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | When_Entity_Is_Created (71) | 8.24, 9.94 |  |  |  | 1 |  |
| 2 | Set_Node_Graph_Variable__Int (323) | 1600.82, 8.05 |  |  |  | 4 |  |
| 3 | Set_Node_Graph_Variable__Int (323) | 2401.16, 8.47 |  |  |  | 4 |  |
| 4 | Set_Node_Graph_Variable__Int (323) | 3203.04, 3.82 |  |  | 2 | 4 |  |
| 5 | Get_Random_Integer (257) | 4202.18, 255.82 |  |  |  | 2 |  |
| 6 | Get_Local_Variable__Bool (18) | 3704.52, 252.22 |  |  | 5, 5 | 2 |  |
| 7 | Set_Local_Variable__Bool (19) | 4006.57, 3.32 |  |  | 5 | 3 |  |
| 8 | Equal__Str (14) | 4509.38, 254.42 |  |  | 5, 5 | 2 |  |
| 9 | Double_Branch (2) | 4805.16, 5.6 |  |  |  | 3 |  |
| 10 | Set_Local_Variable__Bool (19) | 5605.06, 4.3 |  |  | 5 | 3 |  |
| 11 | Create_3D_Vector (225) | 6104.46, 251.42 |  |  |  | 3 |  |
| 12 | Get_Node_Graph_Variable__Entity (337) | 6103.23, 507.76 | __gsts_stage |  |  | 2 |  |
| 13 | Get_Local_Variable__Bool (18) | 6102.98, 753.88 |  |  | 7, 7 | 2 |  |
| 14 | Create_Prefab (252) | 6403.48, 9.93 |  |  |  | 8 |  |
| 15 | Get_Random_Integer (257) | 7407.68, 258.76 |  |  |  | 2 |  |
| 16 | Get_Local_Variable__Bool (18) | 6903.7, 255.25 |  |  | 5, 5 | 2 |  |
| 17 | Set_Local_Variable__Bool (19) | 7202.87, 1.14 |  |  | 5 | 3 |  |
| 18 | Equal__Str (14) | 7708.17, 254.76 |  |  | 5, 5 | 2 |  |
| 19 | Double_Branch (2) | 8001.19, 4.54 |  |  |  | 3 |  |
| 20 | Set_Local_Variable__Bool (19) | 8803.51, 5.22 |  |  | 5 | 3 |  |
| 21 | Create_3D_Vector (225) | 9309.29, 259.62 |  |  |  | 3 |  |
| 22 | Get_Node_Graph_Variable__Entity (337) | 9309.92, 507.09 | __gsts_stage |  |  | 2 |  |
| 23 | Get_Local_Variable__Bool (18) | 9309.02, 755.46 |  |  | 7, 7 | 2 |  |
| 24 | Create_Prefab (252) | 9600.04, 2.12 |  |  |  | 8 |  |
| 25 | Get_Random_Integer (257) | 10609.15, 259.94 |  |  |  | 2 |  |
| 26 | Get_Local_Variable__Bool (18) | 10102.13, 252.93 |  |  | 5, 5 | 2 |  |
| 27 | Set_Local_Variable__Bool (19) | 10408.77, 0.63 |  |  | 5 | 3 |  |
| 28 | Equal__Str (14) | 10908.45, 250.87 |  |  | 5, 5 | 2 |  |
| 29 | Double_Branch (2) | 11201.42, 6.27 |  |  |  | 3 |  |
| 30 | Set_Local_Variable__Bool (19) | 12001.88, 9.85 |  |  | 5 | 3 |  |
| 31 | Create_3D_Vector (225) | 12506.97, 259.5 |  |  |  | 3 |  |
| 32 | Get_Node_Graph_Variable__Entity (337) | 12509.05, 500.33 | __gsts_stage |  |  | 2 |  |
| 33 | Get_Local_Variable__Bool (18) | 12500.16, 754.56 |  |  | 7, 7 | 2 |  |
| 34 | Create_Prefab (252) | 12804.19, 8.4 |  |  |  | 8 |  |
| 35 | Get_Random_Integer (257) | 13806.16, 254.13 |  |  |  | 2 |  |
| 36 | Get_Local_Variable__Bool (18) | 13303.72, 252.91 |  |  | 5, 5 | 2 |  |
| 37 | Set_Local_Variable__Bool (19) | 13608.58, 3.19 |  |  | 5 | 3 |  |
| 38 | Equal__Str (14) | 14100.57, 259.42 |  |  | 5, 5 | 2 |  |
| 39 | Double_Branch (2) | 14400.51, 4.39 |  |  |  | 3 |  |
| 40 | Set_Local_Variable__Bool (19) | 15200.89, 6.4 |  |  | 5 | 3 |  |
| 41 | Create_3D_Vector (225) | 15704.76, 259.86 |  |  |  | 3 |  |
| 42 | Get_Node_Graph_Variable__Entity (337) | 15701.25, 503.16 | __gsts_stage |  |  | 2 |  |
| 43 | Get_Local_Variable__Bool (18) | 15708.58, 751.84 |  |  | 7, 7 | 2 |  |
| 44 | Create_Prefab (252) | 16002.11, 1.19 |  |  |  | 8 |  |
| 45 | Get_Random_Integer (257) | 17002.41, 254.01 |  |  |  | 2 |  |
| 46 | Get_Local_Variable__Bool (18) | 16502.6, 254.32 |  |  | 5, 5 | 2 |  |
| 47 | Set_Local_Variable__Bool (19) | 16800.99, 7.91 |  |  | 5 | 3 |  |
| 48 | Equal__Str (14) | 17301.35, 250.49 |  |  | 5, 5 | 2 |  |
| 49 | Double_Branch (2) | 17605.6, 2.03 |  |  |  | 3 |  |
| 50 | Set_Local_Variable__Bool (19) | 18402.01, 1.36 |  |  | 5 | 3 |  |
| 51 | Create_3D_Vector (225) | 18904.42, 255.29 |  |  |  | 3 |  |
| 52 | Get_Node_Graph_Variable__Entity (337) | 18904.55, 508.91 | __gsts_stage |  |  | 2 |  |
| 53 | Get_Local_Variable__Bool (18) | 18900.07, 752.36 |  |  | 7, 7 | 2 |  |
| 54 | Create_Prefab (252) | 19206.57, 5.3 |  |  |  | 8 |  |
| 55 | Get_Random_Integer (257) | 20203.84, 257.42 |  |  |  | 2 |  |
| 56 | Get_Local_Variable__Bool (18) | 19706.21, 258.61 |  |  | 5, 5 | 2 |  |
| 57 | Set_Local_Variable__Bool (19) | 20008.91, 5.5 |  |  | 5 | 3 |  |
| 58 | Equal__Str (14) | 20501.83, 256.75 |  |  | 5, 5 | 2 |  |
| 59 | Double_Branch (2) | 20805.63, 6.03 |  |  |  | 3 |  |
| 60 | Set_Local_Variable__Bool (19) | 21608.87, 9.52 |  |  | 5 | 3 |  |
| 61 | Create_3D_Vector (225) | 22108.68, 259.9 |  |  |  | 3 |  |
| 62 | Get_Node_Graph_Variable__Entity (337) | 22107.75, 501.57 | __gsts_stage |  |  | 2 |  |
| 63 | Get_Local_Variable__Bool (18) | 22101.86, 754.56 |  |  | 7, 7 | 2 |  |
| 64 | Create_Prefab (252) | 22406.12, 4.99 |  |  |  | 8 |  |
| 65 | Assembly_List__Int (169) | 22908.57, 251.68 |  |  | 4 ×101 | 102 |  |
| 66 | Get_Self_Entity (73) | 22908.34, 506.64 |  |  |  | 0 |  |
| 67 | Start_Timer (79) | 23205.19, 6.16 | __gsts_interval_3_0 |  |  | 4 |  |
| 68 | When_Timer_Is_Triggered (83) | 3.16, 1351.74 |  |  |  | 1 |  |
| 69 | Equal__Str (14) | 507.41, 1605.3 |  |  |  | 2 |  |
| 70 | Double_Branch (2) | 807.32, 1358.54 |  |  |  | 2 |  |
| 71 | Get_Player_GUID_by_Player_ID (750) | 408.55, 1609.75 |  |  |  | 1 |  |
| 72 | Query_Entity_by_GUID (75) | 704.91, 1606.52 |  |  |  | 1 |  |
| 73 | Get_Custom_Variable__Int (50) | 1004.16, 1600.29 | GamePhase |  |  | 3 |  |
| 74 | Equal__Str (14) | 1307.73, 1605.02 |  |  | 5, 5 | 2 |  |
| 75 | Double_Branch (2) | 1600.65, 1356.84 |  |  |  | 3 |  |
| 76 | Get_Node_Graph_Variable__Entity (337) | 1807.9, 1608.88 |  |  | 3 | 2 |  |
| 77 | Logical_NOT_Operation (229) | 2100.05, 1607.89 |  |  |  | 1 |  |
| 78 | Double_Branch (2) | 2406.32, 1351.81 |  |  |  | 3 |  |
| 79 | Set_Node_Graph_Variable__Int (323) | 3200.05, 1359.32 |  |  | 2 | 4 |  |
| 80 | Get_Local_Variable__Bool (18) | 3702.05, 1600.6 |  |  | 6, 6 | 2 |  |
| 81 | Set_Local_Variable__Bool (19) | 4003.3, 1351.47 |  |  | 6 | 3 |  |
| 82 | Get_Local_Variable__Bool (18) | 4508.23, 1605.91 |  |  | 9, 9 | 2 |  |
| 83 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 4506.14, 1855.2 |  |  |  | 1 |  |
| 84 | Set_Local_Variable__Bool (19) | 4808.61, 1355.21 |  |  | 9 | 3 |  |
| 85 | List_Iteration_Loop__Bool (509) | 5600.44, 1353.73 |  |  |  | 4 |  |
| 86 | Add_Uniform_Basic_Linear_Motion_Device (84) | 6404.01, 1359.0 |  | 999.0 |  | 4 |  |
| 87 | Get_Local_Variable__Bool (18) | 6101.52, 1967.94 |  |  | 9, 9 | 2 |  |
| 88 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 6100.92, 2213.18 |  |  |  | 1 |  |
| 89 | Set_Local_Variable__Bool (19) | 6408.25, 1718.72 |  |  | 9 | 3 |  |
| 90 | List_Iteration_Loop__Bool (509) | 7202.24, 1710.49 |  |  |  | 4 |  |
| 91 | Add_Uniform_Basic_Linear_Motion_Device (84) | 8007.62, 1713.97 |  | 999.0 |  | 4 |  |
| 92 | Get_Local_Variable__Bool (18) | 7709.89, 2325.82 |  |  | 9, 9 | 2 |  |
| 93 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 7709.23, 2571.67 |  |  |  | 1 |  |
| 94 | Set_Local_Variable__Bool (19) | 8001.16, 2078.13 |  |  | 9 | 3 |  |
| 95 | List_Iteration_Loop__Bool (509) | 8806.83, 2077.41 |  |  |  | 4 |  |
| 96 | Add_Uniform_Basic_Linear_Motion_Device (84) | 9608.48, 2074.45 |  | 999.0 |  | 4 |  |
| 97 | Get_Local_Variable__Bool (18) | 9305.19, 2688.81 |  |  | 6, 6 | 2 |  |
| 98 | Set_Local_Variable__Bool (19) | 9608.86, 2432.55 |  |  | 6 | 3 |  |
| 99 | Get_Local_Variable__Bool (18) | 10109.08, 2684.08 |  |  | 9, 9 | 2 |  |
| 100 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 10102.05, 2934.15 |  |  |  | 1 |  |
| 101 | Set_Local_Variable__Bool (19) | 10404.9, 2438.3 |  |  | 9 | 3 |  |
| 102 | List_Iteration_Loop__Bool (509) | 11205.2, 2432.31 |  |  |  | 4 |  |
| 103 | Add_Uniform_Basic_Linear_Motion_Device (84) | 12007.25, 2433.58 |  | 999.0 |  | 4 |  |
| 104 | Get_Local_Variable__Bool (18) | 11703.01, 3042.11 |  |  | 9, 9 | 2 |  |
| 105 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 11704.44, 3297.07 |  |  |  | 1 |  |
| 106 | Set_Local_Variable__Bool (19) | 12003.9, 2791.37 |  |  | 9 | 3 |  |
| 107 | List_Iteration_Loop__Bool (509) | 12804.01, 2795.42 |  |  |  | 4 |  |
| 108 | Add_Uniform_Basic_Linear_Motion_Device (84) | 13609.45, 2798.13 |  | 999.0 |  | 4 |  |
| 109 | Get_Local_Variable__Bool (18) | 13306.24, 3405.91 |  |  | 9, 9 | 2 |  |
| 110 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 13304.33, 3659.06 |  |  |  | 1 |  |
| 111 | Set_Local_Variable__Bool (19) | 13606.99, 3152.33 |  |  | 9 | 3 |  |
| 112 | List_Iteration_Loop__Bool (509) | 14405.0, 3158.27 |  |  |  | 4 |  |
| 113 | Add_Uniform_Basic_Linear_Motion_Device (84) | 15205.0, 3151.3 |  | 999.0 |  | 4 |  |
| 114 | Get_Local_Variable__Bool (18) | 14903.89, 3768.85 |  |  | 5, 5 | 2 |  |
| 115 | Get_Node_Graph_Variable__Entity (337) | 14903.0, 4019.96 |  |  | 4 | 2 |  |
| 116 | Set_Local_Variable__Bool (19) | 15209.26, 3510.87 |  |  | 5 | 3 |  |
| 117 | Subtraction__Int (202) | 15706.5, 3764.7 |  |  |  | 3 |  |
| 118 | Set_Local_Variable__Bool (19) | 16007.74, 3516.97 |  |  | 5 | 3 |  |
| 119 | Set_Node_Graph_Variable__Int (323) | 16805.88, 3513.05 |  |  |  | 4 |  |
| 120 | Less_Than_or_Equal_To__Int (231) | 17304.7, 3768.32 |  |  |  | 2 |  |
| 121 | Double_Branch (2) | 17603.48, 3519.65 |  |  |  | 3 |  |
| 122 | Set_Node_Graph_Variable__Int (323) | 18404.62, 3510.72 |  |  |  | 4 |  |
| 123 | Get_Local_Variable__Bool (18) | 18902.21, 3767.04 |  |  | 6, 6 | 2 |  |
| 124 | Set_Local_Variable__Bool (19) | 19206.28, 3513.1 |  |  | 6 | 3 |  |
| 125 | Get_Local_Variable__Bool (18) | 19708.25, 3765.16 |  |  |  | 2 |  |
| 126 | Get_Random_Integer (257) | 19704.06, 4014.53 |  |  |  | 2 |  |
| 127 | Set_Local_Variable__Bool (19) | 20006.93, 3518.21 |  |  |  | 3 |  |
| 128 | Get_Random_Integer (257) | 21004.5, 3764.09 |  |  |  | 2 |  |
| 129 | Get_Local_Variable__Bool (18) | 20503.07, 3764.48 |  |  | 5, 5 | 2 |  |
| 130 | Set_Local_Variable__Bool (19) | 20807.3, 3516.68 |  |  | 5 | 3 |  |
| 131 | Equal__Str (14) | 21307.68, 3763.54 |  |  | 5, 5 | 2 |  |
| 132 | Double_Branch (2) | 21608.63, 3519.84 |  |  |  | 3 |  |
| 133 | Set_Local_Variable__Bool (19) | 22409.08, 3518.92 |  |  | 5 | 3 |  |
| 134 | Get_Local_Variable__Bool (18) | 22909.66, 3760.17 |  |  | 6, 6 | 2 |  |
| 135 | Create_3D_Vector (225) | 22908.36, 4019.95 |  |  |  | 3 |  |
| 136 | Set_Local_Variable__Bool (19) | 23209.51, 3512.45 |  |  | 6 | 3 |  |
| 137 | Get_Local_Variable__Bool (18) | 23708.82, 3761.22 |  |  | 6, 6 | 2 |  |
| 138 | Set_Local_Variable__Bool (19) | 24008.61, 3510.0 |  |  | 6 | 3 |  |
| 139 | Equal__Str (14) | 24503.63, 3766.33 |  |  | 5, 5 | 2 |  |
| 140 | Double_Branch (2) | 24806.33, 3512.49 |  |  |  | 3 |  |
| 141 | Get_Node_Graph_Variable__Entity (337) | 25309.66, 3764.81 | __gsts_stage |  |  | 2 |  |
| 142 | Get_Local_Variable__Bool (18) | 25305.92, 4011.33 |  |  | 7, 7 | 2 |  |
| 143 | Create_Prefab (252) | 25609.1, 3516.26 |  |  |  | 8 |  |
| 144 | Add_Uniform_Basic_Linear_Motion_Device (84) | 26404.51, 3511.83 |  | 999.0 |  | 5 |  |
| 145 | Equal__Str (14) | 26909.02, 3764.5 |  |  | 5, 5 | 2 |  |
| 146 | Double_Branch (2) | 27206.56, 3519.03 |  |  |  | 3 |  |
| 147 | Get_Node_Graph_Variable__Entity (337) | 27705.85, 3769.53 | __gsts_stage |  |  | 2 |  |
| 148 | Get_Local_Variable__Bool (18) | 27708.53, 4011.8 |  |  | 7, 7 | 2 |  |
| 149 | Create_Prefab (252) | 28007.1, 3517.09 |  |  |  | 8 |  |
| 150 | Add_Uniform_Basic_Linear_Motion_Device (84) | 28801.87, 3519.23 |  | 999.0 |  | 5 |  |
| 151 | Equal__Str (14) | 29308.65, 3769.52 |  |  | 5, 5 | 2 |  |
| 152 | Double_Branch (2) | 29606.96, 3510.98 |  |  |  | 3 |  |
| 153 | Get_Node_Graph_Variable__Entity (337) | 30105.86, 3764.94 | __gsts_stage |  |  | 2 |  |
| 154 | Get_Local_Variable__Bool (18) | 30105.68, 4015.34 |  |  | 7, 7 | 2 |  |
| 155 | Create_Prefab (252) | 30409.74, 3514.62 |  |  |  | 8 |  |
| 156 | Add_Uniform_Basic_Linear_Motion_Device (84) | 31200.04, 3519.33 |  | 999.0 |  | 5 |  |
| 157 | Get_Local_Variable__Bool (18) | 31707.4, 3760.17 |  |  | 5, 5 | 2 |  |
| 158 | Get_Node_Graph_Variable__Entity (337) | 31709.71, 4015.67 |  |  | 4 | 2 |  |
| 159 | Set_Local_Variable__Bool (19) | 32002.15, 3512.99 |  |  | 5 | 3 |  |
| 160 | Subtraction__Int (202) | 32506.79, 3761.92 |  |  |  | 3 |  |
| 161 | Set_Local_Variable__Bool (19) | 32807.06, 3512.44 |  |  | 5 | 3 |  |
| 162 | Set_Node_Graph_Variable__Int (323) | 33608.07, 3517.56 |  |  |  | 4 |  |
| 163 | Less_Than_or_Equal_To__Int (231) | 34109.88, 3762.26 |  |  |  | 2 |  |
| 164 | Double_Branch (2) | 34402.4, 3513.93 |  |  |  | 3 |  |
| 165 | Set_Node_Graph_Variable__Int (323) | 35206.4, 3512.36 |  |  |  | 4 |  |
| 166 | Get_Local_Variable__Bool (18) | 35708.22, 3762.36 |  |  | 6, 6 | 2 |  |
| 167 | Set_Local_Variable__Bool (19) | 36007.61, 3513.55 |  |  | 6 | 3 |  |
| 168 | Get_Local_Variable__Bool (18) | 36506.88, 3762.94 |  |  |  | 2 |  |
| 169 | Get_Random_Integer (257) | 36506.98, 4011.47 |  |  |  | 2 |  |
| 170 | Set_Local_Variable__Bool (19) | 36803.8, 3512.95 |  |  |  | 3 |  |
| 171 | Get_Random_Integer (257) | 37801.91, 3766.01 |  |  |  | 2 |  |
| 172 | Get_Local_Variable__Bool (18) | 37302.11, 3766.53 |  |  | 5, 5 | 2 |  |
| 173 | Set_Local_Variable__Bool (19) | 37601.27, 3514.06 |  |  | 5 | 3 |  |
| 174 | Equal__Str (14) | 38102.27, 3764.2 |  |  | 5, 5 | 2 |  |
| 175 | Double_Branch (2) | 38406.13, 3519.47 |  |  |  | 3 |  |
| 176 | Set_Local_Variable__Bool (19) | 39206.78, 3516.72 |  |  | 5 | 3 |  |
| 177 | Get_Local_Variable__Bool (18) | -298.28, 4360.1 |  |  | 6, 6 | 2 |  |
| 178 | Create_3D_Vector (225) | -290.32, 4619.53 |  |  |  | 3 |  |
| 179 | Set_Local_Variable__Bool (19) | 1.24, 4112.71 |  |  | 6 | 3 |  |
| 180 | Get_Local_Variable__Bool (18) | 502.74, 4365.72 |  |  | 6, 6 | 2 |  |
| 181 | Set_Local_Variable__Bool (19) | 803.97, 4113.11 |  |  | 6 | 3 |  |
| 182 | Equal__Str (14) | 1303.52, 4364.5 |  |  | 5, 5 | 2 |  |
| 183 | Double_Branch (2) | 1607.65, 4118.88 |  |  |  | 3 |  |
| 184 | Get_Node_Graph_Variable__Entity (337) | 2106.17, 4365.76 | __gsts_stage |  |  | 2 |  |
| 185 | Get_Local_Variable__Bool (18) | 2109.78, 4611.8 |  |  | 7, 7 | 2 |  |
| 186 | Create_Prefab (252) | 2409.99, 4114.01 |  |  |  | 8 |  |
| 187 | Add_Uniform_Basic_Linear_Motion_Device (84) | 3203.83, 4119.92 |  | 999.0 |  | 5 |  |
| 188 | Equal__Str (14) | 3709.75, 4361.44 |  |  | 5, 5 | 2 |  |
| 189 | Double_Branch (2) | 4007.68, 4115.45 |  |  |  | 3 |  |
| 190 | Get_Node_Graph_Variable__Entity (337) | 4501.96, 4364.59 | __gsts_stage |  |  | 2 |  |
| 191 | Get_Local_Variable__Bool (18) | 4509.31, 4618.96 |  |  | 7, 7 | 2 |  |
| 192 | Create_Prefab (252) | 4805.69, 4112.64 |  |  |  | 8 |  |
| 193 | Add_Uniform_Basic_Linear_Motion_Device (84) | 5607.74, 4118.06 |  | 999.0 |  | 5 |  |
| 194 | Equal__Str (14) | 6102.52, 4364.71 |  |  | 5, 5 | 2 |  |
| 195 | Double_Branch (2) | 6402.59, 4113.38 |  |  |  | 3 |  |
| 196 | Get_Node_Graph_Variable__Entity (337) | 6909.97, 4369.28 | __gsts_stage |  |  | 2 |  |
| 197 | Get_Local_Variable__Bool (18) | 6904.85, 4615.78 |  |  | 7, 7 | 2 |  |
| 198 | Create_Prefab (252) | 7201.53, 4116.32 |  |  |  | 8 |  |
| 199 | Add_Uniform_Basic_Linear_Motion_Device (84) | 8009.85, 4117.05 |  | 999.0 |  | 5 |  |
| 200 | Get_Local_Variable__Bool (18) | 8505.23, 4360.68 |  |  | 9, 9 | 2 |  |
| 201 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 8506.01, 4613.65 |  |  |  | 1 |  |
| 202 | Set_Local_Variable__Bool (19) | 8809.96, 4118.63 |  |  | 9 | 3 |  |
| 203 | List_Iteration_Loop__Bool (509) | 9606.93, 4118.89 |  |  |  | 4 |  |
| 204 | Get_Entity_Location_and_Rotation (99) | 9504.38, 4364.64 |  |  |  | 1 |  |
| 205 | Split_3D_Vector (9) | 9801.08, 4362.32 |  |  |  | 1 |  |
| 206 | Less_Than_or_Equal_To__Int (231) | 10101.28, 4367.46 |  |  |  | 2 |  |
| 207 | Double_Branch (2) | 10403.12, 4113.95 |  |  |  | 2 |  |
| 208 | Destroy_Entity (69) | 11203.24, 4118.81 |  |  |  | 1 |  |
| 209 | Get_Local_Variable__Bool (18) | 10108.07, 4720.84 |  |  | 9, 9 | 2 |  |
| 210 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 10101.37, 4975.25 |  |  |  | 1 |  |
| 211 | Set_Local_Variable__Bool (19) | 10400.47, 4470.97 |  |  | 9 | 3 |  |
| 212 | List_Iteration_Loop__Bool (509) | 11202.41, 4470.81 |  |  |  | 4 |  |
| 213 | Get_Entity_Location_and_Rotation (99) | 11104.8, 4720.55 |  |  |  | 1 |  |
| 214 | Split_3D_Vector (9) | 11407.68, 4728.0 |  |  |  | 1 |  |
| 215 | Less_Than_or_Equal_To__Int (231) | 11705.07, 4723.95 |  |  |  | 2 |  |
| 216 | Double_Branch (2) | 12007.88, 4473.73 |  |  |  | 2 |  |
| 217 | Destroy_Entity (69) | 12803.04, 4474.5 |  |  |  | 1 |  |
| 218 | Get_Local_Variable__Bool (18) | 11704.64, 5085.9 |  |  | 9, 9 | 2 |  |
| 219 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 11707.47, 5338.01 |  |  |  | 1 |  |
| 220 | Set_Local_Variable__Bool (19) | 12000.77, 4837.11 |  |  | 9 | 3 |  |
| 221 | List_Iteration_Loop__Bool (509) | 12804.75, 4836.15 |  |  |  | 4 |  |
| 222 | Get_Entity_Location_and_Rotation (99) | 12701.18, 5089.1 |  |  |  | 1 |  |
| 223 | Split_3D_Vector (9) | 13002.45, 5089.07 |  |  |  | 1 |  |
| 224 | Less_Than_or_Equal_To__Int (231) | 13306.75, 5081.0 |  |  |  | 2 |  |
| 225 | Double_Branch (2) | 13609.69, 4832.39 |  |  |  | 2 |  |
| 226 | Destroy_Entity (69) | 14405.32, 4832.15 |  |  |  | 1 |  |
| 227 | Get_Local_Variable__Bool (18) | 13304.05, 5442.78 |  |  | 9, 9 | 2 |  |
| 228 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 13302.1, 5698.83 |  |  |  | 1 |  |
| 229 | Set_Local_Variable__Bool (19) | 13600.72, 5199.43 |  |  | 9 | 3 |  |
| 230 | List_Iteration_Loop__Bool (509) | 14400.3, 5198.86 |  |  |  | 4 |  |
| 231 | Get_Entity_Location_and_Rotation (99) | 14301.53, 5441.76 |  |  |  | 1 |  |
| 232 | Split_3D_Vector (9) | 14607.1, 5442.25 |  |  |  | 1 |  |
| 233 | Less_Than_or_Equal_To__Int (231) | 14904.45, 5440.98 |  |  |  | 2 |  |
| 234 | Double_Branch (2) | 15201.64, 5190.04 |  |  |  | 2 |  |
| 235 | Destroy_Entity (69) | 16009.85, 5190.75 |  |  |  | 1 |  |
| 236 | Get_Local_Variable__Bool (18) | 14904.88, 5802.5 |  |  | 9, 9 | 2 |  |
| 237 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 14906.03, 6056.89 |  |  |  | 1 |  |
| 238 | Set_Local_Variable__Bool (19) | 15203.5, 5550.86 |  |  | 9 | 3 |  |
| 239 | List_Iteration_Loop__Bool (509) | 16002.13, 5556.98 |  |  |  | 4 |  |
| 240 | Get_Entity_Location_and_Rotation (99) | 15903.28, 5807.86 |  |  |  | 1 |  |
| 241 | Split_3D_Vector (9) | 16202.36, 5803.08 |  |  |  | 1 |  |
| 242 | Less_Than_or_Equal_To__Int (231) | 16500.55, 5803.99 |  |  |  | 2 |  |
| 243 | Double_Branch (2) | 16800.97, 5552.55 |  |  |  | 2 |  |
| 244 | Destroy_Entity (69) | 17604.88, 5555.73 |  |  |  | 1 |  |
| 245 | Get_Local_Variable__Bool (18) | 16505.56, 6161.37 |  |  | 9, 9 | 2 |  |
| 246 | Get_Entities_With_Specified_Prefab_on_the_Field (320) | 16503.51, 6412.65 |  |  |  | 1 |  |
| 247 | Set_Local_Variable__Bool (19) | 16809.89, 5913.97 |  |  | 9 | 3 |  |
| 248 | List_Iteration_Loop__Bool (509) | 17602.06, 5916.95 |  |  |  | 3 |  |
| 249 | Get_Entity_Location_and_Rotation (99) | 17504.06, 6163.33 |  |  |  | 1 |  |
| 250 | Split_3D_Vector (9) | 17806.1, 6165.38 |  |  |  | 1 |  |
| 251 | Less_Than_or_Equal_To__Int (231) | 18106.92, 6160.7 |  |  |  | 2 |  |
| 252 | Double_Branch (2) | 18405.98, 5910.78 |  |  |  | 2 |  |
| 253 | Destroy_Entity (69) | 19206.65, 5911.54 |  |  |  | 1 |  |
| 254 | Get_Specified_Type_of_Entities_on_the_Field (319) | 202.81, 251.26 |  |  | 1401 | 1 |  |
| 255 | Get_Corresponding_Value_From_List__Int (128) | 502.31, 250.64 |  |  | 2, 2 | 3 |  |
| 256 | Set_Node_Graph_Variable__Int (323) | 807.83, 1.99 | __gsts_stage |  | 5 | 4 |  |
| 257 | Assembly_List__Int (169) | 5803.51, 754.72 |  |  |  | 102 |  |
| 258 | Assembly_List__Int (169) | 9006.88, 757.09 |  |  |  | 102 |  |
| 259 | Assembly_List__Int (169) | 12203.0, 755.53 |  |  |  | 102 |  |
| 260 | Assembly_List__Int (169) | 15405.8, 750.74 |  |  |  | 102 |  |
| 261 | Assembly_List__Int (169) | 18603.05, 759.76 |  |  |  | 102 |  |
| 262 | Assembly_List__Int (169) | 21806.19, 754.52 |  |  |  | 102 |  |
| 263 | Assembly_List__Int (169) | 4205.92, 1603.7 |  |  | 2 ×101 | 102 |  |
| 264 | Assembly_List__Int (169) | 5804.11, 1960.87 |  |  | 2 ×101 | 102 |  |
| 265 | Assembly_List__Int (169) | 7406.37, 2326.8 |  |  | 2 ×101 | 102 |  |
| 266 | Assembly_List__Int (169) | 9803.19, 2683.16 |  |  | 2 ×101 | 102 |  |
| 267 | Assembly_List__Int (169) | 11404.07, 3049.23 |  |  | 2 ×101 | 102 |  |
| 268 | Assembly_List__Int (169) | 13000.68, 3402.39 |  |  | 2 ×101 | 102 |  |
| 269 | Assembly_List__Int (169) | 25009.97, 4011.58 |  |  |  | 102 |  |
| 270 | Assembly_List__Int (169) | 27406.21, 4010.98 |  |  |  | 102 |  |
| 271 | Assembly_List__Int (169) | 29802.19, 4016.33 |  |  |  | 102 |  |
| 272 | Assembly_List__Int (169) | 1803.87, 4616.48 |  |  |  | 102 |  |
| 273 | Assembly_List__Int (169) | 4200.78, 4617.5 |  |  |  | 102 |  |
| 274 | Assembly_List__Int (169) | 6609.11, 4618.54 |  |  |  | 102 |  |
| 275 | Assembly_List__Int (169) | 8202.18, 4360.9 |  |  | 2 ×101 | 102 |  |
| 276 | Assembly_List__Int (169) | 9804.41, 4720.37 |  |  | 2 ×101 | 102 |  |
| 277 | Assembly_List__Int (169) | 11408.53, 5087.97 |  |  | 2 ×101 | 102 |  |
| 278 | Assembly_List__Int (169) | 13004.21, 5448.18 |  |  | 2 ×101 | 102 |  |
| 279 | Assembly_List__Int (169) | 14607.91, 5802.51 |  |  | 2 ×101 | 102 |  |
| 280 | Assembly_List__Int (169) | 16208.78, 6165.71 |  |  | 2 ×101 | 102 |  |

**抽出された数値パラメータ:**

- Node 86: `999.0`
- Node 91: `999.0`
- Node 96: `999.0`
- Node 103: `999.0`
- Node 108: `999.0`
- Node 113: `999.0`
- Node 144: `999.0`
- Node 150: `999.0`
- Node 156: `999.0`
- Node 187: `999.0`
- Node 193: `999.0`
- Node 199: `999.0`

### 6.x `SaveDataManager` 詳細 (GUID `1073741838`)

- **ノード数**: 19
- **参照変数**: `maxDistance`

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | When_Entity_Is_Created (71) | -1004.0, -409.0 |  |  |  | 1 |  |
| 2 | Get_Custom_Variable__Int (50) | -682.0, -122.0 |  |  | 22 | 3 |  |
| 3 | Get_List_Length__Int (142) | -474.0, 199.0 |  |  | 10 | 1 |  |
| 4 | Greater_Than__Int (232) | -66.0, -21.0 |  |  |  | 2 |  |
| 5 | Double_Branch (2) | 339.67, -414.22 |  |  |  | 3 |  |
| 6 | Insert_Value_Into_List__Int (135) | 1010.0, 61.0 |  |  | 10, 10 | 3 |  |
| 7 | type 1610612753 | 441.0, 258.0 |  |  |  | 2 |  |
| 8 | type 1610612754 | 849.56, -187.11 |  |  |  | 1 |  |
| 9 | Get_Corresponding_Value_From_List__Int (128) | 454.0, -187.11 |  |  | 10, 10 | 3 |  |
| 10 | Set_Custom_Variable__Int (22) | 1617.33, -421.56 | maxDistance |  | 4 | 3 |  |
| 11 | When_Custom_Variable_Changes__Int (36) | -998.06, 646.7 |  |  | 4, 4 | 3 |  |
| 12 | Greater_Than__Int (232) | 12.79, 991.48 |  |  |  | 2 |  |
| 13 | Get_Custom_Variable__Int (50) | -570.35, 1234.77 | maxDistance |  | 4 | 3 |  |
| 14 | Multiple_Branches__Int (3) | -340.92, 639.56 |  |  |  | 3 |  |
| 15 | Double_Branch (2) | 491.94, 618.13 |  |  |  | 2 |  |
| 16 | type 1610612753 | 550.83, 1009.08 |  |  |  | 2 |  |
| 17 | Assembly_List__Int (169) | 1167.97, 898.13 |  |  | 10 ×101 | 101 |  |
| 18 | Set_Custom_Variable__Int (22) | 2229.87, 604.16 |  |  | 22 | 3 |  |
| 19 | Set_Custom_Variable__Int (22) | 1616.14, 605.71 | maxDistance |  | 4 | 4 |  |

### 6.x `_GSTS_AchievementManager` 詳細 (GUID `1073741839`)

- **ノード数**: 56
- **参照変数**: `GamePhase`, `__gsts_interval_2_0`

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | When_Entity_Is_Created (71) | 7.04, 9.49 |  |  |  | 1 |  |
| 2 | Assembly_List__Int (169) | 504.67, 254.07 |  |  | 4 ×101 | 102 |  |
| 3 | Get_Self_Entity (73) | 501.66, 504.63 |  |  |  | 0 |  |
| 4 | Start_Timer (79) | 808.27, 9.07 | __gsts_interval_2_0 |  |  | 4 |  |
| 5 | When_Timer_Is_Triggered (83) | 0.46, 1103.79 |  |  |  | 1 |  |
| 6 | Equal__Str (14) | 501.26, 1356.08 |  |  |  | 2 |  |
| 7 | Double_Branch (2) | 806.47, 1100.96 |  |  |  | 2 |  |
| 8 | Get_Player_GUID_by_Player_ID (750) | 108.38, 1352.85 |  |  |  | 1 |  |
| 9 | Query_Entity_by_GUID (75) | 409.09, 1359.19 |  |  |  | 1 |  |
| 10 | Get_Custom_Variable__Int (50) | 703.0, 1358.96 | GamePhase |  |  | 3 |  |
| 11 | Equal__Str (14) | 1005.43, 1351.69 |  |  | 5, 5 | 2 |  |
| 12 | Logical_NOT_Operation (229) | 1305.37, 1355.8 |  |  |  | 1 |  |
| 13 | Double_Branch (2) | 1604.1, 1107.37 |  |  |  | 3 |  |
| 14 | Get_Local_Variable__Bool (18) | 2100.85, 1359.2 |  |  |  | 2 |  |
| 15 | Set_Local_Variable__Bool (19) | 2402.13, 1103.28 |  |  |  | 2 |  |
| 16 | Get_Local_Variable__Bool (18) | 2102.97, 1714.8 |  |  | 5, 5 | 2 |  |
| 17 | Get_Player_GUID_by_Player_ID (750) | 1505.29, 1960.76 |  |  |  | 1 |  |
| 18 | Query_Entity_by_GUID (75) | 1805.48, 1969.97 |  |  |  | 1 |  |
| 19 | Get_Custom_Variable__Int (50) | 2101.24, 1963.41 |  |  | 4 | 3 |  |
| 20 | Set_Local_Variable__Bool (19) | 2400.79, 1461.69 |  |  | 5 | 3 |  |
| 21 | Get_Local_Variable__Bool (18) | 2903.38, 1716.47 |  |  |  | 2 |  |
| 22 | Round_to_Integer_Operation (224) | 2906.23, 1969.81 |  |  | 703 | 2 |  |
| 23 | Set_Local_Variable__Bool (19) | 3203.31, 1468.47 |  |  |  | 3 |  |
| 24 | Double_Branch (2) | 4002.86, 1462.77 |  |  |  | 3 |  |
| 25 | Greater_Than_or_Equal_To__Int (233) | 4508.44, 1712.75 |  |  |  | 2 |  |
| 26 | Double_Branch (2) | 4802.31, 1461.54 |  |  |  | 3 |  |
| 27 | Get_Player_GUID_by_Player_ID (750) | 4403.55, 1714.96 |  |  |  | 1 |  |
| 28 | Query_Entity_by_GUID (75) | 4706.13, 1713.02 |  |  |  | 1 |  |
| 29 | Query_If_Achievement_Is_Completed (644) | 5002.53, 1719.98 |  |  |  | 2 |  |
| 30 | Logical_NOT_Operation (229) | 5303.89, 1713.66 |  |  |  | 1 |  |
| 31 | Double_Branch (2) | 5600.48, 1464.24 |  |  |  | 3 |  |
| 32 | Get_Player_GUID_by_Player_ID (750) | 5800.12, 1714.91 |  |  |  | 1 |  |
| 33 | Query_Entity_by_GUID (75) | 6106.85, 1714.86 |  |  |  | 1 |  |
| 34 | Set_Achievement_Progress_Tally (645) | 6405.09, 1465.21 |  |  |  | 4 |  |
| 35 | Double_Branch (2) | 7209.07, 1466.09 |  |  |  | 3 |  |
| 36 | Greater_Than_or_Equal_To__Int (233) | 7702.38, 1716.72 |  |  |  | 2 |  |
| 37 | Double_Branch (2) | 8000.57, 1462.27 |  |  |  | 3 |  |
| 38 | Get_Player_GUID_by_Player_ID (750) | 7607.58, 1712.44 |  |  |  | 1 |  |
| 39 | Query_Entity_by_GUID (75) | 7902.23, 1714.24 |  |  |  | 1 |  |
| 40 | Query_If_Achievement_Is_Completed (644) | 8202.26, 1718.52 |  |  |  | 2 |  |
| 41 | Logical_NOT_Operation (229) | 8507.01, 1712.76 |  |  |  | 1 |  |
| 42 | Double_Branch (2) | 8805.5, 1463.53 |  |  |  | 3 |  |
| 43 | Get_Player_GUID_by_Player_ID (750) | 9002.68, 1719.26 |  |  |  | 1 |  |
| 44 | Query_Entity_by_GUID (75) | 9304.19, 1719.41 |  |  |  | 1 |  |
| 45 | Set_Achievement_Progress_Tally (645) | 9608.89, 1465.43 |  |  |  | 4 |  |
| 46 | Double_Branch (2) | 10400.26, 1468.03 |  |  |  | 2 |  |
| 47 | Greater_Than_or_Equal_To__Int (233) | 10904.53, 1716.61 |  |  |  | 2 |  |
| 48 | Double_Branch (2) | 11206.72, 1463.32 |  |  |  | 2 |  |
| 49 | Get_Player_GUID_by_Player_ID (750) | 10802.61, 1713.43 |  |  |  | 1 |  |
| 50 | Query_Entity_by_GUID (75) | 11101.56, 1716.16 |  |  |  | 1 |  |
| 51 | Query_If_Achievement_Is_Completed (644) | 11404.9, 1715.42 |  |  |  | 2 |  |
| 52 | Logical_NOT_Operation (229) | 11704.79, 1719.58 |  |  |  | 1 |  |
| 53 | Double_Branch (2) | 12006.78, 1468.25 |  |  |  | 2 |  |
| 54 | Get_Player_GUID_by_Player_ID (750) | 12209.22, 1717.31 |  |  |  | 1 |  |
| 55 | Query_Entity_by_GUID (75) | 12509.11, 1711.34 |  |  |  | 1 |  |
| 56 | Set_Achievement_Progress_Tally (645) | 12807.12, 1463.93 |  |  |  | 3 |  |

### 6.x `_GSTS_PersonalBest` 詳細 (GUID `1073741841`)

- **ノード数**: 34
- **参照変数**: `FLAPPY_BGM`, `FLAPPY_QUIT`, `PB_SUBMIT`, `[Flappy Save] No new best; update skipped`, `[Flappy Save] PB_SUBMIT received; distance:`, `[Flappy Save] Stage settlement requested (not a persistence confirmation)`, `[Flappy Save] maxDistance updated; SaveDataManager notified (persistence pending stage exit)`, `maxDistance`

| Node# | ノード種別 | 位置 (x, y) | 参照 refs | 数値 floats | 整数 ints | ポート数 | フラグ |
|---:|---|---|---|---|---|---:|---|
| 1 | type 1610612763 | 7.13, 5.63 | PB_SUBMIT |  |  | 2 | flag9=1, SIGNAL_SEND |
| 2 | Get_Local_Variable__Bool (18) | 504.87, 250.59 |  |  | 5, 5 | 2 |  |
| 3 | Set_Local_Variable__Bool (19) | 803.06, 5.72 |  |  | 5 | 3 |  |
| 4 | Print_String (1) | 1606.06, 7.28 | [Flappy Save] PB_SUBMIT received; distance: |  |  | 2 |  |
| 5 | Data_Type_Conversion__Generic (180) | 2100.26, 254.09 |  |  | 4, 2 | 2 |  |
| 6 | Print_String (1) | 2407.5, 9.17 |  |  |  | 2 |  |
| 7 | Get_Player_GUID_by_Player_ID (750) | 2005.13, 250.35 |  |  |  | 1 |  |
| 8 | Query_Entity_by_GUID (75) | 2308.52, 258.69 |  |  |  | 1 |  |
| 9 | Get_Custom_Variable__Int (50) | 2609.44, 259.41 | maxDistance |  | 4 | 3 |  |
| 10 | Greater_Than__Int (232) | 2901.65, 253.15 |  |  |  | 2 |  |
| 11 | Double_Branch (2) | 3209.44, 2.75 |  |  |  | 3 |  |
| 12 | Get_Player_GUID_by_Player_ID (750) | 3405.54, 251.28 |  |  |  | 1 |  |
| 13 | Query_Entity_by_GUID (75) | 3705.61, 258.42 |  |  |  | 1 |  |
| 14 | Set_Custom_Variable__Int (22) | 4000.56, 7.17 | maxDistance |  | 4 | 5 |  |
| 15 | Print_String (1) | 4807.45, 2.86 | [Flappy Save] maxDistance updated; SaveDataManager notified (persistence pending stage exit) |  |  | 1 |  |
| 16 | Print_String (1) | 4007.55, 367.33 | [Flappy Save] No new best; update skipped |  |  | 1 |  |
| 17 | type 1610612767 | 0.48, 964.62 | FLAPPY_BGM |  |  | 2 | flag9=2, SIGNAL_SEND |
| 18 | Greater_Than__Int (232) | 506.74, 1211.5 |  |  |  | 2 |  |
| 19 | Double_Branch (2) | 806.13, 963.22 |  |  |  | 3 |  |
| 20 | Get_Player_GUID_by_Player_ID (750) | 1008.9, 1214.56 |  |  |  | 1 |  |
| 21 | Query_Entity_by_GUID (75) | 1305.09, 1216.54 |  |  |  | 1 |  |
| 22 | Modify_Player_Background_Music (597) | 1605.8, 966.24 |  | 999.0, 1.0 |  | 10 |  |
| 23 | Get_Player_GUID_by_Player_ID (750) | 1801.63, 1215.32 |  |  |  | 1 |  |
| 24 | Query_Entity_by_GUID (75) | 2107.74, 1218.87 |  |  |  | 1 |  |
| 25 | Start_Pause_Player_Background_Music (595) | 2409.61, 963.06 |  |  |  | 2 |  |
| 26 | Get_Player_GUID_by_Player_ID (750) | 1005.44, 1572.6 |  |  |  | 1 |  |
| 27 | Query_Entity_by_GUID (75) | 1306.61, 1572.82 |  |  |  | 1 |  |
| 28 | Start_Pause_Player_Background_Music (595) | 1602.9, 1320.46 |  |  |  | 2 |  |
| 29 | type 1610612771 | 6.98, 2178.14 | FLAPPY_QUIT |  |  | 2 | flag9=1, SIGNAL_SEND |
| 30 | Get_Player_GUID_by_Player_ID (750) | 209.99, 2424.91 |  |  |  | 1 |  |
| 31 | Query_Entity_by_GUID (75) | 502.91, 2421.41 |  |  |  | 1 |  |
| 32 | Start_Pause_Player_Background_Music (595) | 809.57, 2176.34 |  |  |  | 3 |  |
| 33 | Print_String (1) | 1605.93, 2177.06 | [Flappy Save] Stage settlement requested (not a persistence confirmation) |  |  | 2 |  |
| 34 | Settle_Stage (77) | 2406.25, 2178.44 |  |  |  | 0 |  |

**抽出された数値パラメータ:**

- Node 22: `999.0`
- Node 22: `1.0`

## 8. 設定 (configurations)

| 名前 | GUID | type_id |
|---|---|---:|
| バッグテンプレート | `1119879169` | 12 |
| 環境設定 | `1186988033` | 26 |
| カスタムジョブ | `1090519041` | 4 |
| カスタム成長曲線 | `1094713345` | 5 |
| 移動禁止 | `1077936129` | 1 |

## プロパティ定義 (property_defs)

- `PropertyTransform`
- `PropertyGadgetCombat`
- `PropertyEnmity`
- `PropertyReMark`
- `PropertyEntityTag`
- `PropertyArmy`
- `PropertyStaticVisible`
- `PropertyStaticCollider`
- `ModelDisplay`
- `2`
- `0`
- `PropertyChildModel`
- `PropertyDefaultBorn`
- `PropertyAttachPoint`
- `PropertyModelColorMaterial`

---

> 完全な protobuf ツリーは同名の `.json` ファイル参照。