CREATE VIEW "named_data" AS
SELECT "students"."usn" AS 'usn', "students"."name" AS 'Student Name', "subjects"."subject_code" AS 'Subject Code', "subjects"."subject_name" as 'Subject Name', "internal", "external", "total", "result"
FROM "fourth_results"
INNER JOIN "students" ON "students"."id" = "fourth_results"."student_id"
INNER JOIN "subjects" ON "subjects"."id" = "fourth_results"."subject_id"
ORDER BY "USN";

CREATE VIEW "total_result" AS
SELECT "usn", "name", "total", "percentage", "result"
FROM "students"
INNER JOIN (
    SELECT "student_id", SUM("total") AS 'total', ROUND((
        (CAST(SUM("total") AS REAL) / COUNT("result"))
    ), 2) AS "percentage", IIF(COUNT("result") = "total pass", 'P', 'F') as "result"
    FROM "fourth_results"
    NATURAL JOIN (
        SELECT "student_id", COUNT("result") AS 'total pass'
        FROM "fourth_results"
        WHERE "result" = 'P'
        GROUP BY "student_id"
    )
    GROUP BY "student_id"
) AS 'passData' ON "passData"."student_id" = "students"."id";

CREATE VIEW "subject_result" AS
SELECT *
FROM "subjects"
NATURAL JOIN (
    SELECT "subject_id" AS "id", "total pass" AS 'pass', (COUNT("subject_id") - "total pass") AS 'fail', COUNT("subject_id") AS 'total'
    FROM "fourth_results"
    NATURAL JOIN (
        SELECT "subject_id", COUNT("result") AS 'total pass'
        FROM "fourth_results"
        WHERE "result" = 'P'
        GROUP BY "subject_id"
    )
    GROUP BY "subject_id"
);
