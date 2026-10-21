import type { GstsConfig } from 'genshin-ts'

const config: GstsConfig = {
  compileRoot: '.',
  entries: ['./src'],
  outDir: './dist',
  // Fill in after creating the stage (see ../SETUP.md, section 10), then `npm run build` injects:
  inject: {
    playerId: 801397766,
    mapId: 1073741834
  }
}

export default config
