/* SQL QA REPORTING SUITE / КОМПЛЕКС QA ЗВІТНОСТІ
   Total: 15 Queries (5 for Test Cases, 10 for Bugs)
   Author: Oleksii-Stocksy
*/

-----------------------------------------------------------
-- PART 1: TEST CASE AUDIT & COVERAGE (1-5)
-- ЧАСТИНА 1: АУДИТ ТЕСТ-КЕЙСІВ ТА ПОКРИТТЯ
-- (Логіка: Спочатку перевіряємо базу нашої документації)
-----------------------------------------------------------

-- 1. Анализ покрытия по приоритетам (Priority Distribution)
SELECT priority, COUNT(*) AS total_cases FROM public.test_cases GROUP BY priority;

-- 2. Проверка качества: Кейсы с пустыми шагами или результатами (Audit)
SELECT case_id, case_title FROM public.test_cases WHERE steps IS NULL OR expected_result IS NULL;

-- 3. Список кейсов для регрессии (Keyword filter)
SELECT * FROM public.test_cases WHERE description LIKE '%Regression%' OR case_title LIKE '%Critical%';

-- 4. "Стабильные" кейсы (у которых нет ни одного бага)
SELECT tc.case_id, tc.case_title FROM public.test_cases tc
LEFT JOIN public.bug_reports br ON tc.case_id = br.case_id
WHERE br.bug_id IS NULL;

-- 5. Группировка кейсов по логическим модулям (Range grouping)
SELECT 
    CASE 
        WHEN case_id BETWEEN 1 AND 20 THEN 'Core Auth'
        WHEN case_id BETWEEN 21 AND 50 THEN 'UI/UX'
        ELSE 'Integration'
    END AS module_name, COUNT(*) AS case_count
FROM public.test_cases GROUP BY module_name;


-----------------------------------------------------------
-- PART 2: BUG REPORTING & ANALYTICS (6-15)
-- ЧАСТИНА 2: АНАЛІТИКА БАГ-РЕПОРТІВ
-- (Логіка: Аналіз результатів тестування та знайдених дефектів)
-----------------------------------------------------------

-- 6. Все открытые баги (кроме закрытых)
SELECT title, severity, status FROM public.bug_reports WHERE status != 'Closed';

-- 7. Группировка по серьезности (Severity Distribution)
SELECT severity, COUNT(*) as bug_count FROM public.bug_reports GROUP BY severity;

-- 8. Поиск багов по модулю через ключевые слова
SELECT * FROM public.bug_reports WHERE title LIKE '%[Auth]%';

-- 9. Маппинг: Баг + Название тест-кейса (JOIN)
SELECT br.bug_id, br.title AS bug_title, tc.case_title 
FROM public.bug_reports br
JOIN public.test_cases tc ON br.case_id = tc.case_id;

-- 10. Самый критический функционал (Топ кейсов по количеству багов)
SELECT tc.case_title, COUNT(br.bug_id) AS total_bugs
FROM public.test_cases tc
LEFT JOIN public.bug_reports br ON tc.case_id = br.case_id
GROUP BY tc.case_title ORDER BY total_bugs DESC LIMIT 1;

-- 11. Распределение багов по приоритету исправления
SELECT priority, COUNT(*) AS bug_count FROM public.bug_reports GROUP BY priority ORDER BY bug_count DESC;

-- 12. Процентное соотношение статусов (Release Readiness Metric)
SELECT status, COUNT(*) as count, ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) as percentage
FROM public.bug_reports GROUP BY status;

-- 13. Классификация действий на основе серьезности (CASE)
SELECT title, severity,
    CASE 
        WHEN severity IN ('Blocker', 'Critical') THEN 'Immediate Action'
        ELSE 'Planned Fix'
    END AS action_plan
FROM public.bug_reports;

-- 14. Поиск потенциальных дубликатов (Duplicate check)
SELECT title, COUNT(*) FROM public.bug_reports GROUP BY title HAVING COUNT(*) > 1;

-- 15. Баги, созданные без привязки к конкретному кейсу (Data Integrity)
SELECT * FROM public.bug_reports WHERE case_id IS NULL;