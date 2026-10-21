-- 一閃 ISSEN — Miliastra Wonderland port of issen.html
-- Attach to the root ContainerControl of the Issen Client Control Container.
-- Setup (templates, Script Variables, signals, save): see miliastra/SETUP.md

-- BEGIN TRANSLATIONS
-- Source language (Japanese). Other languages come from Script Text Variables "issen.<key>"
-- (Manage Multi-language Text; import miliastra/translation-lua.csv). Keep both in sync.
local SOURCES = {
  ["color.ink"] = "墨",
  ["element.pyro"] = "炎",
  ["element.hydro"] = "水",
  ["element.cryo"] = "氷",
  ["element.electro"] = "雷",
  ["element.anemo"] = "風",
  ["element.geo"] = "岩",
  ["element.dendro"] = "草",
  ["elementColor"] = "%s元素",
  ["mission.score"] = "1回で %s 点",
  ["mission.combo"] = "コンボ %s",
  ["mission.multi"] = "1回のダッシュで %s 体",
  ["mission.chain"] = "誘爆で %s 体 (1回で)",
  ["mission.close"] = "紙一重 %s 回 (1回で)",
  ["mission.kills"] = "今日 合計 %s 体",
  ["mission.runs"] = "今日 %s 回挑戦",
  ["missionDone"] = "ミッション達成  %s",
  ["multiSlash"] = "%s 斬",
  ["closeCall"] = "紙一重",
  ["startRing"] = "斬って開始",
  ["tagline"] = "タップした場所へ一瞬で斬り抜ける",
  ["soundOn"] = "音 ON",
  ["soundOff"] = "音 OFF",
  ["pause"] = "中断",
  ["paused"] = "中断中",
  ["pausedNote"] = "タイトルへ戻ると、このプレイは記録されません",
  ["resume"] = "続ける",
  ["resumePad"] = "A  続ける",
  ["toTitle"] = "タイトルへ",
  ["toTitlePad"] = "B  タイトルへ",
  ["firstHint"] = "タップした場所へ斬り抜ける",
  ["firstHintPad"] = "スティックで狙って A で斬り抜ける",
  ["whiffHint"] = "空振りするとコンボが途切れて、少しのあいだ動けない",
  ["done"] = "達成",
  ["streakToday"] = "連続 %s 日プレイ中",
  ["streakKeep"] = "今日遊ぶと 連続 %s 日",
  ["streakRestart"] = "今日から連続記録をもう一度",
  ["resetIn"] = "更新まで %s",
  ["todaysMissions"] = "今日のミッション",
  ["exitStage"] = "ステージを終了",
  ["exitConfirm"] = "もう一度押すと終了",
  ["exiting"] = "ステージを終了しています",
  ["exitFailed"] = "ステージを終了できませんでした",
  ["unlockAt"] = "Lv %s で解放",
  ["newBest"] = "自己ベスト更新  +%s",
  ["firstRecord"] = "初記録",
  ["toBest"] = "ベストまで あと %s 点",
  ["statCombo"] = "最大コンボ",
  ["statKills"] = "撃破",
  ["statMulti"] = "最大同時斬り",
  ["streakBonus"] = "連続 %s 日ボーナス ×%s",
  ["allDailies"] = "デイリー全達成 +%s",
  ["gotElement"] = "%s元素の色を手に入れた",
  ["nextElement"] = "次の%s元素まで あと %s XP",
  ["again"] = "タップでもう一度",
  ["againPad"] = "A でもう一度",
  ["hintTitle"] = "A 斬る   RB 元素を変える   X 音   B ステージを終了",
  ["hintPlay"] = "左スティック 狙う   A 斬る   B 中断",
  ["hintPaused"] = "A 続ける   B タイトルへ",
  ["loading"] = "読み込み中",
}
local TR = {}
-- GetText returns the ID itself when no Script Text Variable exists, so the source text stands in.
local function tr(key, ...)
  local v = TR[key]
  if not v then
    local id = "issen." .. key
    local ok, got = pcall(game.GetText, id)
    v = (ok and type(got) == "string" and got ~= "" and got ~= id) and got or SOURCES[key] or key
    TR[key] = v
  end
  if select("#", ...) > 0 then return string.format(v, ...) end
  return v
end
-- END TRANSLATIONS

local TAU = math.pi * 2
local DEG = 180 / math.pi
local floor, min, max, abs, sqrt, sin, cos, atan = math.floor, math.min, math.max, math.abs, math.sqrt, math.sin, math.cos, math.atan
local rnd = math.random

local function clamp(v, a, b) if v < a then return a elseif v > b then return b end return v end
local function hypot(x, y) return sqrt(x * x + y * y) end
local function ease(t) t = clamp(t, 0, 1); return 1 - (1 - t) ^ 3 end
local function easeBack(t) local c = 1.9; return 1 + (c + 1) * (t - 1) ^ 3 + c * (t - 1) ^ 2 end
local function rint(x) return floor(x + 0.5) end
-- Server Signals read floats as 0, so every value sent must be a real Lua integer.
local function toint(x) return math.tointeger(floor(tonumber(x) or 0)) or 0 end

-- ---------- palette (0-255) ----------
local BG    = { 243, 243, 241 }
local INK   = { 20, 20, 22 }
local MUTE  = { 139, 139, 147 }
local FAINT = { 220, 220, 216 }
local WHITE = { 255, 255, 255 }
-- Ink by default; levels unlock the seven elements (Genshin wiki palette, same as Hajiki).
-- icon: StaticReference element icons (103001 electro, 103002 pyro, 103003 cryo, 103004 dendro, 103005 geo, 103006 hydro, 103007 anemo).
local COLORS = {
  { lv = 1 },
  { lv = 2,  k = "pyro",    c = { 204, 59, 0 },   icon = 103002 },
  { lv = 4,  k = "hydro",   c = { 0, 102, 204 },  icon = 103006 },
  { lv = 6,  k = "cryo",    c = { 0, 170, 221 },  icon = 103003 },
  { lv = 9,  k = "electro", c = { 131, 51, 204 }, icon = 103001 },
  { lv = 12, k = "anemo",   c = { 0, 128, 128 },  icon = 103007 },
  { lv = 16, k = "geo",     c = { 184, 134, 11 }, icon = 103005 },
  { lv = 20, k = "dendro",  c = { 89, 128, 0 },   icon = 103004 },
}
local function colorName(c) return c.k and tr("element." .. c.k) or tr("color.ink") end
local IMG_SPARK = 104002 -- four-point sparkle (cryo)

-- ---------- Script Variables ----------
local function param(name, default)
  local ok, v = pcall(script.GetParam, script, name)
  if ok and v ~= nil and v ~= 0 then return v end
  return default
end
local TPL = {}
local SFX = {}
local SFX_NAMES = { "DASH", "KILL1", "KILL2", "KILL3", "KILL4", "KILL5", "WHIFF", "BOOM", "MULTI", "COMBO", "DEATH", "TICK", "MISSION", "LEVEL", "BEST", "UI" }

-- ---------- save ----------
-- Packed as an Integer List (SAVE_LEN) and persisted by the server through In-game Save.
local SAVE_LEN = 24
local function defaultSave()
  return { best = 0, xp = 0, kills = 0, runs = 0, maxCombo = 0, color = 0, streak = 0, lastDay = 0, mute = false, mDay = 0, mp = { 0, 0, 0 }, md = { 0, 0, 0 }, maxStreak = 0 }
end
local save = defaultSave()
local function unpackSave(a)
  local s = defaultSave()
  if type(a) ~= "table" or a[1] ~= 1 then return s end
  local function n(i) return toint(a[i]) end
  s.best, s.xp, s.kills, s.runs, s.maxCombo = n(2), n(3), n(4), n(5), n(6)
  s.color, s.streak, s.lastDay, s.mute, s.mDay = clamp(n(7), 0, #COLORS - 1), n(8), n(9), n(10) == 1, n(11)
  s.mp = { n(12), n(13), n(14) }
  s.md = { n(15), n(16), n(17) }
  s.maxStreak = n(18)
  return s
end
local function packSave()
  local s = save
  local a = { 1, s.best, s.xp, s.kills, s.runs, s.maxCombo, s.color, s.streak, s.lastDay, s.mute and 1 or 0, s.mDay,
    s.mp[1], s.mp[2], s.mp[3], s.md[1], s.md[2], s.md[3], s.maxStreak }
  for i = 1, SAVE_LEN do a[i] = toint(a[i]) end
  return a
end

-- ---------- server link ----------
local PLAYER = Enum.CustomVariableEntityType.PlayerSelf
local online = false      -- server finished loading the save for this player
local bootT = 0
local serverTs = nil      -- local-time timestamp (sec) at load
local elapsed = 0
local RESET_HOUR = 4      -- daily reset at 04:00 server time, like Genshin's
local function readVar(name)
  local ok, v = pcall(game.GetGlobalCustomVariableValue, PLAYER, name)
  if ok then return v end
  return nil
end
local function tzSeconds(tz)
  tz = tonumber(tz) or 0
  if abs(tz) <= 14 then return tz * 3600 end
  if abs(tz) <= 840 then return tz * 60 end
  return tz
end
local function nowSec() if serverTs then return serverTs + elapsed end end
local function dayOf(t) return toint((t - RESET_HOUR * 3600) / 86400) end
local function today() local t = nowSec(); return t and dayOf(t) or 0 end
local function yesterday() local d = today(); return d ~= 0 and d - 1 or 0 end
local function sendSignal(name, ints, list)
  if not online then return end
  local ok, err = pcall(function()
    local s = game.ServerSignal(name)
    if list then s:AddIntList(list) end
    for _, v in ipairs(ints or {}) do s:AddInt(toint(v)) end
    s:SendSignal()
  end)
  if not ok then printerr("issen: signal " .. name .. " failed: " .. tostring(err)) end
end
local function persist() sendSignal("issen_save", nil, packSave()) end

-- ---------- levels ----------
local function need(l) return 80 + l * 40 end
local function lvInfo(xp) local l = 1; while xp >= need(l) do xp = xp - need(l); l = l + 1 end; return l, xp, need(l) end
local function xpForLevel(lv) local x = 0; for l = 1, lv - 1 do x = x + need(l) end; return x end

-- ---------- daily missions ----------
local POOL = {
  { k = "score", n = { 1000, 2000, 3500 } },
  { k = "combo", n = { 20, 35, 60 } },
  { k = "multi", n = { 3, 4, 5 } },
  { k = "chain", n = { 4, 8, 12 } },
  { k = "close", n = { 3, 6, 10 } },
  { k = "kills", n = { 150, 300 } },
  { k = "runs", n = { 3, 5 } },
}
local missions = {}
-- Park-Miller: products stay below 2^53, so it is exact with floats or 64-bit integers alike.
local function rngFrom(seed)
  local s = (abs(toint(seed)) % 2147483646) + 1.0
  for _ = 1, 3 do s = (s * 16807) % 2147483647 end
  return function()
    s = (s * 16807) % 2147483647
    return (s - 1) / 2147483646
  end
end
local function buildMissions(day)
  local r = rngFrom(day)
  local idx = {}
  for i = 1, #POOL do idx[i] = i end
  for i = #idx, 2, -1 do local j = floor(r() * i) + 1; idx[i], idx[j] = idx[j], idx[i] end
  missions = {}
  for i = 1, 3 do
    local p = POOL[idx[i]]
    local n = p.n[floor(r() * #p.n) + 1]
    missions[i] = { k = p.k, n = n, text = tr("mission." .. p.k, n) }
  end
end
local function ensureDay()
  local d = today()
  if d ~= 0 and save.mDay ~= d then save.mDay = d; save.mp = { 0, 0, 0 }; save.md = { 0, 0, 0 } end
  buildMissions(save.mDay)
end

-- ---------- audio ----------
local sfxClock = {}
local function play(name, gap)
  if save.mute then return end
  local id = SFX[name]
  if not id or id == 0 then return end
  local t = sfxClock[name]
  if gap and t and elapsed - t < gap then return end
  sfxClock[name] = elapsed
  pcall(game.PlayAudio2D, id)
end
local function playKill(combo)
  play("KILL" .. clamp(math.ceil(combo / 4), 1, 5), 0.03)
end

-- ---------- display size ----------
local W, H, U = 1920, 1080, 12
local root, input
local world -- layer that shakes (set by buildLayers)

-- ---------- world state ----------
local state = "boot" -- boot | title | play | dying | over
local P = { x = 0, y = 0, r = 1.9, dashing = false, fx = 0, fy = 0, tx = 0, ty = 0, t = 0, dur = 0, dirx = 0, diry = 1,
  hits = 0, recover = 0, grace = 0, buffer = nil, land = 0, alive = true }
local E, FX, WAVES, TXT, TRAIL, BOMBS, TOASTS = {}, {}, {}, {}, {}, {}, {}
local EFX, BOLTS = {}, {} -- element hit effects
local function newRun() return { score = 0, combo = 0, maxCombo = 0, kills = 0, maxMulti = 0, chain = 0, close = 0, time = 0, spawnT = 0.7, newDone = {}, lastX = 0, lastY = 0 } end
local run = newRun()
local hitstop, trauma, kickX, kickY, slowT, slowScale, ts, flash = 0, 0, 0, 0, 0, 1, 1, 0
local flashCol = INK
local comboPulse, dispScore, scorePulse, clock = 0, 0, 0, 0
local startRing = { x = 0, y = 0, r = 7, hit = false }
local startTimer, titleFade = -1, 1
local dieT, res, resT = 0, nil, 0
local UI = {}
local COMBO_MS = { [10] = true, [25] = true, [50] = true, [75] = true, [100] = true, [150] = true, [200] = true, [300] = true, [500] = true }
local aimX, aimY, padMode, aimTouched = 0, 1, false, false
local paused = false            -- play is suspended behind the pause panel
local exitArm, exitSentT = 0, -1 -- title: seconds left to confirm leaving / time since the leave signal went out

-- Lua allows at most 200 locals per function, and the game adds its own to this chunk,
-- so the game logic and the drawing/input code each live in a function of their own.
local acc, toast, wave, rr, liveVal, dashInput, restart, goTitle, setPaused, abandonRun, exitPress, xpShown, update
;(function()
  function acc() return COLORS[save.color + 1].c or INK end
  local function addTrauma(a) trauma = min(1, trauma + a) end
  local function kick(dx, dy, a) kickX = kickX + dx * a; kickY = kickY + dy * a end
  local function slow(t, s) if slowT <= 0 then slowScale = 1 end; slowT = max(slowT, t); slowScale = min(slowScale, s) end
  function toast(str) TOASTS[#TOASTS + 1] = { text = str, t = 0 }; if #TOASTS > 3 then table.remove(TOASTS, 1) end end
  local function pop(x, y, s, size, rgb, life) TXT[#TXT + 1] = { x = x, y = y, s = s, size = size, col = rgb, life = life or 0.7, max = life or 0.7 } end
  function wave(x, y, r0, r1, life, rgb, delay) WAVES[#WAVES + 1] = { x = x, y = y, r0 = r0, r1 = r1, life = life, max = life, col = rgb, delay = delay or 0 } end
  function rr(a, b) return a + rnd() * (b - a) end

  local function distSeg(px, py, ax, ay, bx, by)
    local dx, dy = bx - ax, by - ay
    local l2 = dx * dx + dy * dy
    local t = l2 > 0 and ((px - ax) * dx + (py - ay) * dy) / l2 or 0
    t = clamp(t, 0, 1)
    return hypot(px - ax - dx * t, py - ay - dy * t)
  end

  -- ---------- missions (live) ----------
  function liveVal(i, withRun)
    local m, p = missions[i], save.mp[i]
    if not withRun then return p end
    if m.k == "score" then return max(p, run.score)
    elseif m.k == "combo" then return max(p, run.maxCombo)
    elseif m.k == "multi" then return max(p, run.maxMulti)
    elseif m.k == "chain" then return max(p, run.chain)
    elseif m.k == "close" then return max(p, run.close)
    elseif m.k == "kills" then return p + run.kills end
    return p
  end
  local function checkMissions()
    if state ~= "play" then return end
    for i = 1, 3 do
      if save.md[i] == 0 and liveVal(i, true) >= missions[i].n then
        save.md[i] = 1
        run.newDone[#run.newDone + 1] = i
        toast(tr("missionDone", missions[i].text))
        play("MISSION")
      end
    end
  end

  -- ---------- effects ----------
  local function splitFx(x, y, r, dx, dy, rgb, kind)
    local a = atan(dy, dx)
    local nx, ny = -dy, dx
    for _, s in ipairs({ -1, 1 }) do
      local sp = (8 + rnd() * 6) * U
      FX[#FX + 1] = { t = "half", kind = kind, x = x, y = y, vx = nx * s * sp + dx * 10 * U, vy = ny * s * sp + dy * 10 * U,
        a = a, rot = 0, va = s * (3 + rnd() * 5), r = r, side = s, life = 0.6, max = 0.6, col = rgb }
    end
    for _ = 1, 8 do
      local sa, sp = a + (rnd() - 0.5) * 1.3, (40 + rnd() * 70) * U
      FX[#FX + 1] = { t = "spark", x = x, y = y, vx = cos(sa) * sp, vy = sin(sa) * sp, len = (1 + rnd() * 2.2) * U, life = 0.32, max = 0.32, col = rgb }
    end
    FX[#FX + 1] = { t = "cut", x = x, y = y, vx = 0, vy = 0, a = a, len = r * 5, life = 0.14, max = 0.14, col = rgb }
  end

  -- One flourish per element on every kill, after Hajiki. Sizes and speeds are in U; y points up.
  local function elementFx(x, y, r, dx, dy)
    local el = COLORS[save.color + 1]
    local k, c = el.k, el.c
    if not k then return end
    if k == "pyro" then -- embers rise and fade
      for _ = 1, 9 do EFX[#EFX + 1] = { k = "dot", x = x + rr(-1.5, 1.5) * U, y = y + rr(-1, 1) * U, vx = (rr(-12, 12) + dx * 10) * U, vy = rr(14, 34) * U, g = 10, dr = 0.4, size = rr(0.5, 1.1), rot = 0, va = 0, life = rr(0.45, 0.8), max = 0.8, col = c } end
      wave(x, y, r, r + 3 * U, 0.25, c)
    elseif k == "hydro" then -- three ripples one after another, droplets fall
      for i = 0, 2 do wave(x, y, r, r + (6 + i * 3) * U, 0.5, c, i * 0.09) end
      for _ = 1, 6 do EFX[#EFX + 1] = { k = "dot", x = x, y = y, vx = rr(-18, 18) * U, vy = rr(12, 30) * U, g = -90, dr = 0.6, size = rr(0.5, 0.85), rot = 0, va = 0, life = 0.6, max = 0.6, col = c } end
    elseif k == "cryo" then -- cracks spread from the hit, sparkles hang, the world holds still a moment longer
      for i = 0, 5 do EFX[#EFX + 1] = { k = "crack", x = x, y = y, vx = 0, vy = 0, rot = i / 6 * TAU + rr(-0.3, 0.3), va = 0, len = rr(4, 8), w = 0.3, life = 0.5, max = 0.5, col = c } end
      for _ = 1, 3 do EFX[#EFX + 1] = { k = "spark", x = x + rr(-4, 4) * U, y = y + rr(-4, 4) * U, vx = 0, vy = 0, size = rr(1.5, 2.6), rot = 0, va = rr(-2, 2), life = rr(0.4, 0.6), max = 0.6, col = c } end
      hitstop = max(hitstop, 0.07)
    elseif k == "electro" then -- a bolt from the previous kill (or where the dash began) to this one
      BOLTS[#BOLTS + 1] = { x1 = run.lastX, y1 = run.lastY, x2 = x, y2 = y, life = 0.22, max = 0.22, col = c }
      for _ = 1, 4 do local a = rr(0, TAU); FX[#FX + 1] = { t = "spark", x = x, y = y, vx = cos(a) * 70 * U, vy = sin(a) * 70 * U, len = 1.4 * U, life = 0.15, max = 0.15, col = c } end
    elseif k == "anemo" then -- a swirl that flings pieces around the hit
      for i = 0, 7 do EFX[#EFX + 1] = { k = "swirl", cx = x, cy = y, ang = i / 8 * TAU, av = 9, rad = r, vr = rr(10, 18) * U, size = 0.7, life = 0.5, max = 0.5, col = c } end
      EFX[#EFX + 1] = { k = "arc", x = x, y = y, vx = 0, vy = 0, rot = rr(0, TAU), va = 12, size = r + 3 * U, life = 0.35, max = 0.35, col = c }
    elseif k == "geo" then -- heavy: square chunks drop and bounce just below the hit
      local fl = y - r - 3 * U
      for _ = 1, 6 do EFX[#EFX + 1] = { k = "sq", x = x, y = y, vx = (rr(-25, 25) + dx * 15) * U, vy = rr(15, 40) * U, g = -140, dr = 0.7, floor = fl, rot = rr(0, TAU), va = rr(-8, 8), size = rr(1.3, 2.2), life = rr(0.7, 1), max = 1, col = c } end
      addTrauma(0.15); hitstop = max(hitstop, 0.06)
    elseif k == "dendro" then -- leaves flutter down, flipping as they go
      for _ = 1, 6 do EFX[#EFX + 1] = { k = "leaf", x = x, y = y, vx = rr(-16, 16) * U, vy = rr(8, 22) * U, g = -18, dr = 0.15, rot = rr(0, TAU), va = rr(-5, 5), size = rr(1.4, 2), ph = rr(0, TAU), life = rr(0.8, 1.1), max = 1.1, col = c } end
    end
  end

  -- ---------- spawning ----------
  local function edgePoint()
    local m, s = 4 * U, rnd(0, 3)
    if s == 0 then return rnd() * W, H + m end
    if s == 1 then return W + m, rnd() * H end
    if s == 2 then return rnd() * W, -m end
    return -m, rnd() * H
  end
  local function spawnEnemy(kind, x, y)
    local base = kind == "dot" and 19 or kind == "bomb" and 7 or 9
    E[#E + 1] = { x = x, y = y, vx = 0, vy = 0, kind = kind, dead = false, born = 0, ph = rnd() * TAU,
      r = kind == "dot" and 1.5 or kind == "bomb" and 2.6 or 2.4,
      spd = (base + min(run.time, 120) * 0.09) * (0.9 + rnd() * 0.2) }
  end
  local function spawnGroup()
    local px, py = edgePoint()
    local ang = atan(P.y - py, P.x - px)
    local nx, ny = -sin(ang), cos(ang)
    local k = rnd()
    if k < 0.45 then
      local n = rnd(3, 5)
      for i = 0, n - 1 do local o = (i - (n - 1) / 2) * 5.5 * U; spawnEnemy("ring", px + nx * o, py + ny * o) end
    elseif k < 0.8 and run.time > 8 then
      spawnEnemy("bomb", px, py)
      for i = 0, 4 do local a = i / 5 * TAU; spawnEnemy("ring", px + cos(a) * 6.5 * U, py + sin(a) * 6.5 * U) end
    else
      for i = 0, 3 do spawnEnemy("ring", px - cos(ang) * i * 6 * U, py - sin(ang) * i * 6 * U) end
    end
  end
  local function spawnTick(dt)
    run.spawnT = run.spawnT - dt
    if run.spawnT > 0 or #E > 42 then return end
    local t = run.time
    run.spawnT = max(0.32, 1.2 - t * 0.013) * (0.7 + rnd() * 0.6)
    if t > 5 and rnd() < 0.2 then return spawnGroup() end
    local x, y = edgePoint()
    local r = rnd()
    spawnEnemy((t > 15 and r < 0.16) and "dot" or (t > 8 and r > 0.9) and "bomb" or "ring", x, y)
  end

  -- ---------- player ----------
  local function startDash(x, y)
    local dx, dy = x - P.x, y - P.y
    local len = hypot(dx, dy)
    if len < 1 then dx, dy, len = P.dirx, P.diry, 1 end
    local ux, uy = dx / len, dy / len
    local dist = min(max(len, 6 * U), 60 * U)
    local m = P.r * U + 6
    P.fx, P.fy = P.x, P.y
    P.tx = clamp(P.x + ux * dist, m, W - m)
    P.ty = clamp(P.y + uy * dist, m, H - m)
    P.dur = max(0.055, hypot(P.tx - P.x, P.ty - P.y) / (360 * U))
    P.t, P.dirx, P.diry, P.hits, P.dashing = 0, ux, uy, 0, true
    run.lastX, run.lastY = P.x, P.y
    play("DASH")
  end
  function dashInput(x, y)
    if not P.alive then return end
    if P.dashing or (P.recover > 0 and P.recover < 0.12) then P.buffer = { x, y }
    elseif P.recover <= 0 then startDash(x, y) end
  end

  local kill -- forward

  local function endDash()
    P.dashing, P.grace, P.land = false, 0.07, 1
    kick(P.dirx, P.diry, 0.6 * U)
    if state ~= "play" then return end
    if P.hits == 0 then
      if run.combo >= 5 then pop(P.x, P.y + 5 * U, "BREAK", 3.2 * U, MUTE, 0.8) end
      run.combo, P.recover = 0, 0.3
      play("WHIFF"); addTrauma(0.14)
    else
      run.maxMulti = max(run.maxMulti, P.hits)
      if P.hits >= 2 then
        pop(P.x, P.y + 6 * U, tr("multiSlash", P.hits), (3.4 + P.hits * 0.5) * U, acc(), 0.9)
        wave(P.x, P.y, P.r * U, (14 + P.hits * 4) * U, 0.45, acc())
        play("MULTI")
        if P.hits >= 3 then flash, flashCol = 0.6, acc() end
      end
      checkMissions()
    end
  end

  local function slashStart()
    startRing.hit = true
    splitFx(startRing.x, startRing.y, startRing.r * U, P.dirx, P.diry, INK, "ring")
    elementFx(startRing.x, startRing.y, startRing.r * U, P.dirx, P.diry)
    wave(startRing.x, startRing.y, startRing.r * U, 30 * U, 0.5, acc())
    hitstop = 0.12; addTrauma(0.4); play("MULTI")
    startTimer = 0.45
  end

  local function updatePlayer(dt)
    if P.recover > 0 then P.recover = P.recover - dt end
    if P.grace > 0 then P.grace = P.grace - dt end
    P.land = P.land * 0.0008 ^ dt
    if P.dashing then
      local px, py = P.x, P.y
      P.t = P.t + dt
      local k = min(1, P.t / P.dur)
      local e = 1 - (1 - k) * (1 - k)
      P.x = P.fx + (P.tx - P.fx) * e
      P.y = P.fy + (P.ty - P.fy) * e
      TRAIL[#TRAIL + 1] = { x1 = px, y1 = py, x2 = P.x, y2 = P.y, life = 0.24, max = 0.24 }
      for _, en in ipairs(E) do
        if not en.dead and distSeg(en.x, en.y, px, py, P.x, P.y) < (en.r + P.r * 1.25) * U then kill(en, P.dirx, P.diry, "dash") end
      end
      if state == "title" and not startRing.hit and distSeg(startRing.x, startRing.y, px, py, P.x, P.y) < (startRing.r + P.r) * U then slashStart() end
      if k >= 1 then endDash() end
    end
    if P.alive and not P.dashing and P.recover <= 0 and P.buffer then
      local b = P.buffer; P.buffer = nil; startDash(b[1], b[2])
    end
  end

  -- ---------- kills ----------
  kill = function(e, dx, dy, cause)
    e.dead = true
    run.combo = run.combo + 1
    run.kills = run.kills + 1
    run.maxCombo = max(run.maxCombo, run.combo)
    local mult = 1 + min(9, floor(run.combo / 10))
    local pts, close = 10 * mult, false
    if cause == "dash" then
      P.hits = P.hits + 1
      pts = pts * P.hits
      if hypot(e.x - P.fx, e.y - P.fy) < (e.r + P.r + 5) * U then close = true; run.close = run.close + 1; pts = rint(pts * 1.5) end
      hitstop = max(hitstop, min(0.13, 0.045 + 0.016 * (P.hits - 1)))
      addTrauma(0.16 + 0.04 * min(P.hits, 5))
      kick(dx, dy, 1.1 * U)
    else
      run.chain = run.chain + 1
      hitstop = max(hitstop, 0.03)
      addTrauma(0.1)
    end
    run.score = run.score + pts
    scorePulse, comboPulse = 1, 1
    local r = e.r * U
    splitFx(e.x, e.y, r, dx, dy, INK, e.kind)
    elementFx(e.x, e.y, r, dx, dy)
    run.lastX, run.lastY = e.x, e.y
    pop(e.x, e.y + r + 2 * U, "+" .. pts, 2.2 * U, close and acc() or MUTE, 0.6)
    if close then pop(e.x, e.y - r - 3 * U, tr("closeCall"), 2.4 * U, acc(), 0.7); slow(0.14, 0.3) end
    playKill(run.combo)
    if e.kind == "bomb" then BOMBS[#BOMBS + 1] = { x = e.x, y = e.y, t = 0.08 } end
    if COMBO_MS[run.combo] then
      pop(W / 2, H * 0.7, run.combo .. " COMBO", 6 * U, acc(), 1.2)
      wave(P.x, P.y, P.r * U, max(W, H), 0.7, acc())
      slow(0.4, 0.25); play("COMBO")
      flash, flashCol = 0.5, acc()
    end
    checkMissions()
  end

  local function explode(b)
    local R = 15 * U
    wave(b.x, b.y, 2 * U, R, 0.4, INK)
    wave(b.x, b.y, 2 * U, R * 0.7, 0.3, INK)
    play("BOOM"); addTrauma(0.35)
    for _ = 1, 12 do
      local a, sp = rnd() * TAU, (50 + rnd() * 60) * U
      FX[#FX + 1] = { t = "spark", x = b.x, y = b.y, vx = cos(a) * sp, vy = sin(a) * sp, len = 2 * U, life = 0.4, max = 0.4, col = INK }
    end
    if state ~= "play" then return end
    for _, e in ipairs(E) do
      if not e.dead then
        local d = hypot(e.x - b.x, e.y - b.y)
        if d < R + e.r * U then kill(e, (e.x - b.x) / max(d, 1), (e.y - b.y) / max(d, 1), "chain") end
      end
    end
  end

  -- ---------- flow ----------
  local function layoutTitle()
    startRing.x, startRing.y = W / 2, H * 0.66
    return H * 0.49 -- below the tagline, above the Lv row
  end
  local function beginPlay()
    ensureDay()
    state, run, E, BOMBS, paused = "play", newRun(), {}, {}, false
    P.alive, P.recover, P.buffer = true, 0, nil
    dispScore, startTimer = 0, -1
  end
  function restart()
    FX, TRAIL, TXT = {}, {}, {}
    P.x, P.y, P.dashing, P.land = W / 2, H / 2, false, 1
    wave(P.x, P.y, 0, 20 * U, 0.4, acc())
    play("UI")
    beginPlay()
  end
  function goTitle()
    state, E, BOMBS, TXT = "title", {}, {}, {}
    P.alive, P.dashing, P.recover, P.buffer = true, false, 0, nil
    P.x, P.y = W / 2, layoutTitle()
    startRing.hit, startTimer, titleFade, aimTouched = false, -1, 0, false
    paused, exitArm = false, 0
  end
  function setPaused(on)
    if state ~= "play" or paused == on then return end
    paused = on
    play("UI")
  end
  -- Leaving mid-run drops the run: nothing from it is saved.
  function abandonRun()
    paused = false
    FX, EFX, BOLTS, TRAIL, WAVES = {}, {}, {}, {}, {}
    hitstop, slowT, slowScale, ts, trauma, flash = 0, 0, 1, 1, 0, 0
    play("UI")
    goTitle()
  end
  -- Two presses within 3 s, so a stray tap never ends the stage.
  -- The server answers issen_exit with Settle Stage, which ends the stage for the player.
  function exitPress()
    if state ~= "title" or startTimer >= 0 or exitSentT >= 0 then return end
    if exitArm <= 0 then exitArm = 3; play("UI"); return end
    exitArm, exitSentT = 0, 0
    play("UI")
    local ok, err = pcall(function() game.ServerSignal("issen_exit"):SendSignal() end)
    if not ok then printerr("issen: signal issen_exit failed: " .. tostring(err)) end
    toast(tr("exiting"))
  end
  local function die()
    P.alive, P.dashing, P.buffer, state, dieT = false, false, nil, "dying", 0
    hitstop = 0.16; slow(1.2, 0.16); addTrauma(1)
    flash, flashCol = 1, INK
    for _ = 1, 16 do
      local a, sp = rnd() * TAU, (20 + rnd() * 70) * U
      FX[#FX + 1] = { t = "spark", x = P.x, y = P.y, vx = cos(a) * sp, vy = sin(a) * sp, len = (1.5 + rnd() * 2) * U, life = 0.9, max = 0.9, col = acc() }
    end
    wave(P.x, P.y, P.r * U, 40 * U, 0.9, acc())
    play("DEATH")
  end
  local function finishRun()
    local d = today()
    local lv0 = lvInfo(save.xp)
    if d ~= 0 and save.lastDay ~= d then
      save.streak = (save.lastDay == yesterday()) and save.streak + 1 or 1
      save.lastDay = d
    elseif d == 0 and save.streak == 0 then
      save.streak = 1
    end
    save.maxStreak = max(save.maxStreak, save.streak)
    save.runs = save.runs + 1
    save.kills = save.kills + run.kills
    save.maxCombo = max(save.maxCombo, run.maxCombo)
    local prevBest = save.best
    local newBest = run.score > prevBest and run.score > 0
    if newBest then save.best = run.score end
    local newDone = {}
    for _, i in ipairs(run.newDone) do newDone[#newDone + 1] = i end
    for i = 1, 3 do
      save.mp[i] = missions[i].k == "runs" and save.mp[i] + 1 or liveVal(i, true)
      if save.md[i] == 0 and save.mp[i] >= missions[i].n then save.md[i] = 1; newDone[#newDone + 1] = i end
    end
    local all = save.md[1] == 1 and save.md[2] == 1 and save.md[3] == 1
    local allBonus = (#newDone > 0 and all) and 100 or 0
    local streakMult = 1 + min(max(save.streak - 1, 0), 10) * 0.05
    local gain = rint(run.score / 20 * streakMult) + #newDone * 60 + allBonus
    local xp0 = save.xp
    save.xp = save.xp + gain
    local lv1 = lvInfo(save.xp)
    local unlocked = false
    for i, c in ipairs(COLORS) do
      if c.lv > lv0 and c.lv <= lv1 then save.color = i - 1; unlocked = c end
    end
    persist()
    -- Achievements only ever go up, so send lifetime values.
    sendSignal("issen_run", { run.score, save.best, save.maxCombo, save.maxStreak, lv1, save.kills })
    res = { score = run.score, prevBest = prevBest, newBest = newBest, maxCombo = run.maxCombo, kills = run.kills, maxMulti = run.maxMulti,
      gain = gain, xp0 = xp0, xp1 = save.xp, newDone = newDone, allBonus = allBonus, streakMult = streakMult, unlocked = unlocked,
      shownLv = lv0, lvFlash = 0, bestShown = false }
    state, resT = "over", 0
  end

  -- ---------- loop ----------
  function xpShown() return res.xp0 + (res.xp1 - res.xp0) * ease((resT - 1.05) / 0.9) end
  local function updateResults(rdt)
    if resT > 0.15 and resT < 0.85 then play("TICK", 0.045) end
    if not res.bestShown and resT > 0.9 then
      res.bestShown = true
      if res.newBest then play("BEST"); addTrauma(0.35); wave(W / 2, H * 0.7, 0, max(W, H) * 0.6, 0.8, acc()) end
    end
    local lv = lvInfo(xpShown())
    if lv > res.shownLv then res.shownLv = lv; res.lvFlash = 1; play("LEVEL"); addTrauma(0.25) end
    res.lvFlash = max(0, res.lvFlash - rdt * 1.2)
  end

  local function sim(dt)
    if state == "play" then run.time = run.time + dt; spawnTick(dt) end
    updatePlayer(dt)
    if state == "play" or state == "dying" then
      for _, e in ipairs(E) do
        if not e.dead then
          e.born, e.ph = e.born + dt, e.ph + dt
          local dx, dy = P.x - e.x, P.y - e.y
          local d = max(hypot(dx, dy), 1)
          local sp = (state == "dying" and 0.3 or 1) * e.spd * U
          local k = min(1, dt * 2.5)
          e.vx = e.vx + (dx / d * sp - e.vx) * k
          e.vy = e.vy + (dy / d * sp - e.vy) * k
          e.x, e.y = e.x + e.vx * dt, e.y + e.vy * dt
          if state == "play" and P.alive and not P.dashing and P.grace <= 0 and d < (e.r + P.r) * U * 0.85 then die() end
        end
      end
      for i = 1, #E do
        for j = i + 1, #E do
          local a, b = E[i], E[j]
          local dx, dy = b.x - a.x, b.y - a.y
          local d, m = hypot(dx, dy), (a.r + b.r) * U * 0.9
          if d > 0 and d < m then
            local p = (m - d) / d * 0.25
            a.x, a.y, b.x, b.y = a.x - dx * p, a.y - dy * p, b.x + dx * p, b.y + dy * p
          end
        end
      end
    end
    local alive = {}
    for _, e in ipairs(E) do if not e.dead then alive[#alive + 1] = e end end
    E = alive
    local keep = {}
    for _, b in ipairs(BOMBS) do b.t = b.t - dt; if b.t <= 0 then explode(b) else keep[#keep + 1] = b end end
    BOMBS = keep
    local drag = 0.03 ^ dt
    keep = {}
    for _, f in ipairs(FX) do
      f.life = f.life - dt
      f.x, f.y = f.x + f.vx * dt, f.y + f.vy * dt
      f.vx, f.vy = f.vx * drag, f.vy * drag
      if f.t == "half" then f.rot = f.rot + f.va * dt end
      if f.life > 0 then keep[#keep + 1] = f end
    end
    FX = keep
    keep = {}
    for _, f in ipairs(EFX) do
      f.life = f.life - dt
      if f.k == "swirl" then f.ang = f.ang + f.av * dt; f.rad = f.rad + f.vr * dt; f.av = f.av * 0.2 ^ dt
      elseif f.k == "crack" or f.k == "arc" then f.rot = f.rot + (f.va or 0) * dt
      else
        f.vy = f.vy + (f.g or 0) * U * dt
        local dr = (f.dr or 0.02) ^ dt
        f.vx, f.vy = f.vx * dr, f.vy * dr
        f.x, f.y, f.rot = f.x + f.vx * dt, f.y + f.vy * dt, f.rot + f.va * dt
        if f.floor and f.y < f.floor then f.y = f.floor; f.vy = f.vy * -0.45; f.vx = f.vx * 0.7 end
      end
      if f.life > 0 then keep[#keep + 1] = f end
    end
    EFX = keep
    keep = {}
    for _, b in ipairs(BOLTS) do b.life = b.life - dt; if b.life > 0 then keep[#keep + 1] = b end end
    BOLTS = keep
    keep = {}
    for _, w in ipairs(WAVES) do
      if w.delay > 0 then w.delay = w.delay - dt else w.life = w.life - dt end
      if w.life > 0 then keep[#keep + 1] = w end
    end
    WAVES = keep
    keep = {}
    for _, t in ipairs(TXT) do t.life = t.life - dt; t.y = t.y + 6 * U * dt; if t.life > 0 then keep[#keep + 1] = t end end
    TXT = keep
    keep = {}
    for _, t in ipairs(TRAIL) do t.life = t.life - dt; if t.life > 0 then keep[#keep + 1] = t end end
    TRAIL = keep
    dispScore = dispScore + (run.score - dispScore) * min(1, dt * 14)
    if abs(run.score - dispScore) < 1 then dispScore = run.score end
  end

  local function tickToasts(rdt)
    local keep = {}
    for _, t in ipairs(TOASTS) do t.t = t.t + rdt; if t.t < 2.6 then keep[#keep + 1] = t end end
    TOASTS = keep
  end

  function update(rdt)
    clock = clock + rdt
    elapsed = elapsed + rdt
    if exitArm > 0 then exitArm = exitArm - rdt end
    if exitSentT >= 0 then
      exitSentT = exitSentT + rdt
      if exitSentT > 6 then exitSentT = -1; toast(tr("exitFailed")) end
    end
    tickToasts(rdt)
    if paused then return end
    if slowT > 0 then slowT = slowT - rdt; if slowT <= 0 then slowScale = 1 end end
    ts = ts + ((slowT > 0 and slowScale or 1) - ts) * min(1, rdt * 14)
    trauma = max(0, trauma - rdt * 1.6)
    local kd = 0.0004 ^ rdt
    kickX, kickY = kickX * kd, kickY * kd
    flash = max(0, flash - rdt * 5)
    comboPulse = max(0, comboPulse - rdt * 4)
    scorePulse = max(0, scorePulse - rdt * 5)
    if state == "title" and startTimer < 0 then titleFade = min(1, titleFade + rdt * 3) end
    if startTimer >= 0 then
      titleFade = max(0, titleFade - rdt * 4)
      startTimer = startTimer - rdt
      if startTimer < 0 then beginPlay() end
    end
    if state == "dying" then dieT = dieT + rdt; if dieT > 1.15 then finishRun() end end
    if state == "over" then resT = resT + rdt; updateResults(rdt) end
    if hitstop > 0 then hitstop = hitstop - rdt; return end
    sim(rdt * ts)
  end

end)()

local buildLayers, render, readPad, bindInput
;(function()
  -- ---------- display layer ----------
  -- Every frame draws through pools: each draw call takes the next sprite of a pool,
  -- and sprites a frame did not use are hidden. One pool per layer keeps draw order fixed.
  local L = {}       -- pools by name
  local layerList = {}
  local function stretch(c)
    c:SetAnchorMin(0, 0); c:SetAnchorMax(1, 1); c:SetPivot(0.5, 0.5)
    c:SetSizeDelta(0, 0); c:SetAnchoredPosition(0, 0)
  end
  -- Templates can come out inactive or hidden (the MiliUI Playground does), so switch every new control on.
  local function show(c) c:SetActive(true); c:SetVisible(true) end
  local function newLayer(parent)
    local c = game.InstantiateClientUIControl(TPL.group, parent)
    show(c)
    stretch(c)
    layerList[#layerList + 1] = c
    return c
  end
  -- kind: "dot" | "ring" | "rect" | "text" (a TPL key)
  local function newPool(name, kind, parent, setup)
    L[name] = { tpl = TPL[kind], img = TPL.img and TPL.img[kind], parent = newLayer(parent), items = {}, used = 0, setup = setup }
  end
  local function nextSprite(p)
    p.used = p.used + 1
    local s = p.items[p.used]
    if not s then
      local c = game.InstantiateClientUIControl(p.tpl, p.parent)
      show(c)
      c:SetAnchorMin(0, 0); c:SetAnchorMax(0, 0); c:SetPivot(0.5, 0.5)
      if p.img then c:SetImage(Enum.ImageSource.StaticReference, p.img) end
      if p.setup then p.setup(c) end
      s = { c = c, vis = true }
      p.items[p.used] = s
    end
    if not s.vis then s.c:SetVisible(true); s.vis = true end
    return s
  end
  local function prewarm(p, n)
    for _ = 1, n do nextSprite(p) end
  end
  local function flushAll()
    for _, p in pairs(L) do
      for i = p.used + 1, #p.items do
        local s = p.items[i]
        if s.vis then s.c:SetVisible(false); s.vis = false end
      end
      p.used = 0
    end
  end
  local function img(pool, x, y, w, h, rot, rgb, a)
    local s = nextSprite(L[pool]); local c = s.c
    if s.x ~= x or s.y ~= y then c:SetAnchoredPosition(x, y); s.x, s.y = x, y end
    if s.w ~= w or s.h ~= h then c:SetSizeDelta(w, h); s.w, s.h = w, h end
    rot = rot or 0
    if s.r ~= rot then c:SetLocalRotation(0, 0, rot); s.r = rot end
    local ai = rint(clamp(a or 1, 0, 1) * 255)
    local ck = ((rgb[1] * 256 + rgb[2]) * 256 + rgb[3]) * 256 + ai
    if s.ck ~= ck then c.imageColor = Color.FromRGBA(rgb[1], rgb[2], rgb[3], ai); s.ck = ck end
    return s
  end
  local function circle(pool, x, y, r, rgb, a) return img(pool, x, y, r * 2, r * 2, 0, rgb, a) end
  local function line(pool, x1, y1, x2, y2, th, rgb, a)
    local dx, dy = x2 - x1, y2 - y1
    img(pool, (x1 + x2) / 2, (y1 + y2) / 2, max(0.5, hypot(dx, dy)), th, atan(dy, dx) * DEG, rgb, a)
  end
  -- A circle of constant line width, as short segments (overlapping slightly so no gaps show).
  local function thinRing(pool, x, y, r, th, rgb, a)
    local n = clamp(floor(r / U), 24, 64)
    local step = TAU / n
    for i = 0, n - 1 do
      local a0, a1 = i * step, (i + 1) * step + 0.02
      line(pool, x + cos(a0) * r, y + sin(a0) * r, x + cos(a1) * r, y + sin(a1) * r, th, rgb, a)
    end
  end
  local TH = Enum.TextHorizontalAlignment
  -- Rough width in ems: Latin letters are about half as wide as kana and kanji.
  local function ems(str)
    if not utf8 then return #str * 0.6 end
    local n = 0
    for _, cp in utf8.codes(str) do n = n + (cp < 0x2000 and 0.6 or 1.05) end
    return n
  end
  local function text(pool, str, x, y, size, rgb, a, align)
    local s = nextSprite(L[pool]); local c = s.c
    align = align or 0
    if s.al ~= align then
      c:SetPivot(align < 0 and 0 or align > 0 and 1 or 0.5, 0.5)
      c.horizontalAlignment = align < 0 and TH.Left or align > 0 and TH.Right or TH.Middle
      s.al = align
    end
    size = max(8, rint(size))
    if s.t ~= str then c.text = str; s.t = str end
    if s.fs ~= size then c.fontSize = size; s.fs = size end
    -- Leave room for the game's font metrics and template text margins.
    local w, h = size * (ems(str) + 2), size * 2.4
    if s.x ~= x or s.y ~= y then c:SetAnchoredPosition(x, y); s.x, s.y = x, y end
    if s.w ~= w or s.h ~= h then c:SetSizeDelta(w, h); s.w, s.h = w, h end
    local ai = rint(clamp(a or 1, 0, 1) * 255)
    local ck = ((rgb[1] * 256 + rgb[2]) * 256 + rgb[3]) * 256 + ai
    if s.ck ~= ck then c.fontColor = Color.FromRGBA(rgb[1], rgb[2], rgb[3], ai); s.ck = ck end
    return s
  end
  local function textSetup(c)
    c.adaptiveFontSize = false
    c.enableOutline = false
    c.bgColor = Color.FromRGBA(0, 0, 0, 0)
    c.verticalAlignment = Enum.TextVerticalAlignment.Middle
  end
  -- pcall: the MiliUI Playground has no radial fill yet (halves and arcs show as full rings there)
  local function halfSetup(c) pcall(c.SetFillRadial360, c, Enum.ImageFillRadialType.Right, 0.5) end
  local function arcSetup(c) pcall(c.SetFillRadial360, c, Enum.ImageFillRadialType.Top, 0.35) end
  local function sparkSetup(c) c:SetImage(Enum.ImageSource.StaticReference, IMG_SPARK) end
  local function setIcon(s, id)
    if s.icon ~= id then s.c:SetImage(Enum.ImageSource.StaticReference, id); s.icon = id end
  end


  function buildLayers()
    local bg = newLayer(root)
    L.bg = { tpl = TPL.rect, img = TPL.img and TPL.img.rect, parent = bg, items = {}, used = 0 }
    world = newLayer(root)
    newPool("combo", "text", world, textSetup)
    newPool("trail", "rect", world)
    newPool("wave", "rect", world) -- drawn as a thin polygon: the ring image thickens as it grows
    newPool("eRing", "ring", world)
    newPool("eDot", "dot", world)
    newPool("eRect", "rect", world)
    newPool("halfRing", "ring", world, halfSetup)
    newPool("halfDot", "dot", world, halfSetup)
    newPool("fx", "rect", world)
    newPool("elDot", "dot", world)
    newPool("elRect", "rect", world)
    newPool("elSpark", "dot", world, sparkSetup)
    newPool("arc", "ring", world, arcSetup)
    newPool("aim", "rect", world)
    newPool("pDot", "dot", world)
    newPool("pRing", "ring", world)
    newPool("wText", "text", world, textSetup)
    newPool("hudText", "text", root, textSetup)
    newPool("uiRect", "rect", root)
    newPool("uiDot", "dot", root)
    newPool("uiRing", "ring", root)
    newPool("uiIcon", "dot", root)
    newPool("uiText", "text", root, textSetup)
    newPool("toast", "text", root, textSetup)
    newPool("flash", "rect", root)
    prewarm(L.eRing, 30); prewarm(L.fx, 40); prewarm(L.trail, 20); prewarm(L.halfRing, 16); prewarm(L.wText, 8)
    flushAll()
  end

  -- ---------- drawing ----------
  local function fsz(k, lo) return max(lo, k * U) end

  local function drawWorld()
    if (state == "play" or state == "dying") and run.combo >= 2 then
      local size = min(W, H) * 0.42 * (1 + comboPulse * 0.08)
      text("combo", tostring(run.combo), W / 2, H / 2, size, INK, 0.055)
      local mult = 1 + min(9, floor(run.combo / 10))
      if mult > 1 then text("combo", "×" .. mult, W / 2, H / 2 - size * 0.48, size * 0.16, acc(), 0.18) end
    end
    for _, t in ipairs(TRAIL) do
      local k = t.life / t.max
      line("trail", t.x1, t.y1, t.x2, t.y2, max(1, P.r * 2 * U * k), acc(), k * 0.85)
    end
    for _, w in ipairs(WAVES) do
      if w.delay <= 0 then
        local k = 1 - w.life / w.max
        thinRing("wave", w.x, w.y, w.r0 + (w.r1 - w.r0) * ease(k), max(1, 0.6 * U * (1 - k * 0.7)), w.col, (1 - k) * 0.8)
      end
    end
    if state == "title" and not startRing.hit then
      local pulse = 1 + sin(clock * 3) * 0.04
      circle("eRing", startRing.x, startRing.y, startRing.r * U * pulse, INK, 1)
      local ph = (clock % 1.6) / 1.6
      circle("eRing", startRing.x, startRing.y, startRing.r * U * (1 + ph * 0.6), INK, 0.25 * (1 - ph))
      text("wText", tr("startRing"), startRing.x, startRing.y, fsz(2.2, 14), INK, titleFade)
    end
    for _, e in ipairs(E) do
      local s = e.born < 0.25 and max(0, easeBack(e.born / 0.25)) or 1
      local r = e.r * U * s
      if e.kind == "ring" then circle("eRing", e.x, e.y, r, INK, 1)
      elseif e.kind == "dot" then circle("eDot", e.x, e.y, r, INK, 1)
      else
        local rot = e.ph * 1.2 * DEG
        img("eRect", e.x, e.y, r * 1.7, r * 1.7, rot, INK, 1)
        local q = r * (0.3 + sin(e.ph * 8) * 0.08)
        img("eRect", e.x, e.y, q * 2, q * 2, rot, BG, 1)
      end
    end
    for _, f in ipairs(FX) do
      local k = f.life / f.max
      local a = min(1, k * 1.4)
      if f.t == "half" then
        local r = f.r * (0.7 + 0.3 * k)
        local ang = f.a + f.rot
        if f.kind == "bomb" then
          local nx, ny = -sin(ang), cos(ang)
          img("fx", f.x + nx * f.side * r * 0.42, f.y + ny * f.side * r * 0.42, r * 1.7, r * 0.85, ang * DEG, f.col, a)
        else
          img(f.kind == "dot" and "halfDot" or "halfRing", f.x, f.y, r * 2, r * 2, ang * DEG + (f.side > 0 and 0 or 180), f.col, a)
        end
      elseif f.t == "spark" then
        local v = max(hypot(f.vx, f.vy), 1)
        line("fx", f.x, f.y, f.x - f.vx / v * f.len * k, f.y - f.vy / v * f.len * k, max(1, 0.35 * U), f.col, a)
      else
        local l = f.len * (1.2 - k * 0.2)
        line("fx", f.x - cos(f.a) * l, f.y - sin(f.a) * l, f.x + cos(f.a) * l, f.y + sin(f.a) * l, 0.35 * U * k + 1, f.col, a)
      end
    end
    for _, f in ipairs(EFX) do
      local a = clamp(f.life / f.max * 1.4, 0, 1)
      local k = f.k
      if k == "dot" then circle("elDot", f.x, f.y, f.size * U * (0.5 + 0.5 * f.life / f.max), f.col, a)
      elseif k == "swirl" then circle("elDot", f.cx + cos(f.ang) * f.rad, f.cy + sin(f.ang) * f.rad, f.size * U, f.col, a)
      elseif k == "arc" then img("arc", f.x, f.y, f.size * 2, f.size * 2, f.rot * DEG, f.col, a)
      elseif k == "crack" then
        local g = ease((f.max - f.life) / 0.12) * f.len * U
        line("elRect", f.x, f.y, f.x + cos(f.rot) * g, f.y + sin(f.rot) * g, max(1, f.w * U), f.col, a)
      elseif k == "sq" then img("elRect", f.x, f.y, f.size * U, f.size * U, f.rot * DEG, f.col, a)
      elseif k == "leaf" then
        img("elDot", f.x, f.y, f.size * 1.6 * U, f.size * 0.64 * U * (0.25 + 0.75 * abs(sin(clock * 7 + f.ph))), f.rot * DEG, f.col, a)
      elseif k == "spark" then img("elSpark", f.x, f.y, f.size * 1.2 * U, f.size * 1.2 * U, f.rot * DEG, f.col, a) end
    end
    for _, b in ipairs(BOLTS) do
      -- re-jittered every frame so the bolt flickers
      local n, dx, dy = 6, b.x2 - b.x1, b.y2 - b.y1
      local len = max(hypot(dx, dy), 1)
      local px, py = -dy / len, dx / len
      local x0, y0 = b.x1, b.y1
      for i = 1, n do
        local j = i < n and rr(-1, 1) * min(2.5 * U, len * 0.12) or 0
        local x1, y1 = b.x1 + dx * i / n + px * j, b.y1 + dy * i / n + py * j
        line("elRect", x0, y0, x1, y1, max(1, 0.5 * U), b.col, b.life / b.max)
        x0, y0 = x1, y1
      end
    end
    if P.alive then
      if padMode and not P.dashing and (state == "play" or (state == "title" and startTimer < 0)) then
        local r0, r1 = (P.r + 2) * U, (P.r + 9) * U
        line("aim", P.x + aimX * r0, P.y + aimY * r0, P.x + aimX * r1, P.y + aimY * r1, max(1, 0.3 * U), acc(), 0.5)
        line("aim", P.x + aimX * r1, P.y + aimY * r1, P.x + aimX * 60 * U, P.y + aimY * 60 * U, max(1, 0.15 * U), acc(), 0.15)
      end
      local r = P.r * U
      local sx, sy = 1, 1
      if P.dashing then sx, sy = 1.8, 0.6 else sx, sy = 1 - 0.3 * P.land, 1 + 0.3 * P.land end
      local br = (state == "title" and not P.dashing) and 1 + sin(clock * 4) * 0.05 or 1
      local rot = atan(P.diry, P.dirx) * DEG
      img(P.recover > 0 and "pRing" or "pDot", P.x, P.y, r * 2 * sx * br, r * 2 * sy * br, rot, acc(), 1)
    end
    for _, t in ipairs(TXT) do
      local age = t.max - t.life
      local s = 1 + 0.7 * max(0, 1 - age / 0.1)
      text("wText", t.s, t.x, t.y, t.size * s, t.col, min(1, t.life / t.max * 2.5))
    end
  end

  local function bar(x, y, w, h, k, rgb, a)
    img("uiRect", x + w / 2, y, w, h, 0, FAINT, a)
    local fw = w * clamp(k, 0, 1)
    if fw > 0.5 then img("uiRect", x + fw / 2, y, fw, h, 0, rgb, a) end
  end

  local function drawMute(a)
    local s, x, y = fsz(1.9, 13), W - max(16, 3 * U), H - max(22, 4 * U)
    local str = save.mute and tr("soundOff") or tr("soundOn")
    text("hudText", str, x, y, s, MUTE, a or 1, 1)
    UI.mute = { x = x - s * 4.5, y = y - s, w = s * 4.5 + 12, h = s * 2 }
  end

  -- A label on a faint plate; returns its hit rect. align -1 / 1 puts the left / right edge at x.
  local function button(str, x, y, size, rgb, a, align)
    local w, h = size * (ems(str) + 2), size * 2.2
    if align then x = x - align * w / 2 end
    img("uiRect", x, y, w, h, 0, FAINT, (a or 1) * 0.9)
    text("uiText", str, x, y, size, rgb, a or 1)
    return { x = x - w / 2, y = y - h / 2, w = w, h = h }
  end

  local function hint(str)
    if padMode then text("hudText", str, W / 2, max(14, 2.2 * U), fsz(1.6, 12), MUTE, 0.9) end
  end

  local function drawHUD()
    local m, s = max(16, 3 * U), fsz(5, 22)
    text("hudText", tostring(rint(dispScore)), m, H - m - s * 0.6, s * (1 + scorePulse * 0.12), INK, 1, -1)
    text("hudText", "BEST " .. max(save.best, run.score), m, H - m - s * 1.45, fsz(1.6, 11), MUTE, 1, -1)
    if state == "play" and not paused then
      UI.pause = button(tr("pause"), W - max(16, 3 * U), H - max(22, 4 * U) - max(40, 6 * U), fsz(1.9, 13), { 0, 0, 0 }, 1, 1)
    end
    if save.runs == 0 and run.time < 7 and state == "play" then
      local a = min(1, (7 - run.time) / 1.5) * 0.9
      local y = max(48, 9 * U)
      text("hudText", padMode and tr("firstHintPad") or tr("firstHint"), W / 2, y, fsz(2, 13), MUTE, a)
      text("hudText", tr("whiffHint"), W / 2, y - max(20, 3 * U), fsz(1.7, 12), MUTE, a)
    end
  end

  local function drawPause()
    img("uiRect", W / 2, H / 2, W, H, 0, BG, 0.88)
    local fs = fsz(1.9, 13)
    text("uiText", tr("paused"), W / 2, H * 0.62, fsz(5, 30), INK, 1)
    text("uiText", tr("pausedNote"), W / 2, H * 0.62 - fsz(5, 30), fsz(1.6, 11), MUTE, 1)
    UI.resume = button(padMode and tr("resumePad") or tr("resume"), W / 2, H * 0.42, fs * 1.2, INK, 1)
    UI.quitRun = button(padMode and tr("toTitlePad") or tr("toTitle"), W / 2, H * 0.42 - fs * 3.4, fs, MUTE, 1)
  end

  local function fmtLeft()
    local t = nowSec()
    if not t then return "--:--:--" end
    local d = dayOf(t)
    local s = max(0, floor((d + 1) * 86400 + RESET_HOUR * 3600 - t))
    return string.format("%02d:%02d:%02d", s // 3600, (s // 60) % 60, s % 60)
  end

  local function drawMissions(x0, y, w, lh, highlight, alpha)
    local box = fsz(1.6, 10)
    for i = 1, 3 do
      local m, done, yy = missions[i], save.md[i] == 1, y - (i - 1) * lh
      local hl = false
      for _, j in ipairs(highlight or {}) do if j == i then hl = true end end
      img("uiRect", x0 + box / 2, yy, box, box, 0, done and acc() or FAINT, alpha)
      if not done then img("uiRect", x0 + box / 2, yy, box - 4, box - 4, 0, BG, alpha) end
      text("uiText", m.text, x0 + box + 10, yy, fsz(1.9, 13), hl and acc() or INK, alpha * ((done and not hl) and 0.45 or 1), -1)
      text("uiText", done and tr("done") or (min(m.n, liveVal(i, false)) .. "/" .. m.n), x0 + w, yy, fsz(1.6, 11), done and acc() or MUTE, alpha, 1)
    end
  end

  local function drawTitle()
    local a = titleFade
    local colW = min(W - 32, 440 * U / 8)
    local x0 = (W - colW) / 2
    local ts1 = max(44, min(11 * U, 120))
    text("uiText", "一閃", W / 2, H * 0.87, ts1, INK, a)
    text("uiText", "I S S E N", W / 2, H * 0.87 - ts1 * 0.72, fsz(1.6, 11), MUTE, a)
    text("uiText", tr("tagline"), W / 2, startRing.y - 7 * U - max(20, 3 * U), fsz(1.8, 12), MUTE, a)
    local lv, cur, nd = lvInfo(save.xp)
    local fs = fsz(1.9, 13)
    local y = H * 0.44
    text("uiText", "Lv " .. lv, x0, y, fs, INK, a, -1)
    bar(x0 + fs * 3.6, y, colW - fs * 3.6 - fs * 6.5, 4, cur / nd, acc(), a)
    text("uiText", "BEST " .. save.best, x0 + colW, y, fs, INK, a, 1)
    y = y - fs * 2
    local d = today()
    local streakLine, sc = nil, INK
    if d ~= 0 and save.lastDay == d then streakLine = tr("streakToday", save.streak)
    elseif d ~= 0 and save.lastDay == d - 1 then streakLine, sc = tr("streakKeep", save.streak + 1), acc()
    elseif save.runs > 0 then streakLine, sc = tr("streakRestart"), acc() end
    if streakLine then text("uiText", streakLine, x0, y, fsz(1.7, 12), sc, a, -1) end
    text("uiText", tr("resetIn", fmtLeft()), x0 + colW, y, fsz(1.6, 11), MUTE, a, 1)
    y = y - fs * 1.9
    text("uiText", tr("todaysMissions"), x0, y, fsz(1.6, 11), MUTE, a, -1)
    y = y - fs * 1.6
    drawMissions(x0, y, colW, fs * 1.9, nil, a)
    UI.sw = {}
    local n, sr = #COLORS, fsz(1.3, 7)
    local gap = min(colW / n, sr * 5.5)
    local sy, sx0 = max(46, 8 * U), W / 2 - gap * (n - 1) / 2
    for i, c in ipairs(COLORS) do
      local x, open = sx0 + (i - 1) * gap, lv >= c.lv
      if i - 1 == save.color then circle("uiRing", x, sy, sr + 4, INK, a) end
      if c.icon then
        -- element icons keep their own colors; locked ones are greyed out
        setIcon(img("uiIcon", x, sy, sr * 2.4, sr * 2.4, 0, open and WHITE or MUTE, a * (open and 1 or 0.35)), c.icon)
      else circle("uiDot", x, sy, sr, INK, a) end
      if not open then text("uiText", "Lv" .. c.lv, x, sy - sr - 10, fsz(1.2, 9), MUTE, a) end
      UI.sw[i] = { x = x, y = sy, r = sr + 8, i = i - 1, open = open }
    end
    local sel = COLORS[save.color + 1]
    text("uiText", sel.k and tr("elementColor", colorName(sel)) or colorName(sel), W / 2, sy + sr + max(16, 2.4 * U), fsz(1.5, 11), sel.c or MUTE, a)
    local m = max(16, 3 * U)
    if exitSentT >= 0 then
      text("uiText", tr("exiting"), m, H - max(22, 4 * U), fsz(1.9, 13), MUTE, a, -1)
    else
      UI.exit = button(exitArm > 0 and tr("exitConfirm") or tr("exitStage"), m, H - max(22, 4 * U), fsz(1.9, 13),
        { 0, 0, 0 }, a, -1)
    end
    hint(tr("hintTitle"))
  end

  local function drawResults()
    local k = min(1, resT / 0.3)
    img("uiRect", W / 2, H / 2, W, H, 0, BG, 0.88 * k)
    local colW = min(W - 32, 420 * U / 8)
    local x0, fs = (W - colW) / 2, fsz(1.9, 13)
    local y = H * 0.83
    text("uiText", "S C O R E", W / 2, y, fsz(1.6, 11), MUTE, k)
    y = y - max(44, 8 * U)
    local big = max(48, min(15 * U, 140))
    local bs = (res.bestShown and res.newBest) and 1 + 0.15 * max(0, 1 - (resT - 0.9) / 0.25) or 1
    text("uiText", tostring(rint(res.score * ease((resT - 0.15) / 0.7))), W / 2, y, big * bs, (res.newBest and res.bestShown) and acc() or INK, 1)
    y = y - big * 0.75
    if res.bestShown then
      if res.newBest then text("uiText", res.prevBest > 0 and tr("newBest", res.score - res.prevBest) or tr("firstRecord"), W / 2, y, fs, acc(), 1)
      else text("uiText", tr("toBest", res.prevBest - res.score + 1), W / 2, y, fs, MUTE, 1) end
    end
    y = y - fs * 2.6
    local stats = { { tr("statCombo"), res.maxCombo }, { tr("statKills"), res.kills }, { tr("statMulti"), res.maxMulti } }
    for i, s in ipairs(stats) do
      local x, a = x0 + colW * (i - 0.5) / 3, clamp((resT - 0.3 - (i - 1) * 0.08) / 0.2, 0, 1)
      text("uiText", tostring(s[2]), x, y, fsz(3.6, 20), INK, a)
      text("uiText", s[1], x, y - max(20, 3.4 * U), fsz(1.5, 11), MUTE, a)
    end
    y = y - max(64, 10 * U)
    local xa = clamp((resT - 0.9) / 0.2, 0, 1)
    local lv, cur, nd = lvInfo(xpShown())
    text("uiText", "Lv " .. lv, x0, y, fs * (1 + res.lvFlash * 0.4), res.lvFlash > 0 and acc() or INK, xa, -1)
    bar(x0 + fs * 4, y, colW - fs * 9, 6, cur / nd, acc(), xa)
    text("uiText", "+" .. res.gain .. " XP", x0 + colW, y, fs, INK, xa, 1)
    y = y - fs * 1.7
    local notes = {}
    if res.streakMult > 1 then notes[#notes + 1] = tr("streakBonus", save.streak, string.format("%.2f", res.streakMult)) end
    if res.allBonus > 0 then notes[#notes + 1] = tr("allDailies", res.allBonus) end
    if res.shownLv > lvInfo(res.xp0) then notes[#notes + 1] = "LEVEL UP" end
    if res.unlocked and resT > 1.5 then notes[#notes + 1] = tr("gotElement", colorName(res.unlocked))
    else
      for _, c in ipairs(COLORS) do
        if c.lv > lv then notes[#notes + 1] = tr("nextElement", colorName(c), max(0, math.ceil(xpForLevel(c.lv) - xpShown()))); break end
      end
    end
    text("uiText", table.concat(notes, "   "), x0, y, fsz(1.6, 11), res.lvFlash > 0 and acc() or MUTE, xa, -1)
    y = y - fs * 2.4
    drawMissions(x0, y, colW, fs * 1.9, res.newDone, clamp((resT - 1.2) / 0.3, 0, 1))
    local by = max(44, 8 * U)
    if resT > 0.45 then
      text("uiText", padMode and tr("againPad") or tr("again"), W / 2, by + max(30, 5 * U), fsz(2.3, 15), INK, 0.55 + 0.45 * sin(clock * 5))
      local s2 = fsz(1.9, 13)
      text("uiText", padMode and tr("toTitlePad") or tr("toTitle"), W / 2, by - 6, s2, { 0, 0, 0 }, 1)
      UI.toTitle = { x = W / 2 - s2 * 4, y = by - 6 - s2 * 1.4, w = s2 * 8, h = s2 * 2.8 }
    else UI.toTitle = nil end
  end

  local function drawToasts()
    for i, t in ipairs(TOASTS) do
      local inK = ease(t.t / 0.25)
      local outK = t.t > 2.2 and 1 - (t.t - 2.2) / 0.4 or 1
      local y = H - max(70, 12 * U) - (i - 1) * max(28, 4.4 * U) + (1 - inK) * 20
      text("toast", t.text, W / 2, y, fsz(1.9, 13), acc(), inK * outK)
    end
  end

  function render()
    local bg = nextSprite(L.bg)
    if bg.w ~= W or bg.h ~= H then
      bg.c:SetAnchoredPosition(W / 2, H / 2); bg.c:SetSizeDelta(W * 1.25, H * 1.1); bg.w, bg.h = W, H
      bg.c.imageColor = Color.FromRGBA(BG[1], BG[2], BG[3], 255)
    end
    local amp = paused and 0 or trauma * trauma * 3 * U
    local sx = (rnd() * 2 - 1) * amp + kickX
    local sy = (rnd() * 2 - 1) * amp + kickY
    world:SetAnchoredPosition(sx, sy)
    world:SetLocalRotation(0, 0, paused and 0 or (rnd() * 2 - 1) * trauma * trauma * 1.4)
    UI.pause, UI.exit, UI.resume, UI.quitRun, UI.sw = nil, nil, nil, nil, nil
    drawWorld()
    if state == "title" then drawTitle() end
    if state == "play" or state == "dying" then
      drawHUD()
      if paused then drawPause(); hint(tr("hintPaused"))
      else hint(tr("hintPlay")) end
    end
    if state == "over" then drawResults() end
    if state == "boot" then text("uiText", tr("loading"), W / 2, H / 2, fsz(2, 14), MUTE, 0.6 + 0.4 * sin(clock * 4)) end
    drawToasts()
    drawMute()
    if flash > 0 then img("flash", W / 2, H / 2, W, H, 0, flashCol, flash * 0.14) end
    flushAll()
  end

  -- ---------- input ----------
  local function inRect(r, x, y) return r and x >= r.x and x <= r.x + r.w and y >= r.y and y <= r.y + r.h end
  local function toggleMute() save.mute = not save.mute; persist(); play("UI") end
  local function cycleColor(dir)
    local lv = lvInfo(save.xp)
    local i = save.color
    for _ = 1, #COLORS do
      i = (i + dir) % #COLORS
      if lv >= COLORS[i + 1].lv then break end
    end
    if i ~= save.color then save.color = i; persist(); play("UI"); wave(P.x, P.y, 0, 8 * U, 0.3, acc()) end
  end
  local function pointerDown(x, y)
    padMode = false
    if inRect(UI.mute, x, y) then toggleMute(); return end
    if state == "title" then
      for _, s in ipairs(UI.sw or {}) do
        if hypot(x - s.x, y - s.y) < s.r then
          if s.open then save.color = s.i; persist(); play("UI"); wave(s.x, s.y, 0, 5 * U, 0.3, acc())
          else toast(tr("unlockAt", COLORS[s.i + 1].lv)); play("WHIFF") end
          return
        end
      end
      if inRect(UI.exit, x, y) then exitPress(); return end
      if startTimer < 0 then dashInput(x, y) end
    elseif state == "play" then
      if paused then
        if inRect(UI.resume, x, y) then setPaused(false)
        elseif inRect(UI.quitRun, x, y) then abandonRun() end
        return
      end
      if inRect(UI.pause, x, y) then setPaused(true); return end
      dashInput(x, y)
    elseif state == "over" and resT > 0.45 then
      if inRect(UI.toTitle, x, y) then goTitle() else restart() end
    end
  end
  local function padConfirm()
    padMode = true
    if paused then setPaused(false); return end
    if state == "title" then
      if startTimer < 0 then dashInput(P.x + aimX * 60 * U, P.y + aimY * 60 * U) end
    elseif state == "play" then dashInput(P.x + aimX * 60 * U, P.y + aimY * 60 * U)
    elseif state == "over" and resT > 0.45 then restart() end
  end
  local function padBack()
    padMode = true
    if state == "play" then
      if paused then abandonRun() else setPaused(true) end
    elseif state == "title" then exitPress()
    elseif state == "over" and resT > 0.45 then goTitle() end
  end
  function readPad()
    local ok, dev = pcall(game.GetDevice)
    local isPad = ok and (dev == Enum.Device.Controller or dev == Enum.Device.MobileController)
    if not isPad then return end
    local ok2, lx, ly = pcall(game.GetControllerLeftStickAxis)
    if not ok2 then return end
    local m = hypot(lx or 0, ly or 0)
    if m > 0.3 then
      padMode, aimTouched = true, true
      aimX, aimY = lx / m, ly / m
    elseif state == "title" and not aimTouched then
      local dx, dy = startRing.x - P.x, startRing.y - P.y
      local d = max(hypot(dx, dy), 1)
      aimX, aimY = dx / d, dy / d
    end
  end

  function bindInput()
    input = root:FindChild("Input")
    if not input and TPL.input then input = game.InstantiateClientUIControl(TPL.input, root); show(input) end
    if not input then printerr("issen: no Input CursorEventArea found"); return end
    stretch(input)
    input.raycastTarget = true
    input:SetAsLastSibling()
    input:AddCursorEventListener(Enum.CursorEventType.CursorDown, function(ev)
      local x, y = ev:GetUIPos()
      pointerDown(x, y)
    end)
    local K = Enum.KeyEventType
    local function on(t, fn) root:AddKeyEventListener(t, function() fn(); return true end) end
    on(K.ControllerJumpKeyDown, padConfirm)            -- A
    on(K.ControllerCharacterSkill1KeyDown, padConfirm) -- RT
    on(K.ControllerNormalAttackKeyDown, padBack)       -- B
    on(K.ControllerInteractKeyDown, function() padMode = true; toggleMute() end) -- X
    on(K.ControllerSprintKeyDown, function()            -- RB
      padMode = true
      if state == "title" then cycleColor(1) end
    end)
    on(K.KeyboardJumpKeyDown, function()               -- Space: quick retry
      if state == "over" and resT > 0.45 then restart() end
    end)
  end

end)()

-- ---------- boot ----------
local function loadTime()
  local now = tonumber(readVar("iss_now"))
  if now and now > 0 then serverTs, elapsed = now + tzSeconds(readVar("iss_tz")), 0 end
end
local function loadFromServer()
  local ready = readVar("iss_ready")
  if ready ~= 1 and ready ~= true then return false end
  save = unpackSave(readVar("iss_save"))
  loadTime()
  online = true
  return true
end

function OnStart()
  root = script.object
  TPL.dot, TPL.ring, TPL.rect = param("TPL_DOT"), param("TPL_RING"), param("TPL_RECT")
  TPL.text, TPL.group, TPL.input = param("TPL_TEXT"), param("TPL_GROUP"), param("TPL_INPUT")
  if not (TPL.dot or TPL.ring or TPL.rect or TPL.text or TPL.group) then
    -- No templates set: use the MiliUI Playground's built-in ones so the file previews there as is.
    -- Its one Image template gets each picture with SetImage (100002 circle, 100006 ring, 100001 square).
    print("issen: no TPL_* Script Variables; using MiliUI Playground template IDs")
    TPL.dot, TPL.ring, TPL.rect, TPL.text, TPL.group = 910002, 910002, 910002, 910003, 910001
    TPL.input = TPL.input or 910005
    TPL.img = { dot = 100002, ring = 100006, rect = 100001 }
  end
  for _, n in ipairs(SFX_NAMES) do SFX[n] = param("SFX_" .. n, 0) end
  for _, k in ipairs({ "dot", "ring", "rect", "text", "group" }) do
    if not TPL[k] then printerr("issen: Script Variable TPL_" .. string.upper(k) .. " is not set"); return end
  end
  root.showCursor = true
  root.disableCursorEventPassthrough = true
  root.disableKeyEventPassthrough = true
  W, H = game.GetUICanvasSize()
  U = sqrt(W * H) / 120
  buildLayers()
  bindInput()
  script:RegisterCustomVariableChangedHandler(PLAYER, "iss_ready", function()
    if loadFromServer() and state == "boot" then ensureDay(); goTitle(); titleFade = 1 end
  end)
  -- The time may arrive after the save: missions then switch to today on the title screen.
  script:RegisterCustomVariableChangedHandler(PLAYER, "iss_now", function()
    loadTime()
    if state == "title" then ensureDay() end
  end)
  if loadFromServer() then ensureDay(); goTitle(); titleFade = 1 end
  script:EnableUpdate(true)
end

function OnUpdate(dt)
  if not world then return end
  dt = min(0.05, dt)
  local w, h = game.GetUICanvasSize()
  if w and h and (w ~= W or h ~= H) then W, H, U = w, h, sqrt(w * h) / 120 end
  if state == "boot" then
    bootT = bootT + dt
    if bootT > 4 then
      printerr("issen: server save not ready; playing offline (progress will not be saved)")
      ensureDay(); goTitle(); titleFade = 1
    end
  end
  readPad()
  update(dt)
  render()
end

function OnDestroy()
  if input and input.alive then input:RemoveAllCursorEventListeners() end
  if root and root.alive then root:RemoveAllKeyEventListeners() end
  pcall(script.UnregisterCustomVariableChangedHandler, script, PLAYER, "iss_ready")
  pcall(script.UnregisterCustomVariableChangedHandler, script, PLAYER, "iss_now")
end
