CREATE TABLE "ranks" (
    "rank" INTEGER,
    "usn" TEXT,
    "name" TEXT,
    "total" NUMERIC,
    "percentage" REAL,
    PRIMARY KEY ("rank")
);

INSERT INTO "ranks" ("usn", "name", "total", "percentage")
SELECT "usn", "name", "total", "percentage"
FROM "students"
INNER JOIN (
    SELECT "student_id", SUM("total") AS 'total', ROUND((
        (CAST(SUM("total") AS REAL) / COUNT("result"))
    ), 2) AS "percentage", IIF(COUNT("result") = "total pass", 'P', 'F') as "result", "total_pass"
    FROM "fourth_results"
    NATURAL JOIN (
        SELECT "student_id", COUNT("result") AS 'total pass'
        FROM "fourth_results"
        WHERE "result" = 'P'
        GROUP BY "student_id"
    )
    GROUP BY "student_id"
) AS 'passData' ON "passData"."student_id" = "students"."id"
ORDER BY "percentage" DESC, "total_pass" DESC;