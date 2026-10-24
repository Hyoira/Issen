// Headless harness: strict mock of the Miliastra client Lua API + a bot that plays Issen.
// Usage: MILILUA=<miliastra-lua-api>/library node run.js ../lua/Issen/Main.lua [frames]
// OFFLINE=1 simulates a stage whose server never marks the save as ready.
const fs = require('fs');
const path = require('path');
const { lua, lauxlib, lualib, to_luastring } = require('fengari');

const API = process.env.MILILUA;
const MAIN = process.argv[2];
const FRAMES = Number(process.argv[3] || 36000);

// Build Enum from the API definitions so unknown enum names fail loudly.
const enumSrc = fs.readFileSync(path.join(API, 'enums/Enum.d.lua'), 'utf8');
let enumLua = 'Enum = {}\n';
let cur = null;
for (const line of enumSrc.split('\n')) {
  const c = line.match(/^---@class Enum\.(\w+)/);
  if (c) { cur = c[1]; enumLua += `Enum.${cur} = strict("Enum.${cur}", {})\n`; continue; }
  const f = line.match(/^---@field (\w+) EnumItem\./);
  if (f && cur) enumLua += `rawset(Enum.${cur}, "${f[1]}", "${cur}.${f[1]}")\n`;
}

// EN=1 plays in English: the CSV's English column stands in for the game's Script Text Variables.
let enText = 'EN_TEXT = {}\n';
if (process.env.EN) {
  const csv = fs.readFileSync(path.join(__dirname, '../translation-lua.csv'), 'utf8').replace(/^﻿/, '');
  const cells = (row) => [...row.matchAll(/("(?:[^"]|"")*"|[^,]*)(,|$)/g)].map((m) => m[1].replace(/^"|"$/g, '').replace(/""/g, '"')).slice(0, 4);
  for (const row of csv.split(/\r?\n/).slice(1).filter(Boolean)) {
    const [id, , , en] = cells(row);
    enText += `EN_TEXT[${JSON.stringify(id)}] = ${JSON.stringify(en)}\n`;
  }
}
const harness = `${enText}EN_TEXT_N = ${process.env.EN ? "true" : "false"}
OFFLINE = ${process.env.OFFLINE ? "true" : "false"}
TRACE = ${process.env.TRACE ? "true" : "false"}

function strict(name, t)
  return setmetatable(t, { __index = function(_, k) error("unknown member " .. name .. "." .. tostring(k), 2) end })
end
${enumLua}
local function num(v, what) if type(v) ~= "number" or v ~= v or v == math.huge or v == -math.huge then error("bad number for " .. what .. ": " .. tostring(v), 3) end end
-- A plain table like the MiliUI Playground's: calling Color(...) directly fails there.
Color = strict("Color", {
  FromRGBA = function(r, g, b, a)
    for _, v in ipairs({r, g, b, a}) do num(v, "Color"); if v < 0 or v > 255 then error("Color out of range " .. v, 2) end end
    return { r = r, g = g, b = b, a = a }
  end,
})
function printerr(...) io.write("[printerr] ", table.concat({...}, " "), "\\n") end
function print(...) end

local BASE_FIELDS = { alive=1, id=1, prefabIndex=1, active=1, activeInHierarchy=1, visible=1, name=1, parent=1,
  anchoredPositionX=1, anchoredPositionY=1, sizeDeltaX=1, sizeDeltaY=1, anchorMinX=1, anchorMinY=1, anchorMaxX=1, anchorMaxY=1,
  pivotX=1, pivotY=1, localScaleX=1, localScaleY=1, localScaleZ=1, localRotationX=1, localRotationY=1, localRotationZ=1, canControllerFocus=1 }
local TYPE_FIELDS = {
  Container = { isolateNavigation=1, disableKeyEventPassthrough=1, disableCursorEventPassthrough=1, showCursor=1 },
  Image = { imageSource=1, imageId=1, imageColor=1, imageType=1, enableMask=1, enableSoftEdge=1, fillAmount=1, fillType=1 },
  TextBox = { text=1, fontSize=1, fontColor=1, bgColor=1, enableOutline=1, outlineColor=1, horizontalAlignment=1, verticalAlignment=1, adaptiveFontSize=1, minimumFontSize=1 },
  Cursor = { raycastTarget=1 },
  KeyHint = { keyboardKeyCode=1, controllerKeyCode=1 },
}
local nextId = 1000
CALLS = 0
local methods = {}
function methods.SetAnchorMin(o, x, y) num(x, "SetAnchorMin"); num(y, "SetAnchorMin") end
function methods.SetAnchorMax(o, x, y) num(x, "SetAnchorMax"); num(y, "SetAnchorMax") end
function methods.SetPivot(o, x, y) num(x, "SetPivot"); num(y, "SetPivot") end
function methods.SetSizeDelta(o, x, y) num(x, "SetSizeDelta"); num(y, "SetSizeDelta"); rawset(o, "_w", x); rawset(o, "_h", y) end
function methods.SetAnchoredPosition(o, x, y) num(x, "SetAnchoredPosition"); num(y, "SetAnchoredPosition"); rawset(o, "_x", x); rawset(o, "_y", y) end
function methods.SetLocalRotation(o, x, y, z) num(x, "rot"); num(y, "rot"); num(z, "rot") end
function methods.SetLocalScale(o, x, y, z) num(x, "scale"); num(y, "scale"); num(z, "scale") end
function methods.SetVisible(o, v) assert(type(v) == "boolean", "SetVisible bool"); rawset(o, "_vis", v) end
function methods.SetActive(o, v) assert(type(v) == "boolean") end
function methods.SetAsLastSibling(o) end
function methods.SetAsFirstSibling(o) end
function methods.FindChild(o, p) return o._children[p] end
function methods.GetChild(o, p) return o._children[p] end
function methods.GetChildren(o) return {} end
function methods.AddKeyEventListener(o, t, cb) assert(type(t) == "string", "key enum"); assert(type(cb) == "function"); KEYS[t] = cb end
function methods.RemoveAllKeyEventListeners(o) end
local IMG = { SetFillRadial360 = function(o, t, a) assert(type(t) == "string" and t:find("^ImageFillRadialType"), "radial enum"); num(a, "fill") end,
  SetImage = function(o, src, id)
    assert(src == "ImageSource.StaticReference", "image source " .. tostring(src))
    assert(KNOWN_IMG[id], "unknown image id " .. tostring(id)); IMGIDS[id] = (IMGIDS[id] or 0) + 1
  end, SetFillUnused = function() end }
local CUR = { AddCursorEventListener = function(o, t, cb) assert(type(t) == "string" and t:find("^CursorEventType")); CURSOR[t] = cb end,
  RemoveAllCursorEventListeners = function() end }
function newControl(kind, name)
  nextId = nextId + 1
  local o = { _kind = kind, _children = {}, _vis = true, alive = true, id = nextId, name = name or kind }
  return setmetatable(o, {
    __index = function(t, k)
      if methods[k] then CALLS = CALLS + 1; return methods[k] end
      if kind == "Image" and IMG[k] then CALLS = CALLS + 1; return IMG[k] end
      if kind == "Cursor" and CUR[k] then CALLS = CALLS + 1; return CUR[k] end
      if BASE_FIELDS[k] or (TYPE_FIELDS[kind] and TYPE_FIELDS[kind][k]) then return rawget(t, "_f_" .. k) end
      error("unknown member " .. kind .. "." .. tostring(k), 2)
    end,
    __newindex = function(t, k, v)
      if not (BASE_FIELDS[k] or (TYPE_FIELDS[kind] and TYPE_FIELDS[kind][k])) then error("cannot set " .. kind .. "." .. tostring(k), 2) end
      if k == "fontSize" then num(v, "fontSize"); assert(math.type(v) == "integer", "fontSize must be integer") end
      if k == "text" then assert(type(v) == "string", "text must be string"); SHOWN[v] = true end
      if k == "controllerKeyCode" then
        assert(type(v) == "string" and v:find("^ControllerKeyCode%."), "controller key enum")
        HINT_KEYS[v] = true
      end
      if k == "keyboardKeyCode" then assert(v == "KeyboardKeyCode.None", "controller hints must not show keyboard keys") end
      CALLS = CALLS + 1
      rawset(t, "_f_" .. k, v)
    end })
end
KEYS, CURSOR, SHOWN = {}, {}, {}
IMGIDS = {}
HINT_KEYS = {}
KNOWN_IMG = { [104002] = 1, [103001] = 1, [103002] = 1, [103003] = 1, [103004] = 1, [103005] = 1, [103006] = 1, [103007] = 1 }
local TPLS = { [101] = "Image", [102] = "Image", [103] = "Image", [104] = "TextBox", [105] = "Container", [106] = "KeyHint" }
INSTANCES = 0
local root = newControl("Container", "Root")
root._children.Input = newControl("Cursor", "Input")
VARS = {}
SIGNALS = {}
DEVICE = "Device.KeyboardAndMouse"
STICK = { 0, 0 }
game = strict("game", {
  GetUICanvasSize = function() return 1920, 1080 end,
  InstantiateClientUIControl = function(tpl, parent)
    assert(TPLS[tpl], "unknown template " .. tostring(tpl)); assert(parent, "parent required")
    INSTANCES = INSTANCES + 1
    return newControl(TPLS[tpl])
  end,
  DestroyClientUIControl = function() end,
  GetGlobalCustomVariableValue = function(e, n) assert(e == "CustomVariableEntityType.PlayerSelf"); return VARS[n] end,
  ServerSignal = function(name)
    local sig = { name = name, params = {} }
    return setmetatable({}, { __index = {
      AddInt = function(_, v) num(v, "AddInt"); assert(math.type(v) == "integer", "AddInt integer"); table.insert(sig.params, v) end,
      AddIntList = function(_, l) for i, v in ipairs(l) do num(v, "AddIntList"); assert(math.type(v) == "integer", "list int " .. i) end; table.insert(sig.params, l) end,
      SendSignal = function() table.insert(SIGNALS, sig) end } })
  end,
  PlayAudio2D = function(id) num(id, "audio"); AUDIO = (AUDIO or 0) + 1; return 1 end,
  -- like the game: the ID itself when no Script Text Variable exists
  GetText = function(id) assert(type(id) == "string", "GetText id"); TEXT_CALLS = (TEXT_CALLS or 0) + 1; return EN_TEXT[id] or id end,
  GetDevice = function() return DEVICE end,
  GetControllerLeftStickAxis = function() return STICK[1], STICK[2] end,
})
local params = { TPL_DOT = 101, TPL_RING = 102, TPL_RECT = 103, TPL_TEXT = 104, TPL_GROUP = 105, TPL_BTN = 106, SFX_DASH = 7, SFX_KILL1 = 8, SFX_KILL3 = 9 }
HANDLERS = {}
script = setmetatable({ object = root }, { __index = {
  GetParam = function(_, n) return params[n] end,
  EnableUpdate = function(_, v) UPDATE = v end,
  RegisterCustomVariableChangedHandler = function(_, e, n, cb) HANDLERS[n] = cb end,
  UnregisterCustomVariableChangedHandler = function() end,
} })
`;

const driver = `
local function upval(fn, name, seen)
  seen = seen or {}
  if seen[fn] then return nil end
  seen[fn] = true
  for i = 1, 200 do
    local n, v = debug.getupvalue(fn, i)
    if not n then break end
    if n == name then return v, fn, i end
    if type(v) == "function" then local r, f, j = upval(v, name, seen); if f then return r, f, j end end
  end
end
local function get(name) local v = upval(OnUpdate, name); return v end

-- server: not ready at start, becomes ready on frame 30
VARS.iss_ready = 0
OnStart()
assert(UPDATE == true, "EnableUpdate not called")
-- Level changes affect only the next run; elapsed play time still starts at zero.
do
  local save, makeRun = get("save"), get("newRun")
  local xp = save.xp
  for _, case in ipairs({ { 0, 0 }, { 120, 0.5 }, { 480, 1.5 }, { 100000, 10 } }) do
    save.xp = case[1]
    local r = makeRun()
    assert(r.time == 0 and r.difficultyTime == case[2], "incorrect level difficulty offset")
  end
  save.xp = xp
  local spawn, r, enemies = get("spawnEnemy"), get("run"), get("E")
  local originalTime, n = r.difficultyTime, #enemies
  local function speedAt(t)
    r.difficultyTime = t
    math.randomseed(1234)
    spawn("ring", -100, -100)
    local speed = enemies[#enemies].spd
    table.remove(enemies)
    return speed
  end
  local s120, s300, s600 = speedAt(120), speedAt(300), speedAt(600)
  assert(s300 > s120 and s300 == s600, "enemy speed must increase until 300 seconds and then stop")
  assert(#enemies == n, "difficulty test left enemies behind")
  r.difficultyTime = originalTime
end
local overN = 0
local stats = { states = {}, runs = 0, maxScore = 0, maxCombo = 0, kills = 0, padDashes = 0 }
local lastState
local frames = ${FRAMES}
local tclick = 0
local titleN, pauses, abandons, pausedFrames, elemSeen = 0, 0, 0, 0, {}
local function tapRect(r, what)
  if not r then error("button not on screen: " .. what .. " state=" .. tostring(get("state")) .. " paused=" .. tostring(get("paused"))) end
  CURSOR["CursorEventType.CursorDown"]({ GetUIPos = function() return r.x + r.w / 2, r.y + r.h / 2 end })
end
for f = 1, frames do
  if f == 30 and not OFFLINE then
    VARS.iss_save = { 1, 120, 9200, 10, 2, 5, 0, 2, 20380, 0, 20380, 0, 0, 0, 0, 0, 0 }
    VARS.iss_now = 1760000000 + 86400 * 2
    VARS.iss_tz = 8
    VARS.iss_ready = 1
    HANDLERS.iss_ready("CustomVariableEntityType.PlayerSelf", "iss_ready")
  end
  -- alternate input devices every ~40s of play
  local pad = (f // 2400) % 3 == 2
  DEVICE = pad and "Device.Controller" or "Device.KeyboardAndMouse"
  local state = get("state")
  if state ~= lastState then stats.states[state] = (stats.states[state] or 0) + 1; lastState = state; if state == "over" then overN = overN + 1 end
    if state == "title" then
      titleN = titleN + 1
      KEYS["KeyEventType.ControllerSprintKeyDown"]() -- next unlocked element
      if titleN == 3 then KEYS["KeyEventType.ControllerNormalAttackKeyDown"](); KEYS["KeyEventType.ControllerNormalAttackKeyDown"]() end -- leave
      if titleN == 4 then KEYS["KeyEventType.ControllerNormalAttackKeyDown"]() end -- arm only, let it lapse
    end
  end
  if #get("EFX") > 0 or #get("BOLTS") > 0 then elemSeen[get("save").color] = true end
  if get("paused") then pausedFrames = pausedFrames + 1 end
  if TRACE and get("paused") ~= LASTP then LASTP = get("paused"); io.write("f=" .. f .. " paused=" .. tostring(LASTP) .. " state=" .. state .. " pad=" .. tostring(pad) .. "\\n") end
  -- a dash aimed at the top-right corner can land on the 中断 button: resume like a player would
  if get("paused") and f % 1500 > 800 then tapRect(get("UI").resume, "resume"); ACCIDENTAL = (ACCIDENTAL or 0) + 1 end
  if state == "play" and f % 1500 == 700 and not get("paused") then
    pauses = pauses + 1
    if pad then KEYS["KeyEventType.ControllerNormalAttackKeyDown"]() else tapRect(get("UI").pause, "pause") end
  end
  if state == "play" and f % 1500 == 760 and get("paused") then
    if (f // 1500) % 3 == 0 then
      abandons = abandons + 1
      if pad then KEYS["KeyEventType.ControllerNormalAttackKeyDown"]() else tapRect(get("UI").quitRun, "quitRun") end
    elseif pad then KEYS["KeyEventType.ControllerJumpKeyDown"]() else tapRect(get("UI").resume, "resume") end
  end
  tclick = tclick + 1
  if tclick >= 9 then
    tclick = 0
    local P, E = get("P"), get("E")
    if state == "title" then
      local sr = get("startRing")
      if pad then
        STICK = { 0, 0 }; KEYS["KeyEventType.ControllerJumpKeyDown"]()
      else CURSOR["CursorEventType.CursorDown"]({ GetUIPos = function() return sr.x, sr.y end }) end
    elseif state == "play" and P and not get("paused") then
      local best, bd = nil, 1e9
      for _, e in ipairs(E or {}) do
        local d = math.sqrt((e.x - P.x) ^ 2 + (e.y - P.y) ^ 2)
        if e.x > 0 and e.x < 1920 and e.y > 0 and e.y < 1080 and d < bd then best, bd = e, d end
      end
      if best then
        local dx, dy = best.x - P.x, best.y - P.y
        local L = math.max(bd, 1)
        if pad then
          STICK = { dx / L, dy / L }
          stats.padDashes = stats.padDashes + 1
          KEYS["KeyEventType.ControllerJumpKeyDown"]()
        else
          CURSOR["CursorEventType.CursorDown"]({ GetUIPos = function() return P.x + dx / L * (L + 40), P.y + dy / L * (L + 40) end })
        end
      end
    elseif state == "over" then
      local r = get("run")
      if r then stats.runs = stats.runs + 1; stats.maxScore = math.max(stats.maxScore, r.score); stats.maxCombo = math.max(stats.maxCombo, r.maxCombo); stats.kills = stats.kills + r.kills end
      if overN % 4 == 3 then KEYS["KeyEventType.ControllerNormalAttackKeyDown"]()
      else CURSOR["CursorEventType.CursorDown"]({ GetUIPos = function() return 960, 600 end }) end
    end
  end
  if f % 3000 == 1500 then KEYS["KeyEventType.ControllerSprintKeyDown"](); KEYS["KeyEventType.ControllerInteractKeyDown"](); KEYS["KeyEventType.ControllerInteractKeyDown"]() end
  OnUpdate(1 / 60)
end
local sigCount = {}
if frames >= 1000 then
  assert(HINT_KEYS["ControllerKeyCode.JumpKey"], "missing confirm/slash hint")
  assert(HINT_KEYS["ControllerKeyCode.NormalAttackKey"], "missing back/pause hint")
  for s in pairs(SHOWN) do
    assert(not s:find("^A ") and not s:find("^B ") and not s:find("RB "), "hard-coded controller symbol: " .. s)
  end
end
for _, s in ipairs(SIGNALS) do sigCount[s.name] = (sigCount[s.name] or 0) + 1 end
local st = {}
for k, v in pairs(stats.states) do st[#st + 1] = k .. "=" .. v end
local save = get("save")
local last = SIGNALS[#SIGNALS]
io.write(string.format("frames=%d instances=%d calls=%d audio=%d\\n", frames, INSTANCES, CALLS, AUDIO or 0))
io.write("state entries: " .. table.concat(st, " ") .. "\\n")
io.write(string.format("runs=%d maxScore=%d maxCombo=%d kills=%d padDashes=%d\\n", stats.runs, stats.maxScore, stats.maxCombo, stats.kills, stats.padDashes))
io.write(string.format("signals: issen_save=%d issen_run=%d issen_exit=%d\\n", sigCount.issen_save or 0, sigCount.issen_run or 0, sigCount.issen_exit or 0))
io.write(string.format("pauses=%d abandons=%d pausedFrames=%d titles=%d\\n", pauses, abandons, pausedFrames, titleN))
local es = {}
for c in pairs(elemSeen) do es[#es + 1] = c end
table.sort(es)
io.write("element colors with effects: " .. table.concat(es, ",") .. "\\n")
local ids = {}
for id, n in pairs(IMGIDS) do ids[#ids + 1] = id .. "x" .. n end
table.sort(ids)
io.write("SetImage: " .. table.concat(ids, " ") .. "\\n")
io.write(string.format("save: best=%d xp=%d runs=%d streak=%d lastDay=%d color=%d mute=%s mDay=%d mp=%d,%d,%d md=%d,%d,%d\\n",
  save.best, save.xp, save.runs, save.streak, save.lastDay, save.color, tostring(save.mute), save.mDay, save.mp[1], save.mp[2], save.mp[3], save.md[1], save.md[2], save.md[3]))
local jp, nShown = {}, 0
for s in pairs(SHOWN) do
  nShown = nShown + 1
  if s:find("[\\227-\\233]") then jp[#jp + 1] = s end -- UTF-8 lead bytes of kana and kanji
end
table.sort(jp)
io.write(string.format("distinct texts shown=%d, with Japanese=%d, GetText calls=%d\\n", nShown, #jp, TEXT_CALLS or 0))
if EN_TEXT_N then io.write("  " .. table.concat(jp, " / ") .. "\\n") end
local ms = get("missions")
for i, m in ipairs(ms) do io.write("mission " .. i .. ": " .. m.text .. "\\n") end

-- Leaderboard submissions follow personal-best updates, including ties and offline play.
do
  local save, r, finish = get("save"), get("run"), get("finishRun")
  for _, case in ipairs({ { 0, 0 }, { 120, 119 }, { 120, 120 }, { 120, 121 }, { 121, 120 }, { 121, 122 } }) do
    save.best, r.score = case[1], case[2]
    local first, count = #SIGNALS + 1, 0
    finish()
    for i = first, #SIGNALS do
      local s = SIGNALS[i]
      if s.name == "issen_best" then
        count = count + 1
        assert(#s.params == 1 and s.params[1] == case[2], "incorrect leaderboard score")
      end
    end
    local improved = case[2] > case[1] and case[2] > 0
    assert(save.best == math.max(case[1], case[2]), "incorrect personal best")
    assert(count == ((improved and get("online")) and 1 or 0), "incorrect leaderboard submission count")
  end
  io.write("leaderboard: zero, lower, tie, new best, and repeated runs passed\\n")
end

-- Lifetime close calls survive saves and accumulate across completed runs.
do
  local save, r, finish = get("save"), get("run"), get("finishRun")
  local pack, unpack = get("packSave"), upval(OnStart, "unpackSave")
  local old = { 1, 120, 9200, 10, 2, 5, 0, 2, 20380, 0, 20380, 0, 0, 0, 0, 0, 0, 2 }
  assert(unpack(old).closeCalls == 0 and unpack(old).best == 120, "legacy save migration failed")
  old[19] = 0
  assert(unpack(old).closeCalls == 0, "reserved zero slot migration failed")
  save.closeCalls = 0
  local total = 0
  for _, count in ipairs({ 60, 39, 1, 0, 5 }) do
    r.close = count
    local first = #SIGNALS + 1
    finish()
    total = total + count
    assert(save.closeCalls == total, "close calls did not accumulate")
    local packed = pack()
    assert(#packed == 24 and packed[19] == total, "incorrect close-call save slot")
    assert(unpack(packed).closeCalls == total, "close-call save round trip failed")
    local runs = 0
    for i = first, #SIGNALS do
      local s = SIGNALS[i]
      if s.name == "issen_run" then
        runs = runs + 1
        assert(#s.params == 7 and s.params[6] == save.kills and s.params[7] == total, "incorrect achievement payload")
      end
    end
    assert(runs == (get("online") and 1 or 0), "incorrect achievement submission count")
  end
  io.write("achievements: legacy saves, cumulative close calls at 99/100/105, and payload passed\\n")
end
`;

const L = lauxlib.luaL_newstate();
lualib.luaL_openlibs(L);
function run(code, name) {
  if (lauxlib.luaL_loadbuffer(L, to_luastring(code), null, to_luastring(name)) !== 0 || lua.lua_pcall(L, 0, 0, 0) !== 0) {
    const msg = lua.lua_tojsstring(L, -1);
    console.error(`ERROR in ${name}: ${msg}`);
    process.exit(1);
  }
}
run(harness, 'harness');
// The game's runtime adds locals of its own to the script's main chunk (Main.lua hit
// "too many local variables" in-game at ~160 of its own), so reserve 50 here. Same line numbers.
const RESERVED = 'local ' + Array.from({ length: 50 }, (_, i) => '_reserved' + i).join(', ') + '; ';
run(RESERVED + fs.readFileSync(MAIN, 'utf8'), '@Main.lua');
const t0 = Date.now();
run(driver, 'driver');
console.log(`ok in ${Date.now() - t0} ms`);
