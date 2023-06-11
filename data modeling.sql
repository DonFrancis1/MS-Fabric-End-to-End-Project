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

/*hypertension Dimesions*/
SELECT DISTINCT
    hypertension as hypertension_key,
    CASE 
        WHEN hypertension = '1' THEN 'Yes' 
        ELSE 'No'
    END AS hypertension
FROM stroke

/*heart_disease Dimesions*/
SELECT DISTINCT
    heart_disease as heart_disease_key,
    CASE 
        WHEN heart_disease = '1' THEN 'Yes' 
        ELSE 'No'
    END AS heart_disease
FROM stroke

/*stroke Dimesions*/
SELECT DISTINCT
    stroke as stroke_key,
    CASE 
        WHEN stroke = '1' THEN 'Yes' 
        ELSE 'No'
    END AS stroke
FROM stroke


/*ever_married Dimesions*/
SELECT DISTINCT
    CASE 
        WHEN ever_married = 'Yes' THEN '1'
        ELSE '0'
    END AS ever_married_key,
    ever_married
FROM stroke


/*work_type Dimesions*/
SELECT DISTINCT
    CASE 
        WHEN work_type = 'Self-employed' THEN '1'
        WHEN work_type = 'Never_worked' THEN '2'
        WHEN work_type = 'children' THEN '3'
        WHEN work_type = 'Govt_job' THEN '4'
        WHEN work_type = 'Private' THEN '5'
    END AS work_type_key,
    work_type
FROM stroke


/*Residence_type Dimesions*/
SELECT DISTINCT
    CASE 
        WHEN Residence_type = 'Rural' THEN '0'
        WHEN Residence_type = 'Urban' THEN '1'
    END AS Residence_type_key,
   Residence_type
FROM stroke

/*Diabetes_status Dimesions*/
SELECT DISTINCT
    CASE 
        WHEN avg_glucose_level <= 80 THEN '1'
        WHEN avg_glucose_level > 80 AND avg_glucose_level <= 100 THEN '2'
        WHEN avg_glucose_level > 100 AND avg_glucose_level < 125 THEN '3'
        WHEN avg_glucose_level > 125 THEN '4'
    END AS Diabetes_status_key,
    CASE 
        WHEN avg_glucose_level <= 80 THEN 'hypoglycemic'
        WHEN avg_glucose_level > 80 AND avg_glucose_level <= 100 THEN 'Normal'
        WHEN avg_glucose_level > 100 AND avg_glucose_level < 125 THEN 'Prediabetes'
        WHEN avg_glucose_level > 125 THEN 'Diabetic'
    END AS Diabetes_status
FROM stroke;

/*bmi Dimesions*/
SELECT DISTINCT
    CASE 
        WHEN bmi <= 18.5 THEN '1'
        WHEN bmi > 18.5 AND bmi <= 24.9 THEN '2'
        WHEN bmi > 24.9 AND bmi <= 29.9 THEN '3'
        WHEN bmi > 29.9 THEN '4'
    END AS bmi_key,
    CASE 
        WHEN bmi <= 18.5 THEN 'underweight'
        WHEN bmi > 18.5 AND bmi <= 24.9 THEN 'Normal Weight'
        WHEN bmi > 24.9 AND bmi <= 29.9 THEN 'Overweight'
        WHEN bmi > 29.9 THEN 'Obese'
    END AS bmi_status
FROM stroke

/*smoking_status Dimesions*/
SELECT DISTINCT
    CASE 
        WHEN smoking_status = 'never smoked' THEN '1'
        WHEN smoking_status = 'smokes' THEN '2'
        WHEN smoking_status = 'formerly smoked' THEN '3'
        WHEN smoking_status = 'Unknown' THEN '4'
    END AS smoking_status_key,
    smoking_status
FROM stroke

SELECT * FROM stroke

/*Fact table*/
SELECT 
    id, 
    CASE 
        WHEN gender = 'Male' THEN '1'
        WHEN gender = 'Female' THEN '2' 
        ELSE '3'
    END AS gender_key,
    age,
    hypertension as hypertension_key,
    heart_disease as heart_disease_key,
    CASE 
        WHEN ever_married = 'Yes' THEN '1'
        ELSE '0'
    END AS ever_married_key,
    CASE 
        WHEN work_type = 'Self-employed' THEN '1'
        WHEN work_type = 'Never_worked' THEN '2'
        WHEN work_type = 'children' THEN '3'
        WHEN work_type = 'Govt_job' THEN '4'
        WHEN work_type = 'Private' THEN '5'
    END AS work_type_key,
    CASE 
        WHEN Residence_type = 'Rural' THEN '0'
        WHEN Residence_type = 'Urban' THEN '1'
    END AS Residence_type_key,
    avg_glucose_level,
     CASE 
        WHEN smoking_status = 'never smoked' THEN '1'
        WHEN smoking_status = 'smokes' THEN '2'
        WHEN smoking_status = 'formerly smoked' THEN '3'
        WHEN smoking_status = 'Unknown' THEN '4'
    END AS smoking_status_key,
      CASE 
        WHEN avg_glucose_level <= 80 THEN '1'
        WHEN avg_glucose_level > 80 AND avg_glucose_level <= 100 THEN '2'
        WHEN avg_glucose_level > 100 AND avg_glucose_level < 125 THEN '3'
        WHEN avg_glucose_level > 125 THEN '4'
    END AS Diabetes_status_key,
    bmi,
    CASE 
        WHEN bmi <= 18.5 THEN '1'
        WHEN bmi > 18.5 AND bmi <= 24.9 THEN '2'
        WHEN bmi > 24.9 AND bmi <= 29.9 THEN '3'
        WHEN bmi > 29.9 THEN '4'
    END AS bmi_key,
    stroke as stroke_key

FROM stroke