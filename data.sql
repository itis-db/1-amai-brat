insert into activitytype(
    activitytypeid,
    name,
    sysname
)
select d.*
from (
    values(1,'Программа','Program'),
          (2,'Подпрограмма','SubProgram'),
          (3,'Проект','Project'),
          (4,'Контракт','Contract'),
          (5,'КТ','Point')
) d(activitytypeid, name, sysname)
where not exists(
    select 1 from activitytype t
    where t.activitytypeid = d.activitytypeid
);
--
insert into area(
    areaid, name
) 
select d.* 
from (
    values (1, 'Европа'),
           (2, 'Азия'),
           (3, 'Америка'),
           (4, 'Африка'),
           (5, 'Австралия'),
           (6, 'Антарктида')
) d(areaid, name)
where not exists(
    select 1 from area a
    where  a.areaid = d.areaid
);
--
insert into activity(
    activityid, 
    activitytypeid, 
    code, 
    name, 
    parentid
)
select d.* 
from (
    values (1, 1, 'A', 'Программа А', null),
           (2, 1, 'Б', 'Программа Б', null),
           (3, 2, 'A0', 'Подпрограмма А0', 1),
           (4, 2, 'Б0', 'Подпрограмма Б0', 2),
           (5, 3, 'А00', 'Проект А00', 3),
           (6, 3, 'Б00', 'Проект Б00', 4),
           (7, 4, 'А000', 'Контракт А000', 5),
           (8, 4, 'А001', 'Контракт А001', 5),
           (9, 4, 'Б000', 'Контракт Б000', 6),
           (10, 5, 'А0000', 'КТ А0000', 7),
           (11, 5, 'А0001', 'КТ А0001', 7),
           (12, 5, 'А0010', 'КТ А0010', 8),
           (13, 5, 'Б0000', 'КТ Б0000', 9)
) d(activityid, activitytypeid, code, name, parentid)
where not exists(
    select 1 from activity a 
    where a.activityid = d.activityid
);
--
insert into program(
    programid, 
    indexnum, 
    yearstart, 
    yearfinish
) 
select d.* 
from (
    values (1, 228, 1999, 2005),
           (2, 322, 2006, 2016)
) d(programid, indexnum, yearstart, yearfinish)
where not exists(
    select 1 from program p
    where p.programid = d.programid
);
--
insert into subprogram(
    subprogramid, 
    indexnum
)
select d.*
from (
    values (3, 1337),
           (4, 210)
) d(subprogramid, indexnum)
where not exists(
    select 1 from subprogram s
    where s.subprogramid = d.subprogramid
);
--
insert into project(
    projectid, 
    targetdescr
) 
select d.*
from (
    values (5, 'Какой-то проект'),
           (6, 'Другой проект')
) d(projectid, targetdescr)
where not exists(
    select 1 from project p
    where p.projectid = d.projectid
);
--
insert into contract(
    contractid, 
    areaid
) 
select d.*
from (
    values (7, 2),
           (8, 3),
           (9, 5)
) d(contractid, areaid)
where not exists(
    select 1 from contract c
    where c.contractid = d.contractid
);
--
insert into point(
    pointid, 
    plandate, 
    factdate
) 
select d.*
from (values (10, '2000-01-28'::date, '2000-02-09'::date),
             (11, '2002-07-26'::date, '2004-07-15'::date),
             (12, '2004-07-20'::date, '2004-07-10'::date),
             (13, '2012-12-21'::date, '2012-12-21'::date)
) d(pointid, plandate, factdatedate)
where not exists(
    select 1 from point p
    where p.pointid = d.pointid
);