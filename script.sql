--calculate the number of students of each course;
select course.code, count(*) AS "Number of student" from student
inner join student_course on student.id = student_course.student_id 
inner join course on course.code = student_course.course_code 
group by course.code;

--amount of lecturers of this course;
select count(*) from lecturer_course where lecturer_course.course_code="[couser's code]";

--name of the lecturer with the higest academic degree on this course
select lecturer.name from lecturer
inner join academic_degree on academic_degree.id = lecturer.academic_degree
inner join lecturer_course on lecturer.id = lecturer_course.lecturer_id
where academic_degree.priority = (select max(academic_degree.priority) from academic_degree
inner join lecturer on lecturer.academic_degree = academic_degree.id
inner join lecturer_course on lecturer.id = lecturer_course.lecturer_id
and lecturer_course.course_code = "[couser's code]")
and lecturer_course.course_code = "[couser's code]"
limit 1;

--name of the semester in which this course was selected more often
select semester.name from semester
inner join student_semester on semester.id = student_semester.semester_id
inner join course_semester on course_semester.semester_id = semester.id
and course_semester.course_code = "[couser's code]"
group by semester.name, semester.id
order by count(semester.id) desc
limit 1;

--number of inactive users for this course
select count(*) from user_account
full join student_user on student_user.user_id = user_account.id
full join lecturer_user on lecturer_user.user_id = user_account.id
full join student_course on student_course.student_id = student_user.student_id
full join lecturer_course on lecturer_course.lecturer_id = lecturer_user.lecturer_id
where user_account.is_active = false
and (lecturer_course.course_code = 'M1'
or student_course.course_code = 'M1');
 
--https://www.postgresql.org/docs/9.1/tutorial-window.html
