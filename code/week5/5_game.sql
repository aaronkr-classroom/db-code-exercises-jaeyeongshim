create table UserAccount (
	user_id int PRIMARY KEY,
	email varchar(100),
	password varchar(100),
	crated_at TIMESTAMP
);

create table Character (
	character_id int PRIMARY KEY,
	user_id int,
	name varchar(100),
	level int,
	class varchar(100),
	FOREIGN KEY (user_id) REFERENCES UserAccount (user_id)
);

create table Item (
	item_id int PRIMARY KEY,
	name varchar(100),
	type varchar(50)
);

create table Inventory (
	character_id int,
	item_id int,
	quantuty int,
	PRIMARY KEY (character_id, item_id),
	FOREIGN KEY (character_id) REFERENCES Character (character_id),
	FOREIGN KEY (item_id) REFERENCES Item (item_id)
);