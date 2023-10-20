create table if not exists activitytype
(
    activitytypeid integer not null
        constraint pk_activitytype
            primary key,
    name           text    not null,
    sysname        text    not null
);

create table if not exists area
(
    areaid integer not null primary key,
    name   text    not null
);

create table if not exists activity
(
    activityid     integer not null
        primary key,
    activitytypeid integer not null
        constraint activitytype_fkey
            references activitytype,
    code           text    not null,
    name           text    not null,
    parentid       integer
        constraint fk_activity_parent
            references activity
);

create table if not exists subprogram
(
    subprogramid integer not null,
    indexnum     integer,
    constraint subprogram_pkey primary key (subprogramid),
    constraint subprogramid_fkey foreign key (subprogramid)
        references activity
);

create table if not exists project
(
    projectid   integer not null,
    targetdescr text,
    constraint project_pkey primary key (projectid),
    constraint projectid_fkey foreign key (projectid)
        references activity
);

create table if not exists program
(
    programid  integer not null primary key,
    indexnum   integer,
    yearstart  integer,
    yearfinish integer,
    constraint programid_fkey foreign key (programid)
        references activity
);

create table if not exists point
(
    pointid  integer not null primary key,
    plandate date    not null,
    factdate date,
    constraint pointid_fkey foreign key (pointid)
            references activity
);

create table if not exists contract
(
    contractid integer not null primary key,
    areaid     integer not null,
    constraint contractid_fkey foreign key (contractid)
        references activity,
    constraint areaid_fkey foreign key (areaid)
        references area    
);
