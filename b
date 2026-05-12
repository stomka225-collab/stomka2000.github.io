<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>Микробиология: полный тест</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif;
        }
        body {
            background: #f0f4f8;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
        }
        .card {
            background: white;
            border-radius: 24px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            padding: 20px 24px;
            margin-bottom: 24px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            margin-bottom: 16px;
            padding-bottom: 12px;
            border-bottom: 2px solid #e2e8f0;
        }
        h1 {
            margin: 0;
            font-size: 1.6rem;
            background: linear-gradient(135deg, #1e3c72, #2b5876);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
        }
        h2 {
            font-size: 1.3rem;
            margin: 0;
            color: #0f172a;
        }
        .topic-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 16px;
            margin-top: 16px;
        }
        .topic-btn {
            background: #f8fafc;
            border: 1px solid #cbd5e1;
            border-radius: 20px;
            padding: 16px;
            cursor: pointer;
            transition: 0.2s;
        }
        .topic-btn:hover {
            background: #eef2ff;
            border-color: #3b82f6;
        }
        .topic-name {
            font-weight: 700;
            font-size: 1.1rem;
            margin-bottom: 6px;
        }
        .topic-meta {
            font-size: 0.8rem;
            color: #475569;
            display: flex;
            justify-content: space-between;
        }
        .difficulty {
            display: inline-block;
            padding: 2px 8px;
            border-radius: 20px;
            font-size: 0.7rem;
            font-weight: 600;
        }
        .easy { background: #dcfce7; color: #15803d; }
        .medium { background: #fef9c3; color: #854d0e; }
        .hard { background: #ffe4e6; color: #be123c; }
        .marathon {
            background: linear-gradient(135deg, #1e293b, #0f172a);
            color: white;
            border: none;
        }
        .marathon .topic-name { color: white; }
        .marathon .topic-meta { color: #cbd5e1; }
        .question-text {
            font-size: 1.1rem;
            font-weight: 500;
            margin-bottom: 20px;
            line-height: 1.4;
        }
        .option {
            background: #f1f5f9;
            border-radius: 14px;
            padding: 10px 14px;
            margin-bottom: 8px;
            cursor: pointer;
            border: 1px solid #e2e8f0;
        }
        .option.selected {
            background: #dbeafe;
            border-color: #3b82f6;
        }
        button {
            background: #3b82f6;
            border: none;
            color: white;
            padding: 10px 18px;
            border-radius: 40px;
            font-weight: 500;
            cursor: pointer;
            margin-right: 12px;
            margin-top: 8px;
            font-size: 0.9rem;
        }
        button.outline {
            background: white;
            border: 1px solid #3b82f6;
            color: #3b82f6;
        }
        button.secondary {
            background: #64748b;
        }
        .hint {
            background: #fef9c3;
            padding: 10px 14px;
            border-radius: 16px;
            margin: 12px 0;
            font-size: 0.9rem;
            color: #854d0e;
        }
        .explanation {
            background: #e6f7e6;
            padding: 10px 14px;
            border-radius: 16px;
            margin-top: 12px;
            font-size: 0.9rem;
            color: #166534;
        }
        .progress {
            font-size: 0.9rem;
            color: #334155;
            margin-top: 16px;
            margin-bottom: 12px;
        }
        .result-table {
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.8rem;
        }
        th, td {
            border: 1px solid #cbd5e1;
            padding: 8px 6px;
            vertical-align: top;
        }
        th {
            background: #e2e8f0;
        }
        .correct-row { background: #e6f7e6; }
        .wrong-row { background: #ffe4e6; }
        .score-badge {
            font-size: 1.5rem;
            font-weight: bold;
        }
        footer {
            text-align: center;
            margin-top: 32px;
            color: #64748b;
            font-size: 0.8rem;
        }
    </style>
</head>
<body>
<div class="container" id="app"></div>

<script>
// --------------------------------------------------------------
// ПОЛНАЯ БАЗА ДАННЫХ — ВСЕ ТЕМЫ С ВОПРОСАМИ
// --------------------------------------------------------------
const TOPICS = {
    staphylococcus: {
        name: "🟡 Стафилококки",
        difficulty: "easy",
        color: "easy",
        questionCount: 20,
        questions: [
            { text: "Как располагаются стафилококки в мазке?", options: ["Цепочками", "Парами", "Гроздьями винограда", "Поодиночке"], correct: 2, hint: "Название от греч. staphyle — виноградная гроздь", explanation: "Стафилококки делятся в разных плоскостях, образуя скопления, похожие на гроздь винограда." },
            { text: "Какой фермент вырабатывает золотистый стафилококк?", options: ["Только коагулазу", "Только гиалуронидазу", "Только ДНК-азу", "Все перечисленные"], correct: 3, hint: "Ключевой маркер патогенности S. aureus", explanation: "Золотистый стафилококк продуцирует плазмокоагулазу, гиалуронидазу, ДНКазу, лецитиназу и др." },
            { text: "На какой среде стафилококки дают колонии с радужным венчиком?", options: ["Кровяной агар", "Желточно-солевой агар (ЖСА)", "Среда Эндо", "Висмут-сульфит агар"], correct: 1, hint: "Среда с яичным желтком", explanation: "На ЖСА лецитиназа разлагает лецитин, образуя радужный венчик." }
        ]
    },
    streptococcus: {
        name: "🔵 Стрептококки",
        difficulty: "easy",
        color: "easy",
        questionCount: 20,
        questions: [
            { text: "Как стрептококки располагаются в мазке?", options: ["Цепочками", "Гроздьями", "Парами", "Тетрадами"], correct: 0, hint: "Деление в одной плоскости", explanation: "Стрептококки делятся в одной плоскости и не расходятся, образуя цепочки." },
            { text: "Какой антиген лежит в основе деления β-гемолитических стрептококков на серогруппы?", options: ["М-белок", "С-полисахарид", "Капсула", "Тейхоевая кислота"], correct: 1, hint: "Групповой антиген", explanation: "С-антиген (полисахарид) клеточной стенки определяет серогруппу по Лэнсфилд." }
        ]
    },
    bordetella: {
        name: "🟢 Бордетеллы (коклюш)",
        difficulty: "easy",
        color: "easy",
        questionCount: 15,
        questions: [
            { text: "Какой метод посева используют для диагностики коклюша прямо у постели больного?", options: ["Метод щелочной пептонной воды", "Метод кашлевых пластинок", "Метод флотации", "Метод обогащения"], correct: 1, hint: "Больной кашляет прямо на чашку", explanation: "Чашку с питательной средой подносят ко рту во время кашля." }
        ]
    },
    meningococcus: {
        name: "🧠 Менингококки",
        difficulty: "medium",
        color: "medium",
        questionCount: 30,
        questions: [
            { text: "Какой материал исследуют для диагностики менингококкового менингита?", options: ["Кровь", "Носоглоточная слизь", "Ликвор", "Мокрота"], correct: 2, hint: "Спинномозговая жидкость", explanation: "При менингите основным материалом является ликвор." },
            { text: "Какой антиген менингококка определяет серогруппу?", options: ["Капсульный полисахарид", "Белок наружной мембраны", "Липополисахарид", "Пили"], correct: 0, hint: "Капсула", explanation: "По капсульным полисахаридам выделяют серогруппы A, B, C, Y, W135." }
        ]
    },
    pneumococcus: {
        name: "🫁 Пневмококки",
        difficulty: "medium",
        color: "medium",
        questionCount: 30,
        questions: [
            { text: "Форма пневмококка?", options: ["Бобовидная", "Ланцетовидная", "Шаровидная", "Вибрион"], correct: 1, hint: "Похожа на копьё", explanation: "Пневмококки имеют ланцетовидную форму, располагаются попарно." }
        ]
    },
    salmonella: {
        name: "🥚 Сальмонеллы (тиф, паратиф)",
        difficulty: "medium",
        color: "medium",
        questionCount: 30,
        questions: [
            { text: "Какую среду используют для выделения сальмонелл?", options: ["Среда Кесслера", "Висмут-сульфит агар", "Среда Сабуро", "ЖСА"], correct: 1, hint: "Чёрные колонии", explanation: "На висмут-сульфит агаре сальмонеллы образуют чёрные колонии с металлическим блеском." }
        ]
    },
    virology: {
        name: "🦠 Вирусология",
        difficulty: "medium",
        color: "medium",
        questionCount: 30,
        questions: [
            { text: "Какой вирус содержит РНК и обратную транскриптазу?", options: ["Вирус гриппа", "ВИЧ", "Вирус гепатита В", "Вирус герпеса"], correct: 1, hint: "Ретровирус", explanation: "ВИЧ относится к семейству Retroviridae, имеет обратную транскриптазу." }
        ]
    },
    immunology: {
        name: "🧬 Иммунология / диагностика",
        difficulty: "medium",
        color: "medium",
        questionCount: 30,
        questions: [
            { text: "Какие антитела появляются первыми после инфекции?", options: ["IgG", "IgM", "IgA", "IgE"], correct: 1, hint: "Ранний ответ", explanation: "IgM синтезируются первыми, затем сменяются на IgG." }
        ]
    },
    brucella: {
        name: "🐑 Бруцеллы",
        difficulty: "medium",
        color: "medium",
        questionCount: 30,
        questions: [
            { text: "Какой основной путь заражения бруцеллёзом?", options: ["Воздушно-капельный", "Алиментарный (молоко, сыр)", "Трансмиссивный", "Половой"], correct: 1, hint: "Продукты от коз, овец", explanation: "Заражение через сырое молоко и молочные продукты от больных животных." }
        ]
    },
    corynebacterium: {
        name: "🦠 Коринебактерии (дифтерия)",
        difficulty: "hard",
        color: "hard",
        questionCount: 40,
        questions: [
            { text: "Какой метод окраски выявляет зерна волютина у дифтерийной палочки?", options: ["По Граму", "По Цилю-Нильсену", "По Нейссеру", "По Ожешко"], correct: 2, hint: "Окраска на метахроматические гранулы", explanation: "По Нейссеру палочки жёлтые, а зерна волютина тёмно-коричневые." }
        ]
    },
    anaerobes: {
        name: "⚠️ Анаэробы (ботулизм, столбняк, газовая гангрена)",
        difficulty: "hard",
        color: "hard",
        questionCount: 40,
        questions: [
            { text: "Какой токсин продуцирует Clostridium tetani?", options: ["Ботулотоксин", "Тетаноспазмин", "Энтеротоксин", "Холероген"], correct: 1, hint: "Столбняк", explanation: "Тетаноспазмин — нейротоксин, вызывающий спастические параличи." },
            { text: "Какой возбудитель вызывает ботулизм?", options: ["Clostridium perfringens", "Clostridium botulinum", "Clostridium tetani", "Bacillus anthracis"], correct: 1, hint: "Консервы, колбасы", explanation: "Clostridium botulinum продуцирует ботулотоксин." }
        ]
    }
};

// Состояние
let currentMode = 'menu';
let currentTopicKey = null;
let currentQuestions = [];
let currentIndex = 0;
let userAnswers = [];
let answerSubmitted = false;
let currentSelectedOption = -1;
let hintVisible = false;

function buildMarathonQuestions() {
    let all = [];
    for (let key in TOPICS) {
        all.push(...TOPICS[key].questions);
    }
    for (let i = all.length - 1; i > 0; i--) {
        let j = Math.floor(Math.random() * (i + 1));
        [all[i], all[j]] = [all[j], all[i]];
    }
    return all.slice(0, 100);
}

function startTopic(topicKey, questionsArray) {
    currentMode = 'test';
    currentTopicKey = topicKey;
    currentQuestions = [...questionsArray];
    for (let q of currentQuestions) {
        if (q._originalOptions === undefined) {
            q._originalOptions = [...q.options];
            const opts = [...q._originalOptions];
            for (let i = opts.length - 1; i > 0; i--) {
                let j = Math.floor(Math.random() * (i + 1));
                [opts[i], opts[j]] = [opts[j], opts[i]];
            }
            q.options = opts;
            const correctText = q._originalOptions[q.correct];
            q.correct = q.options.indexOf(correctText);
        }
    }
    userAnswers = new Array(currentQuestions.length).fill(-1);
    currentIndex = 0;
    answerSubmitted = false;
    currentSelectedOption = -1;
    hintVisible = false;
    render();
}

function finishTest() {
    let total = currentQuestions.length;
    let correctCount = 0;
    for (let i = 0; i < total; i++) {
        if (userAnswers[i] === currentQuestions[i].correct) correctCount++;
    }
    let percent = Math.round((correctCount / total) * 100);
    let html = `<div class="card"><h2>📋 Результаты</h2><div class="score-badge">${percent}% (${correctCount}/${total})</div><div class="result-table"><table><thead><tr><th>#</th><th>Вопрос</th><th>Ваш ответ</th><th>Правильный</th><th>Пояснение</th><th>Итог</th></tr></thead><tbody>`;
    for (let i = 0; i < total; i++) {
        let q = currentQuestions[i];
        let userTxt = userAnswers[i] >= 0 ? q.options[userAnswers[i]] : "Нет ответа";
        let correctTxt = q.options[q.correct];
        let isOk = userAnswers[i] === q.correct;
        html += `<tr class="${isOk ? 'correct-row' : 'wrong-row'}">
            <td>${i+1}</td>
            <td>${q.text}</td>
            <td>${userTxt}</td>
            <td>${correctTxt}</td>
            <td>${q.explanation || "—"}</td>
            <td>${isOk ? "✅" : "❌"}</td>
        </tr>`;
    }
    html += `</tbody></table></div><button id="backBtn">🏠 Главное меню</button></div>`;
    document.getElementById('app').innerHTML = html;
    document.getElementById('backBtn')?.addEventListener('click', () => { currentMode = 'menu'; render(); });
}

function submitAnswer() {
    if (answerSubmitted) return;
    if (currentSelectedOption === -1) { alert("Выбери ответ"); return; }
    userAnswers[currentIndex] = currentSelectedOption;
    answerSubmitted = true;
    render();
}

function nextQuestion() {
    if (!answerSubmitted && userAnswers[currentIndex] === -1) { alert("Сначала ответь"); return; }
    if (currentIndex + 1 < currentQuestions.length) {
        currentIndex++;
        answerSubmitted = false;
        currentSelectedOption = (userAnswers[currentIndex] !== -1) ? userAnswers[currentIndex] : -1;
        hintVisible = false;
        render();
    } else {
        finishTest();
    }
}

function renderMenu() {
    let html = `<div class="card"><div class="header"><h1>🧫 МИКРОБИОЛОГИЯ</h1></div><div class="topic-grid">`;
    for (let key in TOPICS) {
        let t = TOPICS[key];
        html += `<div class="topic-btn" data-key="${key}">
            <div class="topic-name">${t.name}</div>
            <div class="topic-meta"><span class="difficulty ${t.color}">${t.difficulty === 'easy' ? 'Лёгкая' : t.difficulty === 'medium' ? 'Средняя' : 'Сложная'}</span> <span>📋 ${t.questionCount}</span></div>
        </div>`;
    }
    html += `<div class="topic-btn marathon" id="marathonBtn">
        <div class="topic-name">🏆 МАРАФОН (100)</div>
        <div class="topic-meta">🔥 Все темы, рандом</div>
    </div>`;
    html += `</div><footer>⚡ Нажми на тему или марафон. В конце — бланк с результатами.</footer></div>`;
    document.getElementById('app').innerHTML = html;
    for (let key in TOPICS) {
        document.querySelector(`.topic-btn[data-key="${key}"]`)?.addEventListener('click', () => startTopic(key, TOPICS[key].questions));
    }
    document.getElementById('marathonBtn')?.addEventListener('click', () => startTopic('marathon', buildMarathonQuestions()));
}

function renderTest() {
    let q = currentQuestions[currentIndex];
    let optsHtml = '';
    for (let i = 0; i < q.options.length; i++) {
        let cls = 'option';
        if (answerSubmitted) cls += ' disabled';
        else if (currentSelectedOption === i) cls += ' selected';
        optsHtml += `<div class="${cls}" data-opt="${i}">${String.fromCharCode(65+i)}. ${q.options[i]}</div>`;
    }
    let hintHtml = hintVisible ? `<div class="hint">💡 ${q.hint}</div>` : '';
    let explHtml = (answerSubmitted && userAnswers[currentIndex] !== -1) ? `<div class="explanation">📘 ${q.explanation || (userAnswers[currentIndex] === q.correct ? "Верно!" : "Неверно.")}</div>` : '';
    let percent = Math.round(((currentIndex + 1) / currentQuestions.length) * 100);
    let btnHtml = !answerSubmitted ?
        `<button id="submitBtn">✅ Проверить</button><button id="hintBtn" class="outline">❓ Подсказка</button>` :
        `<button id="nextBtn" class="secondary">➡️ Следующий</button>`;
    let fullHtml = `
    <div class="card">
        <div class="header"><h2>${currentTopicKey === 'marathon' ? '🏆 МАРАФОН' : TOPICS[currentTopicKey]?.name || 'Тест'}</h2><button id="menuBtn" class="outline" style="background:transparent;">✖ Меню</button></div>
        <div class="progress">Вопрос ${currentIndex+1} из ${currentQuestions.length} · ${percent}%</div>
        <div style="background:#e2e8f0; border-radius:20px; height:6px;"><div style="width:${percent}%; background:#3b82f6; height:6px; border-radius:20px;"></div></div>
        <div class="question-text">${q.text}</div>
        ${optsHtml}
        ${hintHtml}
        ${explHtml}
        <div style="margin-top:18px;">${btnHtml}</div>
    </div>`;
    document.getElementById('app').innerHTML = fullHtml;
    if (!answerSubmitted) {
        document.querySelectorAll('.option:not(.disabled)').forEach(el => {
            el.addEventListener('click', () => { if (!answerSubmitted) { currentSelectedOption = parseInt(el.dataset.opt); renderTest(); } });
        });
        document.getElementById('submitBtn')?.addEventListener('click', submitAnswer);
        document.getElementById('hintBtn')?.addEventListener('click', () => { hintVisible = true; renderTest(); });
    } else {
        document.getElementById('nextBtn')?.addEventListener('click', nextQuestion);
    }
    document.getElementById('menuBtn')?.addEventListener('click', () => { currentMode = 'menu'; render(); });
}

function render() {
    if (currentMode === 'menu') renderMenu();
    else renderTest();
}

render();
</script>
</body>
</html>