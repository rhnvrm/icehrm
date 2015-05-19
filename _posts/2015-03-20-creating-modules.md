---
layout: post
title: Creating Modules
---

There are two types of modules in IceFramework.
	- **admin**: modules which are accessible by Admins and sometimes Managers
	- **modules** modules which can be accessed by all user levels. Any user how doesn't have a Profile attached to them won't have access to these modules

##Module directory structure

Lets assume the module is an admin module (so it should be inside ext/admin directory) and module name (and directory name) is **projects**

```
.
+-- meta.json
+-- api
|   +-- ProjectsAdminManager.php
|   +-- ProjectActionManager.php (optional)
+-- index.php
+-- lib.js
```


##meta.json

{% gist 8b8aa02c917aadf6a6be %}

 - **label** is the name of the menu item
 - **menu** is the name of the group of menus that this module will belong to
 - **order** is the order of the menu item inside group menu
 - **icon** is the font awesome icon of this menu. FA latest version is already added to ice-framework
 - **user_levels** is users with which roles have access to this modules
 - **permissions** this section defines types o permissions for each user role and default values. Values for these permissions can be updated in **System->Permissions** module. Each module will get injected with these permissions and module should decide how to handle each permission.

##ProjectsAdminManager.php

{% gist a4835dd626b8e59a7475 %}

This file defines model classes and other controlling aspects for the module. Ice-framework uses AdoDB Active record as the ORM layer. So all model classes should extend **ICEHRM_Record** class which extends the **ADOdb_Active_Record** class.

In this case we have two model classes for this module. "Client" and "Project" model classes are mapped to "Clients" and "Projects" tables respectively using **$_table** variable in each class (e.g. var $_table = 'Clients';).

If you dig deeper you would see that **ICEHRM_Record** is providing some functionalities related to security, validation and per-processing also.



