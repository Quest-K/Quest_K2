import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
  // 깃허브 저장소 이름인 /Quest_K/를 base로 설정하여 에셋 경로를 맞춥니다.
  base: '/Quest_K/', 
  build: {
    // 빌드 결과물이 생성될 폴더 이름입니다.
    outDir: 'dist',
    // 에셋(JS, CSS)들이 들어갈 폴더 이름입니다.
    assetsDir: 'assets',
    // 배포 시 구형 브라우저 대응을 위한 타겟 설정입니다.
    target: 'esnext',
  },
  server: {
    host: '0.0.0.0',
    port: 3001,
    strictPort: true,
  }
})
