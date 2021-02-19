create table faculties
(
    id   int auto_increment
        primary key,
    Name varchar(45) not null
);

create table departments
(
    id         int auto_increment
        primary key,
    Name       varchar(45) not null,
    Faculty_id int         not null,
    constraint departments_faculties_id_fk
        foreign key (Faculty_id) references faculties (id)
);

create table `groups`
(
    id            int auto_increment
        primary key,
    Name          varchar(20) not null,
    Department_id int         not null,
    constraint group_Name_uindex
        unique (Name),
    constraint groups_departments_id_fk
        foreign key (Department_id) references departments (id)
);

create table students
(
    id        int auto_increment
        primary key,
    FirstName varchar(45)  not null,
    LastName  varchar(45)  not null,
    Phone     varchar(20)  null,
    Email     varchar(255) not null,
    Password  varchar(255) not null,
    Group_id  int          not null,
    constraint students_Email_uindex
        unique (Email),
    constraint students_Phone_uindex
        unique (Phone),
    constraint students_group_id_fk
        foreign key (Group_id) references `groups` (id)
);

create table subjects
(
    id   int auto_increment
        primary key,
    Name varchar(45) not null
);

create table marks
(
    id         int auto_increment
        primary key,
    Mark       float null,
    Student_id int   not null,
    Subject_id int   not null,
    constraint Marks_students_id_fk
        foreign key (Student_id) references students (id),
    constraint Marks_subjects_id_fk
        foreign key (Subject_id) references subjects (id)
);

create table teachers
(
    id            int auto_increment
        primary key,
    FirstName     varchar(45)  not null,
    LastName      varchar(45)  not null,
    Email         varchar(255) not null,
    Phone         varchar(20)  null,
    Password      varchar(255) not null,
    Department_id int          not null,
    constraint Teachers_departments_id_fk
        foreign key (Department_id) references departments (id)
);

create table groupteachersubject
(
    Group_id   int not null,
    Subject_id int not null,
    Teacher_id int not null,
    constraint GroupTeacherSubject_departments_id_fk
        foreign key (Subject_id) references subjects (id),
    constraint GroupTeacherSubject_groups_id_fk
        foreign key (Group_id) references `groups` (id),
    constraint GroupTeacherSubject_teachers_id_fk
        foreign key (Teacher_id) references teachers (id)
);


