-- no of athletes from each country
SELECT NOC, COUNT(*) AS totalAthletes
FROM athletes
GROUP BY NOC
ORDER BY totalAthletes DESC;

-- no of female and male athletes from each country
SELECT 
    NOC,
    SUM(Female) AS female_athletes,
    SUM(Male) AS male_athletes
FROM entriesgender
JOIN athletes ON entriesgender.Discipline = athletes.Discipline
GROUP BY NOC
ORDER BY NOC;

-- gender ratio
SELECT 
    SUM(Female) AS total_female_athletes,
    SUM(Male) AS total_male_athletes,
    ROUND(SUM(Female) * 100.0 / (SUM(Female) + SUM(Male)), 2) AS female_percentage,
    ROUND(SUM(Male) * 100.0 / (SUM(Female) + SUM(Male)), 2) AS male_percentage
FROM entriesgender;

-- Top 10 countries with the highest female athlete counts
SELECT TOP 10
    a.NOC AS country_code,
    SUM(e.Female) AS total_female_athletes
FROM entriesgender e
JOIN athletes a ON e.Discipline = a.Discipline
GROUP BY a.NOC
ORDER BY total_female_athletes DESC;

-- Discipline-wise Gender Participation
SELECT 
    e.Discipline,
    SUM(e.Female) AS total_female_athletes,
    SUM(e.Male) AS total_male_athletes
FROM entriesgender e
GROUP BY e.Discipline
ORDER BY e.Discipline;


-- Countries with Highest Gold Medal Count
SELECT TOP 10
    Team_NOC AS country_code,
    SUM(Gold) AS total_gold_medals
FROM medals
GROUP BY Team_NOC
ORDER BY total_gold_medals DESC;

-- total medals won by top 10 countries
SELECT TOP 10
Team_NOC,
SUM(Gold) AS totalGold,
SUM(Silver) AS totalSilver,
SUM(Bronze) AS totalBronze
FROM medals
GROUP BY Team_NOC
ORDER BY totalGold DESC;




