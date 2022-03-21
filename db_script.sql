create table exercises
(
    exercise_id bigintnot null primary key,
    end_date    datetime     null,
    start_date  datetime     null,
    status      int          null,
    title       varchar(255) null,
    year        int          null
);

create table activities
(
    activity_id bigintnot null primary key,
    description varchar(255) null,
    end_date    datetime     null,
    start_date  datetime     null,
    status      int          null,
    title       varchar(255) null,
    type        int          null,
    exercise_id bigint       null,
    constraint FK3sh39x4up3miyhby7op2fldca
        foreign key (exercise_id) references exercises (exercise_id)
);

create table responsible_types
(
    responsible_type_id bigintnot null primary key,
    type                varchar(255) null
);

create table roles
(
    role_id bigintnot null primary key,
    access  varchar(255) null,
    name    varchar(255) null
);

create table users
(
    dtype               varchar(31)  not null,
    user_id             bigintnot null primary key,
    email               varchar(255) null,
    first_name          varchar(255) null,
    last_name           varchar(255) null,
    login               varchar(255) null,
    password            varchar(255) null,
    phone_number        varchar(255) null,
    status              bit          null,
    domain              varchar(255) null,
    structure           varchar(255) null,
    role_id             bigint       null,
    responsible_type_id bigint       null,
    constraint FKj8qpdkdtc8pw024sl0hr7c5ni
        foreign key (responsible_type_id) references responsible_types (responsible_type_id),
    constraint FKp56c1712k691lhsyewcssf40f
        foreign key (role_id) references roles (role_id)
);

create table participants
(
    domain    varchar(255) null,
    structure varchar(255) null,
    user_id   bigintnot null primary key,
    constraint FKghixrahoj1s8cloinfx8lyeqa
        foreign key (user_id) references users (user_id)
);

create table participates
(
    participate_id bigint not null primary key,
    attendance     bit    null,
    activity_id    bigint null,
    participant_id bigint null,
    constraint FKck52ts3qtmhd6dkrtpe8d1d7m
        foreign key (activity_id) references activities (activity_id),
    constraint FKebm4ppnxypju3eq4s53tb9u2c
        foreign key (participant_id) references users (user_id),
    constraint FKqlw115w817ws8lnn87k83lsnq
        foreign key (participant_id) references participants (user_id)
);

create table responsibles
(
    domain              varchar(255) null,
    user_id             bigintnot null primary key,
    responsible_type_id bigint       null,
    constraint FKqxayxkk64dk4rx5i9sawlraak
        foreign key (responsible_type_id) references responsible_types (responsible_type_id),
    constraint FKrsouwttyl5ycf16jr0pgdl17m
        foreign key (user_id) references users (user_id)
);

