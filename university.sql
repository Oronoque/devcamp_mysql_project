USE university_schema;

-- The average grade that is given by each professor
SELECT professor_id, AVG(grade) AS average_grade FROM Grades GROUP BY professor_id;

-- The top grades for each student:
SELECT student_name, MAX(grade) AS highest_grade FROM Students INNER JOIN Grades ON Students.student_id = Grades.student_id GROUP BY student_name;

-- Group students by the courses that they are enrolled in:
SELECT Students.student_name, Courses.course_name
FROM Students
INNER JOIN Grades ON Students.student_id = Grades.student_id
INNER JOIN Courses ON Grades.course_id = Courses.course_id
ORDER BY Courses.course_name;

-- Summary report of courses & their average grades, sorted most to least challenging (lowest to highest grades)
SELECT Courses.course_name, AVG(Grades.grade) AS average_grade 
FROM Courses 
INNER JOIN Grades ON Courses.course_id = Grades.course_id 
GROUP BY Courses.course_name 
ORDER BY AVG(Grades.grade) ASC;

-- Which student & professor have the most courses in common
SELECT Students.student_name, Professors.professor_name, COUNT(*) AS common_courses 
FROM Students 
INNER JOIN Grades ON Students.student_id = Grades.student_id 
INNER JOIN Professors ON Grades.professor_id = Professors.professor_id 
GROUP BY Students.student_name, Professors.professor_name 
ORDER BY common_courses DESC LIMIT 1;
