/*
[요구사항]
1. 회원가입 시 아이디(이메일)와 비밀번호, 휴대폰 번호, 닉네임을 삽입한다.
2. 동록된 사용자 정보를 조회할 수 있어야 한다.
3. 동일한 닉네임은 지정할 수 없다. 
4. 캐릭터의 레벨은 1 이상이어야 한다. 
5. 사용자가 삭제되면 연결된 캐릭터의 정보도 함께 삭제되어야 한다. 
------------------------------------------------------------------
game_users table
[Entities / 개체]
- game_users

[Properties / 속성]
- user_id        (BIGSERIAL)      -- 숫자 자동 증가, Primary Key
- email          (VARCHAR(50))    -- 이메일
- password       (VARCHAR(50))    -- 비밀번호
- phone          (VARCHAR(15))    -- 전화번호
- nickname       (VARCHAR(30))    -- 닉네임, UNIQUE
- created_at     (TIMESTAMPTZ)    -- 가입 시간
------------------------------------------------------------------
characters table
[Entities / 개체]
- characters

[Properties / 속성]
- characters_id   (BIGSERIAL)      	 -- 숫자 자동 증가, Primary Key
- user_id         (BIGINT/BIGSERIAL) -- 사용자 번호, Foreign Key
- character_name  (VARCHAR(30))      -- 캐릭터 이름
- level           (INT)              -- 캐릭터 레벨, CHECK(level >= 1)
*/

CREATE TABLE game_users(
	user_id bigserial primary key,
	email varchar(50) not null,
	password varchar(50) not null,
	phone varchar(15) not null,
	nickname varchar(30) not null unique,
	created_at timestamptz not null default current_timestamp
);

create table characters(
	characters_id bigserial primary key,
	user_id bigserial,
	character_name varchar(30) not null,
	level int not null check (level >= 1),
	constraint fk_characters_user
		foreign key (user_id)
		references game_users(user_id)
		on delete cascade
		on update cascade
);

select * from game_users;
select * from characters;

INSERT INTO game_users (email, password, phone, nickname) VALUES
	('kim123@example.com', 'pass1234', '010-1234-5678', '용사김'),
	('lee456@example.com', 'qwer5678', '010-2345-6789', '마법사이'),
	('park789@example.com', 'abcd9999', '010-3456-7890', '궁수박');

INSERT INTO characters (user_id, character_name, level) VALUES
	(1, 'FireKnight', 10),
	(2, 'IceWizard', 7),
	(3, 'WindArcher', 15);