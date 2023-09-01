CREATE TABLE "users" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int,
  "role_id" int
);

CREATE TABLE "roles" (
  "id" int PRIMARY KEY,
  "role_name" varchar
);

CREATE TABLE "courses" (
  "id" int PRIMARY KEY,
  "title" varchar,
  "description" varchar,
  "level" varchar,
  "teacher_id" int
);

CREATE TABLE "course_videos" (
  "id" int PRIMARY KEY,
  "title" varchar,
  "url" varchar,
  "course_id" int
);

CREATE TABLE "categories" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "course_categories" (
  "course_id" int,
  "category_id" int,
  "primary" key
);

CREATE TABLE "students_courses" (
  "id" int PRIMARY KEY,
  "student_id" int,
  "course_id" int
);

CREATE TABLE "user_roles" (
  "user_id" int,
  "role_id" int,
  "primary" "key(user_id, role_id)"
);

ALTER TABLE "students_courses" ADD FOREIGN KEY ("student_id") REFERENCES "users" ("id");

ALTER TABLE "students_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "user_roles" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_roles" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "users" ("id");


INSERT INTO roles (id, role_name) VALUES
  (1, 'student'),
  (2, 'teacher'),
  (3, 'admin');

INSERT INTO users (id, name, email, password, age, role_id) VALUES
  (1, 'Juan', 'juan@example.com', 'password123', 25, 1),
  (2, 'Maria', 'maria@example.com', 'securepass', 30, 2);

INSERT INTO categories (id, name) VALUES
  (1, 'Programming'),
  (2, 'Math'),
  (3, 'History');

INSERT INTO courses (id, title, description, level, teacher_id) VALUES
  (1, 'Introduction to Programming', 'Learn the basics of programming', 'Beginner', 2),
  (2, 'Advanced Mathematics', 'Advanced math concepts', 'Advanced', 2);

INSERT INTO course_videos (id, title, url, course_id) VALUES
  (1, 'Introduction to Programming: Part 1', 'https://example.com/video1', 1),
  (2, 'Advanced Math: Trigonometry', 'https://example.com/video2', 2);

INSERT INTO students_courses (id, student_id, course_id) VALUES
  (1, 1, 1),
  (2, 1, 2);

INSERT INTO user_roles (user_id, role_id) VALUES
  (1, 1),
  (2, 2);