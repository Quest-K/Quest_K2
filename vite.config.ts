import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  // 깃허브 저장소 이름인 /Quest_K/를 base로 설정하여 에셋 경로를 맞춥니다.
  base: '/Quest_K/',
  build: {
    outDir: 'dist',
    assetsDir: 'assets',
    target: 'esnext',
  },
  server: {
    host: '0.0.0.0',
    port: 3001,
    strictPort: true,
  }
})

