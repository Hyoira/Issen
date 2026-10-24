import { defineSignal, g } from 'genshin-ts/runtime/core'

// Editor-side IDs. Match these to the stage before building (see ../../SETUP.md).
const GRAPH_ID = 1073741826 // node graph attached to the player entity
const LEADERBOARD_BEST = 1n // Leaderboard: best score
const ACH_KILLS = 2n // Achievement progress: lifetime kills
const ACH_COMBO = 3n // Achievement progress: best combo
const ACH_STREAK = 4n // Achievement progress: longest daily streak
const ACH_LEVEL = 5n // Achievement progress: level
const ACH_FIRST_PLAY = 6n // Achievement progress: first completed run
const ACH_CLOSE = 7n // Achievement progress: lifetime close calls (target: 100)

// Sent by the client script (Main.lua) at the end of every run.
// All values only ever go up, so achievements never move backwards.
const Signal = {
  issen_best: defineSignal('issen_best', [['score', 'int']]),
  issen_run: defineSignal('issen_run', [
    ['score', 'int'],
    ['best', 'int'],
    ['maxCombo', 'int'],
    ['maxStreak', 'int'],
    ['level', 'int'],
    ['kills', 'int'],
    ['closeCalls', 'int']
  ]),
  // The title screen's ステージを終了 (after a second press to confirm).
  issen_exit: defineSignal('issen_exit', [])
} as const

g.server({ id: GRAPH_ID, name: 'Issen' })
  // The client derives the day (04:00 reset) and the mission set from these two values.
  .on('whenEntityIsCreated', (_evt, f) => {
    const self = f.getSelfEntity()
    f.setCustomVariable(self, 'iss_tz', f.queryServerTimeZone(), true)
    f.setCustomVariable(self, 'iss_now', f.queryTimestampUtc0(), true)
  })
  .onSignal(Signal.issen_best, (evt, f) => {
    f.setPlayerLeaderboardScoreAsAnInteger([1n], evt.params.score, LEADERBOARD_BEST)
  })
  .onSignal(Signal.issen_run, (evt, f) => {
    const p = evt.params
    const me = player(1)
    f.setAchievementProgressTally(me, ACH_KILLS, p.kills)
    f.setAchievementProgressTally(me, ACH_COMBO, p.maxCombo)
    f.setAchievementProgressTally(me, ACH_STREAK, p.maxStreak)
    f.setAchievementProgressTally(me, ACH_LEVEL, p.level)
    f.setAchievementProgressTally(me, ACH_FIRST_PLAY, 1n)
    f.setAchievementProgressTally(me, ACH_CLOSE, p.closeCalls)
  })
  // Settle Stage ends the stage; leaving it also writes the In-game Save.
  .onSignal(Signal.issen_exit, (_evt, f) => {
    f.settleStage()
  })
