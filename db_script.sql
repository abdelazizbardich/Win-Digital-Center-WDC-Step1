create table if not exists Admin
(
    id           int auto_increment
        primary key,
    firstname    varchar(20)  null,
    lastname     varchar(20)  null,
    login        varchar(20)  null,
    password     varchar(300) null,
    phone_number varchar(15)  null,
    email        varchar(50)  null,
    status       tinyint(1)   null
);

create table if not exists Exercice
(
    id         int auto_increment
        primary key,
    title      varchar(100) null,
    year       int          null,
    status     varchar(20)  null,
    start_date datetime     null,
    end_date   datetime     null,
    constraint CHK_ExerciceStatus
        check (`status` in (_utf8mb4\'InProgress\',_utf8mb4\'Completed\'))
);

create table if not exists Participant
(
    id           int auto_increment
        primary key,
    firstname    varchar(30) null,
    lastname     varchar(20) null,
    phone_number varchar(15) null,
    email        varchar(50) null,
    domain       varchar(30) null,
    structure    varchar(50) null
);

create table if not exists Responsible
(
    id           int auto_increment
        primary key,
    firstname    varchar(20) null,
    lastname     varchar(20) null,
    phone_number varchar(15) null,
    domain       varchar(20) null,
    type         varchar(20) null,
    constraint CHK_ResponsibleType
        check (`type` in (_utf8mb4\'Formateur\',_utf8mb4\'Intervenant\'))
);

create table if not exists Activity
(
    id             int auto_increment
        primary key,
    title          varchar(100) null,
    description    varchar(200) null,
    type           varchar(20)  null,
    status         varchar(20)  null,
    end_date       datetime     null,
    start_date     datetime     null,
    exercice_id    int          not null,
    responsible_id int          not null,
    constraint Activity_Exercice_id_fk
        foreign key (exercice_id) references Exercice (id)
            on update cascade on delete cascade,
    constraint Activity_Responsible_id_fk
        foreign key (responsible_id) references Responsible (id)
            on update cascade on delete cascade,
    constraint CHK_ActivityStatus
        check (`status` in (_utf8mb4\'Enabled\',_utf8mb4\'Disabled\')),
	constraint CHK_ActivityType
		check (`type` in (_utf8mb4\'Formateur\',_utf8mb4\'Talk\',_utf8mb4\'Event\'))
);

create table if not exists Participate
(
    attendance     tinyint(1) null,
    activity_id    int        not null,
    participant_id int        not null,
    constraint Participate_Activity_id_fk
        foreign key (activity_id) references Activity (id)
            on update cascade on delete cascade,
    constraint Participate_Participant_id_fk
        foreign key (participant_id) references Participant (id)
            on update cascade on delete cascade
);
