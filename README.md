# 📊 Project: Test Management Database (QA)

### ℹ️ Description
This project showcases a relational database structure (PostgreSQL) designed for tracking **Test Cases** and **Bug Reports**. It demonstrates expertise in schema design, data integrity enforcement, and crafting complex SQL queries to solve real-world QA challenges.

### 🛠 Tech Stack
* **RDBMS:** PostgreSQL
* **Tools:** pgAdmin 4, VS Code

### 📂 Repository Content
1. **01_database_schema.sql** — DDL script that defines the tables for `test_cases` and `bug_reports`, including primary and foreign keys.
2. **02_initial_data.sql** — DML script containing a set of 50 mock test records to populate the database.
3. **03_logic_fix.sql** — A specialized script to align bug reports with their corresponding test cases using advanced mapping logic (includes UA/EN comments).
4. **[QA_Analytical_Report.md](./QA_Analytical_Report.md)** — Full analytical report with SQL query results and QA insights.

### 🔍 Key Skills Demonstrated
* **Database Design:** Implementing One-to-Many (1:N) relationships and referential integrity.
* **Data Reporting:** Utilizing complex `JOIN` operations to generate comprehensive test-to-bug reports.
* **Data Manipulation:** Performing bulk updates using the `UPDATE FROM VALUES` syntax to handle large datasets efficiently.

## 🚀 How to Run
1. Execute `01_database_schema.sql` to build the structure.
2. Run `02_initial_data.sql` to load initial data.
3. Apply `03_logic_fix.sql` to ensure correct data mapping.

## 📊 Detailed QA Analytical Report
<details>
  <summary>
    Натисніть, щоб переглянути повний звіт (15 запитів)</summary>


  # QA Analytical Report: Task Tracker System

### 1. Распределение тест-кейсов по приоритетам
|test_priority|total_cases|
|-------------|-----------|
|Critical|25|
|High|25|
|Medium|25|
|Low|25|
> **Висновок:** У системі спостерігається ідеальний баланс пріоритетів (по 25% на кожен тип), що свідчить про рівномірний розподіл тестового покриття.

### 2. Перевірка якості документації (пусті кроки/результати)
*Результат: 0 записів.*
> **Висновок:** Всі тест-кейси мають заповнені кроки та очікувані результати. Прогалин у документації не виявлено, що свідчить про високу якість ведення бази тест-кейсів.

### 3. Топ-10 найскладніших тест-кейсі за обсягом кроків
|case_id|case_title|complexity_score|
|-------|----------|----------------|
|27|Search: Pagination consistency (TC-56)|117|
|60|Auth: Redirect after auth (TC-8)|117|
|59|User Profile: Image upload > 5MB (TC-65)|117|
|69|API / Backend: JSON schema validation (TC-85)|117|
|43|Auth: Password recovery via blocked Email (TC-5)|117|
|33|Search: Filters persistence (TC-58)|117|
|36|API / Backend: Health-check uptime (TC-89)|117|
|19|Search: Ascending price sort (TC-52)|117|
|96|User Profile: Activity history timezone (TC-64)|117|
|22|API / Backend: Concurrent access (TC-98)|117|
> **Висновок:** Дані кейси мають найбільш деталізовані інструкції. Це основні кандидати для автоматизації, оскільки ручне виконання таких сценаріїв займає найбільше часу.

### 4. Стабільні тест-кейси (без виявлених дефектів)
|case_id|case_title|
|-------|----------|
|22|API / Backend: Concurrent access (TC-98)|
|81|User Profile: Image upload > 5MB (TC-75)|
|57|Auth: JWT token validation (TC-11)|
|67|User Profile: GDPR data export (TC-67)|
|90|User Profile: GDPR data export (TC-62)|
|63|Auth: Brute-force protection (TC-9)|
|86|Payments: Partial refund via API (TC-21)|
|82|API / Backend: Cascade deletion check (TC-97)|
|93|User Profile: Image upload > 5MB (TC-80)|
|20|User Profile: Password match check (TC-76)|
|15|Search: Ascending price sort (TC-42)|
|68|Search: Pagination consistency (TC-41)|
|38|Payments: CVV validation (TC-34)|
|54|API / Backend: Duplicate item addition (TC-91)|
|4|Payments: Transaction interruption (TC-38)|
|14|User Profile: Input mask validation (TC-63)|
|99|API / Backend: Health-check uptime (TC-94)|
|74|User Profile: Password match check (TC-66)|
|55|API / Backend: Concurrent access (TC-83)|
|31|API / Backend: Cascade deletion check (TC-87)|
|12|Auth: Brute-force protection (TC-19)|
|1|User Profile: Image upload > 5MB (TC-70)|
|13|Search: Special characters search (TC-55)|
|16|API / Backend: Duplicate item addition (TC-86)|
|87|Auth: Password recovery via blocked Email (TC-20)|
|2|Search: Pagination consistency (TC-51)|
|8|Search: Ascending price sort (TC-47)|
|75|API / Backend: Cascade deletion check (TC-82)|
|79|User Profile: GDPR data export (TC-77)|
|73|Auth: Redirect after auth (TC-13)|
|10|Payments: Currency conversion (TC-27)|
|39|Payments: Expired card payment (TC-35)|
|53|Auth: Redirect after auth (TC-18)|
|46|User Profile: Activity history timezone (TC-79)|
|71|Auth: Brute-force protection (TC-14)|
|97|API / Backend: Health-check uptime (TC-84)|
|34|API / Backend: JSON schema validation (TC-90)|
|5|Auth: JWT token validation (TC-6)|
|64|Payments: Currency conversion (TC-37)|
|98|API / Backend: Duplicate item addition (TC-81)|
|80|Search: Special characters search (TC-50)|
|49|Auth: JWT token validation (TC-1)|
|44|Search: Partial Match search (TC-54)|
|100|Search: Partial Match search (TC-44)|
|65|Search: Filters persistence (TC-48)|
|56|Payments: Transaction interruption (TC-28)|
|42|User Profile: Input mask validation (TC-68)|
|40|Payments: CVV validation (TC-24)|
|3|Search: Partial Match search (TC-49)|
|76|Auth: Login with unregistered phone (TC-12)|
|52|API / Backend: Health-check uptime (TC-99)|
|37|Auth: Password recovery via blocked Email (TC-10)|
|50|Search: Pagination consistency (TC-46)|
|94|Payments: Partial refund via API (TC-26)|
|83|User Profile: Input mask validation (TC-78)|
> **Висновок:** Аналіз показує сценарії, які пройшли успішно без реєстрації помилок. Це зони найвищої стабільності продукту на даний момент.

### 5. Розподіл тест-кейсі за логічними модулями системи
|module_name|case_count|
|-----------|----------|
|UI/UX|30|
|Core Auth|20|
|Integration|50|
> **Висновок:** Дозволяє оцінити щільність тестового покриття між ядром авторизації (Core Auth), інтерфейсом (UI/UX) та інтеграційними процесами.

### 6. Перелік активних дефектів (статус "Не закрито")
|title|severity|status|
|-----|--------|------|
|[Bug] [DB] [Dev] Unexpected system behavior|Blocker|New|
|[Bug] [Mobile] [Dev] Transaction hangs on processing|Critical|Assigned|
|[Bug] [Back] [Prod] Transaction hangs on processing|Major|Retest|
|[Error] [Back] [Stage] Transaction hangs on processing|Critical|Assigned|
|[Issue] [Mobile] [Prod] Transaction hangs on processing|Blocker|In Progress|
|[Bug] [Web] [Dev] Transaction hangs on processing|Major|Assigned|
|[Bug] [Web] [Dev] Unexpected system behavior|Trivial|Reopened|
|[Bug] [DB] [Prod] Items disappear after page refresh|Minor|Assigned|
|[Bug] [Back] [Stage] Failed to log in with valid credentials|Minor|In Progress|
|[Error] [Back] [Stage] Items disappear after page refresh|Trivial|Assigned|
|[Issue] [Web] [Dev] No results found for existing items|Minor|Retest|
|[Issue] [Web] [Stage] No results found for existing items|Critical|Retest|
|[Error] [Back] [Dev] Unexpected system behavior|Critical|Fixed|
|[Error] [DB] [Stage] Unexpected system behavior|Blocker|Reopened|
|[Bug] [Back] [Stage] No results found for existing items|Critical|New|
|[Bug] [Web] [Prod] No results found for existing items|Blocker|Fixed|
|[Issue] [Mobile] [Stage] Failed to log in with valid credentials|Critical|Assigned|
|[Issue] [Mobile] [Prod] User avatar not updated after saving|Trivial|Assigned|
|[Bug] [Back] [Prod] No results found for existing items|Critical|Retest|
|[Issue] [Mobile] [Stage] Transaction hangs on processing|Major|Fixed|
|[Bug] [DB] [Prod] Transaction hangs on processing|Critical|In Progress|
|[Issue] [Mobile] [Stage] Items disappear after page refresh|Minor|Assigned|
|[Issue] [Mobile] [Dev] User avatar not updated after saving|Critical|Open|
|[Error] [DB] [Dev] Items disappear after page refresh|Minor|Open|
|[Bug] [Mobile] [Prod] Failed to log in with valid credentials|Critical|New|
|[Error] [Back] [Stage] Failed to log in with valid credentials|Major|In Progress|
|[Error] [DB] [Prod] Transaction hangs on processing|Blocker|In Progress|
|[Bug] [Back] [Stage] Transaction hangs on processing|Minor|Retest|
|[Bug] [DB] [Prod] Transaction hangs on processing|Blocker|New|
|[Bug] [Web] [Stage] Items disappear after page refresh|Critical|Reopened|
|[Error] [DB] [Dev] Items disappear after page refresh|Major|Fixed|
|[Bug] [Back] [Dev] Failed to log in with valid credentials|Minor|New|
|[Error] [DB] [Dev] User avatar not updated after saving|Critical|Retest|
|[Issue] [Web] [Stage] Transaction hangs on processing|Blocker|In Progress|
|[Bug] [DB] [Dev] Transaction hangs on processing|Blocker|Fixed|
|[Issue] [Web] [Dev] Unexpected system behavior|Critical|Retest|
|[Bug] [Mobile] [Stage] No results found for existing items|Minor|New|
|[Issue] [Web] [Dev] Transaction hangs on processing|Critical|In Progress|
|[Bug] [Mobile] [Prod] Transaction hangs on processing|Blocker|New|
|[Bug] [Web] [Dev] Unexpected system behavior|Critical|In Progress|
|[Error] [Back] [Stage] Unexpected system behavior|Minor|Open|
|[Bug] [Mobile] [Prod] User avatar not updated after saving|Trivial|Fixed|
|[Issue] [Mobile] [Prod] Transaction hangs on processing|Trivial|In Progress|
> **Висновок:** Актуальний список проблем, які потребують уваги розробників та подальшої перевірки з боку QA.

### 7. Розподіл багів за рівнем серйозності (Severity Distribution)
|severity|bug_count|
|--------|---------|
|Major|6|
|Critical|16|
|Trivial|9|
|Blocker|10|
|Minor|9|
> **Висновок:** Ключова метрика для оцінки якості. Велика кількість критичних багів свідчить про високі ризики для релізу.

### 8. Аналіз багів у модулях доступу та авторизації
|bug_id|title|severity|status|
|------|-----|--------|------|
|20|[Bug] [Back] [Prod] User avatar not updated after saving|Trivial|Closed|
|1|[Issue] [Mobile] [Prod] User avatar not updated after saving|Trivial|Assigned|
|30|[Issue] [Mobile] [Dev] User avatar not updated after saving|Critical|Open|
|3|[Bug] [DB] [Stage] User avatar not updated after saving|Blocker|Closed|
|38|[Error] [DB] [Dev] User avatar not updated after saving|Critical|Retest|
|41|[Error] [DB] [Prod] User avatar not updated after saving|Trivial|Closed|
|48|[Bug] [Mobile] [Prod] User avatar not updated after saving|Trivial|Fixed|
> **Висновок:** Фокусний звіт по найбільш критичній зоні безпеки (Login, User Management). Допомагає переконатися, що основні функції входу працюють коректно.

### 9. Мапінг дефектів на відповідні тест-кейси
|bug_id|bug_title|case_title|
|------|---------|----------|
|18|[Issue] [Web] [Stage] No results found for existing items|Search: Pagination consistency (TC-56)|
|43|[Issue] [Mobile] [Stage] Failed to log in with valid credentials|Auth: Redirect after auth (TC-8)|
|48|[Bug] [Mobile] [Prod] User avatar not updated after saving|User Profile: Image upload > 5MB (TC-65)|
|8|[Bug] [DB] [Prod] Items disappear after page refresh|API / Backend: JSON schema validation (TC-85)|
|39|[Bug] [Back] [Dev] Failed to log in with valid credentials|Auth: Password recovery via blocked Email (TC-5)|
|21|[Bug] [Web] [Prod] No results found for existing items|Search: Filters persistence (TC-58)|
|4|[Bug] [Web] [Stage] Items disappear after page refresh|API / Backend: Health-check uptime (TC-89)|
|17|[Issue] [Web] [Dev] No results found for existing items|Search: Ascending price sort (TC-52)|
|45|[Bug] [Web] [Dev] Unexpected system behavior|User Profile: Activity history timezone (TC-64)|
|11|[Bug] [DB] [Dev] Unexpected system behavior|Search: Filters persistence (TC-53)|
|46|[Issue] [Mobile] [Prod] Transaction hangs on processing|Payments: Expired card payment (TC-30)|
|33|[Bug] [Web] [Dev] Transaction hangs on processing|Payments: Expired card payment (TC-30)|
|27|[Issue] [Web] [Stage] Transaction hangs on processing|Payments: Currency conversion (TC-22)|
|37|[Bug] [DB] [Prod] Transaction hangs on processing|Payments: Currency conversion (TC-22)|
|14|[Bug] [Back] [Prod] Transaction hangs on processing|Payments: Partial refund via API (TC-31)|
|35|[Error] [Back] [Stage] Failed to log in with valid credentials|Auth: JWT token validation (TC-16)|
|40|[Bug] [DB] [Dev] Transaction hangs on processing|Payments: Transaction interruption (TC-33)|
|28|[Issue] [Mobile] [Prod] Transaction hangs on processing|Payments: Transaction interruption (TC-33)|
|30|[Issue] [Mobile] [Dev] User avatar not updated after saving|User Profile: Activity history timezone (TC-69)|
|16|[Error] [DB] [Stage] Unexpected system behavior|API / Backend: Cascade deletion check (TC-92)|
|13|[Issue] [Mobile] [Prod] Transaction hangs on processing|Auth: Brute-force protection (TC-4)|
|47|[Error] [Back] [Stage] Unexpected system behavior|Auth: Login with unregistered phone (TC-17)|
|15|[Error] [Back] [Stage] Transaction hangs on processing|Payments: Expired card payment (TC-40)|
|5|[Error] [DB] [Dev] Items disappear after page refresh|API / Backend: Concurrent access (TC-93)|
|44|[Bug] [Mobile] [Stage] No results found for existing items|Search: Partial Match search (TC-59)|
|25|[Bug] [Back] [Stage] Transaction hangs on processing|Payments: Partial refund via API (TC-36)|
|10|[Issue] [Mobile] [Stage] Items disappear after page refresh|API / Backend: JSON schema validation (TC-100)|
|29|[Issue] [Mobile] [Stage] No results found for existing items|Search: Filters persistence (TC-43)|
|38|[Error] [DB] [Dev] User avatar not updated after saving|User Profile: Password match check (TC-71)|
|2|[Bug] [Web] [Dev] Unexpected system behavior|API / Backend: Duplicate item addition (TC-96)|
|49|[Issue] [Web] [Dev] Transaction hangs on processing|Payments: Expired card payment (TC-25)|
|34|[Issue] [Mobile] [Stage] Transaction hangs on processing|Payments: Expired card payment (TC-25)|
|31|[Bug] [Mobile] [Prod] Unexpected system behavior|Search: Ascending price sort (TC-57)|
|42|[Issue] [Web] [Dev] Unexpected system behavior|API / Backend: Concurrent access (TC-88)|
|23|[Bug] [Mobile] [Prod] Failed to log in with valid credentials|Auth: Login with unregistered phone (TC-7)|
|22|[Error] [Back] [Stage] Items disappear after page refresh|Auth: Password recovery via blocked Email (TC-15)|
|41|[Error] [DB] [Prod] User avatar not updated after saving|User Profile: Password match check (TC-61)|
|36|[Bug] [Back] [Prod] No results found for existing items|Search: Special characters search (TC-45)|
|24|[Error] [DB] [Prod] Transaction hangs on processing|Payments: CVV validation (TC-29)|
|20|[Bug] [Back] [Prod] User avatar not updated after saving|User Profile: Input mask validation (TC-73)|
|50|[Bug] [Mobile] [Prod] Transaction hangs on processing|Payments: Transaction interruption (TC-23)|
|12|[Bug] [Mobile] [Dev] Transaction hangs on processing|Payments: Transaction interruption (TC-23)|
|1|[Issue] [Mobile] [Prod] User avatar not updated after saving|Auth: Redirect after auth (TC-3)|
|19|[Bug] [Back] [Stage] Failed to log in with valid credentials|Auth: Login with unregistered phone (TC-2)|
|9|[Error] [Back] [Dev] Unexpected system behavior|API / Backend: JSON schema validation (TC-95)|
|6|[Bug] [Back] [Stage] No results found for existing items|Search: Special characters search (TC-60)|
|32|[Error] [DB] [Dev] Items disappear after page refresh|User Profile: GDPR data export (TC-72)|
|26|[Bug] [DB] [Prod] Transaction hangs on processing|Payments: Currency conversion (TC-32)|
|3|[Bug] [DB] [Stage] User avatar not updated after saving|User Profile: Activity history timezone (TC-74)|
|7|[Issue] [Web] [Stage] Transaction hangs on processing|Payments: CVV validation (TC-39)|
> **Висновок:** Прямий зв'язок між документацією та знайденими помилками. Це підтверджує, що тестування проводиться згідно з розробленими сценаріями.

### 10. Найбільш проблемний функціонал (Кейс-рекордсмен за кількістю багів)
|case_title|total_bugs|
|----------|----------|
|Payments: Transaction interruption (TC-23)|2|
> **Висновок:** Ідентифікація "найслабшої ланки" в системі. Цей функціонал потребує повного перегляду архітектури або більш ретельного рефакторингу.

### 11. Пріоритетність виправлення дефектів (Fix Priority)
|priority|bug_count|
|--------|---------|
|High|21|
|Medium|18|
|Low|11|
> **Висновок:** Допомагає команді розробки сфокусуватися на виправленні тих помилок, які найбільше впливають на бізнес-процеси.

### 12. Відсоткове співвідношення статусів багів (Release Readiness)
Open	3	6.00
Assigned	8	16.00
New	7	14.00
Reopened	3	6.00
In Progress	9	18.00
Closed	7	14.00
Fixed	6	12.00
Retest	7	14.00
> **Висновок:** Головна метрика готовності до релізу. Чим вищий відсоток статусів "Closed" або "Resolved", тим ближче проект до завершення.

### 13. План дій на основі критичності дефектів
|title|severity|action_plan|
|-----|--------|-----------|
|[Bug] [Mobile] [Prod] Unexpected system behavior|Trivial|Planned Fix|
|[Bug] [DB] [Dev] Unexpected system behavior|Blocker|Immediate Action|
|[Bug] [Mobile] [Dev] Transaction hangs on processing|Critical|Immediate Action|
|[Issue] [Mobile] [Prod] Transaction hangs on processing|Critical|Immediate Action|
|[Bug] [Back] [Prod] Transaction hangs on processing|Major|Planned Fix|
|[Error] [Back] [Stage] Transaction hangs on processing|Critical|Immediate Action|
|[Issue] [Mobile] [Prod] Transaction hangs on processing|Blocker|Immediate Action|
|[Bug] [Web] [Dev] Transaction hangs on processing|Major|Planned Fix|
|[Bug] [Web] [Dev] Unexpected system behavior|Trivial|Planned Fix|
|[Bug] [DB] [Prod] Items disappear after page refresh|Minor|Planned Fix|
|[Bug] [Back] [Stage] Failed to log in with valid credentials|Minor|Planned Fix|
|[Error] [Back] [Stage] Items disappear after page refresh|Trivial|Planned Fix|
|[Bug] [Back] [Prod] User avatar not updated after saving|Trivial|Planned Fix|
|[Issue] [Web] [Dev] No results found for existing items|Minor|Planned Fix|
|[Issue] [Web] [Stage] No results found for existing items|Critical|Immediate Action|
|[Error] [Back] [Dev] Unexpected system behavior|Critical|Immediate Action|
|[Error] [DB] [Stage] Unexpected system behavior|Blocker|Immediate Action|
|[Bug] [Back] [Stage] No results found for existing items|Critical|Immediate Action|
|[Bug] [Web] [Prod] No results found for existing items|Blocker|Immediate Action|
|[Issue] [Mobile] [Stage] Failed to log in with valid credentials|Critical|Immediate Action|
|[Issue] [Mobile] [Prod] User avatar not updated after saving|Trivial|Planned Fix|
|[Bug] [Back] [Prod] No results found for existing items|Critical|Immediate Action|
|[Issue] [Mobile] [Stage] Transaction hangs on processing|Major|Planned Fix|
|[Bug] [DB] [Prod] Transaction hangs on processing|Critical|Immediate Action|
|[Issue] [Mobile] [Stage] Items disappear after page refresh|Minor|Planned Fix|
|[Issue] [Mobile] [Dev] User avatar not updated after saving|Critical|Immediate Action|
|[Error] [DB] [Dev] Items disappear after page refresh|Minor|Planned Fix|
|[Issue] [Mobile] [Stage] No results found for existing items|Major|Planned Fix|
|[Bug] [Mobile] [Prod] Failed to log in with valid credentials|Critical|Immediate Action|
|[Error] [Back] [Stage] Failed to log in with valid credentials|Major|Planned Fix|
|[Error] [DB] [Prod] Transaction hangs on processing|Blocker|Immediate Action|
|[Bug] [Back] [Stage] Transaction hangs on processing|Minor|Planned Fix|
|[Bug] [DB] [Prod] Transaction hangs on processing|Blocker|Immediate Action|
|[Issue] [Web] [Stage] Transaction hangs on processing|Trivial|Planned Fix|
|[Bug] [DB] [Stage] User avatar not updated after saving|Blocker|Immediate Action|
|[Bug] [Web] [Stage] Items disappear after page refresh|Critical|Immediate Action|
|[Error] [DB] [Dev] Items disappear after page refresh|Major|Planned Fix|
|[Bug] [Back] [Dev] Failed to log in with valid credentials|Minor|Planned Fix|
|[Error] [DB] [Dev] User avatar not updated after saving|Critical|Immediate Action|
|[Error] [DB] [Prod] User avatar not updated after saving|Trivial|Planned Fix|
|[Issue] [Web] [Stage] Transaction hangs on processing|Blocker|Immediate Action|
|[Bug] [DB] [Dev] Transaction hangs on processing|Blocker|Immediate Action|
|[Issue] [Web] [Dev] Unexpected system behavior|Critical|Immediate Action|
|[Bug] [Mobile] [Stage] No results found for existing items|Minor|Planned Fix|
|[Issue] [Web] [Dev] Transaction hangs on processing|Critical|Immediate Action|
|[Bug] [Mobile] [Prod] Transaction hangs on processing|Blocker|Immediate Action|
|[Bug] [Web] [Dev] Unexpected system behavior|Critical|Immediate Action|
|[Error] [Back] [Stage] Unexpected system behavior|Minor|Planned Fix|
|[Bug] [Mobile] [Prod] User avatar not updated after saving|Trivial|Planned Fix|
|[Issue] [Mobile] [Prod] Transaction hangs on processing|Trivial|Planned Fix|
> **Висновок:** Автоматична класифікація задач. Блокуючі помилки вимагають негайного втручання ("Immediate Action"), інші — планового виправлення.

### 14. Перевірка на наявність дублікатів баг-репортів
|title|count|
|-----|-----|
|[Bug] [DB] [Prod] Transaction hangs on processing|2|
|[Bug] [Web] [Dev] Unexpected system behavior|2|
|[Issue] [Web] [Stage] Transaction hangs on processing|2|
|[Issue] [Mobile] [Prod] Transaction hangs on processing|3|
|[Error] [DB] [Dev] Items disappear after page refresh|2|
> **Висновок:** Контроль гігієни бази даних дефектів. Дозволяє уникнути подвійної роботи для розробників та перевірити уважність QA при створенні тікетів.

### 15. Контроль цілісності даних (Баги без прив'язки)
*Результат: 0 записів.*
> **Висновок:** Технічний аудит бази даних. Перевірка того, чи всі зареєстровані баги мають посилання на джерело (тест-кейс), що забезпечує повну простежуваність.

</details>
