/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        primary: '#1A237E',
        secondary: '#D32F2F',
        accent: '#FFD700',
      },
      fontFamily: {
        sans: ['Inter', 'Noto Sans KR', 'sans-serif'],
        display: ['Outfit', 'Noto Sans KR', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
