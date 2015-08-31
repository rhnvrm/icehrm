ALTER TABLE Users ADD COLUMN user_roles text null;
ALTER TABLE Users ADD COLUMN `default_module` bigint(20) null after `employee`;
ALTER TABLE Modules ADD COLUMN user_roles text null AFTER `user_levels`;
ALTER TABLE Modules ADD COLUMN label varchar(100) NOT NULL AFTER `name`;

create table `UserRoles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) default null,
  primary key  (`id`),
  unique key `name` (`name`)
) engine=innodb default charset=utf8;

ALTER TABLE  `Users` CHANGE  `user_level`  `user_level` enum('Admin','Employee','Manager','Other') default NULL;

create table `EmployeeEducationsTemp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `education_id` bigint(20) NULL,
  `employee` bigint(20) NOT NULL,
  `institute` varchar(400) default null,
  `date_start` date default '0000-00-00',
  `date_end` date default '0000-00-00',
  primary key  (`id`)
) engine=innodb default charset=utf8;

insert into EmployeeEducationsTemp select * from EmployeeEducations;

drop table EmployeeEducations;

create table `EmployeeEducations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `education_id` bigint(20) NULL,
  `employee` bigint(20) NOT NULL,
  `institute` varchar(400) default null,
  `date_start` date default '0000-00-00',
  `date_end` date default '0000-00-00',
  CONSTRAINT `Fk_EmployeeEducations_Educations` FOREIGN KEY (`education_id`) REFERENCES `Educations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeEducations_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  primary key  (`id`)
) engine=innodb default charset=utf8;

insert into EmployeeEducations select * from EmployeeEducationsTemp;

drop table EmployeeEducationsTemp;

UPDATE `Settings` set value = '1' where name = 'System: Reset Modules and Permissions';
UPDATE `Settings` set value = '1' where name = 'System: Add New Permissions';

