CREATE TABLE "students" (
    "id" INTEGER,
    "usn" TEXT NOT NULL UNIQUE,
    "name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "subjects" (
    "id" INTEGER,
    "subject_code" TEXT NOT NULL UNIQUE,
    "subject_name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "fourth_results" (
    "id" INTEGER,
    "student_id" INTEGER,
    "subject_id" INTEGER,
    "internal" NUMERIC NOT NULL,
    "external" NUMERIC NOT NULL,
    "total" NUMERIC NOT NULL,
    "result" TEXT NOT NULL CHECK("result" IN ("P", "F", "A")),
    PRIMARY KEY ("id"),
    FOREIGN KEY ("student_id") REFERENCES "students"("id"),
    FOREIGN KEY ("subject_id") REFERENCES "subjects"("id")
);