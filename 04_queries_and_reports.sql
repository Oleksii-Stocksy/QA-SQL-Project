/* SQL QA REPORTING SUITE / КОМПЛЕКС QA ЗВІТНОСТІ
   Total: 15 Queries
   Author: Oleksii-Stocksy
*/

-----------------------------------------------------------
-- ЧАСТИНА 1: АУДИТ ТЕСТ-КЕЙСІВ ТА ПОКРИТТЯ (1-5)
-----------------------------------------------------------

-- 1. Аналіз покриття за пріоритетами (Розподіл тест-кейсів)
-- Використовуємо коректну назву: test_priority
SELECT test_priority, COUNT(*) AS total_cases 
FROM public.test_cases 
GROUP BY test_priority;

-- 2. Перевірка якості: Кейси з порожніми кроками або результатами
-- Використовуємо: test_steps
SELECT case_id, case_title 
FROM public.test_cases 
WHERE test_steps IS NULL OR expected_result IS NULL;

-- 3. Список кейсів для регресійного тестування 
-- Шукаємо за ключовими словами у case_title (оскільки description відсутній)
SELECT * FROM public.test_cases 
WHERE case_title LIKE '%Regression%' OR case_title LIKE '%Critical%';

-- 4. "Стабільні" кейси (для яких не знайдено жодного багу)
-- Використовуємо LEFT JOIN для пошуку кейсів без прив'язаних багів
SELECT tc.case_id, tc.case_title 
FROM public.test_cases tc
LEFT JOIN public.bug_reports br ON tc.case_id = br.case_id
WHERE br.bug_id IS NULL;

-- 5. Групування кейсів за логічними модулями (за діапазонами ID)
SELECT 
    CASE 
        WHEN case_id BETWEEN 1 AND 20 THEN 'Core Auth'
        WHEN case_id BETWEEN 21 AND 50 THEN 'UI/UX'
        ELSE 'Integration'
    END AS module_name, COUNT(*) AS case_count
FROM public.test_cases 
GROUP BY module_name;


-----------------------------------------------------------
-- ЧАСТИНА 2: АНАЛІТИКА БАГ-РЕПОРТІВ (6-15)
-----------------------------------------------------------

-- 6. Усі відкриті баги (крім закритих)
SELECT title, severity, status 
FROM public.bug_reports 
WHERE status != 'Closed';

-- 7. Розподіл за серйозністю (Severity Distribution)
SELECT severity, COUNT(*) as bug_count 
FROM public.bug_reports 
GROUP BY severity;

-- 8. Пошук багів за модулем через назву
SELECT * FROM public.bug_reports 
WHERE title LIKE '%[Auth]%';

-- 9. Мапінг: Баг + Назва відповідного тест-кейсу (JOIN)

SELECT br.bug_id, br.title AS bug_title, tc.case_title 
FROM public.bug_reports br
JOIN public.test_cases tc ON br.case_id = tc.case_id;

-- 10. Найбільш критичний функціонал (Кейс з найбільшою кількістю багів)
SELECT tc.case_title, COUNT(br.bug_id) AS total_bugs
FROM public.test_cases tc
LEFT JOIN public.bug_reports br ON tc.case_id = br.case_id
GROUP BY tc.case_title 
ORDER BY total_bugs DESC 
LIMIT 1;

-- 11. Розподіл багів за пріоритетом виправлення
SELECT priority, COUNT(*) AS bug_count 
FROM public.bug_reports 
GROUP BY priority 
ORDER BY bug_count DESC;

-- 12. Відсоткове співвідношення статусів (Метрика готовності релізу)
SELECT status, COUNT(*) as count, 
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) as percentage
FROM public.bug_reports 
GROUP BY status;

-- 13. Класифікація дій на основі серйозності (CASE Statement)
SELECT title, severity,
    CASE 
        WHEN severity IN ('Blocker', 'Critical') THEN 'Immediate Action'
        ELSE 'Planned Fix'
    END AS action_plan
FROM public.bug_reports;

-- 14. Пошук потенційних дублікатів багів (Duplicate check)
SELECT title, COUNT(*) 
FROM public.bug_reports 
GROUP BY title 
HAVING COUNT(*) > 1;

-- 15. Контроль цілісності: Баги без прив'язки до кейсу
SELECT * FROM public.bug_reports 
WHERE case_id IS NULL;
