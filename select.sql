# 1.Query the existence of 1 course
SELECT 
    *
FROM
    student_course
WHERE
    courseId = 1;
# 2.Query the presence of both 1 and 2 courses
SELECT 
    *
FROM
    student_homework.student_course
WHERE
    courseId = 1 OR courseId = 2;
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT 
    student.id, student.name, AVG(score) AS avg_score
FROM
    student
        LEFT JOIN
    student_course ON student.id = student_course.studentId
GROUP BY id , name
HAVING avg_score >= 60;
# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT 
    *
FROM
    student
        LEFT JOIN
    student_course ON student.id = student_course.studentId
WHERE
    student_course.score IS NULL;
# 5.Query all SQL with grades
SELECT 
    score
FROM
    student_course;
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT 
    id, name, age, sex
FROM
    student
        JOIN
    student_course ON student.id = student_course.studentId
WHERE
    student_course.courseId = 1
        AND student.id = 2;
# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT 
    student.*, student_course.score
FROM
    student
        JOIN
    student_course ON student.id = student_course.studentId
WHERE
    student_course.courseId = 1
        AND student_course.score < 60
ORDER BY score DESC;
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT 
    courseId, name, AVG(score) AS avg_score
FROM
    student_course
        LEFT JOIN
    course ON student_course.courseId = course.id
GROUP BY courseId , name
ORDER BY avg_score DESC , courseId ASC;
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT 
    student.name, student_course.score
FROM
    student
        JOIN
    student_course ON student.id = student_course.studentId
        JOIN
    course ON student_course.courseId = course.id
WHERE
    course.name = 'Math'
        AND student_course.score < 60;