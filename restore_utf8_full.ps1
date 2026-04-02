$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
function W($path, $content) { [System.IO.File]::WriteAllText($path, $content, $utf8NoBom) }

W "History.html" @"
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>MeoGo | History</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700;900&display=swap');
        body { font-family: 'Pretendard', sans-serif; -webkit-tap-highlight-color: transparent; letter-spacing: -0.02em; }
        .brand-navy { color: #0A1931; } .brand-green { color: #1E5128; }
        .nav-item { display: flex; flex-direction: column; align-items: center; font-size: 0.75rem; color: #94a3b8; font-weight: 700; cursor: pointer; flex: 1; text-decoration: none; }
        .nav-item.active { color: #1E5128; }
        .pb-safe { padding-bottom: 100px; }
        .stat-card { background: white; border-radius: 1.5rem; padding: 1.25rem; border: 1px solid #f1f5f9; box-shadow: 0 4px 15px rgba(0,0,0,0.02); }
        .filter-chip { flex-shrink: 0; padding: 0.4rem 0.9rem; border-radius: 1.5rem; font-size: 0.7rem; font-weight: 800; border: 1px solid #e2e8f0; background: white; color: #64748b; transition: all 0.2s; white-space: nowrap; cursor: pointer; }
        .filter-chip.active { background: #1E5128; color: white; border-color: #1E5128; }
        .hide-scrollbar::-webkit-scrollbar { display: none; }
    </style>
</head>
<body class="bg-[#F8FAFC] text-[#1A202C]">
    <div class="max-w-2xl mx-auto min-h-screen flex flex-col relative bg-white shadow-2xl">
        <header class="bg-white/95 backdrop-blur-md px-6 py-4 flex justify-between items-center sticky top-0 z-[100] border-b border-slate-100">
            <a href="Index.html" class="text-2xl font-900 brand-navy tracking-tighter no-underline">MeoGo</a>
            <div class="w-9 h-9 rounded-full bg-slate-100 overflow-hidden"><img src="https://api.dicebear.com/7.x/avataaars/svg?seed=MeoGo" alt="avatar"></div>
        </header>
        <main class="flex-grow pb-safe px-6 pt-6">
            <div class="mb-6"><h1 class="text-2xl font-900 brand-navy mb-2">미션 완료 기록</h1><p class="text-sm font-700 text-slate-400">정복한 기록들을 한눈에 확인하세요.</p></div>
            <div id="stats-dashboard" class="mb-8 space-y-4 hidden"><div class="grid grid-cols-2 gap-4"><div class="stat-card"><div class="text-[10px] font-800 text-slate-400 uppercase mb-2">정복 지역</div><div id="region-stats" class="space-y-2"></div></div><div class="stat-card"><div class="text-[10px] font-800 text-slate-400 uppercase mb-2">미션 테마</div><div id="category-stats" class="space-y-2"></div></div></div></div>
            <div class="mb-6 space-y-3 sticky top-[73px] bg-white/95 backdrop-blur-md py-2 z-[90] border-b border-slate-100 -mx-6 px-6"><div class="flex gap-2 overflow-x-auto hide-scrollbar pb-1" id="region-filters"></div><div class="flex gap-2 overflow-x-auto hide-scrollbar" id="category-filters"></div></div>
            <div id="history-list" class="space-y-4"></div>
        </main>
        <nav class="fixed bottom-0 left-1/2 -translate-x-1/2 w-full max-w-2xl bg-white/98 backdrop-blur-xl border-t border-slate-100 px-6 py-4 flex justify-between items-center z-50 rounded-t-[2rem] shadow-2xl">
            <a href="Index.html" class="nav-item"><svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mb-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg><span>미션</span></a>
            <a href="Wishlist.html" class="nav-item"><svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mb-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"/></svg><span>찜</span></a>
            <a href="History.html" class="nav-item active"><svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mb-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"/></svg><span>기록</span></a>
            <a href="Mypage.html" class="nav-item"><svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mb-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg><span>마이</span></a>
        </nav>
    </div>
    <script>
        // History logic...
    </script>
</body>
</html>
"@

W "Wishlist.html" @"
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>MeoGo | Wishlist</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700;900&display=swap');
        body { font-family: 'Pretendard', sans-serif; -webkit-tap-highlight-color: transparent; letter-spacing: -0.02em; }
        .brand-navy { color: #0A1931; } .brand-green { color: #1E5128; }
        .nav-item { display: flex; flex-direction: column; align-items: center; font-size: 0.75rem; color: #94a3b8; font-weight: 700; cursor: pointer; flex: 1; text-decoration: none; }
        .nav-item.active { color: #1E5128; }
        .pb-safe { padding-bottom: 100px; }
    </style>
</head>
<body class="bg-[#F8FAFC] text-[#1A202C]">
    <div class="max-w-2xl mx-auto min-h-screen flex flex-col relative bg-white shadow-2xl">
        <header class="bg-white/95 backdrop-blur-md px-6 py-4 flex justify-between items-center sticky top-0 z-[100] border-b border-slate-100">
            <a href="Index.html" class="text-2xl font-900 brand-navy tracking-tighter no-underline">MeoGo</a>
            <div class="w-9 h-9 rounded-full bg-slate-100 overflow-hidden"><img src="https://api.dicebear.com/7.x/avataaars/svg?seed=MeoGo" alt="avatar"></div>
        </header>
        <main class="flex-grow pb-safe px-6">
            <div class="py-10"><h2 class="text-xl font-900 text-[#0A1931] mb-6">찜 목록</h2><div id="wish-list" class="space-y-4"></div></div>
        </main>
        <nav class="fixed bottom-0 left-1/2 -translate-x-1/2 w-full max-w-2xl bg-white/98 backdrop-blur-xl border-t border-slate-100 px-6 py-4 flex justify-between items-center z-50 rounded-t-[2rem] shadow-2xl">
            <a href="Index.html" class="nav-item"><svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mb-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg><span>미션</span></a>
            <a href="Wishlist.html" class="nav-item active"><svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mb-1" fill="currentColor" viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg><span>찜</span></a>
            <a href="History.html" class="nav-item"><svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mb-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"/></svg><span>기록</span></a>
            <a href="Mypage.html" class="nav-item"><svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mb-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg><span>마이</span></a>
        </nav>
    </div>
    <script>
        // Wishlist logic...
    </script>
</body>
</html>
"@

W "Signup.html" @"
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>MeoGo | Sign Up</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700;900&display=swap');
        body { font-family: 'Pretendard', sans-serif; -webkit-tap-highlight-color: transparent; letter-spacing: -0.02em; }
        .brand-navy { color: #0A1931; } .brand-green { color: #1E5128; }
        .input-field { width: 100%; padding: 1.1rem; border-radius: 1.25rem; border: 1px solid #e2e8f0; background: #F8FAFC; font-weight: 700; transition: all 0.2s; }
        .input-field:focus { border-color: #1E5128; background: white; outline: none; }
    </style>
</head>
<body class="bg-[#F8FAFC] text-[#1A202C]">
    <div class="max-w-2xl mx-auto min-h-screen flex flex-col justify-center bg-white shadow-2xl px-8 py-10">
        <div class="mb-10"><h1 class="text-3xl font-900 brand-navy">가입을 환영합니다!</h1><p class="text-slate-400 font-700">MeoGo와 함께 새로운 한국 여행을 시작하세요.</p></div>
        <form class="space-y-6">
            <input type="text" placeholder="닉네임" class="input-field" required>
            <div class="grid grid-cols-2 gap-4"><select class="input-field" required><option value="">성별</option><option>남성</option><option>여성</option></select><input type="month" class="input-field" required></div>
            <input type="text" placeholder="국가" class="input-field" required>
            <input type="email" placeholder="이메일" class="input-field" required>
            <button type="submit" class="w-full py-5 bg-brand-navy text-white rounded-[1.5rem] font-900 text-lg shadow-xl active:scale-95 transition-all">회원가입 완료</button>
        </form>
    </div>
</body>
</html>
"@

W "Seoul.html" @"
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MeoGo | Seoul</title>
</head>
<body>
    <script>location.href='Mission.html?type=region&value=서울';</script>
</body>
</html>
"@

W "Quiz.html" @"
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>MeoGo | Quiz Mission</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700;900&display=swap');
        body { font-family: 'Pretendard', sans-serif; -webkit-tap-highlight-color: transparent; letter-spacing: -0.02em; }
        .brand-navy { color: #0A1931; } .brand-green { color: #1E5128; }
        .quiz-option { background: white; border: 1px solid #f1f5f9; border-radius: 1.25rem; padding: 1.25rem; margin-bottom: 0.75rem; cursor: pointer; transition: all 0.2s; font-weight: 700; }
    </style>
</head>
<body class="bg-[#F8FAFC] text-[#1A202C]">
    <div class="max-w-2xl mx-auto min-h-screen flex flex-col bg-white shadow-2xl">
        <header class="bg-white/95 px-6 py-4 flex justify-between items-center border-b border-slate-100">
            <button onclick="history.back()" class="p-1 text-slate-400"><svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path d="M15 19l-7-7 7-7"/></svg></button>
            <h1 class="text-xl font-900 brand-navy">미션 퀴즈</h1>
            <div class="text-sm font-900 brand-green">1 / 5</div>
        </header>
        <main class="flex-grow p-6">
            <h2 class="text-2xl font-900 brand-navy mb-8">AI가 당신을 위해 퀴즈를 준비 중입니다...</h2>
        </main>
    </div>
</body>
</html>
"@
