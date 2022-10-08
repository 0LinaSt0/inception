/* to create new database with command "IF NOT EXISTS" which help to avoid errors 
	in the event that the database name we've chosen already exists: 
	it just doesn't create new database with same name*/
CREATE DATABASE IF NOT EXISTS `my_database`;
/*to create new user with password*/
CREATE USE 'msalena'@'%' IDENTIFIED BY 'mdbpasswd';
/*to give grants for created user msalena:
	GRANT [type_of_grant] ON [level_of_grent] TO [username]*/
GRANT ALL PRIVILEGES ON *.* TO 'msalena'@'msalena.42.fr';
/* to save privileges */
FLUSH PRIVILEGES;

/*??????????????????????????????????*/
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';