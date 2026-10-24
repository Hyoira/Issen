// Builds miliastra/translation-lua.csv for Manage Multi-language Text > Script Text Variables.
// Japanese comes from SOURCES in lua/Issen/Main.lua (the source language); English is below.
// Usage: node tools/make-translation-csv.js   (run from miliastra/)
const fs = require('fs');
const path = require('path');

const EN = {
  'action.slash': 'Slash',
  'action.aim': 'L-stick to aim',
  'action.color': 'Element',
  'action.sound': 'Sound',
  'action.again': 'Play again',
  'color.ink': 'Ink',
  'element.pyro': 'Pyro',
  'element.hydro': 'Hydro',
  'element.cryo': 'Cryo',
  'element.electro': 'Electro',
  'element.anemo': 'Anemo',
  'element.geo': 'Geo',
  'element.dendro': 'Dendro',
  'elementColor': '%s',
  'mission.score': 'Score %s in one run',
  'mission.combo': 'Reach a %s combo',
  'mission.multi': 'Slash %s in one dash',
  'mission.chain': 'Blast %s with chain explosions in one run',
  'mission.close': '%s close calls in one run',
  'mission.kills': 'Slash %s today',
  'mission.runs': 'Play %s runs today',
  'missionDone': 'Mission complete  %s',
  'multiSlash': '%s SLASH',
  'closeCall': 'Close call',
  'startRing': 'Slash to start',
  'tagline': 'Slash through to wherever you tap',
  'soundOn': 'Sound ON',
  'soundOff': 'Sound OFF',
  'pause': 'Pause',
  'paused': 'Paused',
  'pausedNote': 'Going back to the title discards this run',
  'resume': 'Resume',
  'resumePad': 'A  Resume',
  'toTitle': 'Title',
  'toTitlePad': 'B  Title',
  'firstHint': 'Tap anywhere to slash through to it',
  'firstHintPad': 'Aim with the stick, press A to slash through',
  'whiffHint': 'A miss breaks your combo and stalls you for a moment',
  'done': 'Done',
  'streakToday': '%s-day streak',
  'streakKeep': 'Play today for a %s-day streak',
  'streakRestart': 'Start a new streak today',
  'resetIn': 'Resets in %s',
  'todaysMissions': "Today's missions",
  'exitStage': 'Leave stage',
  'exitConfirm': 'Press again to leave',
  'exiting': 'Leaving the stage',
  'exitFailed': "Couldn't leave the stage",
  'unlockAt': 'Unlocks at Lv %s',
  'newBest': 'New best  +%s',
  'firstRecord': 'First score',
  'toBest': '%s points to your best',
  'statCombo': 'Max combo',
  'statKills': 'Slashed',
  'statMulti': 'Best multi-slash',
  'streakBonus': '%s-day streak ×%s',
  'allDailies': 'All dailies done +%s',
  'gotElement': 'Unlocked the %s color',
  'nextElement': 'Next: %s in %s XP',
  'again': 'Tap to play again',
  'againPad': 'A  Play again',
  'hintTitle': 'A Slash   RB Element   X Sound   B Leave stage',
  'hintPlay': 'L-stick Aim   A Slash   B Pause',
  'hintPaused': 'A Resume   B Title',
  'loading': 'Loading',
};

const root = path.join(__dirname, '..');
const lua = fs.readFileSync(path.join(root, 'lua/Issen/Main.lua'), 'utf8');
const block = lua.slice(lua.indexOf('local SOURCES = {'), lua.indexOf('-- END TRANSLATIONS'));
const sources = [...block.matchAll(/\["([^"]+)"\] = "((?:[^"\\]|\\.)*)"/g)].map((m) => [m[1], m[2]]);

const count = (s) => (s.match(/%s/g) || []).length;
const errors = [];
for (const [key, ja] of sources) {
  if (!(key in EN)) errors.push(`no English for ${key}`);
  else if (count(EN[key]) !== count(ja)) errors.push(`%s count differs for ${key}`);
}
for (const key of Object.keys(EN)) if (!sources.some(([k]) => k === key)) errors.push(`English for unknown key ${key}`);
if (errors.length) { console.error(errors.join('\n')); process.exit(1); }

const cell = (v) => (/[",\n]/.test(v) ? `"${v.replace(/"/g, '""')}"` : v);
const rows = [['テキストマッピングID', '翻訳が必要かどうか', '日本語', '英語']];
for (const [key, ja] of sources) rows.push([`issen.${key}`, 'TRUE', ja, EN[key]]);
const out = path.join(root, 'translation-lua.csv');
fs.writeFileSync(out, '﻿' + rows.map((r) => r.map(cell).join(',')).join('\r\n') + '\r\n');
console.log(`wrote ${sources.length} rows to ${out}`);
