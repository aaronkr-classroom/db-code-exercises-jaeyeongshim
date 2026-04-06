TABLE UserAccount {
	user_id int [pk]
	email varchar
	password varchar
	crated_at TIMESTAMP
}

TABLE Character {
	character_id int [pk]
	user_id int
	name varchar
	level int
	class varchar
	indexes {
		(user_id)
	}
}

TABLE Item {
	item_id int [pk]
	name varchar
	type varchar
}

TABLE Inventory {
	character_id int
	item_id int
	quantuty int
	indexes {
		(character_id, item_id) [pk]
	}
}

Ref: Character.user_id > UserAccount.user_id
Ref: Inventory.character_id > Character.character_id
Ref: Inventory.item_id > Item.item_id