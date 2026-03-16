import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
  // 리포지토리 이름이 Quest_K 이므로 앞뒤에 /를 붙여 정확히 입력합니다.
  base: '/Quest_K/', 
  build: {
    outDir: 'dist',
  },
  server: {
    host: '0.0.0.0',
    port: 3001,
    strictPort: true,
  }
})
