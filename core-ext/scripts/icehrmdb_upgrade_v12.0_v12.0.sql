create table `SalaryComponentType` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`code` varchar(10) NOT NULL,
	`name` varchar(100) NOT NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `SalaryComponent` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
  `componentType` bigint(20) NULL,
  `details` text default null,
  CONSTRAINT `Fk_SalaryComponent_SalaryComponentType` FOREIGN KEY (`componentType`) REFERENCES `SalaryComponentType` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `ImmigrationStatus` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Ethnicity` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeImmigrationStatus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee` bigint(20) NOT NULL,
  `status` bigint(20) NOT NULL,
  CONSTRAINT `Fk_EmployeeImmigrationStatus_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeImmigrationStatus_Type` FOREIGN KEY (`status`) REFERENCES `ImmigrationStatus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeEthnicity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee` bigint(20) NOT NULL,
  `ethnicity` bigint(20) NOT NULL,
  CONSTRAINT `Fk_EmployeeEthnicity_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeEthnicity_Ethnicity` FOREIGN KEY (`ethnicity`) REFERENCES `Ethnicity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  primary key  (`id`)
) engine=innodb default charset=utf8;