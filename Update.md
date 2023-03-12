
  # Photographic evidence of the product backlog delivered and a summary of Sprint 2.

Created a windows server 2022 VM in VMWare VM-DC1 to promote to domain controller.
Created VM-SQL1 to install SQL server, SSMS and SSRS on it and add a db instance. 
Installed SQL Server 2022 to setup the accounts, instance, and dependencies.
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


    Updated product burn-down chart showing two data points; backlog to capacity breakdown and work reduction.

https://docs.google.com/spreadsheets/d/1u5XJ4MzHy3MJsqE2SozMDI7P8lz4wBUvd0Zbgft36Fc/edit?usp=sharing

## Retrospective experience within the project sprints.
