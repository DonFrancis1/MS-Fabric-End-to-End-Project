#!/usr/bin/env python
# coding: utf-8

# ## stroke notebook
# 
# 
# 

# # Loading Data

# In[1]:


#The sql code for fact table view was used to change all the features into number that the machine model can train
data = spark.sql("SELECT id, CASE WHEN gender = 'Male' THEN '1'WHEN gender = 'Female' THEN '2'  ELSE '3'END AS gender_key,age,hypertension as hypertension_key,heart_disease as heart_disease_key,CASE WHEN ever_married = 'Yes' THEN '1'ELSE '0'END AS ever_married_key,CASE WHEN work_type = 'Self-employed' THEN '1' WHEN work_type = 'Never_worked' THEN '2' WHEN work_type = 'children' THEN '3'WHEN work_type = 'Govt_job' THEN '4' WHEN work_type = 'Private' THEN '5'END AS work_type_key,CASE WHEN Residence_type = 'Rural' THEN '0' WHEN Residence_type = 'Urban' THEN '1'END AS Residence_type_key,avg_glucose_level,CASE WHEN smoking_status = 'never smoked' THEN '1'WHEN smoking_status = 'smokes' THEN '2'WHEN smoking_status = 'formerly smoked' THEN '3'WHEN smoking_status = 'Unknown' THEN '4' END AS smoking_status_key,CASE WHEN avg_glucose_level <= 80 THEN '1'WHEN avg_glucose_level > 80 AND avg_glucose_level <= 100 THEN '2'WHEN avg_glucose_level > 100 AND avg_glucose_level < 125 THEN '3'WHEN avg_glucose_level > 125 THEN '4'END AS Diabetes_status_key,bmi,CASE WHEN bmi <= 18.5 THEN '1'WHEN bmi > 18.5 AND bmi <= 24.9 THEN '2'WHEN bmi > 24.9 AND bmi <= 29.9 THEN '3'WHEN bmi > 29.9 THEN '4'END AS bmi_key,stroke as stroke_key FROM Stroke.stroke")

display(data)


# # Switching Dataframe from Spark to Pandas

# In[2]:


import pandas as pd

df = data.toPandas()
display(df)


# # Importing Necessary Libraries

# In[3]:


from sklearn import svm
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score


# In[4]:


# Extract the features and target variable
obesity = df.bmi_key
hypertension = df.hypertension_key
glucose_level = df.avg_glucose_level
heart_disease = df.heart_disease_key
smoking = df.smoking_status_key
stroke_status = df.stroke_key


# In[5]:


#feautures engineering
features = list(zip(obesity,hypertension,glucose_level,heart_disease,smoking))


# In[6]:


# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(features, stroke_status, test_size=0.2, random_state=42)


# In[7]:


# Create an SVM classifier
clf = svm.SVC()


# In[8]:


# Train the SVM classifier
clf.fit(X_train, y_train)


# In[9]:


# Predict the labels for the test set
y_pred = clf.predict(X_test)


# In[10]:


# Calculate the accuracy of the model
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)

