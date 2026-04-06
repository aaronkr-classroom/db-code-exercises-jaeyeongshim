-- dbdiagram.io를 위해 수정하기

TABLE Professor {
   professor_id int [pk]
   professor_name varchar
   deptment varchar
   salary numeric
   salary_level numeric
   hire_date date
}

TABLE Student {
	student_id int [pk]
	student_name varchar
	major varchar
}

TABLE Course {
	course_id int
	section_id int
	professor_id int
	course_name varchar
	indexes {
		(course_id, section_id) [pk]
	}
}

TABLE Enrollment {
	student_id int
	course_id int
	grade varchar
	points numeric
	enrolled_at date
	indexes {
		(student_id, course_id) [pk]
	}
}

ref: Enrollment.student_id > Student.student_id
ref: Course.professor_id > Professor.professor_id