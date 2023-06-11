# MS-Fabric-End-to-End-Project

Stroke Prediction: In this project, we will predict whether a patient will have a heart stroke or not based on his/her comorbidities, work, and lifestyle.
 The project requires Data ingestion and orchestration, Data Cleaning, Data Visualiation and Machine learning Model(SVM). The following Microsoft Fabric workload were used for the project delivery:
 
    1. Data Engineering(Data Factory & Synpase Engineering)
    2. Data Science
    3. Data Analysis(Power BI) 
    
## Project Architecture
![Frame 1](https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/f2c8422b-248f-4c8b-a14e-29a12cd92130)


Inside a Fabric enabled workspace, the following assets were created to deliver this project
![Inkedfabric assets_LI](https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/93973390-d7fc-40fc-b859-751ea15faed8)

### Data Engineering

The Dataset for this project was extracted, transformed and Loaded into an already created lakehouse using dataflow gen2 that opens up the Power Query online. On Power query, the lakehouse destination must be specified before publishing.  
![Frame 1](https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/92e6544d-3f5e-42eb-bb28-88b4292ef15a)

The Published Dataflow was then ingested and orchestrated using data factory. In the pipeline, a dataflow activity was created and ran successfully (note that pipeline for this project is actually not compulsory but in case other pipeline activities like copy activtity are reqiured before loading the entire dataset into the lakehouse). Tables in Lakehouses are based on delta storage format. 

<img width="920" alt="pipeline" src="https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/ec9a1442-9b6d-499c-b1cf-e5a5c3260988">

The stroke dataset is now available in the lakehouse 
<img width="920" alt="image" src="https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/0a8c1261-aab5-4791-a0f8-433088699959">

The lakehouse comes with SQL endpoint that allows the use of SQL queries to explore the dataset. 
At this stage, SQL views were created for the fact and dimension tables for the BI model using some SQL queries.
<img width="920" alt="sql queries" src="https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/c1260f57-9e45-4a34-9de2-23f57677b602">


### Exploratory Data Analysis and Visualization
Data model was created based off the SQL views for the fact and dimension tables. DAX measures were created for the visualization.
<img width="919" alt="model" src="https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/81fd28e6-a523-4a81-9881-b119553b7b8e">

The visualization was created, however, viusualization capabilities and experience here is not as seamless like the power BI desktop. Interestingly, I was able connect to the SQL endpoint in Power BI deskstop using the SQL endpoint connection string. it then occured to me that bringing in the dataset into Power BI desktop using import mode will be duplicating my dataset neither do I want to use direct query mode  because I have a small dataset. I will go ahead to do the visualization in Power BI desktop later but this is worthy of mention since the idea of fabric onelake is to avoid duplication of data within our tenant. 

<img width="920" alt="viz 1" src="https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/e476ccd8-9239-4f13-ad5d-030614a6d4cb">

<img width="917" alt="viz 2" src="https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/ea14f419-ef1c-4a67-9233-bd6ee2698154">


### Machine Learning Model (Support Vector Machine)
Spark note was created to build the machine learning model after it was connected to the existing lakehouse. This is the first machine learning model I will be building leveraging the UI of fabric and ChatGPT to write the the machine learning model codes. The model accuracy is 95%. However, I dont know what to do with the results of this model. I will be collaborating with my Data scientist friend to wrap up this project to a more insightful outcome. 

<img width="920" alt="p1" src="https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/dc333207-3643-436a-a896-14cc1d761e05">

<img width="913" alt="p2" src="https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/ffafa4aa-1a5d-4294-b12a-bbc2c8cebe14">
<img width="918" alt="p3" src="https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/0a87a155-7c16-4fa9-9580-1d71d33ef0f5">
<img width="919" alt="p4" src="https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/d97e7c53-88ca-4b06-ab5f-38f96a42962a">
<img width="920" alt="p5" src="https://github.com/DonFrancis1/MS-Fabric-End-to-End-Project/assets/88105784/ac452d4d-9bc1-4966-ac67-cc310151a6f7">

It was a very rewarding and exciting experience. I am so thrilled at the possiblities with fabric and I cannot wait to witness the co-pilot coming to public preview. 
Link to dataset here: 
https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset



