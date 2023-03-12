David Salas Perez
Chris Brooks
IS470
March 9, 2023

  # Photographic evidence of the product backlog delivered and a summary of Sprints.

Tools Used
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
![image](https://user-images.githubusercontent.com/125078009/224527416-ee53a95c-a733-493c-941d-7855950806cf.png)
Added ISDev domain    
Finalized 
Then verified the service as a server in sql server configuration manager. You can see I had created two instances one default SQLEXPRESS and the other ISWOU
Then I had to enable TCP/IP under SQL Server Network configuration > Protocols for MSSQLSERVER  
Created Inbound firewall rule to allow port 1433 otherwise I can’t connect to the db instance 
The SQL account was used for the SSMS connection  
I need to import the VideoStore database code by creating a new database.
I right clicked on the MovieStoreDB and selected New Query  
Then inject the SQL code in VideoStoreDB yet since the database video store was created in SSMS, I will use that then follow with injection execution commands.
It did not take long to execute the injection query.  
I double check the tables and columns and run a query to return all data within the table  
Perfect, now I am able to begin the SSRS integration before the web search applications
In SSRS configuration manager and connected to the SQL server VM-SQL1
The sqldev account can be used as the service account or not. I use ISDev 
Then in Database I entered the instance admin credentials and tested connection  
Followed the promp by entering database name “ISProject” and credential authentication will be the service account credentials 
Ensured the process is successful  
Now the Web Service URL must be established before the Web Portal URL. TCP Port is 80 because I do not have a cert for HTTPS yet this can be changed at a later time 
In Web Portal URL I clicked apply and ensure the process is successfull  
I used the default directories for both web service and portal
Now I need to test both web links. Therefore, I initiated them to ensure I can see a connection and typed the admin password which is the DC1 admins password since VM-SQL1 is in the domain. However, once I setup and delegate access permissions then I could log in to SSRS or use the web interface as another user with less access. 
The administrator account is to apply or remove access where needed for admins to use. In this case since I am doing this project, I am using domain admin to not bottleneck my movement.  
Setup Windows 10 Education VM with Visual Studio Enterprise 2022 
Install SQL Server Data Tools in Visual Studio in the W10 host. 
Setup connections in VS to SSRS database reports then apply configuration properties.  
Open VS and start a Report Server Project
Right click on Reports and select New Item  
Then Select Report
Right click on Data Sources and Add Data Source  
I named it ISProjectDB then select Build on the lower right
Data Source is Microsoft SQL Server, Server name is VM-SQL1 (I created it in the SQL server previously) 
Then select a database to connect to using SQL Server Authentication which is the sa account and password
Once authenticated we can view the databases and I selected VideoStoreDB  
Test connection to make sure it succeeded then press ok, ok 
Now we can run a small test before we begin a web report.
Add a dataset and select Use a dataset embedded in my report and make sure it is the ISProjectDB data source  

Then go to Query Designer to add code.
I create an easy SELECT SQL query to run.  
In query designer when I add “SELECT * FROM Movie” it will inset all the column titles. Then insert those values to the dataset like so
It is working! Let us push this to the ssrs server! Before that I must add a parameter and table in order for a user or myself have the ability to search for movies on the web from any computer as long as it is in the domain, has access or permissions to the server, even across a vpn if it is setup that way.
Right click on the white space to add a table.  
I added a title and now I just need to add the values I want the query to pull.  
Let’s go with Movie title, vhs and dvd price.  
Also, we can add expressions for the text box, we can add expressions anywhere like header and footer to show page numbers or the same title across different pages. For now, I just want to keep it simple.
Under parameters right click and add a new parameter then named it Movie and prompt it for Search for Movies  
However, when I ask it to pull for values, it lists many values but I can only select one. The reason for that is because I only had one dataset called Movies with many values. 
I have to create a new dataset and named it SearchMovies  
Included a simple search for movies. 
In the Movie parameter now, I’ve selected one value to return titles  
Next in Preview mode, I can search for movies! Here is the list. 
I selected the movie titled “Into the Wild” and view the report  
Impressive! One thing to not forget to avoid displaying a full list even after selecting one value is to include the parameter for the query in the dataset  
One last thing before I deploy it is to add a Description within the Report Properties  
Now for the great moment! Push this out to development or test.
Save all files first. Then I went back to the SSRS server which is the SQL virtual machine. To gather the URL
  
Then we also get the file directory where this report will be deployed to  
I right clicked on ISProject the solution for the report. Then changed the TaretServerURL and TargetReportFolder to match what I had setup in VM-SQL1
I clicked OK and now right clicked on the report (changed the name to MovieList)  
Then selected Deploy.
If we look at the SSRS web we can now see the data that was deployed  
This is it. It is a long process, but this is the right way to set it up with a domain, the VMs separated not in the DC. Also, setting up security settings and configuring access. There is much more to do with it like setting up GitHub in VS and a repository with a dev, test, and prod branch. It can also be used with DevOps.



    Updated product burn-down chart showing two data points; backlog to capacity breakdown and work reduction.

https://docs.google.com/spreadsheets/d/1u5XJ4MzHy3MJsqE2SozMDI7P8lz4wBUvd0Zbgft36Fc/edit?usp=sharing

## Retrospective experience within the project sprints.

# Photos below
![image](https://user-images.githubusercontent.com/125078009/224527416-ee53a95c-a733-493c-941d-7855950806cf.png)
![image](https://user-images.githubusercontent.com/125078009/224527410-1f7517af-c6cd-4b05-995a-7c70a911a35a.png)
![image](https://user-images.githubusercontent.com/125078009/224527431-61712e8d-e0cf-4d9b-8f22-e3cedf0dcf18.png)
![image](https://user-images.githubusercontent.com/125078009/224527436-23845189-2039-458a-a2d0-f61ef8962ea5.png)
![image](https://user-images.githubusercontent.com/125078009/224527439-8068b0cb-f06e-4269-97a0-f4c196500fe5.png)
![image](https://user-images.githubusercontent.com/125078009/224527443-6134bbaf-8b09-4f19-a124-22f771c1c994.png)
![image](https://user-images.githubusercontent.com/125078009/224527452-cd81499f-3e23-488f-a594-994a5ea42722.png)
![image](https://user-images.githubusercontent.com/125078009/224527457-6ea8c8fb-99ef-45d2-af55-1743ba09c71c.png)
![image](https://user-images.githubusercontent.com/125078009/224527461-db4abbfc-c525-42d9-b197-e2100a03d7d5.png)
![image](https://user-images.githubusercontent.com/125078009/224527464-f8fb76d1-be7c-447f-9aec-a7e3fbeee6e6.png)
![image](https://user-images.githubusercontent.com/125078009/224527468-4f77794d-8a14-44a1-81a6-dd038c3a59a7.png)
![image](https://user-images.githubusercontent.com/125078009/224527470-f0e04509-a771-41b7-81da-23ad85e4d3f6.png)
![image](https://user-images.githubusercontent.com/125078009/224527473-4b1c9a37-6cd6-4f99-9c11-296211f4c3c1.png)
![image](https://user-images.githubusercontent.com/125078009/224527478-09a1d5f2-1ab1-4467-8f7d-74981d124aba.png)
![image](https://user-images.githubusercontent.com/125078009/224527482-f968eefe-449b-43e1-b76b-c3ce48ac8442.png)
![image](https://user-images.githubusercontent.com/125078009/224527486-c047d613-ede0-4322-8efc-c995f24b35ee.png)
![image](https://user-images.githubusercontent.com/125078009/224527490-7d37e7f6-0323-4d78-9ab9-b0569e3662bb.png)
![image](https://user-images.githubusercontent.com/125078009/224527492-c7a675bf-78f4-43a1-8264-8bce847fe556.png)
![image](https://user-images.githubusercontent.com/125078009/224527493-76c2b40d-e55f-4f48-9063-85f0a673bc4d.png)
![image](https://user-images.githubusercontent.com/125078009/224527495-7a63c715-91d3-4692-975d-5b0f3844e008.png)
![image](https://user-images.githubusercontent.com/125078009/224527497-abe4f961-7676-46bd-8226-d6a3bcaa1dc4.png)
![image](https://user-images.githubusercontent.com/125078009/224527502-2233534b-8e72-4057-ba36-87ab7532a979.png)
![image](https://user-images.githubusercontent.com/125078009/224527503-556a0a88-2bfc-4a5a-bf50-dbd2a148525c.png)
![image](https://user-images.githubusercontent.com/125078009/224527510-cffe2ccd-d0bb-4f4a-93c6-049bb539396e.png)
![image](https://user-images.githubusercontent.com/125078009/224527513-65fa2ab3-b80f-402b-b902-feffbe38e704.png)
![image](https://user-images.githubusercontent.com/125078009/224527520-5f1f70d6-1e5c-47aa-9863-a44a8e22dd7e.png)
![image](https://user-images.githubusercontent.com/125078009/224527521-4316d5df-53c8-41bc-becc-e025a45b8464.png)
![image](https://user-images.githubusercontent.com/125078009/224527523-c314ccf0-853b-4f10-a701-b94fafeaf12d.png)
![image](https://user-images.githubusercontent.com/125078009/224527524-e0d98a86-bf7b-4be4-879f-24e6f18e117c.png)
![image](https://user-images.githubusercontent.com/125078009/224527527-ca24bedd-9710-419e-a108-92d3afe571d1.png)
![image](https://user-images.githubusercontent.com/125078009/224527528-8ddf85ff-88d6-431e-bef0-862a1d04c5e2.png)
![image](https://user-images.githubusercontent.com/125078009/224527530-fadfc06e-3800-49d0-9e96-fc71830f70ed.png)
![image](https://user-images.githubusercontent.com/125078009/224527535-8aa526db-13be-4949-89cd-05cca5d58a04.png)
![image](https://user-images.githubusercontent.com/125078009/224527536-03c2d075-1b0b-4c42-9b56-276782dc5a8f.png)
![image](https://user-images.githubusercontent.com/125078009/224527539-c0d5be5b-b115-4b0c-8d59-2748ed4527b8.png)
![image](https://user-images.githubusercontent.com/125078009/224527540-205672d2-36e6-4952-9af6-ab527049e093.png)
![image](https://user-images.githubusercontent.com/125078009/224527541-d5cca4c7-55b9-4f07-8dcb-a1af5449a473.png)
![image](https://user-images.githubusercontent.com/125078009/224527545-9080fe1f-85e3-41a4-820a-60496a7c38fd.png)
![image](https://user-images.githubusercontent.com/125078009/224527547-8f3b7a4d-8746-4545-bfba-5bf684ec96c1.png)
![image](https://user-images.githubusercontent.com/125078009/224527549-004048d3-a378-4475-bcdb-5acfc2e1ee7c.png)
![image](https://user-images.githubusercontent.com/125078009/224527550-fd42c850-8ac3-46f0-85aa-b039ee6003a1.png)
![image](https://user-images.githubusercontent.com/125078009/224527554-86bda82e-5bd1-4512-a157-8b278f69c30d.png)
![image](https://user-images.githubusercontent.com/125078009/224527556-feb27b36-3f04-4cae-8f28-d455379f834b.png)
![image](https://user-images.githubusercontent.com/125078009/224527560-5d6522a6-ed17-493d-94d1-5230e878920d.png)









