// @gsts:signals

import { defineSignal } from 'genshin-ts/runtime/core'

export const Signal = {
  "issen_exit": defineSignal("issen_exit", [
  ]),
  "issen_run": defineSignal("issen_run", [
    ["score", "int"],
    ["best", "int"],
    ["maxCombo", "int"],
    ["maxStreak", "int"],
    ["level", "int"],
    ["kills", "int"],
  ]),
  "issen_save": defineSignal("issen_save", [
    ["v", "int_list"],
  ]),
} as const
