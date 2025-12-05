# Natural Cosmetics Shop Analysis

## 1. Описание

 Проект для анализа данных магазина натуральной косметики, исследования характеристик продуктов представленных в магазине, поведения клиентов и моделей продаж. Используютс: SQL, Python, и Power BI. Анализ выделяет ключевые тенденции и самые продаваемые категории продуков. Прокт включает в себя очистку данных, разведочный анализ данных (EDA), дашборд, и структурированную документацию для демонтрации практических навыков анализа данных в контексте розничной торговли и косметики.

> ## DISCLAIMER

>Проект основан на вымышленном магазине натуральной косметики. Все данные сгенерированы рандомно при помощи сервиса Mockaroo.com для учебных целей и составления портфолио. Магазин, покупатели, заказы, и т.д. не представляют никакую реальную компанию или рельных личностей.

## 2. Структура проекта
- ## NaturalCosmeticsShop
  - ### tables
    - customers.csv (*покупатели*)
    - products.csv (*продукты*)
    - sales.csv (*продажи*)
  - ### notebooks
    - etl.ipynb (*извлечение, проеобразование и загрузка данных*)
    - eda.ipynb (*разведочный анализ данных*)
  - ### sql
    - create_tables.sql (*создание таблиц*)
    - insert_tables.sql (*вставка таблиц*)
    - etl.sql (*извлечение, проеобразование и загрузка данных*)
    - analytical_queries.sql (*анализ данных*)
    - power_bi_views.sql (*создание представлений (views) для создания дашборда в Power BI*)
  - ### powerbi
    - dashboard.pbix (*интерактивный дашборд (3 листа)*)
  - ### documentation
    -  structure.pdf (*структура проекта в виде блок-схем*)

     
## 3. Инструменты и технологии

1) Python _(pandas, numpy, matplotlib, seaborn)_
   
2) SQL _(postgresql)_

3) Power BI _(visualisation)_

4) Mockaroo _(data generation)_

5) Jupiter notebook

## 4. Основыне шаги

1. Генерация и сбор данных 

2. Очистка данных (ETL)

3. Разведывательный анализ данных (EDA)

4. Визуализация резльтатов в Python с помощью библиотек Matplotlib и Seaborn

5. Анализ данных в SQL 

6. Создание интерактивного дашборда в Power BI 

7. Создание документации и выводы

## 5. Скриншоты
   
   ### 5.1 Power BI дашборд (частично)

  <img width="754" height="431" alt="image" src="https://github.com/user-attachments/assets/d8d8cd33-5579-439d-92c1-46fa70525212" />

  ### 5.2 EDA (Jupiter)

  <img width="863" height="542" alt="image" src="https://github.com/user-attachments/assets/deef9302-5341-4ec5-9939-a7789a2454a4" />

  <img width="654" height="494" alt="image" src="https://github.com/user-attachments/assets/8f880577-cdc7-4731-908c-f75de4d039b2" />

 ## 6. Как использовать/открывать

 ### 6.1 SQL запросы: 

 SQL запросы написаны для PostgreSQL.  

Чтоб запустить их:

1. Создайте базу данных cosmetics в PostgreSQL.

2. Импортируйте CSV файлы из папки _`tables/`_.

3. Откройте файлы _`.sql`_ в pgAdmin Query.

4. Запутите запросы (f5)

### 6.2 Python 

Анализ Python расположен в папке _`notebooks/`_.  

**Чтобы запустить**:

1) Установите Python версии 3.10+

2) Запустите программу Jupiter Notebook

3) Откройте файлы _`.ipnyb`_  (etl и eda)

4) Убедитесь, что  CSV файлы из папки  _`tables/`_ находятся по тому же пути, чтобы код запускался корректно.

### 6.3 Power BI

Дашборд расположен в папке  _`powerbi`_.

1) Скачайте файл _`.pbix`_. 

2) Откройте его в программе Power BI Desktop 

## 7. Results and insights

In _`documentation/`_ folder: structure.pdf

## 8. Author

Galiia Islamova

*email: galiya.is.98@gmail.com*
