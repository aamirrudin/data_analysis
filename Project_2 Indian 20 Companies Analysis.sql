-- Create database for the analysis
CREATE DATABASE Analysis_2;
USE Analysis_2;
-- Create table for Forbe's 50 List India
CREATE TABLE Forbes_50_list_India (
    rank INT,
    world_rank INT,
    rank_last_year INT,
    name VARCHAR(40),
    headquarters VARCHAR(40),
    revenues DECIMAL(4,2),
    profit DECIMAL(3,2),
    industry VARCHAR(40)
);
ALTER TABLE Forbes_50_list_India
ADD PRIMARY KEY (rank);

-- Inserting values into table using unconventional method
INSERT INTO Forbes_50_list_India VALUES (1,54,1,"Reliance Industry","Mumbai",86.5,7.81,"Conglomerate");
INSERT INTO Forbes_50_list_India VALUES (2,105,5,"State Bank of India","Mumbai",54.52,4.32,"Banking");
INSERT INTO Forbes_50_list_India VALUES (3,154,38,"HDFC Bank","Mumbai",22.51,5.11,"Banking");
INSERT INTO Forbes_50_list_India VALUES (4,205,23,"ICICI Bank","Mumbai",29.89,3.01,"Banking");
INSERT INTO Forbes_50_list_India VALUES (5,229,436,"Oil and Natural Gas Corps","New Delhi",66.28,6.00,"Oil and Gas");
INSERT INTO Forbes_50_list_India VALUES (6,269,49,"HDFC","Mumbai",18.48,2.91,"Financial");
INSERT INTO Forbes_50_list_India VALUES (7,385,241,"Indian Oil Corps","New Delhi",72.20,3.72,"Oil and Gas");
INSERT INTO Forbes_50_list_India VALUES (8,408,531,"Tata Steel","Calcutta",31.07,5.01,"Iron and Steel");
INSERT INTO Forbes_50_list_India VALUES (9,385,63,"Tata Consultancy Services","Mumbai",25.73,5.14,"Infotech");
INSERT INTO Forbes_50_list_India VALUES (10,432,153,"Axix Bank","Mumbai",11.41,1.71,"Banking");
INSERT INTO Forbes_50_list_India VALUES (11,484,29,"NTCP Limited","New Delhi",17.00,2.17,"Utilities");
INSERT INTO Forbes_50_list_India VALUES (12,514,148,"Larsen & Toubro","Mumbai",20.53,1.12,"Capital Goods");
INSERT INTO Forbes_50_list_India VALUES (13,539,47,"Infosys","Bangalore",16.33,2.97,"Infotech");
INSERT INTO Forbes_50_list_India VALUES (14,574,354,"JSW Steel Ltd","Mumbai",9.50,0.50,"Iron and Steel");
INSERT INTO Forbes_50_list_India VALUES (15,593,703,"Vedanta Limited","Mumbai",15.38,2.63,"Metal and Mining");
INSERT INTO Forbes_50_list_India VALUES (16,615,177,"Bharat Petroleum","Mumbai",43.20,2.59,"Oil and Gas");
INSERT INTO Forbes_50_list_India VALUES (17,628,181,"Kotak Mahindra Bank","Mumbai",7.92,1.46,"Banking");
INSERT INTO Forbes_50_list_India VALUES (18,648,473,"Hidalco Industries","Mumbai",2.44,1.60,"Metal and Mining");
INSERT INTO Forbes_50_list_India VALUES (19,710,15,"Bhati Airtel","New Delhi",14.98,0.41,"Telecommunication");
INSERT INTO Forbes_50_list_India VALUES (20,726,44,"Coal India","Calcutta",14.03,2.06,"Metal and Mining");

SELECT * FROM Forbes_50_list_India;

-- Creating new table for Indian companies rating
CREATE TABLE Indian_company (
    company_rank INT,
    rating DECIMAL(2,1),
    review INT,
    company_type VARCHAR(40),
    age INT,
    FOREIGN KEY(company_rank) REFERENCES Forbes_50_list_India(rank) ON DELETE SET NULL
);

-- Inserting values into table using unconventional method
INSERT INTO Indian_company VALUES (1,3.9,26300,"public",53);
INSERT INTO Indian_company VALUES (2,4,20500,"public",32);
INSERT INTO Indian_company VALUES (3,3.9,18700,"private",27);
INSERT INTO Indian_company VALUES (4,4,18500,"public",27);
INSERT INTO Indian_company VALUES (5,4,16200,"public",27);
INSERT INTO Indian_company VALUES (6,3.8,14800,"public",76);
INSERT INTO Indian_company VALUES (7,3.7,14000,"public",54);
INSERT INTO Indian_company VALUES (8,3.8,13700,"public",45);
INSERT INTO Indian_company VALUES (9,3.9,13400,"public",40);
INSERT INTO Indian_company VALUES (10,3.6,12800,"public",35);
INSERT INTO Indian_company VALUES (11,4,11900,"private",24);
INSERT INTO Indian_company VALUES (12,3.8,11500,"public",28);
INSERT INTO Indian_company VALUES (13,4.2,11400,"public",3);
INSERT INTO Indian_company VALUES (14,4,11100,"public",83);
INSERT INTO Indian_company VALUES (15,4,10900,"public",14);
INSERT INTO Indian_company VALUES (16,4.1,10700,"public",110);
INSERT INTO Indian_company VALUES (17,4.1,10500,"public",38);
INSERT INTO Indian_company VALUES (18,4.2,9500,"private",17);
INSERT INTO Indian_company VALUES (19,4,9400,"private",14);
INSERT INTO Indian_company VALUES (20,3.8,7400,"public",18);

SELECT * FROM Indian_company;

-- Find the 10 most profitable company
SELECT * FROM Forbes_50_list_India ORDER BY revenues DESC LIMIT 10;

-- Determine the average company's revenues from Forbes 50
SELECT AVG(revenues) from Forbes_50_list_India;

-- Determine the sum of of all company's revenues
SELECT SUM(revenues) FROM Forbes_50_list_India;

-- The total number of industry listed in Forbes
SELECT COUNT(industry), industry 
FROM Forbes_50_list_India
GROUP BY industry;

-- Determine the total revenues from Oil and Gas industry
SELECT SUM(revenues), industry
FROM Forbes_50_list_India
GROUP BY industry;

-- Find the the top 10 companies with the highest rating and review
SELECT Indian_company.company_rank, Indian_company.rating, Indian_company.review, Forbes_50_list_India.name, Forbes_50_list_India.headquarters
FROM Indian_company
JOIN Forbes_50_list_India
ON Indian_company.company_rank = Forbes_50_list_India.rank
LIMIT 10;