---
layout: post
title: Default Modules
---

## System -> User Module

This module is used to define users who can logged into the system. Each user has a user level. By default framework supports Admin,
Manager and Profile roles.

	- Admin - has access to all system functions
	- Manager - has access to some administrative functions and can act as a supervisor for Profiles
	- Profile - a normal non admin user

One you add a user into this module, a notification will be sent to the specified email address with a password.

## Admin -> Profile Module

In Ice-framework users and profiles are seperated. Profile store the general information about a person while user object for the profile store login
information.

## System -> Settings Module

Store system wide settings

## System -> 'Manage Modules' Module

All the modules available in the installation is listed here. Here you many disable and enable modules if required.

## System -> Manage Permissions Module

Permissions for each module for each user level can be defined in meta.json file in Ice-Framework modules. This module allows admin to control permissions for each user level.
