create table Users (
 id int not null IDENTITY(1,1) primary key,
 username varchar(100) not null,
 password varchar(100) not null 
);

create table PeopleData (
 id int not null identity(1,1) primary key,
 firt_name varchar(200),
 middle_name varchar(200),
 last_name varchar(200),
 user_id int not NULL
);

alter table PeopleData add foreign key (user_id) REFERENCES Users(id);


BEGIN
	DECLARE @cnt INT = 0;

	WHILE @cnt < 10
	BEGIN 
		DECLARE @usr VARCHAR(100) = CONCAT('user_name', @cnt);
   		DECLARE @pwd VARCHAR(100) = CONCAT('password', @cnt);
	
		INSERT INTO docker_test.dbo.Users(username, password)
		VALUES(@usr, @pwd)
	
	
		INSERT INTO docker_test.dbo.PeopleData(firt_name, last_name, user_id)
		VALUES('First Name', 
			'Last Name', 
			( select id from Users WHERE username = @usr AND password = @pwd ) 
		)
	SET @cnt = @cnt + 1;
	END;
END;



