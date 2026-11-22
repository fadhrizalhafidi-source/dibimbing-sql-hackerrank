WITH student_grade AS
(
    SELECT
        s.name AS student_name,
        g.grade,
        s.marks
    FROM Students s
    INNER JOIN Grades g
        ON s.marks BETWEEN g.min_mark AND g.max_mark
)
SELECT
    CASE
        WHEN grade < 8 THEN NULL
        ELSE student_name
    END AS name,
    grade,
    marks
FROM student_grade
ORDER BY
    grade DESC,
    name ASC,
    marks ASC;
