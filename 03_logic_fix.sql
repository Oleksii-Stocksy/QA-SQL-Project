/* DATA LOGIC FIX SCRIPT / СКРИПТ ВИПРАВЛЕННЯ ЛОГІКИ ДАНИХ
  
  EN: Goal: Align bug reports with corresponding test cases based on functional areas.
  UA: Мета: Привести баг-репорти у відповідність до тест-кейсів згідно з функціональними зонами.
  
  Author: Oleksii-Stocksy
*/

UPDATE public.bug_reports AS br
SET case_id = mapping.new_case_id
FROM (VALUES 
    -- AUTH: Login, JWT, Recovery / АВТОРИЗАЦІЯ: Вхід, токени, відновлення
    (19, 11), (23, 25), (35, 30), (39, 43), (43, 60), (47, 91), (22, 92),
    
    -- PROFILE: Avatar, GDPR, Timezone / ПРОФІЛЬ: Аватар, GDPR, часові пояси
    (1, 6), (3, 9), (20, 21), (30, 23), (38, 29), (41, 35), (48, 59), (32, 66),
    
    -- SEARCH: Filtering, Sorting, Pagination / ПОШУК: Фільтри, сортування, пагінація
    (6, 7), (17, 19), (18, 27), (21, 33), (29, 45), (36, 51), (44, 58), (31, 61), (11, 77),
    
    -- PAYMENTS: Transactions, CVV, Card validation / ПЛАТЕЖІ: Транзакції, CVV, валідація карт
    (7, 18), (12, 24), (13, 26), (14, 28), (15, 32), (24, 41), (25, 47), (26, 62), 
    (27, 72), (28, 78), (33, 88), (34, 89), (37, 72), (40, 78), (46, 88), (49, 89), (50, 24),
    
    -- SYSTEM/API: Schema validation, DB errors / СИСТЕМА/API: Валідація схем, помилки БД
    (2, 17), (4, 36), (5, 48), (8, 69), (9, 70), (10, 84), (16, 85), (42, 95), (45, 96)
) AS mapping(bug_id, new_case_id)
WHERE br.bug_id = mapping.bug_id;

-- VERIFICATION: Run this to check the results
-- ПЕРЕВІРКА: Запустіть це, щоб перевірити результат
-- SELECT tc.case_title, br.title FROM public.test_cases tc 
-- JOIN public.bug_reports br ON tc.case_id = br.case_id;