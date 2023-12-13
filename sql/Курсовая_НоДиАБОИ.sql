-- database FinRat 
DROP DATABASE IF EXISTS FinRat;
CREATE DATABASE FinRat;
USE FinRat;

-- 1: df1 - general information about companies
DROP TABLE IF EXISTS general_information;
CREATE TABLE general_information (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE --
	Наименование TEXT,
	Адрес TEXT,
	Дата_регистрации DATE,
	Возраст_компании BIGINT UNSIGNED,
	Регион_регистрации TEXT,
	Вид_деятельности TEXT,
 	Форма_собственности TEXT,
 	Размер_компании TEXT
	);

-- 2: df2 liquidity
DROP TABLE IF EXISTS liquidity;
CREATE TABLE liquidity (
	id_liq SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE --
	Коэффициент_текущей_ликвидности FLOAT,
	Коэффициент_быстрой_ликвидности FLOAT,
	Коэффициент_абсолютной_ликвидности FLOAT,
	FOREIGN KEY (id_liq) REFERENCES general_information(id) ON DELETE CASCADE ON UPDATE CASCADE
	);

-- 3: df3 profitability
DROP TABLE IF EXISTS profitability;
CREATE TABLE profitability (
	id_prof SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE --
	Рентабельность_продаж FLOAT,
	Рентабельность_активов FLOAT,
	Рентабельность_капитала FLOAT,
	FOREIGN KEY (id_prof) REFERENCES general_information(id) ON DELETE CASCADE ON UPDATE CASCADE
	);

-- 4: df4 income statement elements
DROP TABLE IF EXISTS income_statement_elements;
CREATE TABLE income_statement_elements (
	id_inc SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE --
	Доходы INT,
	Расходы INT,
	Валовая_прибыль INT,
	Коммерческие_расходы INT,
	Управленческие_расходы INT,
	Прибыль_продажи INT,
	Чистая_прибыль INT,
	FOREIGN KEY (id_inc) REFERENCES general_information(id) ON DELETE CASCADE ON UPDATE CASCADE
	);

-- 5: df5 balance_sheet
DROP TABLE IF EXISTS balance_sheet;
CREATE TABLE balance_sheet (
	id_bal SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE --
	Внеоборотные_активы INT,
	Чистые_активы INT,
	Активы_всего INT,
	Долгосрочные_обязательства INT,
	Собственный_оборотный_капитал INT,
	Себестоимость_продаж INT,
	FOREIGN KEY (id_bal) REFERENCES general_information(id) ON DELETE CASCADE ON UPDATE CASCADE
	);

-- 6: df6 capital_structure
DROP TABLE IF EXISTS capital_structure;
CREATE TABLE capital_structure (
	id_cap SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE --
	Коэффициент_соотношения_заемных_и_собственных_средств FLOAT,
	Коэффициент_долгосрочного_привлечения_заемных_средств FLOAT,
	Коэффициент_маневренности_собственными_средств FLOAT,
	Коэффициент_обеспеченности_собственными_оборотными_средствами FLOAT,
	FOREIGN KEY (id_cap) REFERENCES general_information(id) ON DELETE CASCADE ON UPDATE CASCADE
	);

-- 7: df7 turnover
DROP TABLE IF EXISTS turnover;
CREATE TABLE turnover (
	id_turn SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE --
	Период_погашения_кредиторской_задолженности INT,
 	Период_оборота_запасов INT,
 	Период_погашения_дебиторской_задолженности INT,
 	Период_оборота_основных_средств INT,
 	Период_оборота_активов INT,
	FOREIGN KEY (id_turn) REFERENCES general_information(id) ON DELETE CASCADE ON UPDATE CASCADE
	);


-- 8: df8 employee information
DROP TABLE IF EXISTS employee_information;
CREATE TABLE employee_information (
	id_empl SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE --
	Среднесписочная_численность_работников INT,
 	Оплата_труда INT,
	FOREIGN KEY (id_empl) REFERENCES general_information(id) ON DELETE CASCADE ON UPDATE CASCADE
	);



SELECT * FROM general_information WHERE Возраст_компании > 5 ;
