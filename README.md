# Sample Databases for Azure Database for MySQL flexible server 

There are two sample database options for you to use: 
- [Polls database](./polls-database) : Use this schema to create a polls application 
- [Community tutorials](./mysqltutorial.org) from [mysqltutorial.org](https://www.mysqltutorial.org/) - mysql sample database and also postgres version of the same database 

**You can use the runtime of your choice (Python, PHP, .NET , Node JS etc) to build using these samples.** Note that this repository only contains sample databases schema with some data. It does not contain any application code. 


## Getting Started
Follow the steps below to install these scripts out on your server. 

### Prerequisites

- You need an Azure subscription. Sign up for Free trial and you can get 12 months free with [Azure Database for MySQL Flexilbe server](https://docs.microsoft.com/en-us/azure/mysql/flexible-server/how-to-deploy-on-azure-free-account).
- You need to install a client to install the schema and data. You can install Azure CLI or MySQL Client tool like mysql.exe or MYSQL Workbench. 

## Installation using Azure CLI 
1. Install [Azure CLI ](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli). If ou have Azure CLI installed , please run ```az upgrade``` to make sure you are suing the latest Azure CLI version. 
2. Create Azure database for MySQL Flexible server with public access 
``` az mysql flexible-server create --name mydemoserver --public-access all ```
3. Import data using ```execute``` command. 
``` az mysql flexible-server execute -n mysqlservername -u adminuser -p "adminpassword" -f "path to pollsdb.sql"```

## Installation using mysql.exe 
Install [MySQL command line client tool](https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-install.html) and then run the following command. Make sure to replace the server name , username and database name with the correct values . SSL is enforced by default hence --ssl-mode is required.  You also need to [download the public SSL certificate](https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem).

### Connect with SSL 
```mysql -h  mysqlservername.database.azurecom -u adminusername -p database_name --ssl-mode=REQUIRED --ssl-ca=DigiCertGlobalRootCA.crt.pem < pollsdb.sql```

### Connect without SSL 
SSL can be turned off for the server. See [how to disable SSL](https://docs.microsoft.com/en-us/azure/mysql/flexible-server/how-to-connect-tls-ssl#disable-ssl-enforcement-on-your-flexible-server).

```mysql -h  mysqlservername.database.azurecom -u adminusername -p database_name < pollsdb.sql```

## Installtion using MySQL Workbench 
Checkout this tutorial on how to connect with [MySQL Workbench](https://docs.microsoft.com/en-us/azure/mysql/flexible-server/connect-workbench). You can copy and paste the script in the query window and execute it. 

## Resources
Azure Database for MySQL Flexible Server [Documentation](https://docs.microsoft.com/en-us/azure/mysql/flexible-server/)

