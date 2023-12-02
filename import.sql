CREATE TABLE "temp" (
    "usn" TEXT,
    "student_name" TEXT,
    "subject_code" TEXT,
    "subject_name" TEXT,
    "internal" NUMERIC,
    "external" NUMERIC,
    "total" NUMERIC,
    "result" TEXT
);

.import --csv --skip 1 dataCopy.csv temp

DELETE FROM "temp"
WHERE "usn" = "";

INSERT INTO "subjects" ("subject_code", "subject_name")
SELECT "subject_code", "subject_name"
FROM "temp"
GROUP BY "subject_code";

INSERT INTO "students" ("usn", "name")
SELECT "usn", "student_name"
FROM "temp"
GROUP BY "usn";

INSERT INTO "fourth_results" ("student_id", "subject_id", "internal", "external", "total", "result")
SELECT (
    SELECT "id"
    FROM "students"
    WHERE "temp"."usn" = "students"."usn"
) AS "student_id",
(
    SELECT "id"
    FROM "subjects"
    WHERE "subjects"."subject_code" = "temp"."subject_code"
) AS "subject_id",
"internal", "external", "total", "result"
FROM "temp";