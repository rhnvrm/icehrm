---
layout: post
title: Installation
---

## Download and install

Download the latest release from [GitHub] (https://github.com/thilinah/icehrm/releases/latest) 

Copy the downloaded file to the path you want to install iCE Hrm in your server and extract.

Create a mysql DB for and user. Grant all on iCE Hrm DB to new DB user.

Visit iCE Hrm installation path in your browser.

During the installation form, fill in details appropriately.

Once the application is installed use the username = admin and password = admin to login to your system.

Note: Please rename or delete the install folder (<ice hrm root>/app/install) since it could pose a security threat to your iCE Hrm instance.

## Manual Installation

**(1) Following values are assumed for bellow instructions:**
DB Name: icehrm_db
User: icehrm_user
Password: icehrm_user_pwd
 
**For linux users**
 
Installation path: /var/www/mycompany.com/icehrm/
Url to installation path: http://mycompany.com/icehrm/
Log file path: /tmp/icehrm.log
 
**For Windows users**
 
Installation path: c:\xampp\htdocs\icehrm\
Url to installation path: http://mycompany.com/icehrm/
Log file: C:\xampp\apache\logs\icehrm.log
 
 
**(2) Create a mysql DB for icehrm**

create database icehrm_db;
grant all on icehrm_db.* to 'icehrm_user'@'localhost' identified by 'icehrm_user_pwd';


**(3) Create tables**
Run following two scripts on your database
1. <icehrm_path>/scripts/icehrmdb.sql
2. <icehrm_path>/scripts/icehrm_master_data.sql


**(4) Provide permissions to required folders**
Please make sure data folder is writable by the web server user

If you are a windows user you can skip this step. But make your web server has necessary permissions to create files in data folder
 sudo chmod 777 <icehrm_path>/data/

**(5) Configure **
Compare values in step(1) with following text and create your own configurations with values you are using.
Assuming values in step (1) config.php for your linux server should look like this:

```php
<?php
ini_set('error_log', '/tmp/icehrm.log');
define('CLIENT_NAME', 'app');
define('APP_BASE_PATH', '/var/www/mycompany.com/icehrm/');
define('CLIENT_BASE_PATH', '/var/www/mycompany.com/icehrm/app/');
define('BASE_URL','http://mycompany.com/icehrm/');
define('CLIENT_BASE_URL','http://mycompany.com/icehrm/app/');
define('APP_DB', 'icehrm_db');
define('APP_USERNAME', 'icehrm_user');
define('APP_PASSWORD', 'icehrm_user_pwd');
define('APP_HOST', 'localhost');
define('APP_CON_STR', 'mysql://'.APP_USERNAME.':'.APP_PASSWORD.'@'.APP_HOST.'/'.APP_DB);
//file upload
define('FILE_TYPES', 'jpg,png,jpeg');
define('MAX_FILE_SIZE_KB', 10 * 1024);
```


Assuming values in step (1) config.php for your windows server should look like this:
```php
<?php
ini_set('error_log', 'C:\xampp\apache\logs\icehrm.log');
define('CLIENT_NAME', 'app');
define('APP_BASE_PATH', 'c:\xampp\htdocs\icehrm\');
define('CLIENT_BASE_PATH', 'c:\xampp\htdocs\icehrm\app\');
define('BASE_URL','http://mycompany.com/icehrm/');
define('CLIENT_BASE_URL','http://mycompany.com/icehrm/app/');
define('APP_DB', 'icehrm_db');
define('APP_USERNAME', 'icehrm_user');
define('APP_PASSWORD', 'icehrm_user_pwd');
define('APP_HOST', 'localhost');
define('APP_CON_STR', 'mysql://'.APP_USERNAME.':'.APP_PASSWORD.'@'.APP_HOST.'/'.APP_DB);
//file upload
define('FILE_TYPES', 'jpg,png,jpeg');
define('MAX_FILE_SIZE_KB', 10 * 1024);
```


**(6) Create Configuration file**
Create file <icehrm path>/app/config.php
Copy contents in step(5) into this file
Delete folder <icehrm path>app/install/