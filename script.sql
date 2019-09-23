--calculate the number of students of each course;
select courses.code, count(*) from students 
inner join students_courses on students.id = students_courses.student_id 
inner join courses on courses.code = students_courses.course_code 
group by courses.code;

--amount of lecturers of this course;
select count(*) from lectures_courses where course_code='M2';

--name of the lecturer with the higest academic degree on this course
select lectures.name from lectures
inner join academic_degrees on academic_degrees.id = lectures.academic_degree_id
where academic_degrees.priority = (select max(academic_degrees.priority) from academic_degrees
inner join lectures on lectures.academic_degree_id = academic_degrees.id
inner join lectures_courses on lectures.id = lectures_courses.lecture_id
and lectures_courses.course_code = 'M2');