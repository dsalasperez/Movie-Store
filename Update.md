David Salas Perez
Chris Brooks
IS470
March 9, 2023

  ## Photographic evidence of the product backlog delivered and a summary of Sprints.

## 1Tools Used
-	VMWare Workstation Pro, SSMS, SSRS, VS
-	Windows Server 2022, SQL Server, DC, DNS, AD

Progamming Languages
- SQL

Systems DNS Hosts
- VM-DC1, VM-SQL1, SQLServerDB, VM-DEV
- 
![image](https://user-images.githubusercontent.com/125078009/224527416-ee53a95c-a733-493c-941d-7855950806cf.png)
![image](https://user-images.githubusercontent.com/125078009/224527410-1f7517af-c6cd-4b05-995a-7c70a911a35a.png)
![image](https://user-images.githubusercontent.com/125078009/224527431-61712e8d-e0cf-4d9b-8f22-e3cedf0dcf18.png)

Created a windows server 2022 VM in VMWare VM-DC1 to promote to domain controller.
Created VM-SQL1 to install SQL server, SSMS and SSRS on it and add a db instance. 
Installed SQL Server 2022 to setup the accounts, instance, and dependencies.

![image](https://user-images.githubusercontent.com/125078009/224527950-10b7041d-7bea-4ea8-ba98-114a014673f0.png)

Added ISDev domain

![image](https://user-images.githubusercontent.com/125078009/224527964-5ecf3998-1ac9-43d1-8ff3-71081969033a.png)
![image](https://user-images.githubusercontent.com/125078009/224527971-06126d4b-a044-4531-95cc-9b11d617a416.png)

Finalized

![image](https://user-images.githubusercontent.com/125078009/224527978-43d1bf68-a339-4038-8aa1-790aceba37af.png)

Then verified the service as a server in sql server configuration manager. You can see I had created two instances one default SQLEXPRESS and the other ISWOU

![image](https://user-images.githubusercontent.com/125078009/224527984-84fd19b0-e9f6-4d1b-af8a-0245245eb928.png)


Then I had to enable TCP/IP under SQL Server Network configuration > Protocols for MSSQLSERVER 

![image](https://user-images.githubusercontent.com/125078009/224527996-553ae179-8cf0-4884-a105-f34420b50127.png)

Created Inbound firewall rule to allow port 1433 otherwise I can’t connect to the db instance 

![image](https://user-images.githubusercontent.com/125078009/224527999-16478c86-97a1-4a07-817b-7c67ccab2838.png)

The SQL account was used for the SSMS connection

![image](https://user-images.githubusercontent.com/125078009/224528007-275128e4-abef-431e-ae46-5c2a5f4268db.png)

I need to import the VideoStore database code by creating a new database.
I right clicked on the MovieStoreDB and selected New Query  

![image](https://user-images.githubusercontent.com/125078009/224528015-8ff1ca17-c4c5-4468-90d5-ee857ec2c89f.png)

Then inject the SQL code in VideoStoreDB yet since the database video store was created in SSMS, I will use that then follow with injection execution commands.
It did not take long to execute the injection query.  

![image](https://user-images.githubusercontent.com/125078009/224528020-60a083c0-9489-4151-9c5c-384c9b205a0a.png)

I double check the tables and columns and run a query to return all data within the table  

![image](https://user-images.githubusercontent.com/125078009/224528024-4910e92a-c3a8-4134-b6ae-a15ded58cf4d.png)

Perfect, now I am able to begin the SSRS integration before the web search applications
In SSRS configuration manager and connected to the SQL server VM-SQL1
The sqldev account can be used as the service account or not. I use ISDev 

![image](https://user-images.githubusercontent.com/125078009/224528033-31677b92-351c-4e5d-b9bb-aed24c1ee88d.png)

Then in Database I entered the instance admin credentials and tested connection  

![image](https://user-images.githubusercontent.com/125078009/224528036-c92c7583-a92a-425e-a223-5b151977551d.png)

Followed the promp by entering database name “ISProject” and credential authentication will be the service account credentials 
Ensured the process is successful  

![image](https://user-images.githubusercontent.com/125078009/224528043-91ab2d92-9498-4588-821f-59d2370d59f9.png)

Now the Web Service URL must be established before the Web Portal URL. TCP Port is 80 because I do not have a cert for HTTPS yet this can be changed at a later time 

![image](https://user-images.githubusercontent.com/125078009/224528051-9570e4ec-8fa3-4622-92be-3010a42acc48.png)

In Web Portal URL I clicked apply and ensure the process is successfull  

![image](https://user-images.githubusercontent.com/125078009/224528055-c421f7a2-509a-4817-8f90-7214a044fded.png)

I used the default directories for both web service and portal
Now I need to test both web links. Therefore, I initiated them to ensure I can see a connection and typed the admin password which is the DC1 admins password since VM-SQL1 is in the domain. However, once I setup and delegate access permissions then I could log in to SSRS or use the web interface as another user with less access. 

![image](https://user-images.githubusercontent.com/125078009/224528063-46cd8d34-262d-41b6-b8c1-c7533818950f.png)

The administrator account is to apply or remove access where needed for admins to use. In this case since I am doing this project, I am using domain admin to not bottleneck my movement.  

![image](https://user-images.githubusercontent.com/125078009/224528066-907ea8ab-9b9b-441f-9e22-98b6b13a1a2e.png)

Setup Windows 10 Education VM with Visual Studio Enterprise 2022 
Install SQL Server Data Tools in Visual Studio in the W10 host. 
Setup connections in VS to SSRS database reports then apply configuration properties.  
Open VS and start a Report Server Project
Right click on Reports and select New Item  

![image](https://user-images.githubusercontent.com/125078009/224528073-106cef31-ebd5-476b-aa86-0a99c86b07dd.png)

Then Select Report
Right click on Data Sources and Add Data Source  

![image](https://user-images.githubusercontent.com/125078009/224528077-57420345-07c4-4214-922f-27a497bb383f.png)

I named it ISProjectDB then select Build on the lower right
Data Source is Microsoft SQL Server, Server name is VM-SQL1 (I created it in the SQL server previously) 
Then select a database to connect to using SQL Server Authentication which is the sa account and password
Once authenticated we can view the databases and I selected VideoStoreDB  

![image](https://user-images.githubusercontent.com/125078009/224528089-9a92fc8b-3db8-4ba7-a428-ad854f7981d0.png)

Test connection to make sure it succeeded then press ok, ok 

![image](https://user-images.githubusercontent.com/125078009/224528096-1da8a126-c68b-4aa9-839c-efe9593f863c.png)

Now we can run a small test before we begin a web report.
Add a dataset and select Use a dataset embedded in my report and make sure it is the ISProjectDB data source  

![image](https://user-images.githubusercontent.com/125078009/224528101-c83e8e2b-354a-464c-bde6-5e5239a4dc87.png)


Then go to Query Designer to add code.
I create an easy SELECT SQL query to run.  

![image](https://user-images.githubusercontent.com/125078009/224528106-da331566-c108-4539-9ca3-e320599cbb64.png)

In query designer when I add “SELECT * FROM Movie” it will inset all the column titles. Then insert those values to the dataset like so

![image](https://user-images.githubusercontent.com/125078009/224528108-096363c8-37a0-4ec6-b6f7-cd6498091f03.png)

It is working! Let us push this to the ssrs server! Before that I must add a parameter and table in order for a user or myself have the ability to search for movies on the web from any computer as long as it is in the domain, has access or permissions to the server, even across a vpn if it is setup that way.
Right click on the white space to add a table.  

![image](https://user-images.githubusercontent.com/125078009/224528111-d4dc1897-ee6d-4549-bb70-fb4a811d4b22.png)

I added a title and now I just need to add the values I want the query to pull.  

![image](https://user-images.githubusercontent.com/125078009/224528116-932ecdc3-86d9-459f-9110-8a6378a9bc72.png)

Let’s go with Movie title, vhs and dvd price.  

![image](https://user-images.githubusercontent.com/125078009/224528121-1991108c-7d66-4a70-9fc6-b2f62ddfc560.png)

Also, we can add expressions for the text box, we can add expressions anywhere like header and footer to show page numbers or the same title across different pages. For now, I just want to keep it simple.
Under parameters right click and add a new parameter then named it Movie and prompt it for Search for Movies  

![image](https://user-images.githubusercontent.com/125078009/224528128-e3d3b314-e620-4ce2-b6bc-c343fbac54f4.png)

However, when I ask it to pull for values, it lists many values but I can only select one. The reason for that is because I only had one dataset called Movies with many values. 

![image](https://user-images.githubusercontent.com/125078009/224528132-1db2bb37-73e1-4e17-a838-e7de9423ecdc.png)

I have to create a new dataset and named it SearchMovies  

![image](https://user-images.githubusercontent.com/125078009/224528140-126dea9d-cbfa-48a6-b601-e0e58a27a13b.png)

Included a simple search for movies. 
In the Movie parameter now, I’ve selected one value to return titles  

![image](https://user-images.githubusercontent.com/125078009/224528145-3fb1f3f1-98d0-4f66-b834-f69aa4973ba8.png)

Next in Preview mode, I can search for movies! Here is the list. 

![image](https://user-images.githubusercontent.com/125078009/224528151-8441e4e3-63c0-4e20-96f8-4da2eea01293.png)

I selected the movie titled “Into the Wild” and view the report  

![image](https://user-images.githubusercontent.com/125078009/224528154-31f6aba1-da09-435d-b0cf-fbdaa577246e.png)

Impressive! One thing to not forget to avoid displaying a full list even after selecting one value is to include the parameter for the query in the dataset  

![image](https://user-images.githubusercontent.com/125078009/224528159-682f0351-2cc3-4da9-8924-e18a75e8b2f6.png)

One last thing before I deploy it is to add a Description within the Report Properties  

![image](https://user-images.githubusercontent.com/125078009/224528162-d0605512-9611-4c63-9e8e-f04a34f1d461.png)

Now for the great moment! Push this out to development or test.
Save all files first. Then I went back to the SSRS server which is the SQL virtual machine. To gather the URL

![image](https://user-images.githubusercontent.com/125078009/224528168-2b0e788a-d253-4596-ab8a-251063f5728a.png)

  
Then we also get the file directory where this report will be deployed to  

![image](https://user-images.githubusercontent.com/125078009/224528174-415f7dfb-891d-4f77-9f6f-1f171ed789f3.png)

I right clicked on ISProject the solution for the report. Then changed the TaretServerURL and TargetReportFolder to match what I had setup in VM-SQL1
I clicked OK and now right clicked on the report (changed the name to MovieList)  

![image](https://user-images.githubusercontent.com/125078009/224528180-c5135909-7411-4e11-9f36-64543c42a3ea.png)

Then selected Deploy.
If we look at the SSRS web we can now see the data that was deployed  

![image](https://user-images.githubusercontent.com/125078009/224528186-c08b5827-aae8-4fd5-b0c6-dc70576707f4.png)

![image](https://user-images.githubusercontent.com/125078009/224528191-1c738ccb-baba-4e50-a17f-fd6e82c974c6.png)

![image](https://user-images.githubusercontent.com/125078009/224528197-22ae8885-b9a7-427a-944a-6dd2e4d27d78.png)

This is it. It is a long process, but this is the right way to set it up with a domain, the VMs separated not in the DC. Also, setting up security settings and configuring access. There is much more to do with it like setting up GitHub in VS and a repository with a dev, test, and prod branch. It can also be used with DevOps.



    Updated product burn-down chart showing two data points; backlog to capacity breakdown and work reduction.

## 2
https://docs.google.com/spreadsheets/d/1u5XJ4MzHy3MJsqE2SozMDI7P8lz4wBUvd0Zbgft36Fc/edit?usp=sharing

##3 
Retrospective experience within the project sprints.
