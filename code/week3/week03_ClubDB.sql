/*
[Entities / 개체]
- Club
- Member
- MemberShip

Club
[Properties / 속성]
club_id (BIGSERIAL)
club_name (VARCHAR(50))
category (VARCHAR(30))
room_location (VARCHAR(50))

Member
[Properties / 속성]
member_id (BIGSERIAL)
name (VARCHAR(50))
student_id (VARCHAR(20))
major (VARCHAR(50))
phone (VARCHAR(20))

MemberShip
[Properties / 속성]
membership_id (BIGSERIAL)
member_id (BIGINT)
club_id (BIGINT)
join_date (DATE)
role (VARCHAR(30))
*/

CREATE TABLE Club (
    club_id BIGSERIAL PRIMARY KEY,
    club_name VARCHAR(50) NOT NULL,
    category VARCHAR(30),
    room_location VARCHAR(50)
);

CREATE TABLE Member (
    member_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    student_id VARCHAR(20) UNIQUE NOT NULL,
    major VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE MemberShip (
    membership_id BIGSERIAL PRIMARY KEY,
    member_id BIGINT NOT NULL REFERENCES member(member_id),
    club_id BIGINT NOT NULL REFERENCES club(club_id),
    join_date DATE,
    role VARCHAR(30)
);

INSERT INTO Club (club_name, category, room_location) VALUES
	('AI 연구회', '학술', '공학관 301호'),
	('축구 동아리', '체육', '운동장'),
	('밴드부', '예술', '학생회관 B1'),
	('봉사단', '봉사', '학생회관 204호'),
	('게임 개발 동아리', '학술', 'IT관 502호');

INSERT INTO Member (name, student_id, major, phone) VALUES
	('김민수', '2023001', '컴퓨터공학과', '010-1111-1111'),
	('이서연', '2023002', '경영학과', '010-2222-2222'),
	('박지훈', '2023003', '전자공학과', '010-3333-3333'),
	('최유진', '2023004', '디자인학과', '010-4444-4444'),
	('정하늘', '2023005', '소프트웨어학과', '010-5555-5555');

INSERT INTO MemberShip (member_id, club_id, join_date, role) VALUES
	(1, 1, '2025-03-10', '회장'),
	(2, 1, '2025-03-12', '회원'),
	(3, 2, '2025-03-15', '회원'),
	(4, 3, '2025-03-18', '부회장'),
	(5, 5, '2025-03-20', '회원'),
	(1, 5, '2025-03-22', '회원');

SELECT * FROM Club;
SELECT * FROM Member;
SELECT * FROM MemberShip;

SELECT * FROM member ORDER BY member_id DESC;

SELECT * FROM Club ORDER BY club_name ASC;


SELECT * FROM Member WHERE major LIKE '%공학%';

SELECT * FROM Club WHERE category = '학술';

SELECT * FROM MemberShip WHERE join_date >= '2025-03-15';