-- -- -- Part 1 / Part 2 -- -- --

-- Login to MYSQ as root user and issue these commands
create user 'user'@'localhost' IDENTIFIED BY 'password';
create database mydatabasename;
grant all privileges on `mydatabasename\_%` . * TO 'user'@'localhost';

-- Log out of root user and login with the new dev user
mysql -u user -ppassword

-- Create new database with the new user
create database mydatabasename_newdatabase;

-- Switch to database created
use mydatabasename_newdatabase;

-- Create the table 
CREATE TABLE `login_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `role` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_registered` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_loggedin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
);

-- Insert values to be able to log in
insert into login_form (firstname,lastname,role,email,password) values ('admin','lastname','admin','admin@hostname',md5('password'));

-- Create site_prefs table
create table `site_prefs` (`id` int(11) not null auto_increment, `maintenance` varchar(15), primary key (`id`));
INSERT INTO site_prefs (maintenance) VALUES ('1');

-- -- -- Part 3 -- -- --

-- Create posts table
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postname` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated` varchar(255) DEFAULT NULL,
  `post` longtext NOT NULL,
  PRIMARY KEY (`id`)
);

-- -- -- MISC -- -- --

-- Add column
alter table login_form add column newcol varchar(15) after last_loggedin;

-- Remove column
alter table login_form drop column newcol;

-- Delete from table
delete from site_prefs where maintenance = "1";
