SELECT * FROM stroke

SELECT COUNT(id) FROM stroke

/*Gender Dimesions*/
SELECT DISTINCT
    CASE 
        WHEN gender = 'Male' THEN '1'
        WHEN gender = 'Female' THEN '2' 
        ELSE '3'
    END AS gender_key,
    gender
FROM stroke
