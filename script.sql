--calculate the number of students of each course;
select course.code, count(student.id) AS "Number of student" from student
inner join student_course on student.id = student_course.student_id 
right join course on course.code = student_course.course_code 
group by course.code;

select * from course
left join student_course on student_course.course_code = course.code;

create view course_lecturers_amount as
select course.code, count(lecturer_course.lecturer_id) as lecturers_amount from lecturer_course
right join course on course.code = lecturer_course.course_code
group by course.code;

create view course_students_num as
select course.code, count(student_course.student_id) as students_num
from course
left join student_course on student_course.course_code = course.code
group by course.code;

select course_students_num.code, course_students_num.students_num, 
course_lecturers_amount.lecturers_amount from course_students_num
inner join course_lecturers_amount on course_students_num.code = course_lecturers_amount.code;

with ctp(code) as
(select * from student
full join student_course on student.id = student_course.student_id
full join course on course.code = student_course.course_code
full join lecturer_course on lecturer_course.course_code = student_course.course_code
union all
select course.code, count(lecturer_course.lecturer_id) as "lecturers amount" from lecturer_course
right join course on lecturer_course.course_code = course.code
group by course.code
)
 select * from ctp;

--amount of lecturers of this course;
select count(*) from lecturer_course where lecturer_course.course_code="[couser's code]";

--name of the lecturer with the higest academic degree on this course
select lecturer_course.course_code as code, lecturer.name from lecturer
inner join academic_degree on academic_degree.id = lecturer.academic_degree
inner join lecturer_course on lecturer.id = lecturer_course.lecturer_id
inner join (select lecturer_course.course_code,
 max(academic_degree.priority) as academic_degree from academic_degree
inner join lecturer on lecturer.academic_degree = academic_degree.id
inner join lecturer_course on lecturer.id = lecturer_course.lecturer_id
group by lecturer_course.course_code);

create view max_ad as
 select lecturer_course.course_code,
  max(academic_degree.priority) as academic_degree,
  lecturer_course.lecturer_id from academic_degree
 inner join lecturer on lecturer.academic_degree = academic_degree.id
 inner join lecturer_course on lecturer.id = lecturer_course.lecturer_id
 group by lecturer_course.course_code, lecturer_course.lecturer_id;

 select * from lecturer
 inner join lecturer_course on lecturer.id = lecturer_course.lecturer_id
inner join academic_degree on academic_degree.id = lecturer.academic_degree
inner join max_ad on lecturer.id = max_ad.lecturer_id
group by lecturer.name, lecturer_course.course_code, academic_degree.priority;

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
--WITH (subquery) AS query_name
