prompt PL/SQL Developer Export Tables for user C##SQL@XE
prompt Created by user on יום ראשון 07 יולי 2024
set feedback off
set define off

prompt Creating GUEST...
create table GUEST
(
  guest_id      INTEGER not null,
  first_name    VARCHAR2(20) not null,
  last_name     VARCHAR2(20) not null,
  phone         VARCHAR2(11) not null,
  date_of_birth DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table GUEST
  add constraint PK_GUEST primary key (GUEST_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROOM...
create table ROOM
(
  room_number INTEGER not null,
  beds        INTEGER not null,
  balcony     VARCHAR2(4) not null,
  price       INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOM
  add constraint PK_ROOM primary key (ROOM_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BOOKING...
create table BOOKING
(
  guest_id    INTEGER not null,
  room_number INTEGER not null,
  entry_date  DATE not null,
  days        INTEGER not null,
  em_id       INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BOOKING
  add constraint PK_BOOKING primary key (ENTRY_DATE, GUEST_ID, ROOM_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BOOKING
  add constraint FK_BOOKING_GUEST foreign key (GUEST_ID)
  references GUEST (GUEST_ID);
alter table BOOKING
  add constraint FK_BOOKING_ROOM_NUMBER foreign key (ROOM_NUMBER)
  references ROOM (ROOM_NUMBER);

prompt Creating EMPLOYEE2...
create table EMPLOYEE2
(
  em_id      INTEGER not null,
  first_name VARCHAR2(20) not null,
  last_name  VARCHAR2(20) not null,
  salary     INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMPLOYEE2
  add constraint PK_EMPLOYEE2 primary key (EM_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMPLOYEE2
  add constraint SALARY_CHECK
  check (salary between 5000 and 30000);
alter table EMPLOYEE2
  add constraint SALARY_CHECKE
  check (salary between 5000 and 30000);
alter table EMPLOYEE2
  add constraint SALARY_CHECKER
  check (salary between 5000 and 30000);
alter table EMPLOYEE2
  add constraint SALARY_CHECKING
  check (salary between 5000 and 30000);

prompt Creating RESERVATIONAGENT...
create table RESERVATIONAGENT
(
  em_id            INTEGER not null,
  tech_proficiency VARCHAR2(15) not null,
  rating           INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RESERVATIONAGENT
  add constraint PK_RESERVATIONAGENT primary key (EM_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RESERVATIONAGENT
  add constraint FK_RESERVATIONAGENT_EM_ID foreign key (EM_ID)
  references EMPLOYEE2 (EM_ID);

prompt Creating INFORM...
create table INFORM
(
  em_id    INTEGER not null,
  guest_id INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INFORM
  add constraint PK_INFORM primary key (EM_ID, GUEST_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INFORM
  add constraint FK_EM_ID_INFORM foreign key (EM_ID)
  references RESERVATIONAGENT (EM_ID) on delete cascade;
alter table INFORM
  add constraint FK_INFORM_GUEST_ID foreign key (GUEST_ID)
  references GUEST (GUEST_ID);

prompt Creating RECEPTIONIST...
create table RECEPTIONIST
(
  em_id INTEGER not null,
  shift VARCHAR2(10) not null,
  lang  VARCHAR2(30) default 'English' not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RECEPTIONIST
  add constraint PK_RECEPTIONIST primary key (EM_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RECEPTIONIST
  add constraint FK_RECEPTIONIST_EM_ID foreign key (EM_ID)
  references EMPLOYEE2 (EM_ID);

prompt Creating REQUEST...
create table REQUEST
(
  guest_id    INTEGER not null,
  room_number INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REQUEST
  add constraint PK_REQUEST primary key (GUEST_ID, ROOM_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REQUEST
  add constraint FK_REQUEST_GUEST_ID foreign key (GUEST_ID)
  references GUEST (GUEST_ID);
alter table REQUEST
  add constraint FK_REQUEST_ROOM_NUMBER foreign key (ROOM_NUMBER)
  references ROOM (ROOM_NUMBER);

prompt Disabling triggers for GUEST...
alter table GUEST disable all triggers;
prompt Disabling triggers for ROOM...
alter table ROOM disable all triggers;
prompt Disabling triggers for BOOKING...
alter table BOOKING disable all triggers;
prompt Disabling triggers for EMPLOYEE2...
alter table EMPLOYEE2 disable all triggers;
prompt Disabling triggers for RESERVATIONAGENT...
alter table RESERVATIONAGENT disable all triggers;
prompt Disabling triggers for INFORM...
alter table INFORM disable all triggers;
prompt Disabling triggers for RECEPTIONIST...
alter table RECEPTIONIST disable all triggers;
prompt Disabling triggers for REQUEST...
alter table REQUEST disable all triggers;
prompt Disabling foreign key constraints for BOOKING...
alter table BOOKING disable constraint SYS_C009114;
alter table BOOKING disable constraint SYS_C009115;
prompt Disabling foreign key constraints for RESERVATIONAGENT...
alter table RESERVATIONAGENT disable constraint SYS_C009125;
prompt Disabling foreign key constraints for INFORM...
alter table INFORM disable constraint FK_EM_ID_INFORM;
alter table INFORM disable constraint SYS_C009130;
prompt Disabling foreign key constraints for RECEPTIONIST...
alter table RECEPTIONIST disable constraint SYS_C009135;
prompt Disabling foreign key constraints for REQUEST...
alter table REQUEST disable constraint SYS_C009139;
alter table REQUEST disable constraint SYS_C009140;
prompt Deleting REQUEST...
delete from REQUEST;
commit;
prompt Deleting RECEPTIONIST...
delete from RECEPTIONIST;
commit;
prompt Deleting INFORM...
delete from INFORM;
commit;
prompt Deleting RESERVATIONAGENT...
delete from RESERVATIONAGENT;
commit;
prompt Deleting EMPLOYEE2...
delete from EMPLOYEE2;
commit;
prompt Deleting BOOKING...
delete from BOOKING;
commit;
prompt Deleting ROOM...
delete from ROOM;
commit;
prompt Deleting GUEST...
delete from GUEST;
commit;
prompt Loading GUEST...
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (136720117, 'Mick', 'Boldra', '056-9638717', to_date('07-07-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (88447724, 'Donia', 'Corthes', '054-8782010', to_date('28-05-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (582544040, 'Alonso', 'McMenamy', '052-4280703', to_date('15-01-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (184886653, 'Engelbert', 'Botwright', '053-9713298', to_date('14-04-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (511178879, 'Ezechiel', 'Byrne', '058-4594796', to_date('10-08-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (682925873, 'Eve', 'Jaffra', '057-3301875', to_date('09-12-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (434645627, 'Gregoire', 'Harkes', '058-2949607', to_date('14-05-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (293806919, 'Brynn', 'Mancell', '057-2505534', to_date('05-02-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (999810624, 'Jeremy', 'Cordey', '052-4402960', to_date('05-12-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (169378918, 'Dmitri', 'Roblett', '057-6514861', to_date('15-04-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (922601322, 'Timothy', 'Stickings', '051-5446306', to_date('19-12-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (497881898, 'Kinnie', 'Hazart', '055-9214365', to_date('13-11-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (702119967, 'Tallia', 'Ruddick', '055-1160365', to_date('07-09-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (231943915, 'Jethro', 'Creebo', '059-3625685', to_date('16-07-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (955915916, 'Shanta', 'Georgeau', '059-4208824', to_date('05-09-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (605955535, 'Lauryn', 'Northridge', '053-8604791', to_date('27-12-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (763219347, 'Maryanna', 'Canland', '058-5552281', to_date('24-02-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (702225081, 'Mari', 'Schroeder', '055-0356324', to_date('16-12-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (338273592, 'Fremont', 'Clawley', '050-3282462', to_date('19-10-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (828551975, 'Lita', 'Kenrick', '054-0771910', to_date('16-07-1974', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (248308343, 'Livvy', 'Elsegood', '057-4403360', to_date('24-06-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (604312430, 'Lewie', 'Lorkins', '056-6796400', to_date('03-07-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (737403223, 'Scarface', 'Kubec', '054-0315254', to_date('18-04-1958', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (659594754, 'Travus', 'Evenden', '053-8086640', to_date('11-12-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (70435672, 'Georgie', 'Jimenez', '050-9037076', to_date('05-07-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (50654111, 'Aimil', 'Loudiane', '051-7955050', to_date('15-09-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (751452007, 'Allix', 'Filip', '057-8696234', to_date('16-09-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (748052366, 'Stacee', 'McBain', '058-6315700', to_date('20-05-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (742926916, 'Danella', 'Buxton', '053-9584655', to_date('15-07-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (283539035, 'Barris', 'St Leger', '054-1205240', to_date('02-05-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (765511772, 'Enriqueta', 'Pounder', '051-9794620', to_date('25-10-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (938616996, 'Kerwinn', 'Leadley', '058-1314807', to_date('15-03-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (359010250, 'Donella', 'Lighterness', '054-2914190', to_date('10-04-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (89883062, 'Wildon', 'Aujouanet', '057-7904777', to_date('01-12-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (664264811, 'Gerardo', 'Milroy', '053-2019666', to_date('23-10-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (712378971, 'Tabbatha', 'Skillett', '053-4691026', to_date('27-03-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (703729263, 'Roxana', 'Allibon', '057-2700422', to_date('20-09-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (868754386, 'Maitilde', 'Alban', '054-1713237', to_date('01-12-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (445018524, 'Sophi', 'Kmieciak', '055-3808298', to_date('02-02-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (610867905, 'Mathian', 'Gumby', '059-4814232', to_date('02-09-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (623452048, 'Duky', 'Foan', '053-1544232', to_date('18-04-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (163358336, 'Sammy', 'Pickles', '059-6460554', to_date('31-10-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (686816902, 'Drusy', 'Olivie', '055-2594170', to_date('25-12-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (643895054, 'Janis', 'Millmoe', '056-3933714', to_date('12-06-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (167668089, 'Anatollo', 'Maccraw', '059-7525411', to_date('02-08-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (261803388, 'Lindy', 'Phalip', '053-9993340', to_date('17-08-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (188658855, 'Neville', 'Inett', '057-9137073', to_date('12-09-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (80233433, 'Chane', 'Purver', '059-5667720', to_date('02-06-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (574019692, 'Cari', 'Zmitruk', '055-3432721', to_date('20-05-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (432145983, 'Nerti', 'Wurz', '059-5206289', to_date('14-06-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (101879583, 'Hunfredo', 'Di Bartolomeo', '052-6182829', to_date('23-07-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (677650301, 'Jacenta', 'Fencott', '056-2541420', to_date('09-12-2001', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (994568560, 'Con', 'Grinvalds', '056-9703279', to_date('24-08-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (847826183, 'Pearle', 'Gurrado', '057-2696318', to_date('19-06-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (5626957, 'Riccardo', 'Minghi', '051-5944580', to_date('26-08-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (620639250, 'Tamar', 'Tunsley', '053-4434401', to_date('07-04-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (965378605, 'Cammi', 'Meaton', '057-2269952', to_date('28-04-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (965984705, 'Christian', 'Mapstone', '053-1895958', to_date('25-09-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (891595119, 'Sosanna', 'Willbraham', '053-3512094', to_date('12-06-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (599065821, 'Petey', 'Magrannell', '051-8643850', to_date('11-07-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (301650658, 'Bondie', 'Beausang', '051-6765814', to_date('25-12-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (662662733, 'Devan', 'Duprey', '050-9311145', to_date('25-06-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (873947658, 'Abigael', 'Crouse', '052-5985188', to_date('13-05-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (216971089, 'Elia', 'Corwood', '056-8814117', to_date('10-08-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (223432686, 'Sayer', 'Postins', '051-0473277', to_date('13-07-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (540968116, 'Wyatan', 'Raunds', '050-3904195', to_date('04-07-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (291570077, 'Nataniel', 'Verling', '059-8236174', to_date('04-12-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (820158625, 'Sheff', 'Downes', '056-6650180', to_date('23-03-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (184677469, 'Adan', 'Gearing', '056-6394388', to_date('18-08-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (12995079, 'Nikki', 'Delaney', '058-7873008', to_date('14-07-1998', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (732771935, 'Theo', 'Giacobilio', '058-7176801', to_date('28-05-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (219337416, 'Farlie', 'Kimbrough', '058-7396017', to_date('01-05-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (754431912, 'Engracia', 'Adran', '059-1443588', to_date('31-12-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (554952007, 'Eldon', 'Farrar', '059-4753728', to_date('15-08-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (953127555, 'Felita', 'Savell', '059-6399858', to_date('13-03-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (759478554, 'Hope', 'Wisham', '057-8509456', to_date('13-11-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (377433931, 'Jillana', 'Gaskamp', '059-3259605', to_date('27-11-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (751065784, 'Leann', 'Swatheridge', '059-8042002', to_date('12-01-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (255866874, 'Gilbert', 'Caccavella', '050-5516846', to_date('21-07-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (944442979, 'Conney', 'Braney', '059-3819600', to_date('14-09-1957', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (132133520, 'Chelsey', 'Delleschi', '057-5245692', to_date('17-10-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (158357659, 'Ewen', 'Simacek', '057-6045489', to_date('06-03-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (441043562, 'Matias', 'Kynder', '051-7813725', to_date('30-07-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (791512667, 'Lu', 'Fenne', '059-5097988', to_date('12-06-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (523132035, 'Jobi', 'Wohler', '052-2894684', to_date('23-07-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (555488253, 'Whit', 'Ludovico', '055-7589499', to_date('08-04-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (873680223, 'Theodore', 'Toor', '052-1276972', to_date('06-06-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (416565574, 'Gal', 'Argent', '059-7141291', to_date('07-04-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (420661845, 'Dulce', 'Garnsworthy', '051-1538983', to_date('06-01-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (780602171, 'Elianora', 'Draper', '052-3759036', to_date('01-03-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (43674898, 'Gaylene', 'Kirman', '058-1374831', to_date('12-02-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (396677554, 'Ardelis', 'Spread', '054-6292411', to_date('20-04-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (266687507, 'Aksel', 'Rubens', '050-9488269', to_date('11-12-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (721516923, 'Gwenni', 'Marrison', '058-2301591', to_date('08-02-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (1717839, 'Janos', 'Kleinsmuntz', '053-3299207', to_date('05-02-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (859350816, 'Halli', 'Kordas', '055-3093656', to_date('27-03-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (775949856, 'Andeee', 'Capeling', '057-5870330', to_date('16-08-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (239453201, 'Roth', 'Odhams', '055-4217969', to_date('06-02-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (558407185, 'Bess', 'Coye', '050-2091899', to_date('13-10-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (50979660, 'Chrissy', 'Colliford', '050-9206076', to_date('21-07-1960', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (777367994, 'Boris', 'Tomala', '056-4258628', to_date('22-02-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (107056788, 'Orbadiah', 'Rodder', '055-4637162', to_date('03-06-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (939690145, 'Uta', 'Oneil', '054-6873627', to_date('20-07-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (595423656, 'Packston', 'Clawson', '059-3184291', to_date('17-09-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (625648663, 'Birdie', 'Cords', '050-4684445', to_date('24-02-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (655348727, 'Stefan', 'Buttrick', '059-2086863', to_date('01-12-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (920114875, 'Fionna', 'Ashford', '052-1844571', to_date('04-08-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (200571988, 'Raynard', 'Grand', '056-2486379', to_date('07-11-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (86661404, 'Emmalynne', 'Knatt', '057-6806062', to_date('06-09-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (791866296, 'Kimble', 'Ties', '058-4821623', to_date('28-09-1976', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (766531363, 'Dalli', 'Eudall', '050-5938967', to_date('22-02-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (377718868, 'Devlin', 'Hallybone', '056-8189469', to_date('11-09-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (383404908, 'Irina', 'Biggen', '057-9469349', to_date('09-05-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (18697101, 'Adamo', 'Fallowes', '056-0213834', to_date('28-05-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (519412704, 'Kali', 'Allanby', '059-3425971', to_date('21-07-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (672884778, 'Lockwood', 'Vassie', '053-2104471', to_date('17-09-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (426957042, 'Blanca', 'Bridywater', '050-5613237', to_date('08-07-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (789997163, 'Clemente', 'Elham', '050-9970136', to_date('15-08-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (84937489, 'Berrie', 'Keelinge', '052-7755727', to_date('06-07-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (818711512, 'Cherry', 'Altree', '059-9785697', to_date('27-09-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (706847449, 'Flossie', 'Matuschek', '054-4455216', to_date('13-11-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (775154294, 'Tabbie', 'Bellward', '054-0726139', to_date('19-10-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (313961966, 'Charyl', 'Rofe', '059-4357107', to_date('26-02-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (936356540, 'Archie', 'Birdall', '058-4879590', to_date('09-07-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (928379443, 'Arne', 'Beaman', '055-8472867', to_date('25-02-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (576811561, 'Brander', 'Juan', '059-8673443', to_date('16-02-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (282927757, 'Heath', 'Locksley', '050-6765135', to_date('26-10-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (540415135, 'Lucius', 'Kibblewhite', '051-6487292', to_date('18-05-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (790308092, 'Brana', 'Lowdiane', '056-7870221', to_date('24-01-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (553266644, 'Jennifer', 'Hebson', '051-2910834', to_date('28-12-1974', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (554726220, 'Sisile', 'Durnill', '053-6550071', to_date('12-10-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (254972152, 'Gaelan', 'Ellse', '055-3023058', to_date('09-12-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (11465811, 'Gabbie', 'Eagles', '051-7417764', to_date('16-06-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (772470337, 'Nevin', 'Gasticke', '055-9942817', to_date('17-12-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (350094576, 'Brandon', 'Banaszczyk', '059-3496290', to_date('19-08-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (628193823, 'Joella', 'McCaughren', '055-8419088', to_date('13-12-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (129932475, 'Malynda', 'Lecount', '059-7532479', to_date('03-09-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (986577118, 'Law', 'Jobe', '051-9392280', to_date('30-12-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (396938920, 'Jessalyn', 'Waylen', '056-3465025', to_date('15-06-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (405133321, 'Ronnica', 'Heenan', '051-5253434', to_date('28-12-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (818704753, 'Linea', 'Supple', '053-4400720', to_date('26-08-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (506253901, 'Emanuel', 'Kroon', '057-4234194', to_date('01-12-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (911459484, 'Antonina', 'Sides', '057-7910646', to_date('02-04-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (646173286, 'Nathalie', 'Schuricht', '052-0921758', to_date('14-08-1958', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (403580602, 'Micheline', 'Ducarne', '057-2450263', to_date('03-04-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (417330284, 'Glori', 'Seawell', '057-8172724', to_date('20-04-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (822620628, 'Guinna', 'Staterfield', '058-2239182', to_date('01-02-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (790450296, 'Kristan', 'Lazer', '051-8015088', to_date('23-04-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (550597527, 'Bat', 'Corsar', '051-3069221', to_date('06-07-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (607609200, 'Leone', 'Van De Cappelle', '053-3727218', to_date('13-12-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (33762037, 'Julee', 'Pikhno', '057-7057666', to_date('28-06-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (801002023, 'Helyn', 'Likely', '056-6103493', to_date('01-12-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (679355403, 'Teador', 'Gravet', '056-4714271', to_date('26-11-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (300129768, 'Kain', 'Orringe', '054-6042887', to_date('18-08-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (666253530, 'Giselbert', 'Beardsley', '058-7078803', to_date('29-06-2001', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (303579252, 'Aldo', 'Lillow', '051-8719758', to_date('05-11-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (900870464, 'Aileen', 'Juschke', '055-1706436', to_date('04-11-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (523005700, 'Karoly', 'Connue', '051-1137325', to_date('06-02-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (937194182, 'Addy', 'Chasmar', '052-3839539', to_date('17-10-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (696617440, 'Hedi', 'Busfield', '059-1306103', to_date('28-11-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (580613229, 'Georgine', 'Goodhall', '059-5683957', to_date('20-12-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (32843115, 'Amandi', 'Buncombe', '051-0091901', to_date('21-10-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (137849984, 'Ardella', 'Robardey', '051-8611440', to_date('20-10-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (688827446, 'Claudianus', 'Schuricht', '059-0645712', to_date('01-02-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (430457266, 'Ross', 'Corking', '050-8009364', to_date('15-06-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (678633001, 'Giraldo', 'Dehm', '056-1860878', to_date('24-01-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (382092349, 'Locke', 'Cork', '056-0735596', to_date('24-03-2001', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (433070647, 'Danielle', 'Howroyd', '054-1668113', to_date('20-07-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (246324249, 'Roosevelt', 'Harefoot', '051-8077445', to_date('29-01-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (289957147, 'Jamey', 'Banat', '050-6317466', to_date('27-09-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (884967228, 'Yasmin', 'Rankine', '055-4727076', to_date('05-07-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (233173356, 'Ruben', 'Popley', '059-8974507', to_date('09-07-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (292758151, 'Bogey', 'Southern', '058-6646781', to_date('08-01-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (202171384, 'Torrey', 'Rootham', '059-1446838', to_date('02-08-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (838301238, 'Hatty', 'Itzcak', '053-8923080', to_date('23-06-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (304445325, 'Amalle', 'Melan', '051-1403293', to_date('19-01-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (866437249, 'Joelle', 'West-Frimley', '059-2296119', to_date('22-04-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (33478448, 'Arny', 'Harrinson', '055-1728076', to_date('04-06-1957', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (453361323, 'Moselle', 'Desesquelle', '050-5078280', to_date('02-11-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (753819790, 'Charmian', 'Conigsby', '055-4852296', to_date('22-07-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (945571450, 'Cari', 'Mandres', '059-2473080', to_date('27-01-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (362794289, 'Arin', 'Woolliams', '054-0618764', to_date('14-11-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (583694700, 'Maureen', 'Knuckles', '058-1925750', to_date('29-01-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (440525629, 'Shell', 'Janak', '059-1962188', to_date('28-01-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (272899495, 'Celesta', 'De Anesy', '055-0714824', to_date('02-03-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (864427260, 'Rene', 'Molan', '056-3322608', to_date('16-11-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (1138673, 'Bennett', 'Alsina', '055-0268487', to_date('08-12-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (588614902, 'Derk', 'Drewett', '057-7576942', to_date('14-08-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (188488796, 'Wayland', 'Dally', '054-8971200', to_date('04-06-1958', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (930215877, 'Lewiss', 'Calveley', '057-3669324', to_date('18-08-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (783746163, 'Daloris', 'Finicj', '056-8652781', to_date('19-12-1976', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (894100813, 'Bridie', 'Spyby', '056-5057347', to_date('29-08-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (469513865, 'Yancey', 'Styant', '053-1615117', to_date('26-10-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (477646592, 'Giulietta', 'Phil', '057-4481967', to_date('20-06-2001', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (770422429, 'Adolphe', 'Torrent', '055-9707365', to_date('14-12-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (964895751, 'Mozelle', 'Lomasney', '056-2262521', to_date('17-11-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (999906876, 'Barnaby', 'Foresight', '055-1400378', to_date('24-09-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (488321919, 'Diana', 'Mouat', '057-4001304', to_date('13-09-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (27337730, 'Susan', 'Colnett', '052-2008395', to_date('03-02-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (325919091, 'Fiona', 'Itscovitz', '057-0042469', to_date('06-10-1999', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (217960251, 'Lucila', 'O''Bradden', '050-3197842', to_date('17-05-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (83725273, 'Virgil', 'Whetland', '057-9556435', to_date('31-12-1976', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (263941328, 'Ben', 'De Stoop', '058-1442122', to_date('26-12-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (609280909, 'Coralie', 'Eggers', '057-3734502', to_date('25-09-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (28573790, 'Hanson', 'Ferne', '059-7681388', to_date('15-07-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (4192795, 'Jenilee', 'Uppett', '052-7741645', to_date('05-03-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (770943394, 'Nelson', 'Broadberry', '057-9584293', to_date('17-10-1998', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (925514152, 'Freeland', 'Bernardin', '056-8670953', to_date('04-10-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (805148676, 'Tally', 'Barke', '050-0670209', to_date('24-04-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (335912518, 'Dolph', 'Guinane', '054-2670806', to_date('06-05-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (337147026, 'Sydel', 'Derrington', '057-5989607', to_date('13-06-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (35248085, 'Idaline', 'Hubeaux', '053-0122022', to_date('26-05-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (119931121, 'Normy', 'Feldbau', '059-4900297', to_date('04-03-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (466407372, 'Issiah', 'Downage', '052-9322316', to_date('28-08-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (505035378, 'Lemuel', 'Beslier', '052-6431217', to_date('09-01-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (487531615, 'Korry', 'Kelsow', '052-6473530', to_date('08-02-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (295421736, 'Emile', 'Campagne', '057-9535749', to_date('02-09-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (852814667, 'Vittoria', 'Kaysor', '058-5494034', to_date('08-09-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (578737286, 'Anabel', 'Crawshaw', '053-0450350', to_date('15-05-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (781547507, 'Cody', 'Coventon', '058-2374158', to_date('27-10-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (284508024, 'Kevon', 'Perrat', '054-9260358', to_date('20-07-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (894538054, 'Beverley', 'Howey', '051-2526042', to_date('19-02-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (412041638, 'Kelsey', 'Dashwood', '050-9793415', to_date('31-01-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (418452768, 'Hobie', 'True', '054-8066313', to_date('20-04-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (915361645, 'Rollie', 'Bortolutti', '053-6088742', to_date('20-09-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (57057664, 'Verena', 'Saice', '059-2270306', to_date('04-07-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (917240940, 'Beatriz', 'Puffett', '050-5425407', to_date('05-04-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (825225057, 'Olin', 'Livick', '057-4726687', to_date('29-12-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (7650638, 'Joellen', 'Petel', '052-8218185', to_date('25-08-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (983801413, 'Therese', 'Viggers', '059-3771977', to_date('21-07-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (499925094, 'Cacilia', 'Byars', '057-1906417', to_date('16-05-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (52951373, 'Penny', 'Blanchet', '053-3527325', to_date('06-08-2001', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (323358973, 'Elfreda', 'Blevin', '051-9865603', to_date('23-03-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (401079390, 'Agatha', 'Donan', '057-0065925', to_date('12-12-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (811199218, 'Viviyan', 'Chatenier', '059-0591970', to_date('26-05-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (960553982, 'Nert', 'Rosoni', '058-7808812', to_date('01-02-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (37246374, 'Gerri', 'Avramow', '055-7800236', to_date('19-10-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (459094322, 'Nanci', 'O''Haire', '057-3636327', to_date('21-10-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (379364409, 'Tulley', 'Spofford', '058-0191776', to_date('01-07-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (407794519, 'Starla', 'Huff', '058-0674410', to_date('03-08-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (994936749, 'Richardo', 'Keighley', '059-3289562', to_date('21-05-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (765018581, 'Luciano', 'Cricket', '050-5534478', to_date('27-07-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (395511118, 'Genia', 'Swaddle', '051-9439370', to_date('23-10-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (343601330, 'Allene', 'Tomaszewski', '058-5685223', to_date('31-05-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (284862147, 'Sarita', 'Bertie', '058-7862270', to_date('16-06-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (490295282, 'Tildie', 'Axel', '058-7098362', to_date('05-06-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (358150371, 'Guenevere', 'Bodiam', '052-0751006', to_date('27-03-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (561676102, 'Durante', 'Klulisek', '057-3437989', to_date('20-03-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (718313033, 'Carrissa', 'Eastham', '056-4274666', to_date('31-08-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (27936243, 'Garner', 'Salvati', '059-8656456', to_date('28-02-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (487691089, 'Simmonds', 'Tomasz', '050-6509991', to_date('15-04-1974', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (880191755, 'Sheridan', 'Laidlaw', '056-3656506', to_date('08-07-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (278947834, 'Ruggiero', 'Donaghie', '052-3590592', to_date('15-07-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (791526255, 'Emmalynne', 'Regus', '056-3523408', to_date('22-03-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (660239180, 'Ezequiel', 'Stygall', '054-0465874', to_date('25-11-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (868319223, 'Loella', 'Breslane', '051-2118362', to_date('14-05-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (123518441, 'Torre', 'Renad', '054-9003235', to_date('18-01-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (232743870, 'Karee', 'Raggatt', '053-0997365', to_date('03-07-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (950719512, 'Sheelagh', 'Cabotto', '057-3737660', to_date('12-01-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (734884137, 'Wells', 'McCard', '050-8923939', to_date('08-07-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (798076468, 'Gilles', 'Mollindinia', '050-6973807', to_date('21-11-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (869068786, 'Letisha', 'Ezele', '056-3898115', to_date('14-12-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (44087281, 'Otis', 'Saket', '058-0567631', to_date('21-12-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (729376590, 'Tobe', 'Draijer', '054-8824195', to_date('10-07-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (89349836, 'Noel', 'Chafer', '055-0545045', to_date('31-12-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (467086955, 'Gwenneth', 'Grayland', '059-1769202', to_date('01-05-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (637473229, 'Jdavie', 'Henrichsen', '051-2402522', to_date('06-09-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (316034762, 'Granger', 'Antwis', '052-1477084', to_date('31-08-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (233509850, 'Rosetta', 'Hugin', '052-6715817', to_date('13-04-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (799460551, 'Joya', 'Freeborn', '051-8188776', to_date('28-12-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (703485110, 'Dorthea', 'Goracci', '050-9689328', to_date('30-06-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (36090909, 'Urbano', 'Kilgallon', '054-0310477', to_date('11-10-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (326121723, 'Briana', 'Garken', '052-4694859', to_date('26-11-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (566823934, 'Ruthann', 'Sappell', '058-7481744', to_date('20-12-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (539619029, 'Alexine', 'Ounsworth', '052-6343393', to_date('20-07-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (944113690, 'Alissa', 'Coom', '054-6579295', to_date('04-01-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (1396149, 'Ches', 'Bronot', '054-4488753', to_date('16-05-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (673407336, 'Cullin', 'Biaggioni', '053-6596147', to_date('05-01-1957', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (999613983, 'Helen', 'Keyworth', '054-3818401', to_date('03-03-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (671362011, 'Genevieve', 'Muldowney', '057-5067707', to_date('23-10-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (245308957, 'Dulci', 'Dibdall', '056-3511678', to_date('20-04-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (804712853, 'Bernard', 'Oldroyd', '051-6740638', to_date('13-08-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (198437423, 'Loraine', 'Hirche', '051-7828246', to_date('21-06-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (580223, 'Walton', 'Petrina', '050-3748180', to_date('11-05-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (722414092, 'Cassi', 'Kilpin', '051-5266633', to_date('12-08-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (117058091, 'Halie', 'Tellenbrook', '054-4778201', to_date('02-05-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (788460692, 'Kerwin', 'Braithwait', '058-8316672', to_date('11-05-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (12002712, 'Roze', 'Prayer', '054-8936331', to_date('15-01-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (228573607, 'Benedicto', 'Canham', '056-5902553', to_date('03-12-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (690114896, 'Cob', 'MacAughtrie', '057-9912581', to_date('21-02-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (613334540, 'Rosene', 'Polfer', '056-3479903', to_date('18-02-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (212470513, 'Cam', 'Mor', '059-7520384', to_date('21-01-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (95786245, 'Dalia', 'Lecordier', '052-1064205', to_date('30-05-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (684257348, 'Marshal', 'Mundie', '056-1577341', to_date('18-01-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (121347815, 'Cherri', 'Piscopiello', '052-4771577', to_date('10-10-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (271235358, 'Tilda', 'McMains', '055-3555525', to_date('03-02-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (427427003, 'Alonso', 'Petegrew', '054-2887497', to_date('26-03-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (346067054, 'Teddie', 'Campaigne', '054-5163664', to_date('20-03-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (114990650, 'Padget', 'Cudworth', '058-4534149', to_date('25-08-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (482005376, 'Kendall', 'McClenaghan', '050-9925641', to_date('03-03-2001', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (291484015, 'Rodina', 'Piel', '055-0241136', to_date('20-02-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (774143138, 'Estella', 'Seear', '058-0446668', to_date('30-11-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (43561107, 'Wat', 'Lozano', '055-3029855', to_date('29-05-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (572566609, 'Claresta', 'Eborn', '059-4226192', to_date('21-11-2001', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (32882149, 'Elvera', 'Rosten', '058-1304689', to_date('02-04-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (628746804, 'Joby', 'Veljes', '053-9355671', to_date('29-11-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (216747431, 'Fergus', 'Berndsen', '053-7752179', to_date('12-09-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (113668956, 'Noam', 'Hubery', '056-4234477', to_date('24-12-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (718475955, 'Leela', 'Vaan', '055-8245105', to_date('31-10-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (562615124, 'Andres', 'Hamnett', '057-5446613', to_date('11-11-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (58187295, 'Richart', 'Burgen', '050-2379106', to_date('15-08-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (275350122, 'Anatola', 'Darycott', '052-0469745', to_date('28-11-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (832890599, 'Darrick', 'Snoday', '059-5098622', to_date('09-09-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (183530934, 'Gabbey', 'Sowten', '059-0225643', to_date('25-07-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (541100519, 'Tanny', 'Spino', '055-2832488', to_date('28-06-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (676829750, 'Celestine', 'Guinan', '051-8091379', to_date('16-04-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (814540938, 'Alanna', 'Powling', '057-6283711', to_date('04-11-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (112727921, 'Aylmar', 'Cherryman', '053-0813117', to_date('13-04-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (610398259, 'Renaud', 'Korejs', '056-2672567', to_date('01-08-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (642201894, 'Lynett', 'Jepperson', '053-3144910', to_date('06-04-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (600080684, 'Aimee', 'Farndale', '058-5870268', to_date('01-12-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (744253356, 'Maxwell', 'Goldson', '054-1374982', to_date('11-05-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (672209411, 'Babbie', 'Laviste', '050-7696786', to_date('04-09-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (994500502, 'Waite', 'Winchcum', '050-0600924', to_date('28-07-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (892936953, 'Dew', 'Phoenix', '052-9052022', to_date('25-04-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (98787120, 'Evonne', 'Tuckwood', '058-3093678', to_date('02-09-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (380122544, 'Sylvia', 'Isaaksohn', '057-7594224', to_date('24-08-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (253006007, 'Ricard', 'De Bellis', '051-7938149', to_date('20-07-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (533472996, 'Dougy', 'Eberts', '059-3163464', to_date('17-07-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (68992888, 'Annabal', 'Aneley', '054-8147383', to_date('16-06-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (739948974, 'Meyer', 'Stucksbury', '050-0035497', to_date('20-05-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (73472715, 'Pincas', 'Lamprecht', '057-8279715', to_date('11-05-1976', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (444339634, 'Letti', 'Johncey', '056-6005540', to_date('09-03-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (540309628, 'Hurlee', 'Glashby', '052-1127112', to_date('03-10-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (83845943, 'Shawn', 'MacNeely', '057-0236501', to_date('22-07-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (747532290, 'Delphinia', 'Lehenmann', '057-5357631', to_date('10-02-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (706377025, 'Cecilio', 'Cuming', '056-3429427', to_date('03-02-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (846027925, 'Herb', 'Kentwell', '050-3567491', to_date('20-01-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (68858904, 'Garth', 'Dorbon', '052-8055918', to_date('24-07-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (897564660, 'Marsiella', 'Bartolomivis', '052-0059247', to_date('01-05-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (241247045, 'Pavla', 'Elvey', '050-8031030', to_date('13-10-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (891910633, 'Eric', 'Westney', '050-2465332', to_date('27-10-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (896313876, 'Gustave', 'Malt', '059-2408376', to_date('01-02-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (840425006, 'Rebeka', 'Slaymaker', '058-5700054', to_date('02-05-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (285980664, 'Lydia', 'Sketch', '057-2905893', to_date('06-07-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (381131314, 'Ashien', 'Hulse', '055-8142672', to_date('30-07-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (236336194, 'Bartolomeo', 'Juliff', '055-2522035', to_date('24-03-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (265119280, 'Bernardina', 'Ben', '050-6684950', to_date('26-12-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (320993503, 'Niko', 'Collinson', '057-9670674', to_date('14-04-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (370100164, 'Marianne', 'Rowley', '052-2095689', to_date('17-11-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (807109039, 'Paolina', 'Feige', '056-4764196', to_date('23-04-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (779897612, 'Shelby', 'Vause', '052-0259470', to_date('12-06-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (776899533, 'Rozalie', 'Dunbobbin', '059-0147549', to_date('14-01-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (473061533, 'Madonna', 'Cavet', '050-0011046', to_date('07-02-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (309820613, 'Dixie', 'Abelovitz', '057-0404720', to_date('15-11-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (369054694, 'Jenica', 'Dearnley', '056-1391019', to_date('25-05-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (231689950, 'Karen', 'Emms', '051-4733802', to_date('15-05-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (37312889, 'Gwynne', 'Gilleon', '051-0551854', to_date('16-08-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (862727578, 'Maxie', 'Poschel', '052-7998941', to_date('15-04-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (370253691, 'Jacky', 'Kydde', '059-8838097', to_date('07-04-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (46687190, 'Dionne', 'Daines', '055-1392491', to_date('05-04-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (138124043, 'Nickolai', 'Fetter', '050-3694202', to_date('21-12-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (750668901, 'Dallas', 'Frohock', '058-7393820', to_date('23-05-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (233074711, 'Florette', 'Riding', '057-7631796', to_date('01-01-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (73047640, 'Julio', 'Keywood', '056-0256980', to_date('14-03-1974', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (356334592, 'Linell', 'Meyrick', '054-3386637', to_date('28-05-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (289340778, 'Ted', 'Ekell', '052-0534144', to_date('12-06-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (894007102, 'Aura', 'Larmor', '053-0109319', to_date('13-10-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (235322446, 'Dillon', 'Dumphy', '055-4430516', to_date('03-06-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (236280802, 'Jamesy', 'Lunnon', '055-5330866', to_date('17-05-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (476723990, 'Petey', 'Ferrino', '056-2912482', to_date('25-03-2001', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (390943627, 'Emilia', 'Domke', '057-1720347', to_date('10-12-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (717880392, 'Letta', 'Liddle', '053-0110741', to_date('18-11-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (335015719, 'Benita', 'Bolitho', '055-2733943', to_date('27-02-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (500715580, 'Carling', 'Hillan', '051-4786490', to_date('12-04-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (956967752, 'Starlene', 'Luxford', '050-5504424', to_date('02-04-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (405688824, 'Emeline', 'Moline', '054-2474573', to_date('11-10-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (836958309, 'Giraud', 'Barnaby', '053-5169939', to_date('01-01-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (43025662, 'Costa', 'Daykin', '053-0436655', to_date('02-06-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (448260037, 'Genny', 'Peverell', '050-4242113', to_date('07-03-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (799039636, 'Bliss', 'Kienzle', '055-9200849', to_date('13-07-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (567516147, 'Collin', 'Pennycock', '050-0443446', to_date('01-09-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (387893781, 'Clint', 'Bockett', '059-2730048', to_date('26-03-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (396179343, 'Rora', 'Clogg', '050-4525338', to_date('11-10-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (846484884, 'Brewer', 'Manion', '054-7467956', to_date('13-10-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (232994015, 'Saxon', 'Greystock', '054-0898319', to_date('21-02-2001', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (210445649, 'Koo', 'Ferraretto', '059-4887256', to_date('18-10-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (496955924, 'Filia', 'Turpey', '055-4949060', to_date('09-05-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (813986720, 'Vincenz', 'Vivians', '057-5776753', to_date('12-10-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (953845254, 'Lindsy', 'Elmer', '058-8854077', to_date('27-06-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (360625153, 'Theodor', 'Tether', '050-5051566', to_date('09-04-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (833911512, 'Ichabod', 'McGeagh', '052-6454647', to_date('03-12-1958', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (15959727, 'Josephina', 'Coolbear', '056-9485396', to_date('28-04-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (470994691, 'Jaimie', 'Fergie', '057-3884324', to_date('06-06-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (681380877, 'Ashlie', 'Jesper', '054-1771444', to_date('10-02-1958', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (506377909, 'Sada', 'Krolle', '055-8891660', to_date('20-07-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (838524358, 'Gerrie', 'Tissier', '059-9721845', to_date('03-02-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (402573561, 'Florie', 'Bonson', '051-9126792', to_date('25-07-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (827901595, 'Querida', 'Affuso', '050-0287675', to_date('15-09-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (96780183, 'Rosalie', 'Cardo', '055-4368273', to_date('14-01-1967', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (968028757, 'Cleo', 'Jones', '055-3920616', to_date('11-05-1957', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (583270097, 'Mauricio', 'Woodes', '050-8104330', to_date('30-09-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (611644501, 'Edward', 'Bon', '051-8598969', to_date('24-10-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (305388875, 'Leonhard', 'Bedow', '058-2866485', to_date('28-11-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (687463072, 'Anica', 'Smeeth', '059-8901684', to_date('21-09-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (567741968, 'Dulcine', 'Shapera', '051-6551482', to_date('15-12-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (732050531, 'Harp', 'Neill', '053-9927825', to_date('30-09-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (59350221, 'Valeria', 'Bourdel', '053-8505139', to_date('22-06-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (928558453, 'Sanders', 'Matura', '052-2324384', to_date('20-09-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (389943790, 'Ingra', 'Lenin', '051-7877028', to_date('03-03-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (500428309, 'Kizzee', 'Tedder', '052-3171150', to_date('02-10-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (635511137, 'Rozele', 'Brusle', '056-7959901', to_date('04-11-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (689965872, 'Fredrick', 'Bernardini', '051-3039284', to_date('25-02-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (895866713, 'Everard', 'Lieb', '058-0713114', to_date('15-11-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (471482899, 'Dianemarie', 'Searchfield', '050-3321738', to_date('27-07-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (904921014, 'Raychel', 'Warnes', '053-0921237', to_date('16-01-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (766416870, 'Consuela', 'Tireman', '056-6216618', to_date('31-10-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (650242072, 'Glenine', 'MacDunlevy', '051-4557156', to_date('03-04-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (459235634, 'Rolfe', 'Brammar', '053-7390928', to_date('21-11-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (214466955, 'Katharyn', 'Smallshaw', '053-9333789', to_date('16-02-1998', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (750789404, 'Deonne', 'Mangion', '057-9020635', to_date('18-06-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (208298661, 'Dimitri', 'Bretland', '053-2604613', to_date('07-01-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (668890911, 'Cleopatra', 'Ruppeli', '055-8817471', to_date('21-08-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (394033517, 'Krishna', 'Folliott', '058-9207253', to_date('22-04-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (529196229, 'Betti', 'Atteridge', '055-3192359', to_date('16-11-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (294955133, 'Wolfy', 'Alvin', '052-5703401', to_date('29-12-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (740517841, 'Prinz', 'Reynish', '056-8583852', to_date('16-10-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (98290342, 'Mortimer', 'Macak', '059-3956727', to_date('04-05-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (929114656, 'Ailee', 'Dashkov', '053-3223156', to_date('02-03-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (471907098, 'Massimiliano', 'McNickle', '059-2000660', to_date('20-09-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (312187989, 'Millard', 'Brauninger', '050-1233096', to_date('14-11-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (286947858, 'Hans', 'Rolfe', '058-8399597', to_date('22-07-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (797142995, 'Robert', 'Duffer', '052-8627100', to_date('13-06-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (986771557, 'Hendrick', 'Jovic', '058-5451919', to_date('22-02-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (731429529, 'Rafaela', 'Wetherell', '057-8774485', to_date('18-11-1974', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (149003615, 'Henryetta', 'Kopacek', '056-7698306', to_date('10-04-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (289471751, 'Rafa', 'Synnott', '053-8767937', to_date('30-09-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (740329511, 'Catlaina', 'Schonfeld', '052-2112132', to_date('30-11-2001', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (821603494, 'Dru', 'Prendiville', '054-4874757', to_date('08-02-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (342872311, 'Wat', 'Bartomieu', '053-3034512', to_date('16-10-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (315806874, 'Trixie', 'Punter', '059-6413873', to_date('04-07-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (158644684, 'Marven', 'Reddish', '057-9705310', to_date('18-01-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (115111869, 'Harrie', 'Antognetti', '059-0177834', to_date('12-07-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (302715872, 'Dud', 'Trass', '056-6348136', to_date('22-10-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (922825288, 'Rita', 'Rottery', '058-8603467', to_date('08-02-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (782567954, 'Amalea', 'Stanwix', '058-8081174', to_date('17-02-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (115305675, 'Bobette', 'Winkett', '053-7271554', to_date('31-01-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (988180263, 'Batsheva', 'Waldren', '056-8581115', to_date('17-02-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (775624090, 'Georgie', 'Hankinson', '055-5376405', to_date('14-05-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (547025568, 'Brandy', 'Trollope', '058-6699700', to_date('08-09-1998', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (775720063, 'Creigh', 'Muzzall', '058-0497497', to_date('26-07-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (84149896, 'Gil', 'Lackey', '054-3882514', to_date('03-09-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (365082672, 'June', 'Stichall', '059-3193385', to_date('14-05-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (498599129, 'Heather', 'Chinge', '057-4317108', to_date('25-07-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (908529945, 'Brandtr', 'Tomich', '053-3683243', to_date('01-03-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (578012673, 'Brigid', 'Snelling', '058-7787388', to_date('22-09-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (917034616, 'Honey', 'Isacq', '057-5108547', to_date('07-06-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (747597237, 'Arin', 'Trenouth', '054-6727147', to_date('21-01-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (936734596, 'Skylar', 'Fitzsymonds', '050-9586626', to_date('07-07-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (412181730, 'Ive', 'Manssuer', '059-3066372', to_date('13-06-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (159569929, 'Serena', 'Thireau', '059-5267807', to_date('09-07-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (796034862, 'Lauri', 'Borgars', '058-0179602', to_date('30-03-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (925999241, 'Milissent', 'Morrill', '053-9856767', to_date('27-03-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (596687189, 'Damara', 'Irdale', '059-0282558', to_date('18-09-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (474058394, 'Camala', 'Syversen', '057-6417112', to_date('04-06-2001', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (644702328, 'Jeddy', 'Boffin', '056-9087742', to_date('16-08-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (901831830, 'Annie', 'Gercke', '053-4971376', to_date('10-12-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (929382144, 'Germaine', 'Rawstorn', '057-5169889', to_date('09-09-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (95063677, 'Raleigh', 'O''Cridigan', '053-8387666', to_date('16-12-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (410948270, 'Sampson', 'Scorthorne', '057-3424600', to_date('02-04-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (300127467, 'Nobe', 'MacComiskey', '057-0043638', to_date('18-08-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (825643796, 'Allyn', 'Christopherson', '051-5607474', to_date('07-03-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (418448292, 'Janaya', 'Steels', '052-9284743', to_date('20-07-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (10342911, 'Lane', 'Vasiltsov', '050-8930320', to_date('08-04-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (613919979, 'Nomi', 'Walworth', '057-5416085', to_date('08-06-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (129096789, 'Enid', 'Sissens', '054-9217341', to_date('22-12-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (349906655, 'Harlin', 'Fenners', '056-6702651', to_date('02-04-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (192087879, 'Allison', 'Curnnokk', '055-0843431', to_date('22-06-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (904309625, 'Tiffany', 'Seekings', '052-5653765', to_date('30-08-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (44007577, 'Adams', 'Raggitt', '050-0977835', to_date('30-03-2001', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (813985305, 'Cyrillus', 'Eburah', '050-3097907', to_date('28-04-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (104756631, 'Ludovico', 'Cardozo', '057-9784201', to_date('27-08-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (420927989, 'Derick', 'Manger', '052-9685088', to_date('17-01-1974', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (794711783, 'Worth', 'Ciccarelli', '056-9014072', to_date('19-01-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (555007782, 'Dolli', 'McMylor', '054-4284574', to_date('30-10-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (619987948, 'Helen-elizabeth', 'Parminter', '050-8996269', to_date('14-06-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (436359729, 'Barbi', 'Hallihane', '053-5962839', to_date('04-12-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (824012038, 'Ilysa', 'Rainforth', '052-0649139', to_date('29-08-1998', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (92423616, 'Florry', 'Roze', '050-3790949', to_date('27-12-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (920930141, 'Celinda', 'Cheverell', '053-7730522', to_date('23-07-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (81875645, 'Shermy', 'Venditto', '054-4213343', to_date('06-11-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (108944425, 'Mirilla', 'Gres', '054-9430048', to_date('13-11-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (619322937, 'Garrik', 'Doogood', '056-7810231', to_date('15-12-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (861113594, 'Mirabelle', 'Tigwell', '053-0735028', to_date('22-09-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (275393257, 'Dorey', 'Allcock', '054-4355254', to_date('29-08-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (916043739, 'Bernard', 'Gerretsen', '056-6802922', to_date('04-04-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (53329006, 'Adolphe', 'McInerney', '056-3616776', to_date('31-10-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (755360861, 'Sybille', 'Dunstone', '053-0799836', to_date('08-10-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (934996519, 'Agata', 'Macci', '053-8268654', to_date('13-06-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (75542571, 'Eartha', 'Swallwell', '053-1980153', to_date('28-12-1988', 'dd-mm-yyyy'));
commit;
prompt 500 records committed...
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (667816831, 'Donni', 'Armytage', '052-4152039', to_date('02-01-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (358850243, 'Biddie', 'Baptiste', '054-4772919', to_date('12-12-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (250757297, 'Rebe', 'Dinsmore', '052-1096381', to_date('03-09-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (599808372, 'Hodge', 'Feak', '056-1814647', to_date('08-04-1958', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (550679182, 'Cari', 'McTerrelly', '052-1050130', to_date('28-12-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (958068049, 'Dimitri', 'Limb', '054-0082827', to_date('09-11-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (248951167, 'Keane', 'Girardet', '053-8352472', to_date('17-12-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (625532164, 'Wilek', 'Oxtoby', '057-8824422', to_date('09-12-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (614876819, 'Emlyn', 'Meffan', '051-0735442', to_date('27-12-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (884278818, 'Nixie', 'Digman', '056-1545678', to_date('01-04-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (320201126, 'Lloyd', 'O''Hannen', '050-2522959', to_date('22-08-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (619664665, 'Desdemona', 'Crunden', '054-9374921', to_date('23-09-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (858830943, 'Egan', 'Pepperill', '057-4832891', to_date('25-02-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (524736554, 'Mayer', 'Wormald', '059-9088813', to_date('06-12-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (632101363, 'Adaline', 'Ventura', '050-9081927', to_date('26-03-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (246030796, 'Ogdon', 'Cawthry', '053-7025739', to_date('08-05-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (820070154, 'Roderick', 'Dewsnap', '059-0239245', to_date('05-10-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (149604833, 'Elane', 'Joysey', '057-0720509', to_date('05-05-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (399396234, 'Lexie', 'Graser', '056-7622756', to_date('12-08-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (838449960, 'Teddi', 'Hopkyns', '050-6800153', to_date('21-10-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (766855103, 'Liane', 'Hymus', '052-6244332', to_date('11-12-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (342775988, 'Willy', 'Hawkswood', '056-6486733', to_date('12-11-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (837573080, 'Weider', 'Puddan', '058-3313598', to_date('16-02-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (775276020, 'Jasmine', 'Pendock', '059-9674775', to_date('17-04-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (334672288, 'Waite', 'Want', '051-9364618', to_date('13-11-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (676188928, 'Saree', 'Pes', '051-4070755', to_date('05-11-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (714956600, 'Cassandry', 'Jobbins', '055-5354372', to_date('01-03-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (534932153, 'Aurelie', 'Winteringham', '054-8027744', to_date('18-07-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (784369112, 'Gardiner', 'Frantzeni', '052-9024451', to_date('31-08-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (47720527, 'Rolando', 'Kaesmakers', '059-3813098', to_date('26-12-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (589453161, 'Lois', 'Secretan', '054-4438760', to_date('18-12-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (249608827, 'Ricky', 'Hartopp', '055-4424890', to_date('19-12-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (860914309, 'Almeta', 'Bearne', '053-8020508', to_date('26-12-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (930829478, 'Giovanna', 'McCarrick', '054-1274472', to_date('17-11-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (464642111, 'Talyah', 'O''Shevlin', '054-8701576', to_date('26-12-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (313345242, 'Babs', 'Stratten', '051-9504472', to_date('07-11-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (961163333, 'Rorke', 'Smoth', '052-2201675', to_date('27-11-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (672029714, 'Dee', 'Shoobridge', '059-5689778', to_date('21-11-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (685659158, 'Lombard', 'Polino', '050-6161659', to_date('06-09-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (766904997, 'Lyman', 'Bovaird', '054-6212131', to_date('08-06-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (542905475, 'Daryn', 'Peddel', '052-5223861', to_date('09-05-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (911176266, 'Harry', 'Sobieski', '057-5698590', to_date('07-10-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (488284443, 'Tiffani', 'Rubroe', '058-6647719', to_date('09-10-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (81955714, 'Mortie', 'Pratt', '051-2213757', to_date('01-11-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (791530797, 'Mohandas', 'Haythorne', '055-7369684', to_date('15-11-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (215809211, 'Worth', 'Saines', '056-7695354', to_date('08-12-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (243673029, 'Lina', 'Truwert', '052-7148643', to_date('12-08-1957', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (449275572, 'Lyn', 'Vezey', '053-5553348', to_date('28-02-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (446287435, 'Elsey', 'Milthorpe', '054-0756827', to_date('23-07-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (51031485, 'Etan', 'Lewknor', '050-3866857', to_date('22-01-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (492461632, 'Noellyn', 'Kundt', '055-7051847', to_date('10-04-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (96329222, 'Bekki', 'Spooner', '050-4125637', to_date('16-08-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (787824850, 'Zacharia', 'Perott', '059-4017215', to_date('26-03-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (18618685, 'Donn', 'Kyngdon', '053-1977913', to_date('21-07-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (543008184, 'Steffi', 'Morais', '054-4688681', to_date('29-05-1998', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (666178987, 'Dunstan', 'Sommerly', '051-2844943', to_date('25-09-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (247593794, 'Meade', 'Waller', '056-1168126', to_date('04-04-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (89442041, 'Perl', 'Wilflinger', '054-2905608', to_date('09-04-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (535855524, 'Winna', 'Chill', '057-2533502', to_date('20-07-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (6928452, 'Terrye', 'Baglan', '059-2861218', to_date('11-05-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (96998887, 'Athena', 'Kivell', '056-2296451', to_date('29-09-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (140019243, 'Hector', 'Prince', '051-2895261', to_date('08-05-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (322240297, 'Shandie', 'McAvey', '058-4102169', to_date('22-04-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (812588537, 'Wat', 'Birts', '054-0791674', to_date('11-01-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (355056278, 'Dare', 'Melendez', '055-8001529', to_date('30-07-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (677227199, 'Concettina', 'Casseldine', '055-6373596', to_date('30-07-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (87492769, 'Ashlee', 'Blurton', '050-6469136', to_date('14-07-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (575479472, 'Emanuele', 'Dulin', '050-2071918', to_date('15-07-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (671215521, 'Farris', 'Canadas', '057-3297763', to_date('19-11-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (381174773, 'Colly', 'Ordemann', '055-7364620', to_date('04-06-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (51003258, 'Deva', 'Sleep', '050-4466700', to_date('19-05-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (98168072, 'Malanie', 'Gynni', '054-6916966', to_date('30-09-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (988781175, 'Judith', 'Springham', '057-8287709', to_date('09-05-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (883328981, 'Nevile', 'Bidnall', '055-7814749', to_date('22-10-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (195613588, 'Sammy', 'Spaducci', '053-1986477', to_date('07-05-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (648701220, 'Elane', 'Calven', '053-9635225', to_date('23-10-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (902105753, 'Fern', 'Dunabie', '058-5411477', to_date('17-11-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (683452562, 'Ingmar', 'Ruddlesden', '053-1083564', to_date('01-01-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (697548235, 'Karlan', 'Dukesbury', '059-6935296', to_date('20-07-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (588514962, 'Loren', 'Rigard', '050-5768470', to_date('01-12-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (340225539, 'Trescha', 'Culham', '053-8627321', to_date('12-07-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (585526082, 'Atalanta', 'Perton', '054-2868556', to_date('02-01-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (933894141, 'Yolande', 'Hambly', '051-7438290', to_date('20-03-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (951334175, 'Sonia', 'Pawsey', '052-5043682', to_date('25-06-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (931163682, 'Elaine', 'Dosdell', '055-0783119', to_date('12-11-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (817185900, 'Shir', 'Biskupiak', '054-0788136', to_date('16-07-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (254305657, 'Thorny', 'Bischop', '059-2988478', to_date('24-02-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (808540378, 'Kay', 'Bonson', '053-9257462', to_date('01-01-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (809700027, 'Carri', 'Slatford', '056-7057042', to_date('03-09-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (239682226, 'Boycey', 'Fortye', '050-6617572', to_date('24-10-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (872015678, 'Jarrad', 'Croxford', '058-2190647', to_date('13-06-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (566335051, 'Rosaline', 'Coode', '052-9842002', to_date('29-08-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (127479756, 'Christopher', 'Silbert', '054-2263702', to_date('15-02-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (369594238, 'Mannie', 'Orry', '052-8835959', to_date('25-04-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (268278586, 'Lynn', 'Killby', '050-8002925', to_date('24-01-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (930931397, 'Elie', 'Giannassi', '051-3152578', to_date('30-07-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (3298276, 'Allister', 'Hartridge', '051-2840656', to_date('18-01-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (296276986, 'Mady', 'Westmerland', '052-8001091', to_date('18-03-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (699749179, 'Vi', 'MacClure', '059-1275180', to_date('21-10-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (798075804, 'Corina', 'Vasyunkin', '055-5991691', to_date('18-09-1985', 'dd-mm-yyyy'));
commit;
prompt 600 records committed...
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (437808690, 'Sile', 'Benjefield', '054-9547493', to_date('19-12-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (188776074, 'Sileas', 'Baden', '051-2098762', to_date('03-10-1974', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (635036008, 'Annice', 'Rumming', '054-1146514', to_date('25-07-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (741735622, 'Lucille', 'Bruckner', '058-2774445', to_date('17-04-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (381321322, 'Boyce', 'Ogles', '053-9537346', to_date('27-01-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (435865908, 'Etan', 'Heak', '058-3635223', to_date('25-04-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (273836904, 'Lionel', 'Revett', '056-8153172', to_date('30-07-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (358778389, 'Klara', 'Francescozzi', '059-0926986', to_date('30-05-1957', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (829105321, 'Allister', 'Spilstead', '051-6565211', to_date('04-09-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (940615672, 'Ailyn', 'Josefer', '054-9634234', to_date('18-02-1957', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (360753417, 'Washington', 'Gookes', '059-5245268', to_date('04-03-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (305453126, 'Haven', 'Airy', '050-8343722', to_date('28-01-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (646294342, 'Rosemarie', 'Claris', '056-9064677', to_date('04-05-1957', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (953454618, 'Edi', 'Radbourn', '051-5751561', to_date('24-09-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (10438709, 'Bobinette', 'Happer', '055-4589446', to_date('09-10-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (954302901, 'Theobald', 'Parsell', '054-9078449', to_date('16-12-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (273190792, 'Cariotta', 'Spadollini', '052-0788258', to_date('29-08-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (597940615, 'Gaylor', 'Barney', '053-1269248', to_date('15-05-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (188072281, 'Clay', 'Nutley', '056-7226867', to_date('02-05-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (466704239, 'Margarete', 'Eyckelbeck', '059-4561655', to_date('13-11-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (685077320, 'Andre', 'Hanburry', '058-0290402', to_date('18-02-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (421379614, 'Helyn', 'Sollett', '058-5010499', to_date('17-05-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (728982438, 'Lilllie', 'Leehane', '056-4643331', to_date('02-01-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (245092124, 'Laurena', 'Machan', '054-0255400', to_date('30-10-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (359535395, 'Theda', 'Leggen', '054-9895040', to_date('23-01-1957', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (766945227, 'Vanna', 'Dibbe', '050-3458788', to_date('20-07-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (476023236, 'Axe', 'Joscelyn', '058-5516641', to_date('23-12-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (798874886, 'Imogene', 'Commander', '053-6385969', to_date('03-05-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (237881862, 'Nani', 'Gelardi', '055-3019592', to_date('20-01-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (123691481, 'Anatol', 'Riggeard', '051-7133317', to_date('18-03-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (888759649, 'Yule', 'Fasset', '059-6936972', to_date('11-10-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (707847577, 'Dion', 'Lermouth', '057-2391816', to_date('16-09-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (64736067, 'Rod', 'McGerraghty', '051-7839405', to_date('29-11-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (925822986, 'Tiebold', 'Van der Veldt', '055-3384113', to_date('04-05-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (650413575, 'Vinita', 'Lowder', '055-3914248', to_date('11-12-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (588794379, 'Early', 'McColm', '057-4620860', to_date('01-06-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (468581292, 'Fulton', 'Schimmang', '052-3638848', to_date('07-04-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (226059752, 'Glenine', 'Rickasse', '058-5740240', to_date('21-05-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (877573026, 'Jazmin', 'Oxby', '055-5704551', to_date('12-04-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (2857898, 'Clemence', 'McCumskay', '055-3869793', to_date('07-05-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (217859613, 'Jo ann', 'Klaesson', '054-5225667', to_date('07-02-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (939126537, 'Marielle', 'Maffucci', '054-7130510', to_date('27-10-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (234144451, 'Gerry', 'Eite', '050-0623158', to_date('17-02-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (611577581, 'Mark', 'Howgill', '055-1353161', to_date('30-10-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (843951632, 'Lilia', 'Petersen', '051-4663432', to_date('17-05-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (866202787, 'Betti', 'Allberry', '056-9432132', to_date('27-05-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (646516784, 'Ynez', 'Halwood', '053-3196999', to_date('09-08-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (968526889, 'Delila', 'Oates', '055-4154265', to_date('02-03-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (673677392, 'Sandy', 'Brellin', '059-1767753', to_date('17-03-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (160706421, 'Jermain', 'Goodey', '057-6359894', to_date('15-11-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (795957244, 'Billy', 'Hawkswood', '057-6722554', to_date('03-03-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (133998877, 'Clerkclaude', 'Chalfain', '059-8281831', to_date('18-10-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (820779695, 'Glyn', 'Madden', '057-2810523', to_date('12-07-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (524251693, 'Lauri', 'Dow', '054-3505096', to_date('06-09-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (941687249, 'Celinda', 'Oppy', '055-6650779', to_date('06-11-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (800412043, 'Barri', 'Jozwiak', '053-2078742', to_date('12-11-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (489199526, 'Alvie', 'Ramstead', '055-4600393', to_date('12-02-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (680043570, 'Garv', 'Lawlie', '051-7243563', to_date('27-03-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (490583178, 'Livvy', 'Kmicicki', '050-7584589', to_date('26-03-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (482993650, 'Elwira', 'Kernock', '057-4897364', to_date('26-09-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (772536129, 'Nelli', 'Muckian', '053-3397122', to_date('29-10-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (415417607, 'Puff', 'Yardy', '058-8548163', to_date('29-01-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (675515920, 'Hieronymus', 'Franzke', '050-3175148', to_date('20-09-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (667839651, 'Ansell', 'Summerskill', '053-0469466', to_date('02-07-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (490962785, 'Mathias', 'Rosenbush', '051-7448176', to_date('07-12-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (470914472, 'Jazmin', 'Dugmore', '052-0901519', to_date('09-03-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (849525653, 'Carlye', 'Rhydderch', '056-4258562', to_date('13-08-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (12227669, 'Linn', 'Pawelski', '057-1561755', to_date('13-11-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (4893073, 'Kaylee', 'Huerta', '058-7022716', to_date('21-12-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (783684296, 'Roi', 'Gallahar', '053-5640741', to_date('31-05-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (598951853, 'Row', 'Peddie', '054-5527944', to_date('16-07-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (861992294, 'Mikol', 'McNeely', '059-6416066', to_date('21-12-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (568531463, 'Pamelina', 'Filov', '058-7072663', to_date('12-11-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (877539276, 'Jonie', 'Annetts', '056-6595013', to_date('20-02-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (814110522, 'Jefferson', 'Delucia', '059-1707686', to_date('31-05-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (855092810, 'Gardiner', 'Moller', '058-2804937', to_date('25-03-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (999038831, 'Revkah', 'Hellin', '050-8426919', to_date('25-08-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (966337064, 'Clerc', 'Wrassell', '053-7251261', to_date('17-12-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (535649481, 'Mariann', 'Metzing', '056-9103918', to_date('03-09-1958', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (31428778, 'Piper', 'O'' Hogan', '059-5223403', to_date('17-08-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (490312661, 'Brandais', 'Hardison', '052-9593738', to_date('29-08-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (431285163, 'Alfredo', 'Tibbs', '053-2534348', to_date('13-05-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (756920398, 'Anderea', 'Kinforth', '057-1109476', to_date('27-01-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (943456742, 'Christophe', 'O''Nion', '052-8410289', to_date('09-03-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (908599989, 'Yalonda', 'Salvadore', '053-8144220', to_date('05-04-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (754061026, 'Page', 'Garrould', '052-6538080', to_date('09-03-1957', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (758968293, 'Mildred', 'Cornford', '052-3855479', to_date('24-06-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (182083568, 'Erek', 'D''eathe', '055-8101419', to_date('17-11-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (69104966, 'Miguel', 'Prettyman', '053-0341626', to_date('19-01-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (479122828, 'Della', 'Dyshart', '059-3725656', to_date('07-06-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (327909575, 'Sharlene', 'Farndon', '051-2186156', to_date('21-06-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (325668343, 'Markus', 'Grimmert', '057-9151234', to_date('17-11-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (613226493, 'Hermine', 'Buddington', '059-4693516', to_date('15-06-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (852595176, 'Evania', 'Feeham', '058-9125686', to_date('19-11-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (374359889, 'Bridie', 'Robez', '056-6561375', to_date('09-09-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (972627089, 'Lydia', 'Laudham', '057-1042200', to_date('12-12-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (140291562, 'Reena', 'Pavinese', '058-4856410', to_date('16-07-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (586728337, 'Deedee', 'Treace', '055-5906438', to_date('28-10-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (821095400, 'Jacquenetta', 'Fogel', '055-7632892', to_date('21-12-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (86148440, 'Jone', 'Vasilik', '057-9391673', to_date('16-03-1982', 'dd-mm-yyyy'));
commit;
prompt 700 records committed...
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (430796178, 'Brenna', 'Brotherwood', '052-0493729', to_date('06-09-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (837792164, 'Carl', 'Swanston', '059-3912398', to_date('23-07-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (240363167, 'Adelaida', 'Foskin', '059-4140195', to_date('13-02-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (363538001, 'Mirna', 'Jansik', '059-8025705', to_date('24-11-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (556124417, 'Dorisa', 'Tootell', '053-8789963', to_date('10-12-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (161599568, 'Roddie', 'Oman', '051-9264167', to_date('25-07-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (993320000, 'Sly', 'Levings', '054-4792604', to_date('07-03-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (315342772, 'Constantia', 'Digby', '057-3546270', to_date('22-02-1998', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (600565025, 'Evvy', 'Sighart', '058-6532311', to_date('23-10-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (263101536, 'Abbey', 'Gogin', '056-0562267', to_date('16-02-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (301443611, 'Emilia', 'Betjeman', '059-6065207', to_date('27-11-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (102017463, 'Veronike', 'Claus', '054-3781248', to_date('05-09-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (333013222, 'Olivia', 'Macias', '058-2309454', to_date('28-10-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (626639881, 'Valida', 'Bartolozzi', '057-0536112', to_date('15-12-1998', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (40282389, 'Iggie', 'de la Tremoille', '050-3630265', to_date('20-07-2001', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (997645211, 'Darryl', 'Warlock', '056-5361961', to_date('07-02-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (56911556, 'Ellsworth', 'McPike', '052-5528647', to_date('09-02-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (881483798, 'Hilario', 'Giorgione', '051-3237807', to_date('28-04-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (266453328, 'Stephen', 'Terbeek', '055-8952618', to_date('26-01-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (95439872, 'Lorena', 'Oldacre', '057-9694018', to_date('06-02-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (175052450, 'Salmon', 'McNicol', '052-0485540', to_date('14-10-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (270808716, 'Hyatt', 'Derrell', '051-6185112', to_date('10-08-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (25891153, 'Noellyn', 'Riccio', '058-8390995', to_date('13-06-1974', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (523451806, 'Quintin', 'Shead', '054-8914556', to_date('23-06-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (218659047, 'Araldo', 'Sodor', '056-2189361', to_date('17-02-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (282684362, 'Darrick', 'Fley', '058-0723145', to_date('08-10-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (941464739, 'Cyndia', 'Chantler', '057-4073221', to_date('02-08-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (835329653, 'Sutton', 'Jessel', '054-0879174', to_date('12-02-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (60744916, 'Glenn', 'Mishaw', '059-5374290', to_date('06-12-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (188029232, 'Vina', 'Mattiussi', '057-7445722', to_date('25-03-2001', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (44465715, 'Becki', 'Kopf', '051-3032146', to_date('22-01-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (536509662, 'Nero', 'Morena', '054-4908321', to_date('28-02-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (144615441, 'Kerby', 'Gepson', '052-6844796', to_date('09-03-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (465299234, 'Hector', 'Tucknutt', '053-5097021', to_date('06-05-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (665466160, 'Kenton', 'Flew', '055-9579807', to_date('25-07-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (625840894, 'Bronny', 'Martijn', '053-5292665', to_date('24-12-1974', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (714762730, 'Aretha', 'Braunroth', '050-5279036', to_date('06-01-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (901112139, 'Cleavland', 'Preskett', '051-0680691', to_date('26-08-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (308779289, 'Opalina', 'Rosbottom', '053-3334268', to_date('28-04-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (648463833, 'Afton', 'Sharram', '059-4133559', to_date('26-10-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (94566420, 'Ariadne', 'Rosenbarg', '051-0749570', to_date('20-10-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (350068332, 'Evangelia', 'McIlheran', '058-2074614', to_date('14-10-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (781133015, 'Nikita', 'Concklin', '050-8347436', to_date('03-08-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (84988573, 'Geneva', 'Mityashev', '057-2269723', to_date('11-02-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (639383822, 'Ebonee', 'Sherwen', '053-5617616', to_date('19-05-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (72529663, 'Blaine', 'Jacombs', '054-1719410', to_date('19-06-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (514183516, 'Loella', 'McMullen', '056-7967475', to_date('15-04-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (983091210, 'Goddard', 'Mc Giffin', '054-7136501', to_date('20-08-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (643164813, 'Giselle', 'Larrat', '059-9383711', to_date('31-01-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (560389115, 'Norri', 'Kirkman', '053-5060632', to_date('26-12-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (389200950, 'Joelynn', 'Poupard', '058-7666354', to_date('06-08-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (259599234, 'Risa', 'Stent', '051-8020845', to_date('18-02-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (276278048, 'Barton', 'Zannotti', '053-6863686', to_date('09-09-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (720747593, 'Hilton', 'Etheridge', '056-9184859', to_date('04-01-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (207609006, 'Laurette', 'Joire', '059-7008402', to_date('25-06-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (701630400, 'Lorry', 'Buckby', '051-9294146', to_date('21-05-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (123765818, 'Danie', 'Lorrimer', '057-5434931', to_date('17-09-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (336885222, 'Alister', 'Gartin', '058-9033150', to_date('28-12-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (342621082, 'Burk', 'Bracco', '050-1655759', to_date('06-07-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (477805332, 'Elle', 'Antognozzii', '054-0679523', to_date('01-04-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (13167398, 'Hy', 'Catlin', '053-9351742', to_date('02-11-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (170759957, 'Vivia', 'Scare', '053-5844441', to_date('21-12-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (900745867, 'Lloyd', 'Asple', '053-2635718', to_date('13-10-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (153296371, 'Jareb', 'Fradson', '057-0176362', to_date('12-07-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (547366813, 'Octavia', 'Drage', '051-4991946', to_date('01-04-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (202487054, 'Chloris', 'Petlyura', '053-8111500', to_date('03-03-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (517536968, 'Katrina', 'Flowith', '053-5024729', to_date('19-04-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (321174615, 'Loree', 'Cantillon', '059-0043229', to_date('26-09-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (97993488, 'Riccardo', 'Greve', '054-1791028', to_date('28-06-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (828581013, 'Vincenty', 'Frenzel;', '059-3479584', to_date('03-06-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (72817576, 'Eolanda', 'McCrillis', '058-3774338', to_date('19-02-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (524565161, 'Svend', 'Barcroft', '057-2265985', to_date('28-01-1974', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (773657751, 'Hadlee', 'Holcroft', '055-0551555', to_date('27-11-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (980331408, 'Elva', 'Brunroth', '058-1294171', to_date('20-05-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (512475504, 'Hilda', 'Hartop', '057-1864941', to_date('20-03-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (112064902, 'Querida', 'Capelle', '055-3807309', to_date('08-12-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (219208207, 'Quinta', 'Harfoot', '057-8299780', to_date('08-03-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (113066042, 'Travus', 'Van Leeuwen', '056-7942602', to_date('01-04-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (44304219, 'Ardys', 'Charley', '058-6848080', to_date('19-07-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (51527747, 'Stacey', 'Bartel', '052-1439827', to_date('05-03-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (788230207, 'Marwin', 'Fiddymont', '059-6917743', to_date('05-01-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (533903367, 'Isabelita', 'Bolzmann', '051-8152724', to_date('28-06-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (76422842, 'Jordan', 'Beynke', '057-4438384', to_date('13-01-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (155712522, 'Fernanda', 'Wickens', '056-5772176', to_date('21-12-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (737425421, 'Mari', 'Kmietsch', '052-5624181', to_date('20-11-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (262822559, 'Sharline', 'Grent', '057-0735433', to_date('30-12-1969', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (988001390, 'Orland', 'Pettiford', '050-7668044', to_date('29-10-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (567662841, 'Nancie', 'Pestridge', '055-7148449', to_date('12-06-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (140501643, 'Conroy', 'Marham', '050-1390037', to_date('28-08-1951', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (909379902, 'Edouard', 'Gecke', '058-6696209', to_date('01-04-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (356943905, 'Niko', 'Kaye', '054-4753188', to_date('05-02-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (835539743, 'Shana', 'Tottem', '058-8851693', to_date('20-07-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (765696286, 'Anatol', 'Erni', '053-5850490', to_date('22-07-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (612151249, 'Marge', 'Ludgrove', '057-9666222', to_date('07-12-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (885097258, 'Cathryn', 'Gillespey', '055-3065370', to_date('08-12-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (720772631, 'Rodney', 'Foulstone', '050-4391424', to_date('16-05-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (419327765, 'Marve', 'Starie', '055-3493951', to_date('31-12-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (957619306, 'Valaree', 'De Filippo', '054-7274256', to_date('01-11-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (896176278, 'Blair', 'Coryndon', '050-7420882', to_date('11-09-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (366684880, 'Brice', 'McKinna', '056-4939719', to_date('19-11-2002', 'dd-mm-yyyy'));
commit;
prompt 800 records committed...
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (373876324, 'Steffi', 'Raffan', '056-6029563', to_date('28-07-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (616966685, 'Tucky', 'Guild', '056-5925773', to_date('07-03-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (176604858, 'Ros', 'Pecey', '059-6596833', to_date('12-01-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (949150222, 'Leia', 'O''Carrol', '057-2341663', to_date('07-07-1976', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (533109136, 'Klarrisa', 'Hasson', '055-2782106', to_date('19-10-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (885530745, 'Lombard', 'Springate', '057-9054070', to_date('23-04-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (832059648, 'Val', 'MacKettrick', '052-4060623', to_date('07-06-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (246872062, 'Beatrisa', 'Koba', '052-8606938', to_date('21-05-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (783933452, 'Gus', 'Taborre', '055-1563605', to_date('05-02-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (251613319, 'Eldridge', 'Dudney', '052-2601984', to_date('31-12-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (801851413, 'Noelani', 'Newnham', '055-2321038', to_date('08-04-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (824331991, 'Arlen', 'De Brett', '050-8977281', to_date('20-03-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (86666800, 'Innis', 'McMenamy', '057-0070906', to_date('06-09-1976', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (101425911, 'Johnny', 'Watkin', '056-3129953', to_date('26-01-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (788085938, 'Roda', 'Cowans', '051-0861494', to_date('25-06-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (485811324, 'Mollee', 'Shilstone', '059-6145646', to_date('10-12-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (262792649, 'Loren', 'Josselsohn', '056-5756149', to_date('05-03-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (678570939, 'Ilka', 'Stobbs', '058-1958515', to_date('11-07-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (655273545, 'Jayme', 'O''Malley', '051-2395633', to_date('18-10-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (155069965, 'Kenn', 'Boldock', '051-0361967', to_date('13-11-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (805557604, 'Rebeca', 'Pell', '053-7662948', to_date('25-12-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (598290979, 'Rebekkah', 'Barcroft', '057-6073939', to_date('19-11-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (412184279, 'Neale', 'Faivre', '057-8627492', to_date('02-03-1974', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (432611063, 'Erina', 'Divine', '052-5650061', to_date('14-01-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (511329433, 'Isadora', 'Abela', '058-6126478', to_date('05-05-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (373854719, 'Hazlett', 'Shickle', '052-8538025', to_date('02-11-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (240720425, 'Ardyth', 'Ribchester', '058-2015499', to_date('12-02-1974', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (98648883, 'Morley', 'Jakubovsky', '057-6355847', to_date('04-04-1958', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (90488352, 'Dela', 'Gavaghan', '059-4047135', to_date('10-04-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (522329367, 'Kane', 'Mulholland', '055-7744784', to_date('15-08-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (35826051, 'Hamel', 'Riccelli', '053-0494157', to_date('08-05-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (604314524, 'Jacquette', 'Krammer', '058-2296873', to_date('13-05-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (306494187, 'Evin', 'Spridgen', '057-3826313', to_date('02-06-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (195674427, 'Aksel', 'Galway', '058-5921966', to_date('24-03-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (489747556, 'Sawyere', 'Weldon', '057-2610662', to_date('19-09-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (578746202, 'Leopold', 'Jansson', '055-2954470', to_date('14-07-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (600547797, 'Sherrie', 'Whyard', '057-9833448', to_date('07-12-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (950569167, 'Andie', 'Worlock', '050-2910028', to_date('02-05-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (486704013, 'Ambros', 'Bacon', '051-5618748', to_date('28-01-1998', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (354679237, 'Sibby', 'McGerraghty', '052-4064964', to_date('29-11-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (41324453, 'Merilyn', 'Dell Casa', '052-7205100', to_date('23-12-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (108491788, 'Pat', 'Downton', '058-3222156', to_date('22-08-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (769196457, 'Ilario', 'Bruty', '058-7017180', to_date('11-02-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (578076200, 'Gilda', 'Malling', '059-2002186', to_date('05-03-1998', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (302347542, 'Pascal', 'Fozard', '054-0976733', to_date('28-10-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (451972516, 'Feodora', 'Siddens', '057-8725515', to_date('15-03-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (629950329, 'Regan', 'Benoy', '056-0006369', to_date('28-04-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (769182328, 'Tabb', 'Maplestone', '052-4567521', to_date('26-10-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (765705985, 'Percy', 'Wykey', '055-6660965', to_date('20-12-1959', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (476293003, 'Georgette', 'Reinbeck', '052-0861113', to_date('03-04-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (23399145, 'Roxana', 'McAusland', '050-2832277', to_date('19-09-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (642152630, 'Hewett', 'Millson', '051-1874291', to_date('28-12-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (511459338, 'Pail', 'Jouhandeau', '056-9292381', to_date('12-04-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (843604069, 'Juliette', 'Jacobovitch', '059-4541927', to_date('26-05-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (11673023, 'Clea', 'Towsie', '056-4715397', to_date('07-11-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (899893645, 'Cristie', 'Duffrie', '058-4607257', to_date('02-09-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (720330162, 'Barton', 'Michin', '057-5820609', to_date('07-10-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (749808930, 'Alyss', 'Romanski', '057-6538060', to_date('21-05-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (969674, 'Jessy', 'Louisot', '058-1827241', to_date('03-09-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (515635766, 'Tad', 'Elger', '053-6395442', to_date('03-03-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (946531589, 'Rodd', 'Stowers', '059-2500462', to_date('14-12-2002', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (27873101, 'Caritta', 'Astall', '052-8407689', to_date('17-02-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (196104946, 'Crin', 'Falcus', '055-4034549', to_date('05-12-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (652549773, 'Gene', 'Matskevich', '057-5336479', to_date('14-09-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (484373323, 'Harriot', 'Farnes', '059-4334901', to_date('03-06-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (960513263, 'Pete', 'Pahl', '053-0521481', to_date('24-02-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (634098291, 'Fiann', 'Boldecke', '058-0508962', to_date('27-09-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (682634917, 'Sharai', 'Leasor', '055-7006628', to_date('13-08-1987', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (862875266, 'Gabbey', 'Georg', '051-4866520', to_date('08-02-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (220987929, 'Raquela', 'Hriinchenko', '058-4822971', to_date('11-03-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (591346237, 'Kali', 'Eakly', '053-8323024', to_date('09-04-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (485981424, 'Olive', 'Bailes', '054-0902034', to_date('16-05-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (54417215, 'Arline', 'Sparrowhawk', '059-0301492', to_date('23-07-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (360902723, 'Fiorenze', 'Page', '056-3217071', to_date('27-03-1958', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (614580140, 'Patric', 'Fletham', '051-2898787', to_date('23-05-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (73257448, 'Reese', 'Wetherby', '057-5442182', to_date('15-12-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (289833124, 'Hanni', 'Aldersey', '057-7130279', to_date('29-04-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (36505847, 'Gill', 'Alven', '057-9797024', to_date('25-09-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (783863063, 'Mercy', 'Fairbank', '052-6281787', to_date('06-04-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (198753994, 'Franky', 'Irce', '052-4262556', to_date('17-06-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (803830284, 'Reggy', 'Izachik', '055-7252910', to_date('19-09-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (299788707, 'Ardyth', 'Culy', '053-6953291', to_date('31-03-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (609739554, 'Augie', 'Anetts', '055-7868239', to_date('06-03-1994', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (99649496, 'Kirstin', 'Froom', '056-1443693', to_date('12-05-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (706372965, 'Dinny', 'Blackboro', '057-0570637', to_date('05-11-1976', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (481750857, 'Koral', 'Cadden', '059-2565341', to_date('03-01-2000', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (484342221, 'Hardy', 'Sucre', '059-5654970', to_date('16-07-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (558729084, 'Anny', 'McGuane', '058-0619405', to_date('04-05-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (795871548, 'Jerry', 'MacKeeg', '054-4428962', to_date('08-01-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (412264478, 'Mickey', 'Dwane', '058-5186277', to_date('12-01-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (816395737, 'Claybourne', 'Quadri', '057-7956674', to_date('06-07-1975', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (268044474, 'Fletcher', 'Bodell', '058-6929522', to_date('02-11-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (868761412, 'Tucker', 'Riall', '057-7287040', to_date('08-07-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (403314295, 'Hadria', 'Channing', '054-5870737', to_date('03-03-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (548178067, 'Carey', 'Caulder', '051-4239075', to_date('30-01-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (762962339, 'Sawyere', 'Hargrove', '057-3990839', to_date('12-06-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (194960528, 'Karry', 'Bann', '057-7786770', to_date('05-04-1971', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (986235526, 'Pen', 'Dimitriades', '055-3440424', to_date('15-08-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (606478972, 'Westbrook', 'Christiensen', '051-5926313', to_date('03-09-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (393469268, 'Halsey', 'Biaggiotti', '050-3176194', to_date('07-08-1968', 'dd-mm-yyyy'));
commit;
prompt 900 records committed...
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (605649551, 'Jaquelin', 'Vickerstaff', '056-7116171', to_date('15-05-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (770455507, 'Terza', 'Rahlof', '058-9713260', to_date('16-06-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (619194539, 'Lezley', 'Dome', '054-5235432', to_date('31-10-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (116057021, 'Jeni', 'Pethrick', '052-6632832', to_date('10-02-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (844228581, 'Kitty', 'Kernoghan', '053-7406042', to_date('21-07-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (410038530, 'Mahmoud', 'Rannigan', '051-0169197', to_date('08-12-1974', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (296299402, 'Joey', 'Oakinfold', '056-4879589', to_date('11-02-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (852243083, 'Roseanne', 'Gwynn', '054-1269152', to_date('01-11-1953', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (550349575, 'Katherina', 'Thomson', '050-3728868', to_date('06-08-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (583464144, 'Sandra', 'Bowld', '053-7173650', to_date('13-11-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (563441466, 'Millard', 'Leamy', '058-8006799', to_date('15-06-1998', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (530536798, 'Scarlet', 'Poulton', '054-0251870', to_date('04-08-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (763375928, 'Joanie', 'Dielhenn', '055-4103837', to_date('13-05-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (694978269, 'Bayard', 'Wright', '059-9019797', to_date('08-01-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (637500348, 'Jeremias', 'MacCurtain', '057-0576499', to_date('17-10-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (681951092, 'Tomasina', 'Mitcheson', '059-5449592', to_date('14-07-1962', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (638881720, 'Ariela', 'Hampton', '056-9899159', to_date('08-05-1984', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (677446448, 'Cathrin', 'McNelis', '052-2379244', to_date('21-12-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (544790398, 'Karina', 'Ciccetti', '051-1223812', to_date('23-02-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (785721807, 'Dru', 'Bowcock', '052-3406100', to_date('02-07-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (848465862, 'Donelle', 'Samett', '051-6803106', to_date('04-04-1960', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (186616883, 'Sheffy', 'Girkin', '052-4394942', to_date('03-05-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (358138824, 'Garald', 'Sillett', '050-2844140', to_date('19-07-1983', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (919760560, 'Dael', 'Aleshkov', '051-2035556', to_date('05-12-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (755928705, 'Kym', 'McAster', '056-8973280', to_date('15-12-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (82049226, 'Rosalind', 'Rickasse', '054-1162617', to_date('02-12-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (720781363, 'Robinson', 'Shurman', '052-4354616', to_date('04-05-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (498951940, 'Brantley', 'Gherardini', '054-5117219', to_date('01-01-1963', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (843531052, 'Kira', 'Spancock', '055-7883403', to_date('11-01-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (274601364, 'Shawnee', 'Theml', '058-5448260', to_date('10-10-1988', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (556202300, 'Pamelina', 'Rowledge', '057-3098275', to_date('26-10-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (345543710, 'Muire', 'Ciardo', '059-1398829', to_date('14-10-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (342897518, 'Roselin', 'Kindell', '056-2313178', to_date('15-12-1958', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (900443642, 'Kyle', 'Boocock', '050-2790636', to_date('17-09-1957', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (416685025, 'Mallory', 'Linch', '058-9016847', to_date('11-05-1995', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (140402261, 'Gino', 'Lythgoe', '056-0235049', to_date('10-11-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (596600647, 'Winston', 'Valentetti', '059-3529538', to_date('21-07-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (242082772, 'Althea', 'Winfindine', '057-4397240', to_date('23-12-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (519485195, 'Kay', 'Jeanet', '058-2119252', to_date('10-08-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (986855538, 'Kristal', 'Wilman', '057-7035628', to_date('11-04-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (978411914, 'Coletta', 'Cockerton', '058-6230931', to_date('24-03-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (193479284, 'Giffard', 'Dietmar', '053-6149537', to_date('14-04-1957', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (682508863, 'Fredek', 'Garfitt', '055-5832798', to_date('14-09-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (394921378, 'Briano', 'Fidler', '055-7545316', to_date('20-04-1964', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (420324658, 'Gaven', 'Minet', '054-4202329', to_date('07-08-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (802169064, 'Rafe', 'Branston', '058-2507846', to_date('01-03-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (401954315, 'Bowie', 'Guerrieri', '058-5035536', to_date('14-09-1968', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (178939047, 'Amelia', 'Jerche', '058-1915106', to_date('13-04-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (485714755, 'Reine', 'Presnell', '052-1909854', to_date('07-07-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (656933573, 'Celinda', 'McClure', '057-0520880', to_date('21-01-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (112756689, 'Orin', 'Blakeway', '051-2457278', to_date('19-08-1967', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (248243489, 'Esma', 'Goudy', '050-8871798', to_date('15-07-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (159361012, 'Efrem', 'Norsworthy', '059-7114499', to_date('05-09-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (441026372, 'Tessa', 'Ortas', '054-0419456', to_date('18-03-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (15898046, 'Alfons', 'Hammatt', '057-2908277', to_date('27-03-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (814830056, 'Claudius', 'Shercliff', '052-4155464', to_date('24-07-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (965781192, 'Jaymee', 'Ragsdall', '052-9726795', to_date('19-06-1982', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (419630680, 'Onida', 'Remer', '052-2274822', to_date('11-12-1978', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (953250268, 'Samara', 'Georgius', '056-1875417', to_date('03-09-2004', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (461511463, 'Shae', 'Willacot', '059-2771413', to_date('01-03-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (13638529, 'Gretel', 'Lindberg', '058-4640830', to_date('20-12-1954', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (846935422, 'Aaron', 'Axon', '052-6657842', to_date('28-04-1985', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (722961842, 'Sydel', 'Blankley', '051-2582464', to_date('26-01-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (877077950, 'Cristen', 'MacRannell', '055-0553514', to_date('13-04-1986', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (581395647, 'Vick', 'Eales', '059-3649193', to_date('25-07-1958', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (420311890, 'Roberta', 'Coners', '053-1734974', to_date('26-06-1961', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (782241521, 'Veriee', 'Londsdale', '057-3854331', to_date('10-06-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (624221074, 'Guglielma', 'Mate', '050-8404270', to_date('03-03-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (277119141, 'Rosemary', 'Butrimovich', '058-4048626', to_date('11-03-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (618703571, 'Sheelah', 'Sapsforde', '055-3594301', to_date('11-11-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (512976318, 'Bay', 'Crofthwaite', '057-5159348', to_date('25-11-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (81016415, 'Godwin', 'Maria', '056-4136046', to_date('04-10-1997', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (300688294, 'Celene', 'MacGuigan', '052-9475410', to_date('03-11-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (595922257, 'Mart', 'Deakins', '050-2376331', to_date('12-04-1973', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (139796076, 'Concettina', 'Helbeck', '058-0547525', to_date('09-01-1956', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (969249981, 'Archibold', 'Swayland', '056-8868562', to_date('01-01-1992', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (335860694, 'Beckie', 'Yakushkin', '059-0805999', to_date('18-01-1989', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (261420471, 'Calv', 'Gresch', '058-5404092', to_date('22-04-1955', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (124045879, 'Avrom', 'Ianno', '057-3996154', to_date('17-05-1991', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (384592074, 'Leigh', 'Fuxman', '051-8658401', to_date('23-01-1999', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (985232422, 'Brett', 'Lendrem', '051-0128625', to_date('14-05-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (573376389, 'Ninon', 'Mearns', '050-2807097', to_date('21-03-1977', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (561238982, 'Siffre', 'Simmill', '053-5450766', to_date('11-09-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (619496339, 'Janot', 'Craxford', '059-7239861', to_date('28-08-1981', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (282186141, 'Codie', 'Dive', '057-6994109', to_date('22-09-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (419694395, 'Scot', 'Hefford', '051-5791654', to_date('27-12-1993', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (296594528, 'Marinna', 'Fabler', '058-4635665', to_date('01-06-1996', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (513883630, 'Ronda', 'Pryell', '053-1066908', to_date('13-09-1980', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (853702225, 'Townsend', 'Whiffin', '051-2451121', to_date('13-08-1972', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (303063139, 'Lu', 'Mcettrick', '052-9695829', to_date('14-06-1965', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (192263489, 'Pamelina', 'Das', '056-8631006', to_date('15-09-2003', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (630633714, 'Crawford', 'Saxby', '052-5718051', to_date('17-05-1979', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (14416899, 'Arleyne', 'Eriksson', '054-1239970', to_date('15-05-1966', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (62968273, 'Merrill', 'Verzey', '050-4309088', to_date('05-01-1976', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (482581963, 'Pete', 'Nelsen', '050-5253570', to_date('16-09-1952', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (693123424, 'Gare', 'MacFaell', '054-2231976', to_date('14-09-1950', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (600298345, 'Zelig', 'Sayes', '054-2822471', to_date('23-06-2005', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (868984325, 'Henri', 'Lummis', '050-8575298', to_date('08-07-1970', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (48751690, 'Rutledge', 'Espley', '056-1370705', to_date('11-04-1990', 'dd-mm-yyyy'));
insert into GUEST (guest_id, first_name, last_name, phone, date_of_birth)
values (109075399, 'Guenna', 'Towers', '054-8550926', to_date('15-11-1974', 'dd-mm-yyyy'));
commit;
prompt 1000 records loaded
prompt Loading ROOM...
insert into ROOM (room_number, beds, balcony, price)
values (1, 5, 'No', 324);
insert into ROOM (room_number, beds, balcony, price)
values (2, 5, 'Yes', 600);
insert into ROOM (room_number, beds, balcony, price)
values (3, 5, 'Yes', 1196);
insert into ROOM (room_number, beds, balcony, price)
values (4, 5, 'Yes', 1150);
insert into ROOM (room_number, beds, balcony, price)
values (5, 4, 'Yes', 1028);
insert into ROOM (room_number, beds, balcony, price)
values (6, 5, 'Yes', 695);
insert into ROOM (room_number, beds, balcony, price)
values (7, 2, 'No', 725);
insert into ROOM (room_number, beds, balcony, price)
values (8, 2, 'No', 995);
insert into ROOM (room_number, beds, balcony, price)
values (9, 4, 'Yes', 797);
insert into ROOM (room_number, beds, balcony, price)
values (10, 5, 'No', 555);
insert into ROOM (room_number, beds, balcony, price)
values (11, 5, 'No', 651);
insert into ROOM (room_number, beds, balcony, price)
values (12, 4, 'No', 1093);
insert into ROOM (room_number, beds, balcony, price)
values (13, 4, 'No', 972);
insert into ROOM (room_number, beds, balcony, price)
values (14, 5, 'No', 1120);
insert into ROOM (room_number, beds, balcony, price)
values (15, 5, 'No', 503);
insert into ROOM (room_number, beds, balcony, price)
values (16, 2, 'Yes', 399);
insert into ROOM (room_number, beds, balcony, price)
values (17, 4, 'No', 988);
insert into ROOM (room_number, beds, balcony, price)
values (18, 2, 'No', 757);
insert into ROOM (room_number, beds, balcony, price)
values (19, 2, 'Yes', 994);
insert into ROOM (room_number, beds, balcony, price)
values (20, 4, 'Yes', 1006);
insert into ROOM (room_number, beds, balcony, price)
values (21, 5, 'Yes', 617);
insert into ROOM (room_number, beds, balcony, price)
values (22, 2, 'No', 1075);
insert into ROOM (room_number, beds, balcony, price)
values (23, 5, 'Yes', 579);
insert into ROOM (room_number, beds, balcony, price)
values (24, 4, 'Yes', 964);
insert into ROOM (room_number, beds, balcony, price)
values (25, 4, 'No', 863);
insert into ROOM (room_number, beds, balcony, price)
values (26, 4, 'Yes', 611);
insert into ROOM (room_number, beds, balcony, price)
values (27, 5, 'No', 1054);
insert into ROOM (room_number, beds, balcony, price)
values (28, 4, 'No', 811);
insert into ROOM (room_number, beds, balcony, price)
values (29, 4, 'Yes', 868);
insert into ROOM (room_number, beds, balcony, price)
values (30, 5, 'No', 329);
insert into ROOM (room_number, beds, balcony, price)
values (31, 5, 'Yes', 642);
insert into ROOM (room_number, beds, balcony, price)
values (32, 5, 'Yes', 1119);
insert into ROOM (room_number, beds, balcony, price)
values (33, 2, 'Yes', 1033);
insert into ROOM (room_number, beds, balcony, price)
values (34, 5, 'Yes', 516);
insert into ROOM (room_number, beds, balcony, price)
values (35, 5, 'Yes', 1129);
insert into ROOM (room_number, beds, balcony, price)
values (36, 5, 'No', 307);
insert into ROOM (room_number, beds, balcony, price)
values (37, 2, 'Yes', 754);
insert into ROOM (room_number, beds, balcony, price)
values (38, 5, 'No', 1052);
insert into ROOM (room_number, beds, balcony, price)
values (39, 4, 'Yes', 460);
insert into ROOM (room_number, beds, balcony, price)
values (40, 5, 'No', 418);
insert into ROOM (room_number, beds, balcony, price)
values (41, 2, 'No', 742);
insert into ROOM (room_number, beds, balcony, price)
values (42, 5, 'Yes', 433);
insert into ROOM (room_number, beds, balcony, price)
values (43, 4, 'Yes', 580);
insert into ROOM (room_number, beds, balcony, price)
values (44, 5, 'No', 1023);
insert into ROOM (room_number, beds, balcony, price)
values (45, 5, 'No', 458);
insert into ROOM (room_number, beds, balcony, price)
values (46, 4, 'No', 363);
insert into ROOM (room_number, beds, balcony, price)
values (47, 2, 'Yes', 423);
insert into ROOM (room_number, beds, balcony, price)
values (48, 4, 'No', 862);
insert into ROOM (room_number, beds, balcony, price)
values (49, 2, 'No', 829);
insert into ROOM (room_number, beds, balcony, price)
values (50, 4, 'No', 1004);
insert into ROOM (room_number, beds, balcony, price)
values (51, 2, 'Yes', 695);
insert into ROOM (room_number, beds, balcony, price)
values (52, 4, 'Yes', 640);
insert into ROOM (room_number, beds, balcony, price)
values (53, 2, 'Yes', 505);
insert into ROOM (room_number, beds, balcony, price)
values (54, 5, 'No', 773);
insert into ROOM (room_number, beds, balcony, price)
values (55, 5, 'No', 787);
insert into ROOM (room_number, beds, balcony, price)
values (56, 2, 'No', 664);
insert into ROOM (room_number, beds, balcony, price)
values (57, 5, 'Yes', 474);
insert into ROOM (room_number, beds, balcony, price)
values (58, 5, 'No', 876);
insert into ROOM (room_number, beds, balcony, price)
values (59, 5, 'Yes', 414);
insert into ROOM (room_number, beds, balcony, price)
values (60, 5, 'Yes', 823);
insert into ROOM (room_number, beds, balcony, price)
values (61, 5, 'Yes', 841);
insert into ROOM (room_number, beds, balcony, price)
values (62, 4, 'No', 558);
insert into ROOM (room_number, beds, balcony, price)
values (63, 2, 'Yes', 925);
insert into ROOM (room_number, beds, balcony, price)
values (64, 4, 'No', 1159);
insert into ROOM (room_number, beds, balcony, price)
values (65, 2, 'No', 388);
insert into ROOM (room_number, beds, balcony, price)
values (66, 5, 'Yes', 1145);
insert into ROOM (room_number, beds, balcony, price)
values (67, 5, 'Yes', 415);
insert into ROOM (room_number, beds, balcony, price)
values (68, 2, 'No', 818);
insert into ROOM (room_number, beds, balcony, price)
values (69, 2, 'No', 1181);
insert into ROOM (room_number, beds, balcony, price)
values (70, 5, 'Yes', 390);
insert into ROOM (room_number, beds, balcony, price)
values (71, 2, 'Yes', 447);
insert into ROOM (room_number, beds, balcony, price)
values (72, 2, 'No', 1097);
insert into ROOM (room_number, beds, balcony, price)
values (73, 2, 'Yes', 851);
insert into ROOM (room_number, beds, balcony, price)
values (74, 2, 'Yes', 987);
insert into ROOM (room_number, beds, balcony, price)
values (75, 2, 'No', 339);
insert into ROOM (room_number, beds, balcony, price)
values (76, 5, 'No', 796);
insert into ROOM (room_number, beds, balcony, price)
values (77, 2, 'Yes', 895);
insert into ROOM (room_number, beds, balcony, price)
values (78, 5, 'No', 367);
insert into ROOM (room_number, beds, balcony, price)
values (79, 5, 'No', 359);
insert into ROOM (room_number, beds, balcony, price)
values (80, 5, 'Yes', 1016);
insert into ROOM (room_number, beds, balcony, price)
values (81, 2, 'Yes', 1091);
insert into ROOM (room_number, beds, balcony, price)
values (82, 5, 'Yes', 852);
insert into ROOM (room_number, beds, balcony, price)
values (83, 5, 'No', 641);
insert into ROOM (room_number, beds, balcony, price)
values (84, 5, 'No', 709);
insert into ROOM (room_number, beds, balcony, price)
values (85, 4, 'Yes', 625);
insert into ROOM (room_number, beds, balcony, price)
values (86, 2, 'No', 631);
insert into ROOM (room_number, beds, balcony, price)
values (87, 4, 'Yes', 472);
insert into ROOM (room_number, beds, balcony, price)
values (88, 2, 'No', 1176);
insert into ROOM (room_number, beds, balcony, price)
values (89, 4, 'No', 765);
insert into ROOM (room_number, beds, balcony, price)
values (90, 4, 'No', 463);
insert into ROOM (room_number, beds, balcony, price)
values (91, 5, 'Yes', 496);
insert into ROOM (room_number, beds, balcony, price)
values (92, 2, 'Yes', 1060);
insert into ROOM (room_number, beds, balcony, price)
values (93, 5, 'No', 1162);
insert into ROOM (room_number, beds, balcony, price)
values (94, 5, 'No', 782);
insert into ROOM (room_number, beds, balcony, price)
values (95, 4, 'No', 492);
insert into ROOM (room_number, beds, balcony, price)
values (96, 4, 'Yes', 1035);
insert into ROOM (room_number, beds, balcony, price)
values (97, 5, 'No', 395);
insert into ROOM (room_number, beds, balcony, price)
values (98, 2, 'No', 984);
insert into ROOM (room_number, beds, balcony, price)
values (99, 5, 'Yes', 587);
insert into ROOM (room_number, beds, balcony, price)
values (100, 2, 'No', 624);
commit;
prompt 100 records committed...
insert into ROOM (room_number, beds, balcony, price)
values (101, 5, 'Yes', 1071);
insert into ROOM (room_number, beds, balcony, price)
values (102, 4, 'Yes', 867);
insert into ROOM (room_number, beds, balcony, price)
values (103, 4, 'Yes', 589);
insert into ROOM (room_number, beds, balcony, price)
values (104, 2, 'No', 1169);
insert into ROOM (room_number, beds, balcony, price)
values (105, 5, 'Yes', 375);
insert into ROOM (room_number, beds, balcony, price)
values (106, 4, 'No', 1070);
insert into ROOM (room_number, beds, balcony, price)
values (107, 4, 'Yes', 323);
insert into ROOM (room_number, beds, balcony, price)
values (108, 5, 'Yes', 881);
insert into ROOM (room_number, beds, balcony, price)
values (109, 5, 'No', 686);
insert into ROOM (room_number, beds, balcony, price)
values (110, 4, 'Yes', 1069);
insert into ROOM (room_number, beds, balcony, price)
values (111, 4, 'No', 503);
insert into ROOM (room_number, beds, balcony, price)
values (112, 2, 'No', 576);
insert into ROOM (room_number, beds, balcony, price)
values (113, 5, 'Yes', 664);
insert into ROOM (room_number, beds, balcony, price)
values (114, 5, 'Yes', 663);
insert into ROOM (room_number, beds, balcony, price)
values (115, 4, 'No', 756);
insert into ROOM (room_number, beds, balcony, price)
values (116, 5, 'No', 836);
insert into ROOM (room_number, beds, balcony, price)
values (117, 4, 'No', 1141);
insert into ROOM (room_number, beds, balcony, price)
values (118, 4, 'Yes', 1016);
insert into ROOM (room_number, beds, balcony, price)
values (119, 4, 'Yes', 559);
insert into ROOM (room_number, beds, balcony, price)
values (120, 4, 'Yes', 1141);
insert into ROOM (room_number, beds, balcony, price)
values (121, 4, 'No', 477);
insert into ROOM (room_number, beds, balcony, price)
values (122, 5, 'No', 734);
insert into ROOM (room_number, beds, balcony, price)
values (123, 4, 'No', 814);
insert into ROOM (room_number, beds, balcony, price)
values (124, 2, 'No', 489);
insert into ROOM (room_number, beds, balcony, price)
values (125, 5, 'Yes', 910);
insert into ROOM (room_number, beds, balcony, price)
values (126, 5, 'No', 772);
insert into ROOM (room_number, beds, balcony, price)
values (127, 2, 'Yes', 913);
insert into ROOM (room_number, beds, balcony, price)
values (128, 5, 'Yes', 551);
insert into ROOM (room_number, beds, balcony, price)
values (129, 2, 'Yes', 515);
insert into ROOM (room_number, beds, balcony, price)
values (130, 5, 'No', 890);
insert into ROOM (room_number, beds, balcony, price)
values (131, 2, 'Yes', 1009);
insert into ROOM (room_number, beds, balcony, price)
values (132, 2, 'Yes', 580);
insert into ROOM (room_number, beds, balcony, price)
values (133, 2, 'No', 965);
insert into ROOM (room_number, beds, balcony, price)
values (134, 4, 'No', 373);
insert into ROOM (room_number, beds, balcony, price)
values (135, 5, 'Yes', 601);
insert into ROOM (room_number, beds, balcony, price)
values (136, 5, 'Yes', 675);
insert into ROOM (room_number, beds, balcony, price)
values (137, 5, 'Yes', 562);
insert into ROOM (room_number, beds, balcony, price)
values (138, 5, 'No', 391);
insert into ROOM (room_number, beds, balcony, price)
values (139, 5, 'No', 735);
insert into ROOM (room_number, beds, balcony, price)
values (140, 2, 'No', 752);
insert into ROOM (room_number, beds, balcony, price)
values (141, 4, 'Yes', 648);
insert into ROOM (room_number, beds, balcony, price)
values (142, 4, 'No', 672);
insert into ROOM (room_number, beds, balcony, price)
values (143, 4, 'No', 803);
insert into ROOM (room_number, beds, balcony, price)
values (144, 2, 'Yes', 1006);
insert into ROOM (room_number, beds, balcony, price)
values (145, 4, 'Yes', 1140);
insert into ROOM (room_number, beds, balcony, price)
values (146, 2, 'No', 734);
insert into ROOM (room_number, beds, balcony, price)
values (147, 5, 'Yes', 856);
insert into ROOM (room_number, beds, balcony, price)
values (148, 5, 'Yes', 679);
insert into ROOM (room_number, beds, balcony, price)
values (149, 4, 'Yes', 961);
insert into ROOM (room_number, beds, balcony, price)
values (150, 2, 'Yes', 684);
insert into ROOM (room_number, beds, balcony, price)
values (151, 5, 'No', 999);
insert into ROOM (room_number, beds, balcony, price)
values (152, 2, 'Yes', 885);
insert into ROOM (room_number, beds, balcony, price)
values (153, 4, 'No', 532);
insert into ROOM (room_number, beds, balcony, price)
values (154, 5, 'Yes', 308);
insert into ROOM (room_number, beds, balcony, price)
values (155, 2, 'No', 1014);
insert into ROOM (room_number, beds, balcony, price)
values (156, 4, 'Yes', 1138);
insert into ROOM (room_number, beds, balcony, price)
values (157, 5, 'Yes', 403);
insert into ROOM (room_number, beds, balcony, price)
values (158, 2, 'Yes', 543);
insert into ROOM (room_number, beds, balcony, price)
values (159, 2, 'No', 306);
insert into ROOM (room_number, beds, balcony, price)
values (160, 4, 'No', 798);
insert into ROOM (room_number, beds, balcony, price)
values (161, 2, 'Yes', 483);
insert into ROOM (room_number, beds, balcony, price)
values (162, 5, 'No', 1163);
insert into ROOM (room_number, beds, balcony, price)
values (163, 5, 'Yes', 1046);
insert into ROOM (room_number, beds, balcony, price)
values (164, 5, 'Yes', 1153);
insert into ROOM (room_number, beds, balcony, price)
values (165, 4, 'Yes', 668);
insert into ROOM (room_number, beds, balcony, price)
values (166, 5, 'No', 855);
insert into ROOM (room_number, beds, balcony, price)
values (167, 4, 'No', 691);
insert into ROOM (room_number, beds, balcony, price)
values (168, 5, 'No', 1185);
insert into ROOM (room_number, beds, balcony, price)
values (169, 4, 'Yes', 607);
insert into ROOM (room_number, beds, balcony, price)
values (170, 5, 'No', 309);
insert into ROOM (room_number, beds, balcony, price)
values (171, 4, 'No', 1078);
insert into ROOM (room_number, beds, balcony, price)
values (172, 2, 'Yes', 344);
insert into ROOM (room_number, beds, balcony, price)
values (173, 2, 'No', 745);
insert into ROOM (room_number, beds, balcony, price)
values (174, 5, 'Yes', 1197);
insert into ROOM (room_number, beds, balcony, price)
values (175, 2, 'No', 801);
insert into ROOM (room_number, beds, balcony, price)
values (176, 5, 'No', 734);
insert into ROOM (room_number, beds, balcony, price)
values (177, 5, 'No', 833);
insert into ROOM (room_number, beds, balcony, price)
values (178, 5, 'No', 477);
insert into ROOM (room_number, beds, balcony, price)
values (179, 4, 'Yes', 995);
insert into ROOM (room_number, beds, balcony, price)
values (180, 4, 'No', 1194);
insert into ROOM (room_number, beds, balcony, price)
values (181, 2, 'No', 846);
insert into ROOM (room_number, beds, balcony, price)
values (182, 2, 'Yes', 623);
insert into ROOM (room_number, beds, balcony, price)
values (183, 5, 'No', 1134);
insert into ROOM (room_number, beds, balcony, price)
values (184, 4, 'No', 603);
insert into ROOM (room_number, beds, balcony, price)
values (185, 2, 'No', 547);
insert into ROOM (room_number, beds, balcony, price)
values (186, 2, 'Yes', 554);
insert into ROOM (room_number, beds, balcony, price)
values (187, 5, 'Yes', 706);
insert into ROOM (room_number, beds, balcony, price)
values (188, 5, 'No', 1143);
insert into ROOM (room_number, beds, balcony, price)
values (189, 5, 'Yes', 1117);
insert into ROOM (room_number, beds, balcony, price)
values (190, 4, 'Yes', 567);
insert into ROOM (room_number, beds, balcony, price)
values (191, 5, 'Yes', 584);
insert into ROOM (room_number, beds, balcony, price)
values (192, 5, 'No', 872);
insert into ROOM (room_number, beds, balcony, price)
values (193, 5, 'No', 691);
insert into ROOM (room_number, beds, balcony, price)
values (194, 2, 'No', 977);
insert into ROOM (room_number, beds, balcony, price)
values (195, 4, 'Yes', 386);
insert into ROOM (room_number, beds, balcony, price)
values (196, 4, 'No', 979);
insert into ROOM (room_number, beds, balcony, price)
values (197, 2, 'Yes', 1137);
insert into ROOM (room_number, beds, balcony, price)
values (198, 5, 'Yes', 1150);
insert into ROOM (room_number, beds, balcony, price)
values (199, 4, 'No', 1181);
insert into ROOM (room_number, beds, balcony, price)
values (200, 2, 'No', 506);
commit;
prompt 200 records committed...
insert into ROOM (room_number, beds, balcony, price)
values (201, 5, 'No', 977);
insert into ROOM (room_number, beds, balcony, price)
values (202, 4, 'Yes', 601);
insert into ROOM (room_number, beds, balcony, price)
values (203, 5, 'No', 705);
insert into ROOM (room_number, beds, balcony, price)
values (204, 5, 'No', 1012);
insert into ROOM (room_number, beds, balcony, price)
values (205, 4, 'Yes', 1084);
insert into ROOM (room_number, beds, balcony, price)
values (206, 4, 'No', 616);
insert into ROOM (room_number, beds, balcony, price)
values (207, 4, 'No', 564);
insert into ROOM (room_number, beds, balcony, price)
values (208, 4, 'Yes', 436);
insert into ROOM (room_number, beds, balcony, price)
values (209, 4, 'No', 487);
insert into ROOM (room_number, beds, balcony, price)
values (210, 5, 'Yes', 764);
insert into ROOM (room_number, beds, balcony, price)
values (211, 5, 'Yes', 316);
insert into ROOM (room_number, beds, balcony, price)
values (212, 5, 'Yes', 605);
insert into ROOM (room_number, beds, balcony, price)
values (213, 4, 'Yes', 985);
insert into ROOM (room_number, beds, balcony, price)
values (214, 2, 'No', 1157);
insert into ROOM (room_number, beds, balcony, price)
values (215, 2, 'No', 942);
insert into ROOM (room_number, beds, balcony, price)
values (216, 4, 'No', 987);
insert into ROOM (room_number, beds, balcony, price)
values (217, 4, 'Yes', 550);
insert into ROOM (room_number, beds, balcony, price)
values (218, 5, 'No', 538);
insert into ROOM (room_number, beds, balcony, price)
values (219, 4, 'Yes', 528);
insert into ROOM (room_number, beds, balcony, price)
values (220, 4, 'No', 362);
insert into ROOM (room_number, beds, balcony, price)
values (221, 2, 'Yes', 660);
insert into ROOM (room_number, beds, balcony, price)
values (222, 4, 'Yes', 1075);
insert into ROOM (room_number, beds, balcony, price)
values (223, 2, 'Yes', 692);
insert into ROOM (room_number, beds, balcony, price)
values (224, 5, 'No', 962);
insert into ROOM (room_number, beds, balcony, price)
values (225, 5, 'No', 1066);
insert into ROOM (room_number, beds, balcony, price)
values (226, 5, 'No', 1063);
insert into ROOM (room_number, beds, balcony, price)
values (227, 4, 'No', 1113);
insert into ROOM (room_number, beds, balcony, price)
values (228, 2, 'Yes', 418);
insert into ROOM (room_number, beds, balcony, price)
values (229, 4, 'Yes', 652);
insert into ROOM (room_number, beds, balcony, price)
values (230, 4, 'No', 1089);
insert into ROOM (room_number, beds, balcony, price)
values (231, 5, 'No', 477);
insert into ROOM (room_number, beds, balcony, price)
values (232, 2, 'Yes', 720);
insert into ROOM (room_number, beds, balcony, price)
values (233, 2, 'Yes', 771);
insert into ROOM (room_number, beds, balcony, price)
values (234, 4, 'No', 423);
insert into ROOM (room_number, beds, balcony, price)
values (235, 5, 'Yes', 951);
insert into ROOM (room_number, beds, balcony, price)
values (236, 4, 'Yes', 1177);
insert into ROOM (room_number, beds, balcony, price)
values (237, 5, 'No', 1138);
insert into ROOM (room_number, beds, balcony, price)
values (238, 4, 'No', 587);
insert into ROOM (room_number, beds, balcony, price)
values (239, 4, 'Yes', 646);
insert into ROOM (room_number, beds, balcony, price)
values (240, 4, 'Yes', 1159);
insert into ROOM (room_number, beds, balcony, price)
values (241, 5, 'No', 698);
insert into ROOM (room_number, beds, balcony, price)
values (242, 2, 'Yes', 585);
insert into ROOM (room_number, beds, balcony, price)
values (243, 4, 'Yes', 863);
insert into ROOM (room_number, beds, balcony, price)
values (244, 4, 'Yes', 302);
insert into ROOM (room_number, beds, balcony, price)
values (245, 5, 'Yes', 591);
insert into ROOM (room_number, beds, balcony, price)
values (246, 4, 'No', 431);
insert into ROOM (room_number, beds, balcony, price)
values (247, 4, 'No', 417);
insert into ROOM (room_number, beds, balcony, price)
values (248, 2, 'No', 1029);
insert into ROOM (room_number, beds, balcony, price)
values (249, 2, 'No', 456);
insert into ROOM (room_number, beds, balcony, price)
values (250, 2, 'Yes', 969);
insert into ROOM (room_number, beds, balcony, price)
values (251, 4, 'Yes', 989);
insert into ROOM (room_number, beds, balcony, price)
values (252, 4, 'Yes', 562);
insert into ROOM (room_number, beds, balcony, price)
values (253, 2, 'Yes', 971);
insert into ROOM (room_number, beds, balcony, price)
values (254, 2, 'Yes', 1120);
insert into ROOM (room_number, beds, balcony, price)
values (255, 2, 'No', 504);
insert into ROOM (room_number, beds, balcony, price)
values (256, 2, 'No', 381);
insert into ROOM (room_number, beds, balcony, price)
values (257, 2, 'No', 822);
insert into ROOM (room_number, beds, balcony, price)
values (258, 2, 'Yes', 523);
insert into ROOM (room_number, beds, balcony, price)
values (259, 5, 'Yes', 733);
insert into ROOM (room_number, beds, balcony, price)
values (260, 5, 'No', 979);
insert into ROOM (room_number, beds, balcony, price)
values (261, 4, 'No', 993);
insert into ROOM (room_number, beds, balcony, price)
values (262, 4, 'Yes', 590);
insert into ROOM (room_number, beds, balcony, price)
values (263, 2, 'Yes', 391);
insert into ROOM (room_number, beds, balcony, price)
values (264, 5, 'Yes', 1068);
insert into ROOM (room_number, beds, balcony, price)
values (265, 2, 'Yes', 838);
insert into ROOM (room_number, beds, balcony, price)
values (266, 5, 'No', 586);
insert into ROOM (room_number, beds, balcony, price)
values (267, 4, 'Yes', 321);
insert into ROOM (room_number, beds, balcony, price)
values (268, 4, 'No', 1130);
insert into ROOM (room_number, beds, balcony, price)
values (269, 5, 'Yes', 657);
insert into ROOM (room_number, beds, balcony, price)
values (270, 2, 'No', 683);
insert into ROOM (room_number, beds, balcony, price)
values (271, 5, 'No', 815);
insert into ROOM (room_number, beds, balcony, price)
values (272, 5, 'No', 628);
insert into ROOM (room_number, beds, balcony, price)
values (273, 5, 'No', 629);
insert into ROOM (room_number, beds, balcony, price)
values (274, 5, 'Yes', 767);
insert into ROOM (room_number, beds, balcony, price)
values (275, 5, 'Yes', 1168);
insert into ROOM (room_number, beds, balcony, price)
values (276, 4, 'Yes', 1119);
insert into ROOM (room_number, beds, balcony, price)
values (277, 5, 'Yes', 725);
insert into ROOM (room_number, beds, balcony, price)
values (278, 2, 'Yes', 908);
insert into ROOM (room_number, beds, balcony, price)
values (279, 4, 'Yes', 614);
insert into ROOM (room_number, beds, balcony, price)
values (280, 4, 'Yes', 534);
insert into ROOM (room_number, beds, balcony, price)
values (281, 2, 'No', 944);
insert into ROOM (room_number, beds, balcony, price)
values (282, 4, 'Yes', 598);
insert into ROOM (room_number, beds, balcony, price)
values (283, 2, 'Yes', 1150);
insert into ROOM (room_number, beds, balcony, price)
values (284, 5, 'No', 330);
insert into ROOM (room_number, beds, balcony, price)
values (285, 2, 'Yes', 1150);
insert into ROOM (room_number, beds, balcony, price)
values (286, 5, 'No', 469);
insert into ROOM (room_number, beds, balcony, price)
values (287, 4, 'No', 842);
insert into ROOM (room_number, beds, balcony, price)
values (288, 2, 'No', 1176);
insert into ROOM (room_number, beds, balcony, price)
values (289, 4, 'Yes', 519);
insert into ROOM (room_number, beds, balcony, price)
values (290, 2, 'Yes', 648);
insert into ROOM (room_number, beds, balcony, price)
values (291, 2, 'No', 621);
insert into ROOM (room_number, beds, balcony, price)
values (292, 5, 'No', 1113);
insert into ROOM (room_number, beds, balcony, price)
values (293, 5, 'Yes', 843);
insert into ROOM (room_number, beds, balcony, price)
values (294, 4, 'Yes', 360);
insert into ROOM (room_number, beds, balcony, price)
values (295, 5, 'Yes', 485);
insert into ROOM (room_number, beds, balcony, price)
values (296, 2, 'No', 495);
insert into ROOM (room_number, beds, balcony, price)
values (297, 5, 'No', 552);
insert into ROOM (room_number, beds, balcony, price)
values (298, 5, 'Yes', 965);
insert into ROOM (room_number, beds, balcony, price)
values (299, 4, 'Yes', 993);
insert into ROOM (room_number, beds, balcony, price)
values (300, 5, 'No', 999);
commit;
prompt 300 records committed...
insert into ROOM (room_number, beds, balcony, price)
values (301, 4, 'No', 1165);
insert into ROOM (room_number, beds, balcony, price)
values (302, 5, 'No', 409);
insert into ROOM (room_number, beds, balcony, price)
values (303, 5, 'No', 1081);
insert into ROOM (room_number, beds, balcony, price)
values (304, 4, 'No', 1021);
insert into ROOM (room_number, beds, balcony, price)
values (305, 2, 'Yes', 955);
insert into ROOM (room_number, beds, balcony, price)
values (306, 2, 'Yes', 594);
insert into ROOM (room_number, beds, balcony, price)
values (307, 4, 'Yes', 935);
insert into ROOM (room_number, beds, balcony, price)
values (308, 4, 'Yes', 893);
insert into ROOM (room_number, beds, balcony, price)
values (309, 5, 'Yes', 841);
insert into ROOM (room_number, beds, balcony, price)
values (310, 4, 'No', 871);
insert into ROOM (room_number, beds, balcony, price)
values (311, 2, 'No', 509);
insert into ROOM (room_number, beds, balcony, price)
values (312, 5, 'No', 378);
insert into ROOM (room_number, beds, balcony, price)
values (313, 5, 'Yes', 1068);
insert into ROOM (room_number, beds, balcony, price)
values (314, 4, 'No', 1186);
insert into ROOM (room_number, beds, balcony, price)
values (315, 4, 'Yes', 670);
insert into ROOM (room_number, beds, balcony, price)
values (316, 4, 'No', 404);
insert into ROOM (room_number, beds, balcony, price)
values (317, 5, 'No', 1043);
insert into ROOM (room_number, beds, balcony, price)
values (318, 2, 'No', 960);
insert into ROOM (room_number, beds, balcony, price)
values (319, 5, 'Yes', 535);
insert into ROOM (room_number, beds, balcony, price)
values (320, 5, 'Yes', 749);
insert into ROOM (room_number, beds, balcony, price)
values (321, 2, 'No', 434);
insert into ROOM (room_number, beds, balcony, price)
values (322, 4, 'No', 946);
insert into ROOM (room_number, beds, balcony, price)
values (323, 4, 'Yes', 856);
insert into ROOM (room_number, beds, balcony, price)
values (324, 5, 'Yes', 931);
insert into ROOM (room_number, beds, balcony, price)
values (325, 5, 'No', 302);
insert into ROOM (room_number, beds, balcony, price)
values (326, 2, 'No', 649);
insert into ROOM (room_number, beds, balcony, price)
values (327, 4, 'Yes', 342);
insert into ROOM (room_number, beds, balcony, price)
values (328, 2, 'No', 925);
insert into ROOM (room_number, beds, balcony, price)
values (329, 5, 'Yes', 931);
insert into ROOM (room_number, beds, balcony, price)
values (330, 2, 'No', 896);
insert into ROOM (room_number, beds, balcony, price)
values (331, 5, 'No', 402);
insert into ROOM (room_number, beds, balcony, price)
values (332, 2, 'Yes', 390);
insert into ROOM (room_number, beds, balcony, price)
values (333, 4, 'No', 507);
insert into ROOM (room_number, beds, balcony, price)
values (334, 5, 'No', 433);
insert into ROOM (room_number, beds, balcony, price)
values (335, 4, 'Yes', 442);
insert into ROOM (room_number, beds, balcony, price)
values (336, 5, 'No', 722);
insert into ROOM (room_number, beds, balcony, price)
values (337, 4, 'No', 1030);
insert into ROOM (room_number, beds, balcony, price)
values (338, 4, 'No', 1144);
insert into ROOM (room_number, beds, balcony, price)
values (339, 5, 'Yes', 594);
insert into ROOM (room_number, beds, balcony, price)
values (340, 5, 'Yes', 779);
insert into ROOM (room_number, beds, balcony, price)
values (341, 5, 'Yes', 903);
insert into ROOM (room_number, beds, balcony, price)
values (342, 5, 'No', 698);
insert into ROOM (room_number, beds, balcony, price)
values (343, 4, 'No', 510);
insert into ROOM (room_number, beds, balcony, price)
values (344, 4, 'Yes', 404);
insert into ROOM (room_number, beds, balcony, price)
values (345, 5, 'Yes', 544);
insert into ROOM (room_number, beds, balcony, price)
values (346, 4, 'No', 676);
insert into ROOM (room_number, beds, balcony, price)
values (347, 2, 'No', 867);
insert into ROOM (room_number, beds, balcony, price)
values (348, 4, 'Yes', 709);
insert into ROOM (room_number, beds, balcony, price)
values (349, 4, 'No', 438);
insert into ROOM (room_number, beds, balcony, price)
values (350, 5, 'No', 640);
insert into ROOM (room_number, beds, balcony, price)
values (351, 2, 'No', 1097);
insert into ROOM (room_number, beds, balcony, price)
values (352, 2, 'Yes', 513);
insert into ROOM (room_number, beds, balcony, price)
values (353, 4, 'Yes', 749);
insert into ROOM (room_number, beds, balcony, price)
values (354, 5, 'Yes', 303);
insert into ROOM (room_number, beds, balcony, price)
values (355, 2, 'No', 935);
insert into ROOM (room_number, beds, balcony, price)
values (356, 5, 'No', 520);
insert into ROOM (room_number, beds, balcony, price)
values (357, 2, 'Yes', 619);
insert into ROOM (room_number, beds, balcony, price)
values (358, 4, 'No', 1162);
insert into ROOM (room_number, beds, balcony, price)
values (359, 4, 'Yes', 329);
insert into ROOM (room_number, beds, balcony, price)
values (360, 5, 'No', 991);
insert into ROOM (room_number, beds, balcony, price)
values (361, 5, 'Yes', 426);
insert into ROOM (room_number, beds, balcony, price)
values (362, 2, 'No', 446);
insert into ROOM (room_number, beds, balcony, price)
values (363, 2, 'No', 924);
insert into ROOM (room_number, beds, balcony, price)
values (364, 4, 'No', 908);
insert into ROOM (room_number, beds, balcony, price)
values (365, 4, 'Yes', 955);
insert into ROOM (room_number, beds, balcony, price)
values (366, 5, 'No', 1056);
insert into ROOM (room_number, beds, balcony, price)
values (367, 4, 'Yes', 1132);
insert into ROOM (room_number, beds, balcony, price)
values (368, 2, 'Yes', 976);
insert into ROOM (room_number, beds, balcony, price)
values (369, 2, 'Yes', 606);
insert into ROOM (room_number, beds, balcony, price)
values (370, 5, 'No', 623);
insert into ROOM (room_number, beds, balcony, price)
values (371, 5, 'Yes', 375);
insert into ROOM (room_number, beds, balcony, price)
values (372, 5, 'No', 753);
insert into ROOM (room_number, beds, balcony, price)
values (373, 4, 'Yes', 300);
insert into ROOM (room_number, beds, balcony, price)
values (374, 4, 'No', 633);
insert into ROOM (room_number, beds, balcony, price)
values (375, 4, 'No', 651);
insert into ROOM (room_number, beds, balcony, price)
values (376, 2, 'Yes', 538);
insert into ROOM (room_number, beds, balcony, price)
values (377, 5, 'Yes', 1053);
insert into ROOM (room_number, beds, balcony, price)
values (378, 4, 'No', 970);
insert into ROOM (room_number, beds, balcony, price)
values (379, 4, 'Yes', 954);
insert into ROOM (room_number, beds, balcony, price)
values (380, 2, 'No', 513);
insert into ROOM (room_number, beds, balcony, price)
values (381, 2, 'No', 1021);
insert into ROOM (room_number, beds, balcony, price)
values (382, 4, 'No', 1077);
insert into ROOM (room_number, beds, balcony, price)
values (383, 5, 'Yes', 779);
insert into ROOM (room_number, beds, balcony, price)
values (384, 4, 'Yes', 470);
insert into ROOM (room_number, beds, balcony, price)
values (385, 5, 'Yes', 516);
insert into ROOM (room_number, beds, balcony, price)
values (386, 2, 'No', 444);
insert into ROOM (room_number, beds, balcony, price)
values (387, 5, 'Yes', 1175);
insert into ROOM (room_number, beds, balcony, price)
values (388, 5, 'No', 704);
insert into ROOM (room_number, beds, balcony, price)
values (389, 4, 'No', 1091);
insert into ROOM (room_number, beds, balcony, price)
values (390, 2, 'Yes', 824);
insert into ROOM (room_number, beds, balcony, price)
values (391, 2, 'Yes', 772);
insert into ROOM (room_number, beds, balcony, price)
values (392, 2, 'Yes', 485);
insert into ROOM (room_number, beds, balcony, price)
values (393, 4, 'No', 439);
insert into ROOM (room_number, beds, balcony, price)
values (394, 4, 'Yes', 448);
insert into ROOM (room_number, beds, balcony, price)
values (395, 2, 'No', 833);
insert into ROOM (room_number, beds, balcony, price)
values (396, 4, 'Yes', 799);
insert into ROOM (room_number, beds, balcony, price)
values (397, 4, 'Yes', 827);
insert into ROOM (room_number, beds, balcony, price)
values (398, 4, 'No', 909);
insert into ROOM (room_number, beds, balcony, price)
values (399, 4, 'No', 1191);
insert into ROOM (room_number, beds, balcony, price)
values (400, 2, 'No', 416);
commit;
prompt 400 records committed...
insert into ROOM (room_number, beds, balcony, price)
values (401, 2, 'Yes', 1049);
insert into ROOM (room_number, beds, balcony, price)
values (402, 2, 'No', 533);
insert into ROOM (room_number, beds, balcony, price)
values (403, 5, 'No', 345);
insert into ROOM (room_number, beds, balcony, price)
values (404, 5, 'No', 1157);
insert into ROOM (room_number, beds, balcony, price)
values (405, 5, 'No', 1138);
insert into ROOM (room_number, beds, balcony, price)
values (406, 5, 'No', 1013);
insert into ROOM (room_number, beds, balcony, price)
values (407, 5, 'Yes', 524);
insert into ROOM (room_number, beds, balcony, price)
values (408, 4, 'No', 1103);
insert into ROOM (room_number, beds, balcony, price)
values (409, 4, 'Yes', 1200);
insert into ROOM (room_number, beds, balcony, price)
values (410, 4, 'Yes', 727);
insert into ROOM (room_number, beds, balcony, price)
values (411, 2, 'Yes', 886);
insert into ROOM (room_number, beds, balcony, price)
values (412, 5, 'No', 905);
insert into ROOM (room_number, beds, balcony, price)
values (413, 2, 'No', 970);
insert into ROOM (room_number, beds, balcony, price)
values (414, 2, 'No', 557);
insert into ROOM (room_number, beds, balcony, price)
values (415, 2, 'No', 1080);
insert into ROOM (room_number, beds, balcony, price)
values (416, 4, 'No', 340);
insert into ROOM (room_number, beds, balcony, price)
values (417, 5, 'No', 1069);
insert into ROOM (room_number, beds, balcony, price)
values (418, 2, 'No', 843);
insert into ROOM (room_number, beds, balcony, price)
values (419, 5, 'Yes', 1116);
insert into ROOM (room_number, beds, balcony, price)
values (420, 4, 'No', 1087);
insert into ROOM (room_number, beds, balcony, price)
values (421, 2, 'Yes', 1048);
insert into ROOM (room_number, beds, balcony, price)
values (422, 2, 'No', 703);
insert into ROOM (room_number, beds, balcony, price)
values (423, 2, 'No', 1126);
insert into ROOM (room_number, beds, balcony, price)
values (424, 2, 'Yes', 664);
insert into ROOM (room_number, beds, balcony, price)
values (425, 2, 'Yes', 314);
insert into ROOM (room_number, beds, balcony, price)
values (426, 4, 'No', 438);
insert into ROOM (room_number, beds, balcony, price)
values (427, 4, 'Yes', 913);
insert into ROOM (room_number, beds, balcony, price)
values (428, 5, 'No', 496);
insert into ROOM (room_number, beds, balcony, price)
values (429, 4, 'Yes', 854);
insert into ROOM (room_number, beds, balcony, price)
values (430, 2, 'Yes', 1064);
insert into ROOM (room_number, beds, balcony, price)
values (431, 5, 'Yes', 988);
insert into ROOM (room_number, beds, balcony, price)
values (432, 5, 'Yes', 753);
insert into ROOM (room_number, beds, balcony, price)
values (433, 5, 'No', 1146);
insert into ROOM (room_number, beds, balcony, price)
values (434, 2, 'Yes', 616);
insert into ROOM (room_number, beds, balcony, price)
values (435, 4, 'Yes', 799);
insert into ROOM (room_number, beds, balcony, price)
values (436, 4, 'Yes', 500);
insert into ROOM (room_number, beds, balcony, price)
values (437, 5, 'No', 672);
insert into ROOM (room_number, beds, balcony, price)
values (438, 4, 'Yes', 433);
insert into ROOM (room_number, beds, balcony, price)
values (439, 2, 'Yes', 726);
insert into ROOM (room_number, beds, balcony, price)
values (440, 2, 'No', 569);
insert into ROOM (room_number, beds, balcony, price)
values (441, 5, 'Yes', 1016);
insert into ROOM (room_number, beds, balcony, price)
values (442, 4, 'Yes', 960);
insert into ROOM (room_number, beds, balcony, price)
values (443, 5, 'Yes', 673);
insert into ROOM (room_number, beds, balcony, price)
values (444, 4, 'Yes', 489);
insert into ROOM (room_number, beds, balcony, price)
values (445, 4, 'Yes', 1023);
insert into ROOM (room_number, beds, balcony, price)
values (446, 2, 'Yes', 670);
insert into ROOM (room_number, beds, balcony, price)
values (447, 2, 'Yes', 375);
insert into ROOM (room_number, beds, balcony, price)
values (448, 2, 'No', 943);
insert into ROOM (room_number, beds, balcony, price)
values (449, 2, 'No', 327);
insert into ROOM (room_number, beds, balcony, price)
values (450, 2, 'Yes', 1092);
insert into ROOM (room_number, beds, balcony, price)
values (451, 4, 'No', 697);
insert into ROOM (room_number, beds, balcony, price)
values (452, 4, 'No', 554);
insert into ROOM (room_number, beds, balcony, price)
values (453, 5, 'No', 1043);
insert into ROOM (room_number, beds, balcony, price)
values (454, 2, 'No', 317);
insert into ROOM (room_number, beds, balcony, price)
values (455, 2, 'Yes', 1057);
insert into ROOM (room_number, beds, balcony, price)
values (456, 4, 'Yes', 599);
insert into ROOM (room_number, beds, balcony, price)
values (457, 2, 'No', 1191);
insert into ROOM (room_number, beds, balcony, price)
values (458, 4, 'No', 1158);
insert into ROOM (room_number, beds, balcony, price)
values (459, 4, 'Yes', 923);
insert into ROOM (room_number, beds, balcony, price)
values (460, 4, 'No', 1125);
insert into ROOM (room_number, beds, balcony, price)
values (461, 2, 'Yes', 844);
insert into ROOM (room_number, beds, balcony, price)
values (462, 2, 'Yes', 619);
insert into ROOM (room_number, beds, balcony, price)
values (463, 4, 'Yes', 482);
insert into ROOM (room_number, beds, balcony, price)
values (464, 4, 'No', 722);
insert into ROOM (room_number, beds, balcony, price)
values (465, 2, 'No', 788);
insert into ROOM (room_number, beds, balcony, price)
values (466, 5, 'No', 421);
insert into ROOM (room_number, beds, balcony, price)
values (467, 2, 'Yes', 420);
insert into ROOM (room_number, beds, balcony, price)
values (468, 2, 'Yes', 638);
insert into ROOM (room_number, beds, balcony, price)
values (469, 2, 'Yes', 1083);
insert into ROOM (room_number, beds, balcony, price)
values (470, 4, 'Yes', 780);
insert into ROOM (room_number, beds, balcony, price)
values (471, 4, 'No', 449);
insert into ROOM (room_number, beds, balcony, price)
values (472, 5, 'No', 533);
insert into ROOM (room_number, beds, balcony, price)
values (473, 5, 'No', 799);
insert into ROOM (room_number, beds, balcony, price)
values (474, 5, 'No', 1033);
insert into ROOM (room_number, beds, balcony, price)
values (475, 4, 'Yes', 898);
insert into ROOM (room_number, beds, balcony, price)
values (476, 5, 'No', 1171);
insert into ROOM (room_number, beds, balcony, price)
values (477, 5, 'Yes', 871);
insert into ROOM (room_number, beds, balcony, price)
values (478, 2, 'No', 677);
insert into ROOM (room_number, beds, balcony, price)
values (479, 2, 'Yes', 841);
insert into ROOM (room_number, beds, balcony, price)
values (480, 5, 'Yes', 1102);
insert into ROOM (room_number, beds, balcony, price)
values (481, 4, 'Yes', 499);
insert into ROOM (room_number, beds, balcony, price)
values (482, 5, 'Yes', 1015);
insert into ROOM (room_number, beds, balcony, price)
values (483, 4, 'Yes', 390);
insert into ROOM (room_number, beds, balcony, price)
values (484, 5, 'Yes', 788);
insert into ROOM (room_number, beds, balcony, price)
values (485, 4, 'No', 705);
insert into ROOM (room_number, beds, balcony, price)
values (486, 5, 'Yes', 1145);
insert into ROOM (room_number, beds, balcony, price)
values (487, 5, 'No', 671);
insert into ROOM (room_number, beds, balcony, price)
values (488, 5, 'No', 535);
insert into ROOM (room_number, beds, balcony, price)
values (489, 2, 'Yes', 761);
insert into ROOM (room_number, beds, balcony, price)
values (490, 4, 'No', 1068);
insert into ROOM (room_number, beds, balcony, price)
values (491, 4, 'No', 324);
insert into ROOM (room_number, beds, balcony, price)
values (492, 4, 'No', 1063);
insert into ROOM (room_number, beds, balcony, price)
values (493, 4, 'Yes', 921);
insert into ROOM (room_number, beds, balcony, price)
values (494, 2, 'Yes', 764);
insert into ROOM (room_number, beds, balcony, price)
values (495, 5, 'No', 1156);
insert into ROOM (room_number, beds, balcony, price)
values (496, 2, 'No', 1138);
insert into ROOM (room_number, beds, balcony, price)
values (497, 5, 'No', 378);
insert into ROOM (room_number, beds, balcony, price)
values (498, 2, 'Yes', 427);
insert into ROOM (room_number, beds, balcony, price)
values (499, 4, 'No', 980);
insert into ROOM (room_number, beds, balcony, price)
values (500, 2, 'Yes', 454);
commit;
prompt 500 records committed...
insert into ROOM (room_number, beds, balcony, price)
values (501, 5, 'No', 1181);
insert into ROOM (room_number, beds, balcony, price)
values (502, 2, 'No', 304);
insert into ROOM (room_number, beds, balcony, price)
values (503, 4, 'No', 1028);
insert into ROOM (room_number, beds, balcony, price)
values (504, 4, 'No', 682);
insert into ROOM (room_number, beds, balcony, price)
values (505, 2, 'No', 581);
insert into ROOM (room_number, beds, balcony, price)
values (506, 2, 'No', 894);
insert into ROOM (room_number, beds, balcony, price)
values (507, 5, 'Yes', 1189);
insert into ROOM (room_number, beds, balcony, price)
values (508, 4, 'Yes', 609);
insert into ROOM (room_number, beds, balcony, price)
values (509, 4, 'Yes', 928);
insert into ROOM (room_number, beds, balcony, price)
values (510, 4, 'No', 402);
insert into ROOM (room_number, beds, balcony, price)
values (511, 4, 'No', 375);
insert into ROOM (room_number, beds, balcony, price)
values (512, 5, 'Yes', 978);
insert into ROOM (room_number, beds, balcony, price)
values (513, 4, 'Yes', 695);
insert into ROOM (room_number, beds, balcony, price)
values (514, 4, 'No', 651);
insert into ROOM (room_number, beds, balcony, price)
values (515, 5, 'Yes', 764);
insert into ROOM (room_number, beds, balcony, price)
values (516, 2, 'Yes', 506);
insert into ROOM (room_number, beds, balcony, price)
values (517, 2, 'No', 775);
insert into ROOM (room_number, beds, balcony, price)
values (518, 5, 'No', 740);
insert into ROOM (room_number, beds, balcony, price)
values (519, 2, 'No', 390);
insert into ROOM (room_number, beds, balcony, price)
values (520, 5, 'No', 531);
insert into ROOM (room_number, beds, balcony, price)
values (521, 5, 'No', 844);
insert into ROOM (room_number, beds, balcony, price)
values (522, 4, 'Yes', 964);
insert into ROOM (room_number, beds, balcony, price)
values (523, 5, 'No', 1020);
insert into ROOM (room_number, beds, balcony, price)
values (524, 5, 'No', 1004);
insert into ROOM (room_number, beds, balcony, price)
values (525, 4, 'No', 743);
insert into ROOM (room_number, beds, balcony, price)
values (526, 2, 'No', 637);
insert into ROOM (room_number, beds, balcony, price)
values (527, 2, 'No', 383);
insert into ROOM (room_number, beds, balcony, price)
values (528, 5, 'Yes', 731);
insert into ROOM (room_number, beds, balcony, price)
values (529, 4, 'No', 675);
insert into ROOM (room_number, beds, balcony, price)
values (530, 5, 'No', 490);
insert into ROOM (room_number, beds, balcony, price)
values (531, 2, 'Yes', 516);
insert into ROOM (room_number, beds, balcony, price)
values (532, 2, 'No', 931);
insert into ROOM (room_number, beds, balcony, price)
values (533, 2, 'Yes', 811);
insert into ROOM (room_number, beds, balcony, price)
values (534, 5, 'No', 787);
insert into ROOM (room_number, beds, balcony, price)
values (535, 2, 'Yes', 456);
insert into ROOM (room_number, beds, balcony, price)
values (536, 2, 'No', 728);
insert into ROOM (room_number, beds, balcony, price)
values (537, 4, 'Yes', 570);
insert into ROOM (room_number, beds, balcony, price)
values (538, 2, 'Yes', 969);
insert into ROOM (room_number, beds, balcony, price)
values (539, 5, 'Yes', 567);
insert into ROOM (room_number, beds, balcony, price)
values (540, 2, 'No', 322);
insert into ROOM (room_number, beds, balcony, price)
values (541, 5, 'No', 998);
insert into ROOM (room_number, beds, balcony, price)
values (542, 4, 'Yes', 943);
insert into ROOM (room_number, beds, balcony, price)
values (543, 4, 'No', 823);
insert into ROOM (room_number, beds, balcony, price)
values (544, 5, 'No', 1134);
insert into ROOM (room_number, beds, balcony, price)
values (545, 2, 'Yes', 1170);
insert into ROOM (room_number, beds, balcony, price)
values (546, 4, 'Yes', 642);
insert into ROOM (room_number, beds, balcony, price)
values (547, 4, 'Yes', 376);
insert into ROOM (room_number, beds, balcony, price)
values (548, 2, 'Yes', 829);
insert into ROOM (room_number, beds, balcony, price)
values (549, 5, 'No', 667);
insert into ROOM (room_number, beds, balcony, price)
values (550, 2, 'No', 1111);
insert into ROOM (room_number, beds, balcony, price)
values (551, 2, 'No', 310);
insert into ROOM (room_number, beds, balcony, price)
values (552, 2, 'Yes', 388);
insert into ROOM (room_number, beds, balcony, price)
values (553, 5, 'No', 943);
insert into ROOM (room_number, beds, balcony, price)
values (554, 2, 'Yes', 552);
insert into ROOM (room_number, beds, balcony, price)
values (555, 2, 'No', 962);
insert into ROOM (room_number, beds, balcony, price)
values (556, 2, 'No', 487);
insert into ROOM (room_number, beds, balcony, price)
values (557, 4, 'Yes', 612);
insert into ROOM (room_number, beds, balcony, price)
values (558, 2, 'Yes', 934);
insert into ROOM (room_number, beds, balcony, price)
values (559, 2, 'Yes', 1150);
insert into ROOM (room_number, beds, balcony, price)
values (560, 5, 'No', 950);
insert into ROOM (room_number, beds, balcony, price)
values (561, 4, 'Yes', 747);
insert into ROOM (room_number, beds, balcony, price)
values (562, 4, 'No', 887);
insert into ROOM (room_number, beds, balcony, price)
values (563, 2, 'Yes', 499);
insert into ROOM (room_number, beds, balcony, price)
values (564, 5, 'No', 528);
insert into ROOM (room_number, beds, balcony, price)
values (565, 4, 'No', 351);
insert into ROOM (room_number, beds, balcony, price)
values (566, 5, 'No', 378);
insert into ROOM (room_number, beds, balcony, price)
values (567, 2, 'Yes', 1018);
insert into ROOM (room_number, beds, balcony, price)
values (568, 4, 'Yes', 828);
insert into ROOM (room_number, beds, balcony, price)
values (569, 2, 'No', 916);
insert into ROOM (room_number, beds, balcony, price)
values (570, 2, 'Yes', 957);
insert into ROOM (room_number, beds, balcony, price)
values (571, 5, 'No', 1171);
insert into ROOM (room_number, beds, balcony, price)
values (572, 5, 'No', 923);
insert into ROOM (room_number, beds, balcony, price)
values (573, 2, 'No', 925);
insert into ROOM (room_number, beds, balcony, price)
values (574, 5, 'No', 827);
insert into ROOM (room_number, beds, balcony, price)
values (575, 5, 'No', 357);
insert into ROOM (room_number, beds, balcony, price)
values (576, 2, 'No', 321);
insert into ROOM (room_number, beds, balcony, price)
values (577, 4, 'Yes', 788);
insert into ROOM (room_number, beds, balcony, price)
values (578, 4, 'Yes', 359);
insert into ROOM (room_number, beds, balcony, price)
values (579, 5, 'Yes', 889);
insert into ROOM (room_number, beds, balcony, price)
values (580, 4, 'No', 641);
insert into ROOM (room_number, beds, balcony, price)
values (581, 2, 'No', 350);
insert into ROOM (room_number, beds, balcony, price)
values (582, 2, 'Yes', 917);
insert into ROOM (room_number, beds, balcony, price)
values (583, 5, 'No', 1199);
insert into ROOM (room_number, beds, balcony, price)
values (584, 4, 'Yes', 699);
insert into ROOM (room_number, beds, balcony, price)
values (585, 5, 'Yes', 1185);
insert into ROOM (room_number, beds, balcony, price)
values (586, 4, 'No', 766);
insert into ROOM (room_number, beds, balcony, price)
values (587, 4, 'Yes', 571);
insert into ROOM (room_number, beds, balcony, price)
values (588, 2, 'No', 1121);
insert into ROOM (room_number, beds, balcony, price)
values (589, 4, 'No', 558);
insert into ROOM (room_number, beds, balcony, price)
values (590, 5, 'Yes', 824);
insert into ROOM (room_number, beds, balcony, price)
values (591, 2, 'Yes', 1191);
insert into ROOM (room_number, beds, balcony, price)
values (592, 5, 'Yes', 1173);
insert into ROOM (room_number, beds, balcony, price)
values (593, 4, 'No', 1040);
insert into ROOM (room_number, beds, balcony, price)
values (594, 4, 'No', 438);
insert into ROOM (room_number, beds, balcony, price)
values (595, 4, 'No', 952);
insert into ROOM (room_number, beds, balcony, price)
values (596, 2, 'Yes', 472);
insert into ROOM (room_number, beds, balcony, price)
values (597, 4, 'No', 316);
insert into ROOM (room_number, beds, balcony, price)
values (598, 5, 'Yes', 452);
insert into ROOM (room_number, beds, balcony, price)
values (599, 4, 'No', 366);
insert into ROOM (room_number, beds, balcony, price)
values (600, 5, 'No', 955);
commit;
prompt 600 records committed...
insert into ROOM (room_number, beds, balcony, price)
values (601, 2, 'No', 1159);
insert into ROOM (room_number, beds, balcony, price)
values (602, 5, 'No', 760);
insert into ROOM (room_number, beds, balcony, price)
values (603, 5, 'No', 1006);
insert into ROOM (room_number, beds, balcony, price)
values (604, 2, 'Yes', 455);
insert into ROOM (room_number, beds, balcony, price)
values (605, 2, 'No', 1199);
insert into ROOM (room_number, beds, balcony, price)
values (606, 5, 'No', 741);
insert into ROOM (room_number, beds, balcony, price)
values (607, 2, 'No', 722);
insert into ROOM (room_number, beds, balcony, price)
values (608, 2, 'No', 432);
insert into ROOM (room_number, beds, balcony, price)
values (609, 4, 'No', 537);
insert into ROOM (room_number, beds, balcony, price)
values (610, 5, 'Yes', 984);
insert into ROOM (room_number, beds, balcony, price)
values (611, 2, 'No', 776);
insert into ROOM (room_number, beds, balcony, price)
values (612, 4, 'No', 929);
insert into ROOM (room_number, beds, balcony, price)
values (613, 5, 'No', 1175);
insert into ROOM (room_number, beds, balcony, price)
values (614, 5, 'No', 1197);
insert into ROOM (room_number, beds, balcony, price)
values (615, 4, 'No', 729);
insert into ROOM (room_number, beds, balcony, price)
values (616, 2, 'No', 1027);
insert into ROOM (room_number, beds, balcony, price)
values (617, 4, 'No', 611);
insert into ROOM (room_number, beds, balcony, price)
values (618, 4, 'No', 992);
insert into ROOM (room_number, beds, balcony, price)
values (619, 5, 'No', 1177);
insert into ROOM (room_number, beds, balcony, price)
values (620, 2, 'Yes', 542);
insert into ROOM (room_number, beds, balcony, price)
values (621, 4, 'No', 325);
insert into ROOM (room_number, beds, balcony, price)
values (622, 4, 'Yes', 408);
insert into ROOM (room_number, beds, balcony, price)
values (623, 2, 'No', 679);
insert into ROOM (room_number, beds, balcony, price)
values (624, 5, 'No', 925);
insert into ROOM (room_number, beds, balcony, price)
values (625, 2, 'No', 379);
insert into ROOM (room_number, beds, balcony, price)
values (626, 4, 'Yes', 575);
insert into ROOM (room_number, beds, balcony, price)
values (627, 4, 'No', 802);
insert into ROOM (room_number, beds, balcony, price)
values (628, 2, 'No', 1198);
insert into ROOM (room_number, beds, balcony, price)
values (629, 5, 'Yes', 372);
insert into ROOM (room_number, beds, balcony, price)
values (630, 5, 'Yes', 327);
insert into ROOM (room_number, beds, balcony, price)
values (631, 5, 'Yes', 724);
insert into ROOM (room_number, beds, balcony, price)
values (632, 5, 'Yes', 533);
insert into ROOM (room_number, beds, balcony, price)
values (633, 5, 'Yes', 1115);
insert into ROOM (room_number, beds, balcony, price)
values (634, 5, 'Yes', 725);
insert into ROOM (room_number, beds, balcony, price)
values (635, 4, 'No', 627);
insert into ROOM (room_number, beds, balcony, price)
values (636, 5, 'No', 924);
insert into ROOM (room_number, beds, balcony, price)
values (637, 2, 'Yes', 879);
insert into ROOM (room_number, beds, balcony, price)
values (638, 2, 'Yes', 919);
insert into ROOM (room_number, beds, balcony, price)
values (639, 2, 'No', 716);
insert into ROOM (room_number, beds, balcony, price)
values (640, 2, 'No', 775);
insert into ROOM (room_number, beds, balcony, price)
values (641, 2, 'Yes', 305);
insert into ROOM (room_number, beds, balcony, price)
values (642, 4, 'Yes', 1107);
insert into ROOM (room_number, beds, balcony, price)
values (643, 2, 'Yes', 381);
insert into ROOM (room_number, beds, balcony, price)
values (644, 2, 'No', 707);
insert into ROOM (room_number, beds, balcony, price)
values (645, 2, 'No', 1012);
insert into ROOM (room_number, beds, balcony, price)
values (646, 4, 'Yes', 1171);
insert into ROOM (room_number, beds, balcony, price)
values (647, 4, 'No', 518);
insert into ROOM (room_number, beds, balcony, price)
values (648, 4, 'Yes', 647);
insert into ROOM (room_number, beds, balcony, price)
values (649, 2, 'Yes', 942);
insert into ROOM (room_number, beds, balcony, price)
values (650, 2, 'Yes', 727);
insert into ROOM (room_number, beds, balcony, price)
values (651, 4, 'Yes', 560);
insert into ROOM (room_number, beds, balcony, price)
values (652, 4, 'Yes', 479);
insert into ROOM (room_number, beds, balcony, price)
values (653, 2, 'No', 1060);
insert into ROOM (room_number, beds, balcony, price)
values (654, 5, 'No', 887);
insert into ROOM (room_number, beds, balcony, price)
values (655, 4, 'No', 637);
insert into ROOM (room_number, beds, balcony, price)
values (656, 4, 'Yes', 693);
insert into ROOM (room_number, beds, balcony, price)
values (657, 4, 'Yes', 466);
insert into ROOM (room_number, beds, balcony, price)
values (658, 2, 'Yes', 1102);
insert into ROOM (room_number, beds, balcony, price)
values (659, 2, 'No', 863);
insert into ROOM (room_number, beds, balcony, price)
values (660, 5, 'Yes', 643);
insert into ROOM (room_number, beds, balcony, price)
values (661, 5, 'Yes', 1108);
insert into ROOM (room_number, beds, balcony, price)
values (662, 2, 'No', 580);
insert into ROOM (room_number, beds, balcony, price)
values (663, 4, 'No', 784);
insert into ROOM (room_number, beds, balcony, price)
values (664, 4, 'No', 377);
insert into ROOM (room_number, beds, balcony, price)
values (665, 5, 'Yes', 1048);
insert into ROOM (room_number, beds, balcony, price)
values (666, 2, 'No', 768);
insert into ROOM (room_number, beds, balcony, price)
values (667, 2, 'No', 1051);
insert into ROOM (room_number, beds, balcony, price)
values (668, 2, 'No', 856);
insert into ROOM (room_number, beds, balcony, price)
values (669, 5, 'Yes', 1034);
insert into ROOM (room_number, beds, balcony, price)
values (670, 2, 'Yes', 511);
insert into ROOM (room_number, beds, balcony, price)
values (671, 4, 'Yes', 398);
insert into ROOM (room_number, beds, balcony, price)
values (672, 2, 'No', 798);
insert into ROOM (room_number, beds, balcony, price)
values (673, 4, 'No', 1041);
insert into ROOM (room_number, beds, balcony, price)
values (674, 4, 'Yes', 1086);
insert into ROOM (room_number, beds, balcony, price)
values (675, 4, 'No', 678);
insert into ROOM (room_number, beds, balcony, price)
values (676, 4, 'No', 708);
insert into ROOM (room_number, beds, balcony, price)
values (677, 2, 'Yes', 773);
insert into ROOM (room_number, beds, balcony, price)
values (678, 4, 'No', 1031);
insert into ROOM (room_number, beds, balcony, price)
values (679, 4, 'Yes', 1016);
insert into ROOM (room_number, beds, balcony, price)
values (680, 5, 'No', 430);
insert into ROOM (room_number, beds, balcony, price)
values (681, 2, 'Yes', 741);
insert into ROOM (room_number, beds, balcony, price)
values (682, 2, 'No', 685);
insert into ROOM (room_number, beds, balcony, price)
values (683, 2, 'No', 797);
insert into ROOM (room_number, beds, balcony, price)
values (684, 4, 'Yes', 558);
insert into ROOM (room_number, beds, balcony, price)
values (685, 2, 'No', 676);
insert into ROOM (room_number, beds, balcony, price)
values (686, 5, 'Yes', 432);
insert into ROOM (room_number, beds, balcony, price)
values (687, 2, 'Yes', 617);
insert into ROOM (room_number, beds, balcony, price)
values (688, 2, 'Yes', 744);
insert into ROOM (room_number, beds, balcony, price)
values (689, 2, 'No', 863);
insert into ROOM (room_number, beds, balcony, price)
values (690, 4, 'Yes', 1184);
insert into ROOM (room_number, beds, balcony, price)
values (691, 5, 'No', 316);
insert into ROOM (room_number, beds, balcony, price)
values (692, 5, 'Yes', 790);
insert into ROOM (room_number, beds, balcony, price)
values (693, 4, 'No', 991);
insert into ROOM (room_number, beds, balcony, price)
values (694, 2, 'Yes', 464);
insert into ROOM (room_number, beds, balcony, price)
values (695, 4, 'Yes', 438);
insert into ROOM (room_number, beds, balcony, price)
values (696, 4, 'Yes', 644);
insert into ROOM (room_number, beds, balcony, price)
values (697, 4, 'No', 1118);
insert into ROOM (room_number, beds, balcony, price)
values (698, 4, 'Yes', 837);
insert into ROOM (room_number, beds, balcony, price)
values (699, 4, 'Yes', 960);
insert into ROOM (room_number, beds, balcony, price)
values (700, 4, 'No', 614);
commit;
prompt 700 records loaded
prompt Loading BOOKING...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (954302901, 529, to_date('06-06-1975', 'dd-mm-yyyy'), 14, 75905856);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (236336194, 266, to_date('28-12-1970', 'dd-mm-yyyy'), 10, 788436504);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (492461632, 278, to_date('08-10-2004', 'dd-mm-yyyy'), 12, 651546201);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (89349836, 40, to_date('25-05-1978', 'dd-mm-yyyy'), 1, 648255483);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (412264478, 74, to_date('17-09-2000', 'dd-mm-yyyy'), 5, 71273362);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (500428309, 80, to_date('09-04-2000', 'dd-mm-yyyy'), 5, 517634650);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (112727921, 21, to_date('29-10-2013', 'dd-mm-yyyy'), 13, 270924940);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (611577581, 373, to_date('10-12-1992', 'dd-mm-yyyy'), 2, 187484274);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (774143138, 129, to_date('05-02-1973', 'dd-mm-yyyy'), 2, 794115696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (789997163, 455, to_date('20-10-1975', 'dd-mm-yyyy'), 6, 607574361);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (591346237, 700, to_date('12-12-1993', 'dd-mm-yyyy'), 1, 509167884);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (667816831, 293, to_date('01-11-1972', 'dd-mm-yyyy'), 3, 758394292);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (315342772, 403, to_date('22-10-2000', 'dd-mm-yyyy'), 10, 923536778);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (265119280, 364, to_date('28-01-1976', 'dd-mm-yyyy'), 8, 357844780);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (13638529, 404, to_date('28-08-1978', 'dd-mm-yyyy'), 5, 92519490);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (707847577, 538, to_date('13-06-2014', 'dd-mm-yyyy'), 4, 887282476);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (261803388, 377, to_date('01-05-2005', 'dd-mm-yyyy'), 4, 802809781);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (217960251, 69, to_date('05-03-1985', 'dd-mm-yyyy'), 5, 714603536);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (129932475, 201, to_date('25-06-1980', 'dd-mm-yyyy'), 9, 236775278);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (596600647, 137, to_date('16-03-2007', 'dd-mm-yyyy'), 9, 465891024);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (655273545, 72, to_date('24-04-1986', 'dd-mm-yyyy'), 9, 270924940);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (519412704, 674, to_date('25-03-1989', 'dd-mm-yyyy'), 7, 351101580);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (309820613, 461, to_date('18-03-2015', 'dd-mm-yyyy'), 6, 978345655);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (690114896, 111, to_date('05-03-2011', 'dd-mm-yyyy'), 6, 254183134);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (619664665, 493, to_date('01-10-1986', 'dd-mm-yyyy'), 7, 750280357);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (248243489, 69, to_date('27-01-1974', 'dd-mm-yyyy'), 8, 746027242);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (619664665, 380, to_date('27-01-2006', 'dd-mm-yyyy'), 3, 128545745);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (852243083, 84, to_date('09-05-1992', 'dd-mm-yyyy'), 10, 349532042);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (763219347, 438, to_date('30-09-2004', 'dd-mm-yyyy'), 2, 658535442);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (11465811, 560, to_date('26-06-2005', 'dd-mm-yyyy'), 13, 141133895);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (791866296, 371, to_date('24-04-1993', 'dd-mm-yyyy'), 4, 262380974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (677227199, 373, to_date('19-04-2011', 'dd-mm-yyyy'), 12, 890003369);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (901831830, 296, to_date('30-01-2009', 'dd-mm-yyyy'), 12, 844365450);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (101425911, 274, to_date('15-01-1982', 'dd-mm-yyyy'), 10, 317878499);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (98168072, 202, to_date('20-03-1988', 'dd-mm-yyyy'), 10, 187734366);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (482581963, 652, to_date('03-08-1994', 'dd-mm-yyyy'), 14, 802809781);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (178939047, 513, to_date('12-08-2009', 'dd-mm-yyyy'), 3, 249310996);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (365082672, 73, to_date('09-06-1984', 'dd-mm-yyyy'), 10, 740363237);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (35248085, 592, to_date('11-07-1979', 'dd-mm-yyyy'), 8, 286496076);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (316034762, 403, to_date('07-05-1992', 'dd-mm-yyyy'), 6, 857634572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (325668343, 119, to_date('24-04-1982', 'dd-mm-yyyy'), 3, 718798626);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (728982438, 515, to_date('07-11-2013', 'dd-mm-yyyy'), 11, 507410925);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (482993650, 91, to_date('15-11-2008', 'dd-mm-yyyy'), 13, 188147669);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (248951167, 281, to_date('16-09-2023', 'dd-mm-yyyy'), 14, 440327900);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (4192795, 145, to_date('18-05-2012', 'dd-mm-yyyy'), 4, 393576903);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (246324249, 670, to_date('26-08-2015', 'dd-mm-yyyy'), 1, 339386425);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (113668956, 208, to_date('16-08-1970', 'dd-mm-yyyy'), 5, 716858810);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (643164813, 182, to_date('26-12-2000', 'dd-mm-yyyy'), 4, 254183134);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (777367994, 157, to_date('13-10-1987', 'dd-mm-yyyy'), 4, 826859074);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (779897612, 243, to_date('29-07-1998', 'dd-mm-yyyy'), 5, 237165544);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (355056278, 470, to_date('12-04-2015', 'dd-mm-yyyy'), 1, 835190007);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (360753417, 471, to_date('31-12-2016', 'dd-mm-yyyy'), 12, 621782285);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (763375928, 101, to_date('02-03-2004', 'dd-mm-yyyy'), 4, 874315634);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (837573080, 391, to_date('05-03-2018', 'dd-mm-yyyy'), 4, 378488167);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (343601330, 212, to_date('13-04-1974', 'dd-mm-yyyy'), 10, 944171827);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (84988573, 417, to_date('18-09-1973', 'dd-mm-yyyy'), 9, 796939742);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (582544040, 229, to_date('20-12-2015', 'dd-mm-yyyy'), 12, 446907807);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (744253356, 119, to_date('03-02-1972', 'dd-mm-yyyy'), 7, 675645102);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (108944425, 342, to_date('20-12-1977', 'dd-mm-yyyy'), 6, 12638587);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (817185900, 643, to_date('11-03-2019', 'dd-mm-yyyy'), 3, 75905856);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (939690145, 446, to_date('23-02-1977', 'dd-mm-yyyy'), 8, 1543538);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (186616883, 102, to_date('17-07-1993', 'dd-mm-yyyy'), 11, 458899046);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (313961966, 532, to_date('03-12-1996', 'dd-mm-yyyy'), 3, 153241174);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (5626957, 484, to_date('12-07-1973', 'dd-mm-yyyy'), 4, 839864465);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (124045879, 617, to_date('15-12-2023', 'dd-mm-yyyy'), 13, 328950838);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (312187989, 664, to_date('13-01-1988', 'dd-mm-yyyy'), 3, 237165544);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (239453201, 116, to_date('29-12-2010', 'dd-mm-yyyy'), 1, 692856389);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (33762037, 214, to_date('13-04-2008', 'dd-mm-yyyy'), 14, 770042193);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (781133015, 3, to_date('02-08-1990', 'dd-mm-yyyy'), 13, 762568462);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (891910633, 508, to_date('08-03-2007', 'dd-mm-yyyy'), 3, 360390841);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (363538001, 611, to_date('12-10-1993', 'dd-mm-yyyy'), 11, 178666074);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (32843115, 87, to_date('03-07-2017', 'dd-mm-yyyy'), 11, 217203442);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (296276986, 513, to_date('07-08-1982', 'dd-mm-yyyy'), 4, 229526774);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (484373323, 84, to_date('05-03-1977', 'dd-mm-yyyy'), 1, 589872419);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (534932153, 280, to_date('17-04-2014', 'dd-mm-yyyy'), 8, 756653140);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (482005376, 194, to_date('25-05-1972', 'dd-mm-yyyy'), 13, 416908680);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (13167398, 420, to_date('06-08-2006', 'dd-mm-yyyy'), 8, 844430650);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (605955535, 434, to_date('04-04-2008', 'dd-mm-yyyy'), 4, 507895090);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (261803388, 17, to_date('12-02-2001', 'dd-mm-yyyy'), 4, 104098064);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (192087879, 440, to_date('26-04-1990', 'dd-mm-yyyy'), 12, 718798626);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (327909575, 346, to_date('15-05-2023', 'dd-mm-yyyy'), 5, 718802548);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (101879583, 358, to_date('01-04-1995', 'dd-mm-yyyy'), 7, 337896519);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (794711783, 108, to_date('13-04-1993', 'dd-mm-yyyy'), 8, 636858414);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (945571450, 97, to_date('28-06-2017', 'dd-mm-yyyy'), 9, 320257400);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (270808716, 126, to_date('07-08-1990', 'dd-mm-yyyy'), 6, 617292974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (513883630, 576, to_date('25-12-1982', 'dd-mm-yyyy'), 10, 796939742);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (648463833, 506, to_date('02-09-2010', 'dd-mm-yyyy'), 8, 895641532);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (195674427, 65, to_date('22-09-1973', 'dd-mm-yyyy'), 3, 216049651);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (868319223, 314, to_date('13-11-2024', 'dd-mm-yyyy'), 14, 838539231);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (485981424, 600, to_date('19-03-1979', 'dd-mm-yyyy'), 9, 199137043);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (394921378, 624, to_date('21-08-2010', 'dd-mm-yyyy'), 2, 750450292);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (941687249, 677, to_date('18-01-2011', 'dd-mm-yyyy'), 2, 244587046);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (530536798, 578, to_date('05-06-2001', 'dd-mm-yyyy'), 14, 356588438);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (98787120, 120, to_date('29-04-2001', 'dd-mm-yyyy'), 3, 658564281);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (732771935, 428, to_date('31-03-1971', 'dd-mm-yyyy'), 4, 718740896);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (170759957, 609, to_date('10-12-2001', 'dd-mm-yyyy'), 3, 718802548);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (777367994, 4, to_date('30-01-2014', 'dd-mm-yyyy'), 13, 835190007);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (64736067, 86, to_date('09-12-2001', 'dd-mm-yyyy'), 10, 850817402);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (417330284, 598, to_date('20-03-1990', 'dd-mm-yyyy'), 4, 541171572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (611644501, 582, to_date('12-09-1971', 'dd-mm-yyyy'), 1, 270924940);
commit;
prompt 100 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (978411914, 305, to_date('23-02-1996', 'dd-mm-yyyy'), 2, 417081781);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (377718868, 228, to_date('12-03-1992', 'dd-mm-yyyy'), 6, 874315634);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (285980664, 371, to_date('10-07-1972', 'dd-mm-yyyy'), 10, 393576903);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (611644501, 281, to_date('30-12-2012', 'dd-mm-yyyy'), 7, 284848175);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (381174773, 505, to_date('04-04-2007', 'dd-mm-yyyy'), 2, 887282476);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (820070154, 450, to_date('11-05-1980', 'dd-mm-yyyy'), 1, 249310996);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (12995079, 293, to_date('27-03-1978', 'dd-mm-yyyy'), 13, 205294997);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (788085938, 217, to_date('12-10-1994', 'dd-mm-yyyy'), 4, 855883192);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (679355403, 545, to_date('23-07-2009', 'dd-mm-yyyy'), 13, 513852071);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (766904997, 395, to_date('10-01-2017', 'dd-mm-yyyy'), 7, 635027893);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (986577118, 454, to_date('17-01-2006', 'dd-mm-yyyy'), 1, 825668146);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (824012038, 105, to_date('31-12-1995', 'dd-mm-yyyy'), 9, 71273362);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (335912518, 622, to_date('09-07-2005', 'dd-mm-yyyy'), 8, 370269659);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (430796178, 54, to_date('11-01-1992', 'dd-mm-yyyy'), 8, 770159297);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (129096789, 355, to_date('30-07-1981', 'dd-mm-yyyy'), 4, 441773370);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (737403223, 240, to_date('26-10-1988', 'dd-mm-yyyy'), 10, 8379588);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (465299234, 76, to_date('27-05-1993', 'dd-mm-yyyy'), 2, 284359297);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (459094322, 277, to_date('03-11-1996', 'dd-mm-yyyy'), 5, 611127729);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (606478972, 464, to_date('23-05-2018', 'dd-mm-yyyy'), 4, 778639839);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (753819790, 596, to_date('08-05-2004', 'dd-mm-yyyy'), 12, 819875448);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (369594238, 472, to_date('23-02-1980', 'dd-mm-yyyy'), 11, 952079976);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (868319223, 116, to_date('18-02-1990', 'dd-mm-yyyy'), 14, 731142515);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (950569167, 40, to_date('26-04-1988', 'dd-mm-yyyy'), 12, 440250930);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (791512667, 268, to_date('22-12-1992', 'dd-mm-yyyy'), 1, 348955707);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (961163333, 241, to_date('16-03-1975', 'dd-mm-yyyy'), 14, 836670970);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (782241521, 681, to_date('14-09-1992', 'dd-mm-yyyy'), 4, 498155036);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (303063139, 33, to_date('11-07-1981', 'dd-mm-yyyy'), 4, 284848175);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (805148676, 50, to_date('26-11-1979', 'dd-mm-yyyy'), 6, 179391023);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (829105321, 587, to_date('15-07-2012', 'dd-mm-yyyy'), 9, 228547715);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (744253356, 219, to_date('13-12-2016', 'dd-mm-yyyy'), 13, 216049651);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (51527747, 397, to_date('05-06-2005', 'dd-mm-yyyy'), 5, 770042193);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (15959727, 603, to_date('30-05-1975', 'dd-mm-yyyy'), 12, 890290774);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (782567954, 565, to_date('13-11-1986', 'dd-mm-yyyy'), 2, 857634572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (530536798, 231, to_date('30-08-1994', 'dd-mm-yyyy'), 10, 944171827);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (605955535, 263, to_date('12-05-1980', 'dd-mm-yyyy'), 4, 228547715);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (940615672, 59, to_date('13-01-1993', 'dd-mm-yyyy'), 5, 380185536);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (223432686, 697, to_date('15-11-1983', 'dd-mm-yyyy'), 2, 450037767);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (858830943, 683, to_date('20-09-1980', 'dd-mm-yyyy'), 6, 915926672);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (381174773, 481, to_date('31-08-2003', 'dd-mm-yyyy'), 3, 440772461);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (84149896, 677, to_date('30-07-1992', 'dd-mm-yyyy'), 8, 890715596);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (986577118, 367, to_date('29-11-1982', 'dd-mm-yyyy'), 9, 736009235);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (188488796, 296, to_date('27-01-1989', 'dd-mm-yyyy'), 2, 433914048);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (547366813, 491, to_date('03-07-1987', 'dd-mm-yyyy'), 13, 950506091);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (477646592, 35, to_date('11-09-2018', 'dd-mm-yyyy'), 14, 32049351);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (680043570, 320, to_date('20-06-2024', 'dd-mm-yyyy'), 2, 890290774);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (89442041, 600, to_date('23-12-1985', 'dd-mm-yyyy'), 11, 895641532);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (81016415, 621, to_date('30-08-1989', 'dd-mm-yyyy'), 13, 542329182);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (619322937, 520, to_date('29-06-1994', 'dd-mm-yyyy'), 1, 366210712);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (249608827, 65, to_date('01-06-2023', 'dd-mm-yyyy'), 7, 728666532);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (934996519, 693, to_date('04-06-1974', 'dd-mm-yyyy'), 12, 783717113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (405688824, 699, to_date('20-02-1985', 'dd-mm-yyyy'), 8, 718740896);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (405133321, 365, to_date('06-05-2018', 'dd-mm-yyyy'), 8, 788436504);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (251613319, 436, to_date('16-10-2017', 'dd-mm-yyyy'), 7, 423866989);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (420661845, 649, to_date('18-04-2007', 'dd-mm-yyyy'), 1, 913357506);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (782567954, 126, to_date('08-03-1985', 'dd-mm-yyyy'), 1, 405226871);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (294955133, 338, to_date('20-11-1990', 'dd-mm-yyyy'), 11, 582743934);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (369594238, 78, to_date('24-08-2006', 'dd-mm-yyyy'), 3, 557186261);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (381174773, 156, to_date('15-07-1980', 'dd-mm-yyyy'), 7, 604314036);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (123691481, 468, to_date('10-03-1994', 'dd-mm-yyyy'), 1, 523666684);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (266453328, 174, to_date('14-11-1997', 'dd-mm-yyyy'), 7, 243145366);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (80233433, 659, to_date('14-03-1974', 'dd-mm-yyyy'), 13, 913357506);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (825643796, 175, to_date('04-07-2006', 'dd-mm-yyyy'), 13, 363052948);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (217859613, 636, to_date('02-08-2023', 'dd-mm-yyyy'), 4, 684803812);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (381131314, 317, to_date('09-05-1973', 'dd-mm-yyyy'), 8, 718408998);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (358778389, 117, to_date('13-05-1996', 'dd-mm-yyyy'), 11, 983757891);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (619194539, 170, to_date('31-03-1981', 'dd-mm-yyyy'), 5, 89100606);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (676188928, 80, to_date('01-08-2010', 'dd-mm-yyyy'), 9, 103914968);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (210445649, 211, to_date('03-06-1986', 'dd-mm-yyyy'), 2, 95131359);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (900870464, 303, to_date('03-05-2009', 'dd-mm-yyyy'), 12, 819875448);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (420661845, 430, to_date('27-04-1998', 'dd-mm-yyyy'), 3, 752540023);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (262792649, 415, to_date('16-06-1998', 'dd-mm-yyyy'), 1, 370269659);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (872015678, 645, to_date('21-05-1978', 'dd-mm-yyyy'), 3, 519481550);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (721516923, 273, to_date('03-11-1988', 'dd-mm-yyyy'), 4, 320257400);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (604314524, 284, to_date('01-07-1975', 'dd-mm-yyyy'), 3, 762522269);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (632101363, 251, to_date('29-09-2013', 'dd-mm-yyyy'), 11, 141420133);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (309820613, 358, to_date('07-03-1991', 'dd-mm-yyyy'), 3, 9385231);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (714956600, 540, to_date('27-03-1982', 'dd-mm-yyyy'), 13, 440772461);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (637500348, 696, to_date('25-05-2009', 'dd-mm-yyyy'), 5, 432069073);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (158644684, 592, to_date('16-06-2024', 'dd-mm-yyyy'), 13, 984350743);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (964895751, 349, to_date('17-05-2016', 'dd-mm-yyyy'), 8, 427970187);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (818704753, 395, to_date('14-07-1999', 'dd-mm-yyyy'), 12, 229526774);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (796034862, 279, to_date('22-11-2016', 'dd-mm-yyyy'), 11, 718740896);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (588614902, 527, to_date('13-04-1992', 'dd-mm-yyyy'), 11, 213954003);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (210445649, 149, to_date('27-01-1983', 'dd-mm-yyyy'), 13, 992664950);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (512475504, 651, to_date('02-02-2003', 'dd-mm-yyyy'), 11, 744342438);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (276278048, 564, to_date('13-11-1985', 'dd-mm-yyyy'), 4, 380185536);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (597940615, 242, to_date('28-04-1990', 'dd-mm-yyyy'), 11, 121662109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (2857898, 554, to_date('19-07-1976', 'dd-mm-yyyy'), 2, 71273362);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (382092349, 568, to_date('19-06-1974', 'dd-mm-yyyy'), 8, 402205007);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (381131314, 118, to_date('31-08-1971', 'dd-mm-yyyy'), 13, 498155036);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (908529945, 505, to_date('01-11-1986', 'dd-mm-yyyy'), 6, 976997166);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (219208207, 216, to_date('08-06-2023', 'dd-mm-yyyy'), 13, 908126768);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (936734596, 275, to_date('29-09-1995', 'dd-mm-yyyy'), 6, 895641532);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (756920398, 692, to_date('09-04-1979', 'dd-mm-yyyy'), 12, 622592331);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (891595119, 612, to_date('27-01-2009', 'dd-mm-yyyy'), 9, 9385231);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (791512667, 258, to_date('30-10-2002', 'dd-mm-yyyy'), 12, 84503456);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (589453161, 581, to_date('21-04-2021', 'dd-mm-yyyy'), 10, 227485160);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (712378971, 453, to_date('06-02-1995', 'dd-mm-yyyy'), 10, 802809781);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (934996519, 408, to_date('15-02-1985', 'dd-mm-yyyy'), 7, 251745122);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (600080684, 446, to_date('30-07-1981', 'dd-mm-yyyy'), 6, 447456951);
commit;
prompt 200 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (289340778, 649, to_date('01-11-2019', 'dd-mm-yyyy'), 7, 117090238);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (791512667, 621, to_date('09-12-2005', 'dd-mm-yyyy'), 5, 787093235);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (216971089, 292, to_date('31-05-2005', 'dd-mm-yyyy'), 1, 752764983);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (52951373, 32, to_date('25-08-2020', 'dd-mm-yyyy'), 13, 196295696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (286947858, 484, to_date('01-02-1970', 'dd-mm-yyyy'), 7, 844430650);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (718475955, 212, to_date('19-05-2021', 'dd-mm-yyyy'), 5, 814503339);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (852243083, 303, to_date('16-03-1999', 'dd-mm-yyyy'), 11, 355249589);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (296276986, 466, to_date('02-05-1998', 'dd-mm-yyyy'), 5, 163507585);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (482005376, 640, to_date('22-08-1977', 'dd-mm-yyyy'), 12, 66135977);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (485981424, 673, to_date('29-10-2019', 'dd-mm-yyyy'), 13, 450037767);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (972627089, 226, to_date('22-04-1980', 'dd-mm-yyyy'), 9, 523666684);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (813985305, 330, to_date('12-09-2009', 'dd-mm-yyyy'), 5, 284359297);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (803830284, 152, to_date('09-09-2023', 'dd-mm-yyyy'), 5, 615068764);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (308779289, 346, to_date('19-11-1971', 'dd-mm-yyyy'), 9, 424240758);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (246030796, 62, to_date('09-11-1994', 'dd-mm-yyyy'), 9, 36280567);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (359010250, 338, to_date('04-07-1990', 'dd-mm-yyyy'), 7, 758394292);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (266453328, 171, to_date('16-08-1970', 'dd-mm-yyyy'), 8, 136766109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (432145983, 204, to_date('04-10-1998', 'dd-mm-yyyy'), 8, 582743934);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (683452562, 370, to_date('29-09-2017', 'dd-mm-yyyy'), 1, 674823260);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (459094322, 22, to_date('02-08-1977', 'dd-mm-yyyy'), 13, 855522077);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (920114875, 625, to_date('05-12-2022', 'dd-mm-yyyy'), 1, 541171572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (272899495, 447, to_date('30-11-2021', 'dd-mm-yyyy'), 14, 188147669);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (872015678, 61, to_date('25-03-2003', 'dd-mm-yyyy'), 4, 622592331);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (535855524, 77, to_date('11-04-2011', 'dd-mm-yyyy'), 12, 522740512);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (321174615, 548, to_date('20-08-1985', 'dd-mm-yyyy'), 9, 320257400);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (33762037, 639, to_date('23-02-1979', 'dd-mm-yyyy'), 14, 507410925);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (41324453, 597, to_date('12-09-1978', 'dd-mm-yyyy'), 11, 153241174);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (632101363, 50, to_date('27-06-2019', 'dd-mm-yyyy'), 3, 658535442);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (567662841, 260, to_date('23-05-2021', 'dd-mm-yyyy'), 3, 948482928);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (88447724, 141, to_date('09-11-1990', 'dd-mm-yyyy'), 14, 684803812);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (936734596, 536, to_date('16-08-1974', 'dd-mm-yyyy'), 5, 433914048);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (751065784, 89, to_date('13-07-1981', 'dd-mm-yyyy'), 9, 356588438);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (50979660, 270, to_date('04-11-2010', 'dd-mm-yyyy'), 7, 543257923);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (382092349, 662, to_date('07-02-1984', 'dd-mm-yyyy'), 6, 673475478);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (600547797, 233, to_date('04-04-1982', 'dd-mm-yyyy'), 5, 613574055);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (175052450, 292, to_date('05-09-2023', 'dd-mm-yyyy'), 5, 885765470);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (814830056, 359, to_date('07-12-2024', 'dd-mm-yyyy'), 2, 337896519);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (295421736, 336, to_date('15-10-2000', 'dd-mm-yyyy'), 5, 809127048);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (432611063, 266, to_date('26-06-1979', 'dd-mm-yyyy'), 1, 602194268);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (202171384, 421, to_date('26-02-2002', 'dd-mm-yyyy'), 6, 254183134);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (925999241, 340, to_date('21-04-1976', 'dd-mm-yyyy'), 10, 136612880);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (359535395, 388, to_date('10-01-2010', 'dd-mm-yyyy'), 2, 673475478);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (248243489, 455, to_date('25-12-2023', 'dd-mm-yyyy'), 14, 210171934);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (289957147, 158, to_date('14-01-2013', 'dd-mm-yyyy'), 7, 251745122);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (1717839, 10, to_date('13-11-1995', 'dd-mm-yyyy'), 12, 894962236);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (282927757, 156, to_date('12-07-1983', 'dd-mm-yyyy'), 13, 992664950);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (58187295, 214, to_date('27-07-1986', 'dd-mm-yyyy'), 7, 95131359);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (159569929, 242, to_date('25-03-1982', 'dd-mm-yyyy'), 6, 78120681);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (132133520, 164, to_date('10-04-2014', 'dd-mm-yyyy'), 5, 236775278);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (95786245, 492, to_date('09-08-2016', 'dd-mm-yyyy'), 8, 370269659);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (747532290, 418, to_date('22-05-1996', 'dd-mm-yyyy'), 6, 770159297);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (440525629, 94, to_date('27-06-2022', 'dd-mm-yyyy'), 2, 351101580);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (659594754, 401, to_date('02-11-2011', 'dd-mm-yyyy'), 11, 498155036);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (316034762, 29, to_date('04-02-2016', 'dd-mm-yyyy'), 8, 302549197);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (628746804, 205, to_date('23-04-1988', 'dd-mm-yyyy'), 7, 140762549);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (673407336, 329, to_date('12-03-2013', 'dd-mm-yyyy'), 7, 976997166);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (788085938, 155, to_date('23-02-1994', 'dd-mm-yyyy'), 1, 252952088);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (613919979, 516, to_date('09-04-1975', 'dd-mm-yyyy'), 14, 73319693);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (401079390, 432, to_date('06-09-2001', 'dd-mm-yyyy'), 14, 229526774);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (583464144, 509, to_date('05-05-2007', 'dd-mm-yyyy'), 7, 705787767);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (588514962, 445, to_date('21-05-1974', 'dd-mm-yyyy'), 14, 944171827);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (634098291, 451, to_date('20-08-1999', 'dd-mm-yyyy'), 6, 243145366);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (542905475, 549, to_date('14-05-1978', 'dd-mm-yyyy'), 11, 270924940);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (441026372, 181, to_date('01-12-2003', 'dd-mm-yyyy'), 12, 217203442);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (490583178, 514, to_date('22-02-1982', 'dd-mm-yyyy'), 10, 166021665);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (275350122, 543, to_date('27-01-1976', 'dd-mm-yyyy'), 11, 204637922);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (72817576, 280, to_date('19-08-2021', 'dd-mm-yyyy'), 4, 252952088);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (646516784, 221, to_date('19-08-2002', 'dd-mm-yyyy'), 2, 139099038);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (940615672, 491, to_date('19-03-2022', 'dd-mm-yyyy'), 2, 845912900);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (83725273, 619, to_date('12-10-2001', 'dd-mm-yyyy'), 9, 196295696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (25891153, 204, to_date('12-05-2001', 'dd-mm-yyyy'), 11, 351101580);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (720772631, 250, to_date('28-09-2006', 'dd-mm-yyyy'), 1, 825668146);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (335912518, 421, to_date('24-08-1975', 'dd-mm-yyyy'), 14, 617758551);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (781547507, 631, to_date('04-01-2008', 'dd-mm-yyyy'), 12, 236775278);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (476023236, 386, to_date('30-08-1989', 'dd-mm-yyyy'), 13, 152452318);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (872015678, 22, to_date('06-05-1983', 'dd-mm-yyyy'), 4, 324539265);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (468581292, 127, to_date('06-02-1999', 'dd-mm-yyyy'), 10, 543257923);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (23399145, 430, to_date('08-06-1997', 'dd-mm-yyyy'), 2, 972191037);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (605649551, 593, to_date('20-10-1999', 'dd-mm-yyyy'), 2, 573441687);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (99649496, 186, to_date('08-06-2024', 'dd-mm-yyyy'), 1, 651546201);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (958068049, 407, to_date('19-03-2012', 'dd-mm-yyyy'), 12, 633205472);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (350094576, 129, to_date('14-10-2017', 'dd-mm-yyyy'), 11, 206288356);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (717880392, 216, to_date('08-02-1990', 'dd-mm-yyyy'), 5, 440250930);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (496955924, 161, to_date('07-08-1975', 'dd-mm-yyyy'), 11, 463175157);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (837792164, 581, to_date('20-07-2011', 'dd-mm-yyyy'), 14, 243145366);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (27936243, 251, to_date('30-12-1997', 'dd-mm-yyyy'), 14, 771231041);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (25891153, 352, to_date('10-03-2008', 'dd-mm-yyyy'), 12, 170769951);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (23399145, 106, to_date('04-02-2013', 'dd-mm-yyyy'), 9, 196295696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (160706421, 230, to_date('03-05-1993', 'dd-mm-yyyy'), 1, 188147669);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (313961966, 352, to_date('05-01-1972', 'dd-mm-yyyy'), 8, 103902646);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (486704013, 236, to_date('05-09-1979', 'dd-mm-yyyy'), 2, 465891024);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (487691089, 144, to_date('08-10-1978', 'dd-mm-yyyy'), 3, 750200121);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (394033517, 515, to_date('03-02-1986', 'dd-mm-yyyy'), 8, 527339940);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (620639250, 554, to_date('14-01-2019', 'dd-mm-yyyy'), 3, 355249589);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (360902723, 631, to_date('28-04-1979', 'dd-mm-yyyy'), 4, 689999565);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (814830056, 684, to_date('25-12-1970', 'dd-mm-yyyy'), 6, 324539265);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (925999241, 638, to_date('24-10-1992', 'dd-mm-yyyy'), 4, 350437713);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (381131314, 129, to_date('31-10-1977', 'dd-mm-yyyy'), 6, 153241174);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (718475955, 401, to_date('08-02-2021', 'dd-mm-yyyy'), 4, 762522269);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (293806919, 157, to_date('18-07-1973', 'dd-mm-yyyy'), 4, 756653140);
commit;
prompt 300 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (717880392, 610, to_date('20-04-1986', 'dd-mm-yyyy'), 9, 475443309);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (137849984, 26, to_date('21-05-1996', 'dd-mm-yyyy'), 14, 312448494);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (282927757, 635, to_date('13-10-2012', 'dd-mm-yyyy'), 14, 557186261);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (419327765, 649, to_date('22-04-2003', 'dd-mm-yyyy'), 14, 983757891);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (785721807, 625, to_date('13-11-2004', 'dd-mm-yyyy'), 5, 692812350);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (275393257, 320, to_date('03-01-2022', 'dd-mm-yyyy'), 5, 140762549);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (232994015, 95, to_date('17-12-1983', 'dd-mm-yyyy'), 13, 185926813);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (798076468, 602, to_date('03-12-2015', 'dd-mm-yyyy'), 13, 237165544);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (349906655, 149, to_date('17-06-2024', 'dd-mm-yyyy'), 14, 458899046);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (684257348, 541, to_date('12-09-1980', 'dd-mm-yyyy'), 8, 718740896);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (644702328, 208, to_date('11-08-1995', 'dd-mm-yyyy'), 12, 948482928);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (323358973, 113, to_date('03-12-1977', 'dd-mm-yyyy'), 3, 294873316);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (763219347, 688, to_date('03-12-2011', 'dd-mm-yyyy'), 5, 84503456);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (394921378, 498, to_date('28-05-1988', 'dd-mm-yyyy'), 5, 179391023);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (900870464, 216, to_date('04-09-1977', 'dd-mm-yyyy'), 14, 629672609);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (248243489, 458, to_date('15-02-1977', 'dd-mm-yyyy'), 1, 294873316);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (50979660, 288, to_date('17-12-1972', 'dd-mm-yyyy'), 2, 121118536);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (488321919, 107, to_date('28-05-2005', 'dd-mm-yyyy'), 3, 750450292);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (843951632, 366, to_date('25-02-1975', 'dd-mm-yyyy'), 5, 770253624);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (877539276, 614, to_date('30-12-1981', 'dd-mm-yyyy'), 2, 692812350);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (941464739, 173, to_date('25-01-1987', 'dd-mm-yyyy'), 11, 915926672);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (50654111, 404, to_date('23-12-2008', 'dd-mm-yyyy'), 10, 326283524);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (683452562, 399, to_date('03-10-1976', 'dd-mm-yyyy'), 13, 187734366);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (814540938, 58, to_date('02-07-1974', 'dd-mm-yyyy'), 5, 140762549);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (922825288, 30, to_date('12-05-2015', 'dd-mm-yyyy'), 2, 268000963);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (167668089, 377, to_date('24-02-2013', 'dd-mm-yyyy'), 6, 895641532);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (693123424, 365, to_date('17-02-1999', 'dd-mm-yyyy'), 10, 523666684);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (497881898, 473, to_date('02-08-1984', 'dd-mm-yyyy'), 13, 103914968);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (568531463, 611, to_date('22-03-1996', 'dd-mm-yyyy'), 14, 278839113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (596600647, 568, to_date('12-02-1993', 'dd-mm-yyyy'), 1, 262380974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (47720527, 485, to_date('02-03-2013', 'dd-mm-yyyy'), 3, 795991899);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (59350221, 581, to_date('19-04-2008', 'dd-mm-yyyy'), 8, 357844780);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (824012038, 280, to_date('15-02-1987', 'dd-mm-yyyy'), 11, 687449545);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (266453328, 28, to_date('19-08-2005', 'dd-mm-yyyy'), 11, 458899046);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (33478448, 420, to_date('13-11-1972', 'dd-mm-yyyy'), 13, 151191594);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (765018581, 179, to_date('03-03-1970', 'dd-mm-yyyy'), 7, 155285136);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (677446448, 355, to_date('27-12-2014', 'dd-mm-yyyy'), 3, 635662386);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (613919979, 3, to_date('29-06-1985', 'dd-mm-yyyy'), 11, 972191037);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (484342221, 637, to_date('28-11-2000', 'dd-mm-yyyy'), 4, 262380974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (610398259, 269, to_date('05-06-2014', 'dd-mm-yyyy'), 12, 136612880);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (852595176, 605, to_date('29-01-1971', 'dd-mm-yyyy'), 6, 141420133);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (72529663, 618, to_date('25-11-1976', 'dd-mm-yyyy'), 8, 617758551);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (635511137, 266, to_date('18-09-1973', 'dd-mm-yyyy'), 9, 388996575);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (770422429, 284, to_date('07-02-1993', 'dd-mm-yyyy'), 12, 451316705);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (465299234, 107, to_date('03-03-2010', 'dd-mm-yyyy'), 6, 141140098);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (277119141, 61, to_date('24-04-1977', 'dd-mm-yyyy'), 14, 211359005);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (968526889, 97, to_date('18-10-2017', 'dd-mm-yyyy'), 7, 410105143);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (246872062, 661, to_date('18-02-2003', 'dd-mm-yyyy'), 3, 658535442);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (524736554, 581, to_date('13-07-2002', 'dd-mm-yyyy'), 11, 192731092);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (175052450, 396, to_date('31-01-2015', 'dd-mm-yyyy'), 4, 117090238);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (149604833, 561, to_date('26-08-1977', 'dd-mm-yyyy'), 13, 517634650);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (412181730, 222, to_date('10-01-1988', 'dd-mm-yyyy'), 6, 896897649);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (89442041, 440, to_date('30-12-2010', 'dd-mm-yyyy'), 6, 178666074);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (282684362, 460, to_date('03-01-1996', 'dd-mm-yyyy'), 9, 463175157);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (985232422, 185, to_date('29-05-1999', 'dd-mm-yyyy'), 12, 141140098);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (1717839, 442, to_date('18-08-2008', 'dd-mm-yyyy'), 10, 670671149);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (637473229, 141, to_date('02-02-1984', 'dd-mm-yyyy'), 7, 276484140);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (901112139, 600, to_date('20-07-2022', 'dd-mm-yyyy'), 1, 984350743);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (98290342, 133, to_date('07-02-1988', 'dd-mm-yyyy'), 4, 152452318);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (81955714, 143, to_date('12-03-1996', 'dd-mm-yyyy'), 5, 79984886);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (410948270, 412, to_date('15-01-2005', 'dd-mm-yyyy'), 10, 357844780);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (802169064, 87, to_date('20-05-1978', 'dd-mm-yyyy'), 2, 75905856);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (44304219, 346, to_date('22-03-2000', 'dd-mm-yyyy'), 3, 139099038);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (90488352, 15, to_date('21-08-2014', 'dd-mm-yyyy'), 1, 200515695);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (302715872, 304, to_date('25-02-1975', 'dd-mm-yyyy'), 13, 348201260);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (741735622, 402, to_date('09-07-1989', 'dd-mm-yyyy'), 9, 968219989);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (808540378, 273, to_date('28-11-2016', 'dd-mm-yyyy'), 10, 805225066);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (82049226, 171, to_date('06-10-1982', 'dd-mm-yyyy'), 11, 121118536);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (23399145, 74, to_date('22-10-1988', 'dd-mm-yyyy'), 11, 752764983);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (337147026, 459, to_date('05-03-1977', 'dd-mm-yyyy'), 11, 569878396);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (195613588, 536, to_date('16-12-1976', 'dd-mm-yyyy'), 3, 229526774);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (484342221, 689, to_date('19-11-2020', 'dd-mm-yyyy'), 6, 908126768);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (155712522, 113, to_date('14-02-1976', 'dd-mm-yyyy'), 6, 701956875);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (619322937, 143, to_date('08-02-1996', 'dd-mm-yyyy'), 6, 789430976);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (580613229, 672, to_date('07-07-1972', 'dd-mm-yyyy'), 9, 750200121);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (824331991, 577, to_date('31-12-2014', 'dd-mm-yyyy'), 5, 944171827);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (489747556, 574, to_date('07-01-2008', 'dd-mm-yyyy'), 13, 285417351);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (568531463, 659, to_date('29-01-1986', 'dd-mm-yyyy'), 4, 814503339);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (635036008, 157, to_date('02-02-1974', 'dd-mm-yyyy'), 4, 417081781);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (659594754, 590, to_date('19-07-1975', 'dd-mm-yyyy'), 5, 890003369);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (381131314, 255, to_date('31-03-1977', 'dd-mm-yyyy'), 8, 651546201);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (720330162, 221, to_date('10-10-1997', 'dd-mm-yyyy'), 1, 424240758);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (340225539, 296, to_date('25-04-2005', 'dd-mm-yyyy'), 6, 509167884);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (614876819, 69, to_date('31-05-1976', 'dd-mm-yyyy'), 1, 728666532);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (544790398, 452, to_date('30-07-2022', 'dd-mm-yyyy'), 14, 387211420);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (855092810, 539, to_date('04-03-1988', 'dd-mm-yyyy'), 10, 548404580);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (453361323, 532, to_date('18-07-1996', 'dd-mm-yyyy'), 2, 445298667);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (794711783, 583, to_date('10-08-2013', 'dd-mm-yyyy'), 6, 805225066);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (335015719, 81, to_date('21-03-1997', 'dd-mm-yyyy'), 14, 513852071);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (496955924, 558, to_date('16-04-1999', 'dd-mm-yyyy'), 4, 329518955);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (791530797, 412, to_date('21-03-1990', 'dd-mm-yyyy'), 13, 673475478);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (751452007, 604, to_date('17-11-1971', 'dd-mm-yyyy'), 13, 139099038);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (986771557, 33, to_date('26-03-1981', 'dd-mm-yyyy'), 14, 424240758);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (263101536, 292, to_date('28-10-2007', 'dd-mm-yyyy'), 10, 85272737);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (208298661, 421, to_date('10-08-2009', 'dd-mm-yyyy'), 9, 66135977);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (635511137, 624, to_date('02-03-2011', 'dd-mm-yyyy'), 11, 337896519);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (994568560, 618, to_date('29-05-2001', 'dd-mm-yyyy'), 10, 718408998);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (642201894, 627, to_date('17-01-2012', 'dd-mm-yyyy'), 13, 952079976);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (668890911, 653, to_date('14-05-2016', 'dd-mm-yyyy'), 8, 348201260);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (920114875, 521, to_date('17-08-1993', 'dd-mm-yyyy'), 14, 74274374);
commit;
prompt 400 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (873680223, 607, to_date('07-12-1995', 'dd-mm-yyyy'), 5, 266658796);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (524736554, 595, to_date('30-12-2000', 'dd-mm-yyyy'), 2, 518947468);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (497881898, 692, to_date('27-12-2010', 'dd-mm-yyyy'), 6, 684803812);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (250757297, 518, to_date('05-09-1995', 'dd-mm-yyyy'), 5, 328950838);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (308779289, 275, to_date('22-10-1974', 'dd-mm-yyyy'), 12, 844430650);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (419630680, 54, to_date('10-11-2014', 'dd-mm-yyyy'), 6, 89100606);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (6928452, 29, to_date('29-01-2014', 'dd-mm-yyyy'), 13, 826859074);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (597940615, 486, to_date('27-03-2003', 'dd-mm-yyyy'), 7, 356588438);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (956967752, 509, to_date('02-11-2010', 'dd-mm-yyyy'), 5, 141420133);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (795957244, 514, to_date('08-01-2024', 'dd-mm-yyyy'), 6, 670671149);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (642152630, 622, to_date('06-02-2010', 'dd-mm-yyyy'), 2, 71961495);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (25891153, 204, to_date('24-02-1982', 'dd-mm-yyyy'), 13, 144874633);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (548178067, 38, to_date('25-08-1984', 'dd-mm-yyyy'), 5, 598780758);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (158644684, 490, to_date('19-03-1973', 'dd-mm-yyyy'), 10, 548404580);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (82049226, 82, to_date('11-12-2003', 'dd-mm-yyyy'), 12, 206288356);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (707847577, 559, to_date('04-07-1989', 'dd-mm-yyyy'), 2, 923536778);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (821603494, 688, to_date('22-01-2011', 'dd-mm-yyyy'), 4, 923536778);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (573376389, 187, to_date('13-10-2020', 'dd-mm-yyyy'), 8, 46651369);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (881483798, 550, to_date('04-07-2024', 'dd-mm-yyyy'), 10, 609136779);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (837573080, 259, to_date('31-03-2005', 'dd-mm-yyyy'), 5, 151191594);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (338273592, 671, to_date('29-09-2012', 'dd-mm-yyyy'), 10, 121118536);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (775720063, 343, to_date('29-11-1971', 'dd-mm-yyyy'), 13, 95131359);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (732771935, 382, to_date('18-02-1978', 'dd-mm-yyyy'), 1, 501487636);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (659594754, 285, to_date('28-04-2002', 'dd-mm-yyyy'), 5, 983757891);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (320201126, 175, to_date('23-01-2001', 'dd-mm-yyyy'), 9, 387211420);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (369594238, 569, to_date('15-05-1998', 'dd-mm-yyyy'), 10, 557186261);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (808540378, 371, to_date('30-07-1983', 'dd-mm-yyyy'), 1, 141140098);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (540968116, 516, to_date('06-05-2017', 'dd-mm-yyyy'), 12, 196295696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (302715872, 297, to_date('15-06-1997', 'dd-mm-yyyy'), 9, 12943391);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (53329006, 589, to_date('04-03-2021', 'dd-mm-yyyy'), 2, 750200121);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (468581292, 369, to_date('17-11-2018', 'dd-mm-yyyy'), 10, 328950838);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (888759649, 393, to_date('29-05-1997', 'dd-mm-yyyy'), 14, 49968460);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (936356540, 341, to_date('03-10-1972', 'dd-mm-yyyy'), 14, 509167884);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (953845254, 247, to_date('16-02-1986', 'dd-mm-yyyy'), 9, 609136779);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (763219347, 178, to_date('17-04-1979', 'dd-mm-yyyy'), 10, 485698844);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (679355403, 304, to_date('19-07-1982', 'dd-mm-yyyy'), 13, 451316705);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (342872311, 79, to_date('27-05-1975', 'dd-mm-yyyy'), 5, 746027242);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (646173286, 645, to_date('12-03-1976', 'dd-mm-yyyy'), 11, 607574361);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (129096789, 540, to_date('23-02-1994', 'dd-mm-yyyy'), 12, 718408998);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (419630680, 523, to_date('20-01-1987', 'dd-mm-yyyy'), 3, 636108167);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (999906876, 445, to_date('14-04-1973', 'dd-mm-yyyy'), 5, 801031572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (356943905, 526, to_date('08-03-1998', 'dd-mm-yyyy'), 5, 509275607);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (853702225, 238, to_date('15-04-1984', 'dd-mm-yyyy'), 1, 598780758);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (86666800, 307, to_date('02-08-2001', 'dd-mm-yyyy'), 6, 692812350);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (595922257, 498, to_date('01-11-1992', 'dd-mm-yyyy'), 2, 118426724);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (646294342, 414, to_date('12-02-2010', 'dd-mm-yyyy'), 11, 794115696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (986235526, 177, to_date('04-07-1985', 'dd-mm-yyyy'), 2, 337896519);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (775624090, 667, to_date('04-10-2001', 'dd-mm-yyyy'), 11, 412258548);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (828581013, 590, to_date('30-06-1997', 'dd-mm-yyyy'), 2, 393576903);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (553266644, 582, to_date('20-05-1999', 'dd-mm-yyyy'), 12, 374269823);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (48751690, 324, to_date('19-01-1972', 'dd-mm-yyyy'), 5, 656069837);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (953845254, 439, to_date('17-09-1972', 'dd-mm-yyyy'), 12, 885641852);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (896176278, 118, to_date('14-09-2006', 'dd-mm-yyyy'), 4, 423866989);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (212470513, 98, to_date('09-06-1990', 'dd-mm-yyyy'), 13, 736118185);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (943456742, 18, to_date('05-03-2018', 'dd-mm-yyyy'), 9, 12943391);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (195674427, 32, to_date('27-10-1972', 'dd-mm-yyyy'), 7, 816591045);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (788460692, 151, to_date('02-02-1980', 'dd-mm-yyyy'), 11, 427970187);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (346067054, 184, to_date('08-09-1984', 'dd-mm-yyyy'), 7, 915165531);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (805557604, 480, to_date('21-04-1999', 'dd-mm-yyyy'), 6, 684803812);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (805148676, 39, to_date('03-07-1998', 'dd-mm-yyyy'), 8, 187734366);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (769182328, 349, to_date('28-05-1995', 'dd-mm-yyyy'), 9, 887282476);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (121347815, 577, to_date('13-11-2013', 'dd-mm-yyyy'), 5, 731142515);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (883328981, 78, to_date('31-03-1973', 'dd-mm-yyyy'), 4, 152452318);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (547025568, 318, to_date('13-11-1975', 'dd-mm-yyyy'), 7, 968219989);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (862875266, 120, to_date('25-06-1997', 'dd-mm-yyyy'), 10, 579001671);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (306494187, 183, to_date('25-12-2006', 'dd-mm-yyyy'), 7, 948482928);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (490312661, 439, to_date('04-08-1975', 'dd-mm-yyyy'), 5, 972191037);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (858830943, 390, to_date('04-08-1998', 'dd-mm-yyyy'), 2, 673475478);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (245092124, 101, to_date('19-03-2004', 'dd-mm-yyyy'), 4, 517695961);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (956967752, 162, to_date('19-08-2009', 'dd-mm-yyyy'), 7, 363052948);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (186616883, 305, to_date('17-02-2012', 'dd-mm-yyyy'), 4, 908122514);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (643895054, 117, to_date('21-04-2010', 'dd-mm-yyyy'), 13, 915165531);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (370253691, 226, to_date('29-04-2019', 'dd-mm-yyyy'), 2, 155285136);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (23399145, 76, to_date('06-05-1988', 'dd-mm-yyyy'), 9, 935194922);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (550349575, 476, to_date('18-01-2000', 'dd-mm-yyyy'), 4, 855883192);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (195674427, 445, to_date('10-05-2013', 'dd-mm-yyyy'), 3, 255340449);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (567516147, 638, to_date('08-06-2015', 'dd-mm-yyyy'), 13, 141420133);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (513883630, 312, to_date('09-03-2006', 'dd-mm-yyyy'), 6, 750450292);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (895866713, 587, to_date('23-02-1973', 'dd-mm-yyyy'), 4, 382318427);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (291484015, 30, to_date('25-09-1974', 'dd-mm-yyyy'), 12, 519481550);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (56911556, 659, to_date('23-09-1979', 'dd-mm-yyyy'), 4, 13912645);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (294955133, 330, to_date('30-09-1974', 'dd-mm-yyyy'), 9, 762568462);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (482993650, 211, to_date('10-05-2000', 'dd-mm-yyyy'), 10, 850817402);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (83845943, 485, to_date('17-07-1988', 'dd-mm-yyyy'), 14, 789430976);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (283539035, 314, to_date('07-03-1973', 'dd-mm-yyyy'), 2, 192731092);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (215809211, 23, to_date('18-05-2016', 'dd-mm-yyyy'), 4, 602194268);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (888759649, 96, to_date('05-05-1995', 'dd-mm-yyyy'), 14, 266658796);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (102017463, 307, to_date('12-04-2003', 'dd-mm-yyyy'), 10, 276484140);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (568531463, 684, to_date('03-03-2003', 'dd-mm-yyyy'), 14, 8379588);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (432611063, 381, to_date('04-03-2009', 'dd-mm-yyyy'), 6, 121118536);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (440525629, 255, to_date('20-11-1993', 'dd-mm-yyyy'), 13, 895641532);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (431285163, 386, to_date('27-10-1975', 'dd-mm-yyyy'), 3, 65925109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (133998877, 219, to_date('30-11-2017', 'dd-mm-yyyy'), 8, 801031572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (488321919, 586, to_date('27-01-1981', 'dd-mm-yyyy'), 4, 646974723);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (301443611, 187, to_date('15-06-2004', 'dd-mm-yyyy'), 9, 270924940);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (498599129, 94, to_date('14-11-2007', 'dd-mm-yyyy'), 1, 770159297);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (40282389, 454, to_date('06-02-2015', 'dd-mm-yyyy'), 5, 579001671);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (109075399, 700, to_date('15-03-2008', 'dd-mm-yyyy'), 1, 835190007);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (500428309, 395, to_date('08-01-1981', 'dd-mm-yyyy'), 8, 63614029);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (613334540, 208, to_date('09-04-1979', 'dd-mm-yyyy'), 7, 855522077);
commit;
prompt 500 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (939690145, 401, to_date('10-08-1995', 'dd-mm-yyyy'), 7, 229615740);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (835329653, 406, to_date('04-03-1991', 'dd-mm-yyyy'), 12, 355249589);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (684257348, 324, to_date('11-02-1986', 'dd-mm-yyyy'), 10, 255340449);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (951334175, 414, to_date('10-06-2021', 'dd-mm-yyyy'), 5, 958142341);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (775624090, 404, to_date('16-03-2002', 'dd-mm-yyyy'), 4, 229615740);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (240363167, 525, to_date('11-01-1972', 'dd-mm-yyyy'), 10, 731142515);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (403314295, 629, to_date('05-09-2020', 'dd-mm-yyyy'), 7, 573441687);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (300129768, 305, to_date('27-10-1997', 'dd-mm-yyyy'), 14, 410105143);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (465299234, 694, to_date('17-08-2001', 'dd-mm-yyyy'), 2, 845912900);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (625840894, 204, to_date('07-02-2018', 'dd-mm-yyyy'), 2, 509275607);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (790308092, 366, to_date('06-03-2001', 'dd-mm-yyyy'), 4, 324539265);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (612151249, 357, to_date('06-02-2022', 'dd-mm-yyyy'), 14, 635027893);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (983091210, 358, to_date('25-05-1987', 'dd-mm-yyyy'), 4, 103914968);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (44007577, 369, to_date('20-11-1977', 'dd-mm-yyyy'), 2, 701956875);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (717880392, 143, to_date('09-01-1993', 'dd-mm-yyyy'), 13, 12638587);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (578746202, 252, to_date('15-08-1988', 'dd-mm-yyyy'), 2, 211359005);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (835329653, 538, to_date('23-04-1979', 'dd-mm-yyyy'), 3, 475443309);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (960553982, 373, to_date('24-09-1977', 'dd-mm-yyyy'), 9, 244587046);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (777367994, 89, to_date('20-04-1998', 'dd-mm-yyyy'), 1, 75905856);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (604314524, 490, to_date('16-03-2008', 'dd-mm-yyyy'), 8, 613574055);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (928379443, 409, to_date('16-06-1994', 'dd-mm-yyyy'), 5, 699864151);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (92423616, 188, to_date('15-12-2011', 'dd-mm-yyyy'), 6, 236653050);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (728982438, 526, to_date('06-05-1984', 'dd-mm-yyyy'), 12, 427970187);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (127479756, 89, to_date('03-05-1971', 'dd-mm-yyyy'), 2, 836670970);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (451972516, 589, to_date('13-03-2023', 'dd-mm-yyyy'), 8, 894962236);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (714762730, 315, to_date('18-09-2017', 'dd-mm-yyyy'), 11, 348955707);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (277119141, 148, to_date('26-08-1973', 'dd-mm-yyyy'), 13, 718408998);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (588614902, 186, to_date('23-05-1994', 'dd-mm-yyyy'), 1, 573284331);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (294955133, 109, to_date('26-05-2002', 'dd-mm-yyyy'), 10, 710066917);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (315806874, 223, to_date('30-09-2024', 'dd-mm-yyyy'), 13, 440327900);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (902105753, 639, to_date('24-02-1974', 'dd-mm-yyyy'), 4, 266658796);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (775276020, 383, to_date('28-05-1998', 'dd-mm-yyyy'), 1, 378488167);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (393469268, 524, to_date('26-12-2011', 'dd-mm-yyyy'), 8, 896897649);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (737403223, 435, to_date('20-04-1983', 'dd-mm-yyyy'), 11, 775851939);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (31428778, 292, to_date('08-11-1982', 'dd-mm-yyyy'), 14, 440772461);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (500428309, 79, to_date('14-07-1983', 'dd-mm-yyyy'), 6, 447456951);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (431285163, 146, to_date('25-06-1999', 'dd-mm-yyyy'), 8, 380185536);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (51003258, 312, to_date('23-06-1989', 'dd-mm-yyyy'), 8, 378488167);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (303579252, 617, to_date('03-06-1979', 'dd-mm-yyyy'), 4, 770253624);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (23399145, 417, to_date('17-03-1991', 'dd-mm-yyyy'), 6, 328950838);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (937194182, 41, to_date('24-02-2001', 'dd-mm-yyyy'), 1, 470607412);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (894100813, 518, to_date('16-07-1986', 'dd-mm-yyyy'), 12, 684803812);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (922601322, 419, to_date('01-02-2005', 'dd-mm-yyyy'), 2, 302549197);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (239682226, 521, to_date('24-08-2024', 'dd-mm-yyyy'), 12, 348201260);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (775276020, 211, to_date('10-12-1971', 'dd-mm-yyyy'), 8, 324539265);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (84937489, 463, to_date('19-01-2020', 'dd-mm-yyyy'), 11, 213954003);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (960553982, 325, to_date('30-01-1996', 'dd-mm-yyyy'), 2, 611127729);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (832890599, 87, to_date('13-03-1992', 'dd-mm-yyyy'), 8, 826859074);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (517536968, 254, to_date('07-04-2000', 'dd-mm-yyyy'), 2, 801031572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (492461632, 57, to_date('20-12-1988', 'dd-mm-yyyy'), 13, 382318427);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (869068786, 267, to_date('24-05-1989', 'dd-mm-yyyy'), 5, 266658796);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (866437249, 278, to_date('22-09-1971', 'dd-mm-yyyy'), 14, 716858810);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (490962785, 70, to_date('27-05-1992', 'dd-mm-yyyy'), 2, 666953605);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (895866713, 607, to_date('27-11-1995', 'dd-mm-yyyy'), 1, 451316705);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (814110522, 649, to_date('16-08-2012', 'dd-mm-yyyy'), 14, 36280567);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (188658855, 624, to_date('15-12-2007', 'dd-mm-yyyy'), 11, 750200121);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (561238982, 576, to_date('31-12-2014', 'dd-mm-yyyy'), 10, 716162130);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (754431912, 568, to_date('14-09-1992', 'dd-mm-yyyy'), 6, 419144040);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (1138673, 564, to_date('26-02-1973', 'dd-mm-yyyy'), 7, 294873316);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (755928705, 328, to_date('10-07-1988', 'dd-mm-yyyy'), 9, 795991899);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (97993488, 316, to_date('20-12-2022', 'dd-mm-yyyy'), 5, 568766870);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (993320000, 209, to_date('28-06-2016', 'dd-mm-yyyy'), 10, 648255483);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (512976318, 637, to_date('17-12-1985', 'dd-mm-yyyy'), 2, 836579011);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (160706421, 633, to_date('03-03-1993', 'dd-mm-yyyy'), 8, 440772461);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (379364409, 203, to_date('18-10-2023', 'dd-mm-yyyy'), 8, 844365450);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (586728337, 61, to_date('26-12-2014', 'dd-mm-yyyy'), 6, 976997166);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (953845254, 8, to_date('11-10-1997', 'dd-mm-yyyy'), 9, 46651369);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (925822986, 191, to_date('03-04-1984', 'dd-mm-yyyy'), 7, 84503456);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (470914472, 26, to_date('31-12-1982', 'dd-mm-yyyy'), 6, 292815566);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (184886653, 556, to_date('03-09-1978', 'dd-mm-yyyy'), 13, 36280567);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (195613588, 279, to_date('03-06-1999', 'dd-mm-yyyy'), 13, 86118963);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (182083568, 52, to_date('04-08-1975', 'dd-mm-yyyy'), 4, 402205007);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (732050531, 690, to_date('11-04-1999', 'dd-mm-yyyy'), 4, 857634572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (772536129, 684, to_date('24-02-2011', 'dd-mm-yyyy'), 1, 151191594);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (925999241, 696, to_date('15-07-1986', 'dd-mm-yyyy'), 12, 648829127);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (313961966, 63, to_date('04-04-2015', 'dd-mm-yyyy'), 11, 337896519);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (561676102, 404, to_date('07-08-1971', 'dd-mm-yyyy'), 6, 778639839);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (188776074, 609, to_date('17-09-1982', 'dd-mm-yyyy'), 1, 468288433);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (18618685, 534, to_date('19-12-1997', 'dd-mm-yyyy'), 2, 736009235);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (47720527, 127, to_date('18-11-1991', 'dd-mm-yyyy'), 14, 139099038);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (306494187, 511, to_date('12-04-1974', 'dd-mm-yyyy'), 3, 12943391);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (467086955, 137, to_date('21-01-2021', 'dd-mm-yyyy'), 12, 895641532);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (619987948, 302, to_date('22-08-2024', 'dd-mm-yyyy'), 11, 199137043);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (436359729, 385, to_date('27-07-2002', 'dd-mm-yyyy'), 4, 617292974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (909379902, 425, to_date('01-10-1984', 'dd-mm-yyyy'), 3, 569878396);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (835539743, 424, to_date('17-08-1971', 'dd-mm-yyyy'), 11, 178666074);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (953454618, 601, to_date('01-08-1980', 'dd-mm-yyyy'), 5, 507895090);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (635511137, 110, to_date('08-06-1999', 'dd-mm-yyyy'), 10, 826859074);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (86148440, 532, to_date('15-08-1987', 'dd-mm-yyyy'), 8, 845912900);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (765511772, 453, to_date('09-12-1988', 'dd-mm-yyyy'), 14, 188147669);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (300129768, 387, to_date('20-06-1996', 'dd-mm-yyyy'), 8, 213954003);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (75542571, 220, to_date('17-06-1975', 'dd-mm-yyyy'), 13, 617292974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (271235358, 565, to_date('11-03-2007', 'dd-mm-yyyy'), 13, 802809781);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (829105321, 243, to_date('07-01-1979', 'dd-mm-yyyy'), 7, 211689744);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (775154294, 129, to_date('10-11-1989', 'dd-mm-yyyy'), 8, 143131406);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (496955924, 468, to_date('08-02-1984', 'dd-mm-yyyy'), 3, 445269041);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (485981424, 57, to_date('18-07-2019', 'dd-mm-yyyy'), 7, 236775278);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (859350816, 547, to_date('07-09-1971', 'dd-mm-yyyy'), 8, 388996575);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (3298276, 64, to_date('26-12-2009', 'dd-mm-yyyy'), 9, 266658796);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (453361323, 48, to_date('24-11-2015', 'dd-mm-yyyy'), 5, 5145747);
commit;
prompt 600 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (703485110, 632, to_date('29-11-1983', 'dd-mm-yyyy'), 8, 783717113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (983801413, 158, to_date('05-05-1995', 'dd-mm-yyyy'), 3, 348955707);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (583464144, 80, to_date('02-10-2008', 'dd-mm-yyyy'), 9, 283601196);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (113668956, 25, to_date('29-11-1988', 'dd-mm-yyyy'), 4, 8379588);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (369054694, 285, to_date('30-10-1971', 'dd-mm-yyyy'), 6, 509519761);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (864427260, 538, to_date('28-07-2020', 'dd-mm-yyyy'), 9, 228547715);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (512976318, 199, to_date('07-05-2013', 'dd-mm-yyyy'), 7, 541171572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (112064902, 592, to_date('08-12-2013', 'dd-mm-yyyy'), 12, 622592331);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (124045879, 82, to_date('26-05-2001', 'dd-mm-yyyy'), 3, 629672609);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (95786245, 332, to_date('05-08-2002', 'dd-mm-yyyy'), 12, 217203442);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (720772631, 122, to_date('20-07-1984', 'dd-mm-yyyy'), 8, 509519761);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (720330162, 305, to_date('21-08-2008', 'dd-mm-yyyy'), 8, 410105143);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (33762037, 447, to_date('14-08-2022', 'dd-mm-yyyy'), 4, 740363237);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (98290342, 332, to_date('12-06-2011', 'dd-mm-yyyy'), 1, 328950838);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (158357659, 662, to_date('21-09-1978', 'dd-mm-yyyy'), 12, 136612880);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (300129768, 444, to_date('28-01-2004', 'dd-mm-yyyy'), 14, 517695961);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (946531589, 140, to_date('21-07-2018', 'dd-mm-yyyy'), 8, 79984886);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (739948974, 402, to_date('12-06-2012', 'dd-mm-yyyy'), 7, 978345655);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (466407372, 282, to_date('04-01-1980', 'dd-mm-yyyy'), 14, 949702702);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (939690145, 306, to_date('24-05-1970', 'dd-mm-yyyy'), 8, 458899046);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (184677469, 647, to_date('29-11-1980', 'dd-mm-yyyy'), 6, 192731092);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (432611063, 183, to_date('19-04-1973', 'dd-mm-yyyy'), 13, 548404580);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (960513263, 416, to_date('02-04-1993', 'dd-mm-yyyy'), 7, 166021665);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (598290979, 227, to_date('03-07-1982', 'dd-mm-yyyy'), 10, 976997166);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (158644684, 8, to_date('31-03-1972', 'dd-mm-yyyy'), 12, 707132487);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (775276020, 141, to_date('31-10-1997', 'dd-mm-yyyy'), 5, 451316705);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (380122544, 529, to_date('04-09-2011', 'dd-mm-yyyy'), 13, 523666684);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (783933452, 591, to_date('10-02-2020', 'dd-mm-yyyy'), 10, 844365450);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (188072281, 190, to_date('09-10-2005', 'dd-mm-yyyy'), 10, 438430790);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (396677554, 416, to_date('01-05-1980', 'dd-mm-yyyy'), 3, 388996575);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (791866296, 453, to_date('31-03-1982', 'dd-mm-yyyy'), 6, 326283524);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (999906876, 667, to_date('08-05-1975', 'dd-mm-yyyy'), 13, 788436504);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (485714755, 460, to_date('26-08-1982', 'dd-mm-yyyy'), 1, 258901645);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (426957042, 696, to_date('05-12-1992', 'dd-mm-yyyy'), 9, 995715649);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (273836904, 407, to_date('02-06-2015', 'dd-mm-yyyy'), 1, 507410925);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (470994691, 592, to_date('22-12-2014', 'dd-mm-yyyy'), 5, 211689744);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (431285163, 510, to_date('06-03-1995', 'dd-mm-yyyy'), 6, 604314036);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (193479284, 321, to_date('05-06-1992', 'dd-mm-yyyy'), 14, 278839113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (384592074, 475, to_date('13-07-1999', 'dd-mm-yyyy'), 2, 770042193);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (95786245, 183, to_date('17-10-1972', 'dd-mm-yyyy'), 3, 552251003);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (359010250, 151, to_date('05-03-1998', 'dd-mm-yyyy'), 14, 284359297);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (919760560, 88, to_date('21-08-1976', 'dd-mm-yyyy'), 2, 216049651);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (192263489, 114, to_date('16-02-1994', 'dd-mm-yyyy'), 11, 952079976);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (465299234, 342, to_date('18-10-1981', 'dd-mm-yyyy'), 3, 518947468);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (699749179, 83, to_date('08-08-2009', 'dd-mm-yyyy'), 12, 633601303);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (263101536, 416, to_date('21-01-1974', 'dd-mm-yyyy'), 3, 485698844);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (68858904, 514, to_date('29-12-1984', 'dd-mm-yyyy'), 8, 13912645);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (200571988, 402, to_date('11-03-2004', 'dd-mm-yyyy'), 14, 75905856);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (753819790, 695, to_date('21-02-1980', 'dd-mm-yyyy'), 13, 410105143);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (84937489, 486, to_date('12-06-1979', 'dd-mm-yyyy'), 1, 509519761);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (634098291, 218, to_date('10-08-2017', 'dd-mm-yyyy'), 7, 153241174);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (779897612, 315, to_date('25-04-2001', 'dd-mm-yyyy'), 14, 518947468);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (321174615, 245, to_date('08-04-1970', 'dd-mm-yyyy'), 1, 602194268);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (476293003, 377, to_date('24-08-2016', 'dd-mm-yyyy'), 1, 199137043);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (749808930, 498, to_date('07-05-1979', 'dd-mm-yyyy'), 8, 983757891);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (835539743, 684, to_date('28-01-2024', 'dd-mm-yyyy'), 9, 895641532);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (476293003, 255, to_date('12-02-2022', 'dd-mm-yyyy'), 6, 71961495);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (485714755, 648, to_date('30-09-1973', 'dd-mm-yyyy'), 10, 13912645);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (994936749, 23, to_date('28-08-2019', 'dd-mm-yyyy'), 2, 995715649);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (791530797, 94, to_date('09-06-2013', 'dd-mm-yyyy'), 9, 913357506);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (488321919, 191, to_date('28-01-2007', 'dd-mm-yyyy'), 5, 470607412);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (104756631, 343, to_date('11-05-2024', 'dd-mm-yyyy'), 4, 465891024);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (776899533, 568, to_date('03-01-1971', 'dd-mm-yyyy'), 1, 374269823);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (791530797, 578, to_date('12-02-1994', 'dd-mm-yyyy'), 7, 736118185);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (765511772, 121, to_date('18-12-2018', 'dd-mm-yyyy'), 5, 636108167);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (140291562, 129, to_date('18-08-1987', 'dd-mm-yyyy'), 14, 820249517);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (941464739, 173, to_date('30-04-1997', 'dd-mm-yyyy'), 14, 370269659);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (581395647, 51, to_date('08-06-1983', 'dd-mm-yyyy'), 8, 944171827);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (900443642, 81, to_date('29-03-1971', 'dd-mm-yyyy'), 1, 337896519);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (140291562, 678, to_date('29-04-2008', 'dd-mm-yyyy'), 11, 125538621);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (169378918, 22, to_date('02-04-1980', 'dd-mm-yyyy'), 12, 771231041);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (58187295, 379, to_date('19-01-1996', 'dd-mm-yyyy'), 10, 127821918);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (415417607, 479, to_date('20-07-1985', 'dd-mm-yyyy'), 11, 850817402);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (946531589, 561, to_date('12-01-2002', 'dd-mm-yyyy'), 3, 789430976);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (215809211, 409, to_date('27-05-2007', 'dd-mm-yyyy'), 11, 447456951);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (299788707, 454, to_date('15-01-1989', 'dd-mm-yyyy'), 5, 617758551);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (699749179, 328, to_date('08-08-1982', 'dd-mm-yyyy'), 2, 668074819);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (643895054, 215, to_date('26-04-1999', 'dd-mm-yyyy'), 13, 779367460);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (485714755, 522, to_date('29-06-1995', 'dd-mm-yyyy'), 6, 32049351);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (242082772, 525, to_date('26-06-1990', 'dd-mm-yyyy'), 8, 602194268);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (619496339, 76, to_date('26-02-1980', 'dd-mm-yyyy'), 1, 457971338);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (783933452, 500, to_date('01-06-2016', 'dd-mm-yyyy'), 12, 890715596);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (955915916, 157, to_date('04-01-2015', 'dd-mm-yyyy'), 9, 251745122);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (618703571, 81, to_date('14-07-2008', 'dd-mm-yyyy'), 10, 518947468);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (253006007, 587, to_date('16-08-1976', 'dd-mm-yyyy'), 3, 635027893);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (807109039, 657, to_date('01-11-2018', 'dd-mm-yyyy'), 9, 699864151);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (340225539, 231, to_date('03-10-1981', 'dd-mm-yyyy'), 1, 582743934);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (412181730, 494, to_date('10-09-1991', 'dd-mm-yyyy'), 4, 845912900);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (734884137, 481, to_date('28-07-2017', 'dd-mm-yyyy'), 12, 609136779);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (868761412, 638, to_date('26-10-2007', 'dd-mm-yyyy'), 14, 855883192);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (471482899, 570, to_date('23-06-1979', 'dd-mm-yyyy'), 13, 73319693);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (629950329, 664, to_date('14-09-2014', 'dd-mm-yyyy'), 12, 557511653);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (762962339, 537, to_date('03-02-2011', 'dd-mm-yyyy'), 3, 895641532);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (861113594, 357, to_date('01-09-1998', 'dd-mm-yyyy'), 8, 613574055);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (232994015, 596, to_date('20-05-2016', 'dd-mm-yyyy'), 1, 699864151);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (843604069, 31, to_date('26-04-1998', 'dd-mm-yyyy'), 11, 691502586);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (999613983, 234, to_date('20-11-1971', 'dd-mm-yyyy'), 5, 313776915);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (153296371, 496, to_date('11-05-2003', 'dd-mm-yyyy'), 11, 825541986);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (852814667, 312, to_date('29-04-2012', 'dd-mm-yyyy'), 10, 410105143);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (44304219, 344, to_date('22-10-1989', 'dd-mm-yyyy'), 13, 147527730);
commit;
prompt 700 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (301650658, 353, to_date('25-06-2012', 'dd-mm-yyyy'), 8, 254183134);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (997645211, 560, to_date('09-11-1978', 'dd-mm-yyyy'), 5, 141133895);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (578076200, 585, to_date('13-11-2001', 'dd-mm-yyyy'), 10, 788436504);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (954302901, 591, to_date('12-01-2010', 'dd-mm-yyyy'), 13, 433914048);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (983801413, 595, to_date('12-12-2018', 'dd-mm-yyyy'), 8, 750280357);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (788085938, 567, to_date('12-03-1991', 'dd-mm-yyyy'), 5, 204637922);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (342872311, 478, to_date('05-07-2002', 'dd-mm-yyyy'), 8, 118426724);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (928379443, 649, to_date('02-06-1971', 'dd-mm-yyyy'), 1, 427970187);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (183530934, 175, to_date('10-01-2007', 'dd-mm-yyyy'), 14, 750280357);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (795871548, 312, to_date('12-02-1979', 'dd-mm-yyyy'), 10, 363052948);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (284862147, 52, to_date('29-11-2000', 'dd-mm-yyyy'), 7, 740363237);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (127479756, 697, to_date('12-02-2020', 'dd-mm-yyyy'), 5, 211689744);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (389943790, 486, to_date('14-07-2023', 'dd-mm-yyyy'), 6, 701956875);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (642152630, 145, to_date('28-11-1999', 'dd-mm-yyyy'), 1, 95131359);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (999906876, 469, to_date('06-10-1973', 'dd-mm-yyyy'), 5, 725503953);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (835539743, 392, to_date('02-04-2019', 'dd-mm-yyyy'), 10, 552251003);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (149003615, 671, to_date('22-06-2011', 'dd-mm-yyyy'), 11, 317878499);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (506377909, 350, to_date('11-09-1983', 'dd-mm-yyyy'), 6, 343490255);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (89442041, 357, to_date('02-09-1983', 'dd-mm-yyyy'), 6, 646974723);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (115111869, 623, to_date('28-12-1983', 'dd-mm-yyyy'), 14, 952079976);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (524736554, 219, to_date('08-03-2016', 'dd-mm-yyyy'), 4, 136612880);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (511459338, 616, to_date('29-04-2016', 'dd-mm-yyyy'), 2, 686698590);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (338273592, 206, to_date('24-03-2019', 'dd-mm-yyyy'), 11, 762522269);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (268044474, 280, to_date('19-11-1992', 'dd-mm-yyyy'), 14, 222801306);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (101425911, 490, to_date('06-07-2023', 'dd-mm-yyyy'), 9, 312448494);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (686816902, 544, to_date('25-08-1984', 'dd-mm-yyyy'), 11, 468288433);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (248308343, 127, to_date('28-02-1977', 'dd-mm-yyyy'), 7, 908126768);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (860914309, 293, to_date('02-09-1983', 'dd-mm-yyyy'), 10, 178666074);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (394033517, 28, to_date('30-09-1999', 'dd-mm-yyyy'), 5, 441773370);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (149003615, 213, to_date('08-10-2016', 'dd-mm-yyyy'), 5, 237165544);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (73257448, 281, to_date('05-03-1978', 'dd-mm-yyyy'), 6, 366210712);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (412181730, 52, to_date('22-06-2020', 'dd-mm-yyyy'), 7, 427970187);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (506377909, 416, to_date('29-11-2001', 'dd-mm-yyyy'), 2, 141133895);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (732050531, 19, to_date('05-08-1973', 'dd-mm-yyyy'), 5, 326283524);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (558407185, 158, to_date('20-11-2011', 'dd-mm-yyyy'), 11, 262380974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (132133520, 194, to_date('06-03-1983', 'dd-mm-yyyy'), 6, 802809781);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (999613983, 389, to_date('02-08-2020', 'dd-mm-yyyy'), 1, 770042193);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (275350122, 548, to_date('09-10-2001', 'dd-mm-yyyy'), 3, 339386425);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (747532290, 66, to_date('01-01-2010', 'dd-mm-yyyy'), 11, 787093235);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (933894141, 26, to_date('01-05-2008', 'dd-mm-yyyy'), 13, 896315385);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (246872062, 205, to_date('04-05-2001', 'dd-mm-yyyy'), 12, 635662386);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (798075804, 645, to_date('06-11-1991', 'dd-mm-yyyy'), 1, 646600561);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (780602171, 665, to_date('18-08-1975', 'dd-mm-yyyy'), 4, 152452318);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (583270097, 417, to_date('13-11-1999', 'dd-mm-yyyy'), 2, 471725480);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (302347542, 635, to_date('03-07-2009', 'dd-mm-yyyy'), 9, 844365450);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (758968293, 406, to_date('10-03-1979', 'dd-mm-yyyy'), 8, 758394292);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (355056278, 51, to_date('07-05-1975', 'dd-mm-yyyy'), 14, 771231041);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (28573790, 76, to_date('09-07-2006', 'dd-mm-yyyy'), 11, 716162130);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (198437423, 28, to_date('04-11-2021', 'dd-mm-yyyy'), 11, 376570056);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (489199526, 589, to_date('17-01-2019', 'dd-mm-yyyy'), 7, 546641058);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (232994015, 672, to_date('09-06-1979', 'dd-mm-yyyy'), 13, 995715649);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (86148440, 609, to_date('17-09-1976', 'dd-mm-yyyy'), 14, 573441687);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (312187989, 65, to_date('28-04-1997', 'dd-mm-yyyy'), 10, 573284331);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (15898046, 616, to_date('16-10-2005', 'dd-mm-yyyy'), 1, 967121346);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (342621082, 36, to_date('04-06-1989', 'dd-mm-yyyy'), 1, 451316705);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (610867905, 213, to_date('26-04-2000', 'dd-mm-yyyy'), 1, 883311691);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (420311890, 198, to_date('23-01-2013', 'dd-mm-yyyy'), 9, 825668146);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (626639881, 342, to_date('10-03-1975', 'dd-mm-yyyy'), 9, 546641058);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (780602171, 247, to_date('19-10-1970', 'dd-mm-yyyy'), 12, 117090238);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (679355403, 148, to_date('06-07-2015', 'dd-mm-yyyy'), 10, 36280567);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (985232422, 146, to_date('07-03-1990', 'dd-mm-yyyy'), 14, 360390841);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (643895054, 380, to_date('06-04-2012', 'dd-mm-yyyy'), 9, 153241174);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (251613319, 164, to_date('23-07-2002', 'dd-mm-yyyy'), 14, 284359297);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (706372965, 1, to_date('02-09-2007', 'dd-mm-yyyy'), 9, 187484274);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (369054694, 594, to_date('02-02-1978', 'dd-mm-yyyy'), 2, 707132487);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (807109039, 217, to_date('06-02-2001', 'dd-mm-yyyy'), 14, 254183134);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (467086955, 684, to_date('01-01-2024', 'dd-mm-yyyy'), 4, 995715649);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (610398259, 634, to_date('12-01-1981', 'dd-mm-yyyy'), 8, 913357506);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (791512667, 110, to_date('27-06-1999', 'dd-mm-yyyy'), 14, 433914048);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (774143138, 479, to_date('27-08-2016', 'dd-mm-yyyy'), 10, 221300694);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (104756631, 593, to_date('11-11-2002', 'dd-mm-yyyy'), 12, 770042193);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (776899533, 278, to_date('20-07-1987', 'dd-mm-yyyy'), 14, 12638587);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (431285163, 483, to_date('17-01-2012', 'dd-mm-yyyy'), 12, 569429189);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (488284443, 504, to_date('16-05-1972', 'dd-mm-yyyy'), 6, 427970187);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (323358973, 522, to_date('09-09-1987', 'dd-mm-yyyy'), 12, 247837735);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (7650638, 203, to_date('15-02-2016', 'dd-mm-yyyy'), 3, 602194268);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (338273592, 644, to_date('07-08-2006', 'dd-mm-yyyy'), 12, 819875448);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (756920398, 45, to_date('08-04-2011', 'dd-mm-yyyy'), 12, 795287992);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (676829750, 520, to_date('24-02-2016', 'dd-mm-yyyy'), 1, 262380974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (618703571, 204, to_date('05-04-1999', 'dd-mm-yyyy'), 1, 629672609);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (200571988, 127, to_date('27-04-2000', 'dd-mm-yyyy'), 8, 128545745);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (291484015, 109, to_date('09-09-2006', 'dd-mm-yyyy'), 8, 670671149);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (677446448, 15, to_date('02-08-1974', 'dd-mm-yyyy'), 14, 770042193);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (487691089, 653, to_date('17-09-1987', 'dd-mm-yyyy'), 2, 513852071);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (326121723, 274, to_date('26-02-1972', 'dd-mm-yyyy'), 14, 357844780);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (511329433, 202, to_date('19-12-2017', 'dd-mm-yyyy'), 12, 177256205);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (489747556, 42, to_date('04-01-2013', 'dd-mm-yyyy'), 12, 935194922);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (420661845, 125, to_date('10-09-2007', 'dd-mm-yyyy'), 13, 972191037);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (401079390, 693, to_date('12-07-2021', 'dd-mm-yyyy'), 13, 217203442);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (268044474, 647, to_date('20-08-1984', 'dd-mm-yyyy'), 13, 121662109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (349906655, 40, to_date('05-06-1988', 'dd-mm-yyyy'), 3, 32049351);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (960553982, 96, to_date('11-10-2008', 'dd-mm-yyyy'), 4, 509275607);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (877573026, 540, to_date('10-02-2000', 'dd-mm-yyyy'), 5, 296973061);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (833911512, 574, to_date('15-12-1981', 'dd-mm-yyyy'), 4, 216049651);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (342621082, 664, to_date('29-01-1998', 'dd-mm-yyyy'), 3, 992664950);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (720772631, 458, to_date('29-06-1994', 'dd-mm-yyyy'), 7, 268000963);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (236280802, 350, to_date('12-02-1970', 'dd-mm-yyyy'), 1, 422957628);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (803830284, 617, to_date('03-12-2008', 'dd-mm-yyyy'), 12, 387211420);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (682634917, 352, to_date('28-01-2008', 'dd-mm-yyyy'), 3, 12638587);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (466704239, 523, to_date('05-04-2001', 'dd-mm-yyyy'), 7, 162227499);
commit;
prompt 800 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (153296371, 371, to_date('16-06-1996', 'dd-mm-yyyy'), 14, 412258548);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (902105753, 565, to_date('18-12-1998', 'dd-mm-yyyy'), 10, 885641852);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (813985305, 250, to_date('25-06-2006', 'dd-mm-yyyy'), 13, 598780758);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (776899533, 87, to_date('10-03-1990', 'dd-mm-yyyy'), 3, 228547715);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (953454618, 561, to_date('12-09-1993', 'dd-mm-yyyy'), 10, 731142515);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (877077950, 637, to_date('19-01-1987', 'dd-mm-yyyy'), 4, 360390841);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (817185900, 682, to_date('22-10-1978', 'dd-mm-yyyy'), 11, 378488167);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (673677392, 190, to_date('19-11-2004', 'dd-mm-yyyy'), 2, 65925109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (646173286, 648, to_date('22-08-1977', 'dd-mm-yyyy'), 8, 244587046);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (773657751, 505, to_date('19-11-1995', 'dd-mm-yyyy'), 3, 894962236);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (514183516, 617, to_date('28-06-2007', 'dd-mm-yyyy'), 6, 292815566);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (864427260, 589, to_date('31-03-1972', 'dd-mm-yyyy'), 7, 440327900);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (950719512, 173, to_date('12-01-1985', 'dd-mm-yyyy'), 5, 419144040);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (701630400, 152, to_date('31-05-1987', 'dd-mm-yyyy'), 10, 816591045);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (286947858, 478, to_date('22-10-1985', 'dd-mm-yyyy'), 1, 779367460);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (336885222, 227, to_date('13-12-2021', 'dd-mm-yyyy'), 4, 978345655);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (202171384, 63, to_date('22-08-1983', 'dd-mm-yyyy'), 13, 62733937);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (132133520, 567, to_date('03-11-2019', 'dd-mm-yyyy'), 14, 86156727);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (92423616, 476, to_date('05-05-1990', 'dd-mm-yyyy'), 12, 795287992);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (634098291, 172, to_date('23-01-2014', 'dd-mm-yyyy'), 11, 329518955);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (12995079, 398, to_date('26-09-1998', 'dd-mm-yyyy'), 11, 266658796);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (473061533, 305, to_date('04-11-1993', 'dd-mm-yyyy'), 4, 787093235);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (274601364, 91, to_date('06-11-2004', 'dd-mm-yyyy'), 2, 283601196);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (872015678, 256, to_date('10-01-2003', 'dd-mm-yyyy'), 8, 216049651);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (613334540, 473, to_date('05-10-1980', 'dd-mm-yyyy'), 11, 751610687);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (578746202, 251, to_date('15-09-1980', 'dd-mm-yyyy'), 9, 648255483);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (884967228, 310, to_date('07-04-2012', 'dd-mm-yyyy'), 5, 523666684);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (595423656, 432, to_date('23-11-2024', 'dd-mm-yyyy'), 8, 825668146);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (373854719, 381, to_date('25-08-1997', 'dd-mm-yyyy'), 10, 66135977);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (513883630, 387, to_date('02-08-1993', 'dd-mm-yyyy'), 13, 718408998);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (496955924, 603, to_date('20-02-2000', 'dd-mm-yyyy'), 12, 744342438);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (479122828, 538, to_date('14-08-1973', 'dd-mm-yyyy'), 2, 509167884);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (360902723, 42, to_date('10-02-1974', 'dd-mm-yyyy'), 7, 770042193);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (98648883, 537, to_date('19-01-2002', 'dd-mm-yyyy'), 9, 795287992);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (950719512, 303, to_date('07-09-1988', 'dd-mm-yyyy'), 13, 636858414);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (685659158, 30, to_date('27-09-2015', 'dd-mm-yyyy'), 10, 25600113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (72817576, 177, to_date('24-11-1973', 'dd-mm-yyyy'), 11, 278839113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (420927989, 444, to_date('18-09-2013', 'dd-mm-yyyy'), 14, 675645102);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (580613229, 203, to_date('15-05-1984', 'dd-mm-yyyy'), 2, 596433578);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (313961966, 129, to_date('03-10-1971', 'dd-mm-yyyy'), 11, 445298667);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (824012038, 88, to_date('02-10-1999', 'dd-mm-yyyy'), 9, 324375529);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (721516923, 306, to_date('06-07-2005', 'dd-mm-yyyy'), 8, 621782285);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (679355403, 409, to_date('09-08-1995', 'dd-mm-yyyy'), 1, 684803812);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (580613229, 487, to_date('12-02-2011', 'dd-mm-yyyy'), 4, 949702702);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (253006007, 607, to_date('26-08-2004', 'dd-mm-yyyy'), 9, 509275607);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (263101536, 264, to_date('27-12-1995', 'dd-mm-yyyy'), 6, 363052948);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (467086955, 399, to_date('24-12-1985', 'dd-mm-yyyy'), 6, 896315385);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (396179343, 167, to_date('30-06-2016', 'dd-mm-yyyy'), 3, 201391316);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (296299402, 410, to_date('14-07-1996', 'dd-mm-yyyy'), 3, 118426724);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (781133015, 334, to_date('19-08-2013', 'dd-mm-yyyy'), 14, 501487636);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (892936953, 467, to_date('13-03-1984', 'dd-mm-yyyy'), 10, 731142515);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (791530797, 301, to_date('05-11-1991', 'dd-mm-yyyy'), 7, 88263254);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (254972152, 16, to_date('24-07-2022', 'dd-mm-yyyy'), 3, 262380974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (575479472, 322, to_date('20-02-2005', 'dd-mm-yyyy'), 2, 983757891);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (243673029, 380, to_date('17-07-1978', 'dd-mm-yyyy'), 11, 564180130);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (668890911, 364, to_date('31-05-1997', 'dd-mm-yyyy'), 10, 63614029);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (349906655, 619, to_date('27-08-1997', 'dd-mm-yyyy'), 3, 125538621);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (583270097, 149, to_date('11-02-2016', 'dd-mm-yyyy'), 11, 25600113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (327909575, 354, to_date('28-07-2007', 'dd-mm-yyyy'), 11, 255340449);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (591346237, 476, to_date('12-09-1978', 'dd-mm-yyyy'), 4, 716162130);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (517536968, 520, to_date('18-11-2015', 'dd-mm-yyyy'), 11, 568766870);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (677446448, 501, to_date('09-08-2000', 'dd-mm-yyyy'), 11, 944171827);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (155712522, 524, to_date('24-05-1992', 'dd-mm-yyyy'), 4, 801031572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (567662841, 626, to_date('28-12-1979', 'dd-mm-yyyy'), 6, 348201260);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (598290979, 459, to_date('09-11-1981', 'dd-mm-yyyy'), 12, 944840657);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (23399145, 359, to_date('05-07-2004', 'dd-mm-yyyy'), 10, 548404580);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (1396149, 191, to_date('18-09-2024', 'dd-mm-yyyy'), 9, 666953605);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (643164813, 476, to_date('14-01-1982', 'dd-mm-yyyy'), 8, 646600561);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (676188928, 655, to_date('17-04-1998', 'dd-mm-yyyy'), 1, 750280357);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (672884778, 82, to_date('08-09-1996', 'dd-mm-yyyy'), 11, 734196899);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (362794289, 341, to_date('12-06-2023', 'dd-mm-yyyy'), 9, 796939742);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (659594754, 90, to_date('13-12-1991', 'dd-mm-yyyy'), 5, 243172611);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (988180263, 521, to_date('08-05-1989', 'dd-mm-yyyy'), 5, 522740512);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (999906876, 651, to_date('15-05-2010', 'dd-mm-yyyy'), 10, 894962236);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (853702225, 584, to_date('28-08-1996', 'dd-mm-yyyy'), 6, 73319693);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (4192795, 696, to_date('12-05-1982', 'dd-mm-yyyy'), 10, 440327900);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (519412704, 304, to_date('27-05-2023', 'dd-mm-yyyy'), 1, 210171934);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (544790398, 396, to_date('03-03-2006', 'dd-mm-yyyy'), 11, 229615740);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (656933573, 664, to_date('20-02-2014', 'dd-mm-yyyy'), 9, 967121346);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (248951167, 578, to_date('13-07-2005', 'dd-mm-yyyy'), 4, 686698590);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (671215521, 554, to_date('26-05-2007', 'dd-mm-yyyy'), 6, 65925109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (682634917, 457, to_date('21-10-1981', 'dd-mm-yyyy'), 9, 895641532);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (625648663, 114, to_date('14-10-1999', 'dd-mm-yyyy'), 11, 163507585);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (634098291, 251, to_date('21-10-1996', 'dd-mm-yyyy'), 8, 968219989);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (194960528, 439, to_date('03-12-2023', 'dd-mm-yyyy'), 11, 427970187);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (473061533, 354, to_date('04-05-1987', 'dd-mm-yyyy'), 2, 795287992);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (500715580, 289, to_date('25-08-2016', 'dd-mm-yyyy'), 11, 517634650);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (441026372, 471, to_date('18-09-2005', 'dd-mm-yyyy'), 5, 366210712);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (11465811, 264, to_date('11-08-2010', 'dd-mm-yyyy'), 12, 684968117);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (153296371, 184, to_date('02-07-1993', 'dd-mm-yyyy'), 7, 845912900);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (325919091, 571, to_date('12-05-1971', 'dd-mm-yyyy'), 5, 211359005);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (642152630, 582, to_date('28-07-2011', 'dd-mm-yyyy'), 1, 896315385);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (320201126, 438, to_date('23-07-1970', 'dd-mm-yyyy'), 2, 13912645);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (138124043, 237, to_date('23-06-2014', 'dd-mm-yyyy'), 6, 758394292);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (381131314, 352, to_date('24-03-1988', 'dd-mm-yyyy'), 10, 187484274);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (775154294, 699, to_date('11-05-1979', 'dd-mm-yyyy'), 13, 883311691);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (259599234, 515, to_date('24-11-1990', 'dd-mm-yyyy'), 5, 896315385);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (828581013, 224, to_date('29-02-2020', 'dd-mm-yyyy'), 9, 674823260);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (766855103, 326, to_date('26-03-2022', 'dd-mm-yyyy'), 7, 177256205);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (655273545, 185, to_date('15-04-2000', 'dd-mm-yyyy'), 2, 296973061);
commit;
prompt 900 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (817185900, 3, to_date('31-07-2020', 'dd-mm-yyyy'), 5, 450037767);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (282186141, 459, to_date('12-10-2011', 'dd-mm-yyyy'), 13, 751610687);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (98290342, 349, to_date('04-10-1988', 'dd-mm-yyyy'), 4, 433914048);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (535855524, 458, to_date('17-04-1990', 'dd-mm-yyyy'), 5, 286496076);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (119931121, 12, to_date('26-02-1977', 'dd-mm-yyyy'), 6, 746027242);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (335912518, 522, to_date('25-05-1988', 'dd-mm-yyyy'), 12, 339386425);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (75542571, 353, to_date('23-09-1996', 'dd-mm-yyyy'), 1, 359618622);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (961163333, 56, to_date('04-05-1973', 'dd-mm-yyyy'), 1, 658564281);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (112727921, 78, to_date('19-01-1996', 'dd-mm-yyyy'), 6, 141133895);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (600298345, 203, to_date('11-09-1985', 'dd-mm-yyyy'), 2, 628408315);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (699749179, 508, to_date('02-07-2010', 'dd-mm-yyyy'), 1, 686698590);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (136720117, 132, to_date('06-05-2010', 'dd-mm-yyyy'), 12, 9385231);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (581395647, 94, to_date('01-08-1989', 'dd-mm-yyyy'), 13, 85272737);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (158644684, 17, to_date('17-01-1997', 'dd-mm-yyyy'), 13, 635662386);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (820779695, 493, to_date('22-09-1984', 'dd-mm-yyyy'), 2, 518947468);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (476023236, 254, to_date('31-01-2003', 'dd-mm-yyyy'), 13, 199137043);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (186616883, 646, to_date('14-10-2006', 'dd-mm-yyyy'), 11, 196295696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (289471751, 115, to_date('26-09-1985', 'dd-mm-yyyy'), 12, 177256205);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (836958309, 695, to_date('28-12-1989', 'dd-mm-yyyy'), 2, 787093235);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (496955924, 247, to_date('21-04-2001', 'dd-mm-yyyy'), 7, 236653050);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (541100519, 105, to_date('27-09-1983', 'dd-mm-yyyy'), 3, 294873316);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (900745867, 152, to_date('07-12-1990', 'dd-mm-yyyy'), 3, 92519490);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (682634917, 661, to_date('06-12-1970', 'dd-mm-yyyy'), 14, 227485160);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (50979660, 187, to_date('18-01-2005', 'dd-mm-yyyy'), 8, 864900732);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (930931397, 339, to_date('23-12-2017', 'dd-mm-yyyy'), 1, 363052948);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (781133015, 677, to_date('07-09-2013', 'dd-mm-yyyy'), 3, 179391023);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (588514962, 70, to_date('07-03-2002', 'dd-mm-yyyy'), 5, 329518955);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (798874886, 639, to_date('24-10-1972', 'dd-mm-yyyy'), 2, 983757891);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (961163333, 164, to_date('27-03-2004', 'dd-mm-yyyy'), 2, 285417351);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (986771557, 554, to_date('25-01-1988', 'dd-mm-yyyy'), 5, 445298667);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (59350221, 695, to_date('29-04-1996', 'dd-mm-yyyy'), 11, 731142515);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (637500348, 510, to_date('20-01-1990', 'dd-mm-yyyy'), 7, 243145366);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (384592074, 619, to_date('30-06-2012', 'dd-mm-yyyy'), 12, 935194922);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (646516784, 443, to_date('11-04-1991', 'dd-mm-yyyy'), 10, 136766109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (81875645, 282, to_date('20-09-1976', 'dd-mm-yyyy'), 11, 716858810);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (646173286, 537, to_date('21-03-2016', 'dd-mm-yyyy'), 11, 838491698);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (506377909, 138, to_date('06-03-1998', 'dd-mm-yyyy'), 12, 355249589);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (632101363, 179, to_date('10-04-1980', 'dd-mm-yyyy'), 3, 602194268);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (412041638, 253, to_date('27-10-2006', 'dd-mm-yyyy'), 13, 427970187);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (820158625, 348, to_date('05-04-2017', 'dd-mm-yyyy'), 11, 211689744);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (988781175, 575, to_date('30-11-1977', 'dd-mm-yyyy'), 8, 329518955);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (775949856, 446, to_date('18-04-2006', 'dd-mm-yyyy'), 5, 796939742);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (953845254, 317, to_date('12-06-1981', 'dd-mm-yyyy'), 2, 450037767);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (755360861, 267, to_date('03-05-1984', 'dd-mm-yyyy'), 14, 607574361);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (731429529, 392, to_date('29-03-2003', 'dd-mm-yyyy'), 2, 839864465);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (581395647, 427, to_date('12-04-2002', 'dd-mm-yyyy'), 14, 324375529);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (477646592, 151, to_date('25-01-1994', 'dd-mm-yyyy'), 10, 152452318);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (770943394, 334, to_date('28-02-2013', 'dd-mm-yyyy'), 4, 949702702);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (580223, 500, to_date('04-03-1993', 'dd-mm-yyyy'), 13, 855883192);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (706372965, 73, to_date('13-02-2012', 'dd-mm-yyyy'), 8, 752764983);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (744253356, 477, to_date('21-01-1973', 'dd-mm-yyyy'), 9, 980324985);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (749808930, 380, to_date('04-03-1972', 'dd-mm-yyyy'), 7, 144874633);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (175052450, 147, to_date('14-06-1995', 'dd-mm-yyyy'), 6, 762522269);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (666253530, 430, to_date('15-03-1984', 'dd-mm-yyyy'), 2, 689999565);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (273190792, 245, to_date('30-06-1988', 'dd-mm-yyyy'), 13, 405226871);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (325919091, 269, to_date('11-07-2006', 'dd-mm-yyyy'), 8, 602194268);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (487691089, 264, to_date('21-12-1974', 'dd-mm-yyyy'), 9, 25600113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (410948270, 510, to_date('10-09-1970', 'dd-mm-yyyy'), 1, 387211420);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (805148676, 111, to_date('23-12-2004', 'dd-mm-yyyy'), 5, 886558356);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (754431912, 293, to_date('25-07-2003', 'dd-mm-yyyy'), 5, 153241174);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (812588537, 424, to_date('31-08-2001', 'dd-mm-yyyy'), 3, 701956875);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (198753994, 602, to_date('06-07-1992', 'dd-mm-yyyy'), 11, 216049651);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (671215521, 156, to_date('04-07-2014', 'dd-mm-yyyy'), 6, 262380974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (646294342, 496, to_date('03-04-2009', 'dd-mm-yyyy'), 5, 343490255);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (326121723, 183, to_date('01-11-2018', 'dd-mm-yyyy'), 8, 569878396);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (687463072, 352, to_date('14-12-1998', 'dd-mm-yyyy'), 4, 750200121);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (350094576, 290, to_date('27-05-2012', 'dd-mm-yyyy'), 4, 552251003);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (866437249, 647, to_date('10-10-2023', 'dd-mm-yyyy'), 10, 716162130);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (741735622, 385, to_date('23-09-1981', 'dd-mm-yyyy'), 1, 923536778);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (624221074, 463, to_date('01-06-1979', 'dd-mm-yyyy'), 7, 832448839);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (484342221, 42, to_date('11-11-2007', 'dd-mm-yyyy'), 14, 673475478);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (843531052, 696, to_date('14-03-1983', 'dd-mm-yyyy'), 3, 178666074);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (901112139, 182, to_date('08-11-2014', 'dd-mm-yyyy'), 7, 607574361);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (702119967, 189, to_date('03-09-2023', 'dd-mm-yyyy'), 13, 8379588);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (685077320, 221, to_date('15-07-1999', 'dd-mm-yyyy'), 5, 805225066);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (791526255, 289, to_date('06-01-1978', 'dd-mm-yyyy'), 11, 36280567);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (788230207, 368, to_date('24-04-1975', 'dd-mm-yyyy'), 3, 718802548);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (732050531, 529, to_date('01-09-1975', 'dd-mm-yyyy'), 5, 424240758);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (747532290, 9, to_date('13-04-1970', 'dd-mm-yyyy'), 2, 313776915);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (436359729, 307, to_date('23-11-2002', 'dd-mm-yyyy'), 11, 151191594);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (895866713, 50, to_date('20-02-2023', 'dd-mm-yyyy'), 13, 25600113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (115305675, 49, to_date('01-10-1989', 'dd-mm-yyyy'), 11, 874315634);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (618703571, 9, to_date('04-01-2024', 'dd-mm-yyyy'), 6, 628408315);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (519412704, 474, to_date('02-12-1975', 'dd-mm-yyyy'), 11, 887282476);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (522329367, 409, to_date('16-06-2018', 'dd-mm-yyyy'), 12, 673475478);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (243673029, 572, to_date('05-11-2011', 'dd-mm-yyyy'), 2, 648255483);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (779897612, 269, to_date('11-03-1976', 'dd-mm-yyyy'), 10, 950506091);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (515635766, 548, to_date('02-04-2009', 'dd-mm-yyyy'), 10, 658535442);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (459235634, 91, to_date('05-12-1978', 'dd-mm-yyyy'), 3, 716858810);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (384592074, 227, to_date('14-12-2016', 'dd-mm-yyyy'), 4, 328950838);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (965378605, 658, to_date('05-07-1978', 'dd-mm-yyyy'), 1, 937893137);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (566335051, 175, to_date('02-12-1991', 'dd-mm-yyyy'), 9, 864900732);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (798075804, 571, to_date('13-10-1994', 'dd-mm-yyyy'), 8, 699496630);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (681380877, 548, to_date('13-01-1988', 'dd-mm-yyyy'), 3, 779367460);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (558729084, 643, to_date('11-09-1976', 'dd-mm-yyyy'), 5, 543257923);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (374359889, 379, to_date('03-03-1979', 'dd-mm-yyyy'), 13, 211359005);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (866437249, 62, to_date('04-06-1992', 'dd-mm-yyyy'), 14, 826859074);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (81955714, 562, to_date('26-01-2010', 'dd-mm-yyyy'), 11, 980324985);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (774143138, 624, to_date('21-07-1994', 'dd-mm-yyyy'), 5, 950506091);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (523005700, 26, to_date('10-08-1981', 'dd-mm-yyyy'), 10, 104098064);
commit;
prompt 1000 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (245092124, 254, to_date('30-05-1971', 'dd-mm-yyyy'), 14, 199137043);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (550597527, 694, to_date('20-12-1986', 'dd-mm-yyyy'), 2, 651546201);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (7650638, 103, to_date('12-09-2005', 'dd-mm-yyyy'), 12, 103902646);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (953250268, 368, to_date('01-02-2016', 'dd-mm-yyyy'), 1, 229615740);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (660239180, 617, to_date('13-04-1978', 'dd-mm-yyyy'), 8, 121662109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (492461632, 301, to_date('09-07-1987', 'dd-mm-yyyy'), 7, 278839113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (389943790, 102, to_date('30-06-1983', 'dd-mm-yyyy'), 3, 751610687);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (965378605, 173, to_date('31-12-1973', 'dd-mm-yyyy'), 14, 983757891);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (885097258, 5, to_date('18-07-1974', 'dd-mm-yyyy'), 6, 746027242);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (755928705, 94, to_date('08-08-1985', 'dd-mm-yyyy'), 7, 855522077);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (485981424, 561, to_date('04-04-2018', 'dd-mm-yyyy'), 11, 980324985);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (216747431, 480, to_date('28-06-1976', 'dd-mm-yyyy'), 2, 628408315);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (335015719, 232, to_date('17-10-1989', 'dd-mm-yyyy'), 12, 463175157);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (547025568, 621, to_date('20-05-1973', 'dd-mm-yyyy'), 12, 438430790);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (35248085, 465, to_date('07-09-2019', 'dd-mm-yyyy'), 2, 286496076);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (242082772, 449, to_date('01-10-1974', 'dd-mm-yyyy'), 7, 447456951);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (248243489, 220, to_date('05-10-1974', 'dd-mm-yyyy'), 3, 141420133);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (535649481, 14, to_date('14-02-2010', 'dd-mm-yyyy'), 11, 604314036);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (241247045, 203, to_date('30-01-2021', 'dd-mm-yyyy'), 2, 415804946);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (73257448, 187, to_date('06-05-2007', 'dd-mm-yyyy'), 12, 284359297);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (350068332, 233, to_date('13-10-1992', 'dd-mm-yyyy'), 5, 736118185);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (83725273, 24, to_date('26-11-2002', 'dd-mm-yyyy'), 9, 206288356);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (6928452, 239, to_date('03-11-1970', 'dd-mm-yyyy'), 9, 187734366);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (81016415, 67, to_date('22-04-2010', 'dd-mm-yyyy'), 2, 242497574);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (412041638, 243, to_date('25-12-1971', 'dd-mm-yyyy'), 13, 953949724);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (919760560, 105, to_date('21-05-2019', 'dd-mm-yyyy'), 14, 707132487);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (335912518, 162, to_date('02-04-2000', 'dd-mm-yyyy'), 13, 447456951);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (648701220, 190, to_date('08-06-2014', 'dd-mm-yyyy'), 14, 836670970);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (235322446, 411, to_date('26-02-2014', 'dd-mm-yyyy'), 7, 229526774);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (796034862, 100, to_date('17-05-2021', 'dd-mm-yyyy'), 3, 915165531);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (350094576, 230, to_date('05-08-1970', 'dd-mm-yyyy'), 5, 718798626);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (662662733, 329, to_date('26-12-1982', 'dd-mm-yyyy'), 9, 283601196);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (84937489, 652, to_date('18-02-2015', 'dd-mm-yyyy'), 11, 211359005);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (377718868, 73, to_date('25-10-2011', 'dd-mm-yyyy'), 5, 826859074);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (855092810, 41, to_date('07-02-1976', 'dd-mm-yyyy'), 1, 926670662);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (485714755, 172, to_date('18-09-1986', 'dd-mm-yyyy'), 12, 463175157);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (909379902, 637, to_date('24-02-2005', 'dd-mm-yyyy'), 13, 255340449);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (770943394, 656, to_date('08-07-2006', 'dd-mm-yyyy'), 6, 794922762);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (434645627, 288, to_date('23-03-1973', 'dd-mm-yyyy'), 3, 128545745);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (610398259, 557, to_date('05-01-1997', 'dd-mm-yyyy'), 2, 440327900);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (97993488, 346, to_date('23-06-1991', 'dd-mm-yyyy'), 9, 1543538);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (766945227, 524, to_date('18-09-1970', 'dd-mm-yyyy'), 3, 13912645);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (51031485, 475, to_date('22-04-2020', 'dd-mm-yyyy'), 12, 972191037);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (262822559, 256, to_date('10-07-2021', 'dd-mm-yyyy'), 10, 249310996);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (140291562, 67, to_date('18-04-2024', 'dd-mm-yyyy'), 7, 944171827);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (340225539, 319, to_date('04-04-1984', 'dd-mm-yyyy'), 14, 445269041);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (917034616, 318, to_date('01-08-1985', 'dd-mm-yyyy'), 13, 222801306);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (284508024, 545, to_date('26-06-2000', 'dd-mm-yyyy'), 10, 794115696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (64736067, 320, to_date('01-09-2010', 'dd-mm-yyyy'), 11, 794922762);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (108944425, 171, to_date('13-01-1978', 'dd-mm-yyyy'), 5, 658535442);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (751065784, 138, to_date('21-02-2015', 'dd-mm-yyyy'), 4, 718408998);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (476023236, 590, to_date('07-10-1995', 'dd-mm-yyyy'), 14, 582743934);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (98787120, 239, to_date('05-01-1970', 'dd-mm-yyyy'), 10, 885641852);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (936734596, 505, to_date('16-12-1992', 'dd-mm-yyyy'), 5, 228547715);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (721516923, 634, to_date('17-03-1986', 'dd-mm-yyyy'), 5, 589872419);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (98290342, 418, to_date('01-04-2008', 'dd-mm-yyyy'), 6, 440772461);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (780602171, 139, to_date('13-06-2008', 'dd-mm-yyyy'), 2, 228547715);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (219208207, 613, to_date('26-07-2001', 'dd-mm-yyyy'), 13, 915165531);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (202487054, 492, to_date('12-12-1979', 'dd-mm-yyyy'), 9, 5145747);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (198437423, 450, to_date('20-01-1983', 'dd-mm-yyyy'), 12, 750200121);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (488321919, 168, to_date('12-12-2017', 'dd-mm-yyyy'), 11, 252952088);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (25891153, 152, to_date('03-02-1996', 'dd-mm-yyyy'), 10, 675645102);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (625648663, 257, to_date('14-08-1971', 'dd-mm-yyyy'), 12, 144874633);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (96998887, 28, to_date('10-10-1970', 'dd-mm-yyyy'), 9, 12943391);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (610867905, 401, to_date('02-02-2000', 'dd-mm-yyyy'), 2, 658535442);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (396677554, 479, to_date('29-07-2015', 'dd-mm-yyyy'), 2, 151191594);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (158644684, 86, to_date('06-10-1974', 'dd-mm-yyyy'), 9, 668074819);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (568531463, 358, to_date('26-09-1986', 'dd-mm-yyyy'), 4, 348955707);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (892936953, 235, to_date('19-12-2002', 'dd-mm-yyyy'), 2, 530192612);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (208298661, 134, to_date('30-04-2018', 'dd-mm-yyyy'), 6, 78120681);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (7650638, 157, to_date('20-10-2019', 'dd-mm-yyyy'), 12, 718802548);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (359535395, 651, to_date('24-11-2003', 'dd-mm-yyyy'), 12, 589872419);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (731429529, 696, to_date('12-06-1993', 'dd-mm-yyyy'), 11, 152452318);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (894538054, 650, to_date('13-11-2014', 'dd-mm-yyyy'), 8, 886558356);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (249608827, 93, to_date('01-03-2021', 'dd-mm-yyyy'), 4, 227485160);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (99649496, 225, to_date('30-11-1978', 'dd-mm-yyyy'), 6, 617292974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (253006007, 162, to_date('04-11-2000', 'dd-mm-yyyy'), 4, 796939742);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (536509662, 531, to_date('02-02-2010', 'dd-mm-yyyy'), 8, 787093235);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (235322446, 239, to_date('21-11-1985', 'dd-mm-yyyy'), 8, 892386761);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (95439872, 616, to_date('18-07-1989', 'dd-mm-yyyy'), 3, 292815566);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (885530745, 60, to_date('08-10-2001', 'dd-mm-yyyy'), 1, 707132487);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (226059752, 238, to_date('27-04-1977', 'dd-mm-yyyy'), 13, 63614029);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (953845254, 90, to_date('10-04-1985', 'dd-mm-yyyy'), 6, 216049651);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (630633714, 504, to_date('10-05-1970', 'dd-mm-yyyy'), 1, 422957628);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (917034616, 194, to_date('24-08-2019', 'dd-mm-yyyy'), 1, 825896842);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (360625153, 573, to_date('12-07-1990', 'dd-mm-yyyy'), 2, 820249517);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (184677469, 568, to_date('08-01-1985', 'dd-mm-yyyy'), 7, 498155036);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (13167398, 244, to_date('26-05-1977', 'dd-mm-yyyy'), 4, 339386425);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (585526082, 619, to_date('05-03-1991', 'dd-mm-yyyy'), 10, 424240758);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (36090909, 143, to_date('22-10-1994', 'dd-mm-yyyy'), 11, 9385231);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (158644684, 186, to_date('22-12-1972', 'dd-mm-yyyy'), 6, 613574055);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (396938920, 72, to_date('20-05-2001', 'dd-mm-yyyy'), 8, 838491698);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (939126537, 559, to_date('13-10-2010', 'dd-mm-yyyy'), 7, 163507585);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (271235358, 556, to_date('07-12-1973', 'dd-mm-yyyy'), 3, 450037767);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (237881862, 549, to_date('21-05-2012', 'dd-mm-yyyy'), 1, 850817402);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (57057664, 12, to_date('17-06-2012', 'dd-mm-yyyy'), 4, 415804946);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (747597237, 431, to_date('13-10-1982', 'dd-mm-yyyy'), 14, 88263254);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (619987948, 172, to_date('05-08-2022', 'dd-mm-yyyy'), 13, 378488167);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (625648663, 391, to_date('17-04-1972', 'dd-mm-yyyy'), 10, 200515695);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (320993503, 620, to_date('29-08-1998', 'dd-mm-yyyy'), 3, 445269041);
commit;
prompt 1100 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (486704013, 637, to_date('11-10-1979', 'dd-mm-yyyy'), 10, 816591045);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (481750857, 118, to_date('05-08-2009', 'dd-mm-yyyy'), 8, 788436504);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (685659158, 236, to_date('18-06-2020', 'dd-mm-yyyy'), 10, 908126768);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (818711512, 328, to_date('04-08-1993', 'dd-mm-yyyy'), 3, 376570056);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (453361323, 20, to_date('02-08-1979', 'dd-mm-yyyy'), 11, 648829127);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (607609200, 232, to_date('26-02-2017', 'dd-mm-yyyy'), 10, 628408315);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (43674898, 30, to_date('27-12-2007', 'dd-mm-yyyy'), 11, 141420133);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (242082772, 73, to_date('14-12-1992', 'dd-mm-yyyy'), 11, 839864465);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (888759649, 611, to_date('08-09-1976', 'dd-mm-yyyy'), 5, 221300694);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (327909575, 597, to_date('31-01-2005', 'dd-mm-yyyy'), 10, 953949724);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (965781192, 297, to_date('13-06-2013', 'dd-mm-yyyy'), 4, 890290774);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (619664665, 136, to_date('21-12-2002', 'dd-mm-yyyy'), 10, 835190007);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (303579252, 201, to_date('20-12-1992', 'dd-mm-yyyy'), 14, 779367460);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (459094322, 689, to_date('10-06-2022', 'dd-mm-yyyy'), 1, 518947468);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (451972516, 700, to_date('22-04-1983', 'dd-mm-yyyy'), 3, 25600113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (765705985, 219, to_date('19-10-1982', 'dd-mm-yyyy'), 2, 648829127);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (374359889, 18, to_date('02-04-2021', 'dd-mm-yyyy'), 5, 972191037);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (969249981, 241, to_date('29-12-1992', 'dd-mm-yyyy'), 2, 548404580);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (613334540, 618, to_date('09-11-1993', 'dd-mm-yyyy'), 5, 427970187);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (837573080, 630, to_date('02-07-2006', 'dd-mm-yyyy'), 1, 185926813);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (89442041, 303, to_date('07-12-2003', 'dd-mm-yyyy'), 2, 675645102);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (737403223, 496, to_date('27-07-1984', 'dd-mm-yyyy'), 9, 243145366);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (325919091, 172, to_date('15-12-1978', 'dd-mm-yyyy'), 3, 312448494);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (734884137, 562, to_date('20-02-1994', 'dd-mm-yyyy'), 9, 795991899);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (928379443, 194, to_date('06-09-2017', 'dd-mm-yyyy'), 10, 382318427);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (980331408, 504, to_date('05-02-2016', 'dd-mm-yyyy'), 9, 333421520);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (635511137, 349, to_date('02-05-1981', 'dd-mm-yyyy'), 12, 547676914);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (605649551, 88, to_date('18-02-1970', 'dd-mm-yyyy'), 5, 86118963);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (198437423, 286, to_date('02-01-2024', 'dd-mm-yyyy'), 11, 883311691);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (356334592, 91, to_date('17-12-2009', 'dd-mm-yyyy'), 1, 378488167);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (285980664, 331, to_date('26-03-2019', 'dd-mm-yyyy'), 10, 857634572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (965984705, 92, to_date('09-11-2005', 'dd-mm-yyyy'), 7, 517634650);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (471482899, 108, to_date('07-03-1989', 'dd-mm-yyyy'), 8, 423866989);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (747532290, 296, to_date('13-12-2015', 'dd-mm-yyyy'), 8, 457971338);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (13638529, 97, to_date('19-08-1993', 'dd-mm-yyyy'), 5, 958142341);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (772470337, 131, to_date('27-02-2007', 'dd-mm-yyyy'), 7, 155285136);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (215809211, 445, to_date('29-10-1980', 'dd-mm-yyyy'), 2, 61071883);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (512475504, 661, to_date('29-11-2021', 'dd-mm-yyyy'), 1, 689999565);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (634098291, 474, to_date('09-05-2020', 'dd-mm-yyyy'), 12, 262380974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (169378918, 677, to_date('15-04-2016', 'dd-mm-yyyy'), 12, 908122514);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (381174773, 292, to_date('16-02-1972', 'dd-mm-yyyy'), 5, 213954003);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (515635766, 612, to_date('07-12-1999', 'dd-mm-yyyy'), 10, 648829127);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (51527747, 660, to_date('13-10-1989', 'dd-mm-yyyy'), 12, 604314036);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (301443611, 296, to_date('29-05-2006', 'dd-mm-yyyy'), 9, 333421520);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (68992888, 117, to_date('15-06-1978', 'dd-mm-yyyy'), 13, 886558356);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (958068049, 478, to_date('09-08-1970', 'dd-mm-yyyy'), 3, 136766109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (235322446, 430, to_date('25-12-1975', 'dd-mm-yyyy'), 6, 432069073);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (119931121, 165, to_date('25-08-1975', 'dd-mm-yyyy'), 5, 210171934);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (506377909, 170, to_date('15-12-2009', 'dd-mm-yyyy'), 8, 446907807);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (295421736, 625, to_date('26-09-1991', 'dd-mm-yyyy'), 12, 770253624);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (765705985, 406, to_date('22-06-1995', 'dd-mm-yyyy'), 4, 613574055);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (6928452, 524, to_date('01-06-2006', 'dd-mm-yyyy'), 14, 825541986);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (427427003, 274, to_date('23-04-1997', 'dd-mm-yyyy'), 11, 285417351);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (794711783, 203, to_date('22-07-1991', 'dd-mm-yyyy'), 10, 201391316);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (337147026, 248, to_date('04-12-1994', 'dd-mm-yyyy'), 7, 178666074);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (358850243, 418, to_date('25-05-2024', 'dd-mm-yyyy'), 1, 995715649);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (155712522, 672, to_date('18-09-1971', 'dd-mm-yyyy'), 4, 501487636);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (484342221, 646, to_date('07-04-1985', 'dd-mm-yyyy'), 13, 771231041);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (843531052, 400, to_date('29-07-1970', 'dd-mm-yyyy'), 5, 343490255);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (868984325, 379, to_date('28-06-1995', 'dd-mm-yyyy'), 1, 718802548);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (637500348, 218, to_date('05-11-2023', 'dd-mm-yyyy'), 4, 602194268);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (873680223, 355, to_date('30-06-2017', 'dd-mm-yyyy'), 8, 179391023);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (273836904, 607, to_date('12-01-1971', 'dd-mm-yyyy'), 8, 196295696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (421379614, 153, to_date('21-07-1992', 'dd-mm-yyyy'), 1, 701956875);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (108944425, 248, to_date('26-04-2020', 'dd-mm-yyyy'), 6, 329518955);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (720781363, 62, to_date('03-01-2012', 'dd-mm-yyyy'), 6, 163507585);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (237881862, 465, to_date('23-11-2023', 'dd-mm-yyyy'), 3, 84503456);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (282684362, 569, to_date('03-10-2017', 'dd-mm-yyyy'), 7, 410846459);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (139796076, 257, to_date('24-11-2004', 'dd-mm-yyyy'), 8, 211359005);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (561238982, 56, to_date('13-09-1998', 'dd-mm-yyyy'), 3, 670671149);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (158644684, 485, to_date('05-04-1985', 'dd-mm-yyyy'), 10, 691502586);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (416565574, 606, to_date('04-12-1974', 'dd-mm-yyyy'), 3, 995637522);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (625532164, 371, to_date('02-07-1970', 'dd-mm-yyyy'), 9, 857634572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (50979660, 28, to_date('21-10-1991', 'dd-mm-yyyy'), 7, 350437713);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (188658855, 193, to_date('01-02-1985', 'dd-mm-yyyy'), 6, 32049351);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (808540378, 501, to_date('09-02-1980', 'dd-mm-yyyy'), 8, 324375529);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (490962785, 590, to_date('20-09-2011', 'dd-mm-yyyy'), 9, 118426724);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (268278586, 539, to_date('29-09-2016', 'dd-mm-yyyy'), 7, 360390841);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (514183516, 466, to_date('20-12-2009', 'dd-mm-yyyy'), 3, 339386425);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (955915916, 217, to_date('23-04-2002', 'dd-mm-yyyy'), 14, 750280357);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (800412043, 242, to_date('03-06-2011', 'dd-mm-yyyy'), 14, 153670287);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (233509850, 443, to_date('07-02-1972', 'dd-mm-yyyy'), 7, 144874633);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (739948974, 5, to_date('15-10-1983', 'dd-mm-yyyy'), 7, 915165531);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (604314524, 246, to_date('09-02-1985', 'dd-mm-yyyy'), 5, 222801306);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (249608827, 574, to_date('04-09-2008', 'dd-mm-yyyy'), 14, 617758551);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (355056278, 122, to_date('10-09-2016', 'dd-mm-yyyy'), 6, 805225066);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (690114896, 488, to_date('08-05-2015', 'dd-mm-yyyy'), 11, 216049651);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (43674898, 32, to_date('07-08-2018', 'dd-mm-yyyy'), 10, 163507585);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (320201126, 275, to_date('29-12-1988', 'dd-mm-yyyy'), 8, 153670287);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (955915916, 284, to_date('07-08-1985', 'dd-mm-yyyy'), 12, 470607412);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (289471751, 142, to_date('17-11-2000', 'dd-mm-yyyy'), 5, 350437713);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (305388875, 626, to_date('04-11-1979', 'dd-mm-yyyy'), 13, 216049651);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (121347815, 491, to_date('10-09-1996', 'dd-mm-yyyy'), 9, 728666532);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (325668343, 262, to_date('02-10-1982', 'dd-mm-yyyy'), 1, 141420133);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (788230207, 441, to_date('27-01-1983', 'dd-mm-yyyy'), 1, 736009235);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (637500348, 221, to_date('03-11-1998', 'dd-mm-yyyy'), 12, 507410925);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (245092124, 392, to_date('19-11-1997', 'dd-mm-yyyy'), 6, 598780758);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (104756631, 611, to_date('13-05-2021', 'dd-mm-yyyy'), 9, 714603536);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (791512667, 410, to_date('02-01-1987', 'dd-mm-yyyy'), 14, 670671149);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (98290342, 18, to_date('30-08-1985', 'dd-mm-yyyy'), 1, 440772461);
commit;
prompt 1200 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (632101363, 205, to_date('29-04-1981', 'dd-mm-yyyy'), 7, 147527730);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (703485110, 268, to_date('30-04-2007', 'dd-mm-yyyy'), 14, 527339940);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (718313033, 101, to_date('19-02-1992', 'dd-mm-yyyy'), 5, 216049651);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (289833124, 321, to_date('25-03-1988', 'dd-mm-yyyy'), 3, 874315634);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (302715872, 99, to_date('14-03-1973', 'dd-mm-yyyy'), 5, 359618622);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (567662841, 448, to_date('12-05-1999', 'dd-mm-yyyy'), 4, 718740896);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (848465862, 663, to_date('25-03-1998', 'dd-mm-yyyy'), 11, 771231041);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (236280802, 477, to_date('07-12-1973', 'dd-mm-yyyy'), 4, 815386042);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (943456742, 316, to_date('17-07-1985', 'dd-mm-yyyy'), 4, 262380974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (770943394, 284, to_date('14-07-1978', 'dd-mm-yyyy'), 10, 992664950);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (988781175, 519, to_date('11-11-1991', 'dd-mm-yyyy'), 13, 816591045);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (595423656, 389, to_date('20-01-2007', 'dd-mm-yyyy'), 4, 613574055);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (554952007, 361, to_date('12-11-1986', 'dd-mm-yyyy'), 14, 552251003);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (770422429, 222, to_date('11-06-2023', 'dd-mm-yyyy'), 6, 855883192);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (696617440, 636, to_date('25-11-2018', 'dd-mm-yyyy'), 5, 890290774);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (12995079, 80, to_date('01-09-1992', 'dd-mm-yyyy'), 12, 141140098);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (780602171, 206, to_date('17-03-1997', 'dd-mm-yyyy'), 12, 820249517);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (464642111, 643, to_date('26-02-1986', 'dd-mm-yyyy'), 8, 285417351);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (737403223, 540, to_date('07-02-1977', 'dd-mm-yyyy'), 2, 607574361);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (2857898, 284, to_date('15-07-1986', 'dd-mm-yyyy'), 11, 139099038);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (284508024, 272, to_date('09-09-1983', 'dd-mm-yyyy'), 10, 864900732);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (563441466, 174, to_date('03-10-1977', 'dd-mm-yyyy'), 4, 196295696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (81875645, 514, to_date('15-09-2021', 'dd-mm-yyyy'), 2, 740363237);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (80233433, 188, to_date('08-02-1994', 'dd-mm-yyyy'), 9, 674823260);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (781547507, 680, to_date('27-03-2016', 'dd-mm-yyyy'), 7, 779367460);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (490312661, 391, to_date('08-01-2016', 'dd-mm-yyyy'), 1, 357844780);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (864427260, 379, to_date('29-08-2015', 'dd-mm-yyyy'), 8, 410846459);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (284508024, 559, to_date('31-08-2010', 'dd-mm-yyyy'), 1, 470607412);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (226059752, 413, to_date('11-02-2002', 'dd-mm-yyyy'), 9, 229526774);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (702119967, 48, to_date('11-08-2006', 'dd-mm-yyyy'), 4, 243172611);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (807109039, 152, to_date('26-11-1989', 'dd-mm-yyyy'), 4, 152452318);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (937194182, 322, to_date('06-04-2023', 'dd-mm-yyyy'), 11, 351101580);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (672029714, 697, to_date('05-06-1981', 'dd-mm-yyyy'), 4, 438430790);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (911176266, 576, to_date('27-10-1977', 'dd-mm-yyyy'), 7, 801031572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (624221074, 328, to_date('26-10-2017', 'dd-mm-yyyy'), 8, 463175157);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (798076468, 76, to_date('06-12-1983', 'dd-mm-yyyy'), 7, 205294997);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (18697101, 313, to_date('29-08-1999', 'dd-mm-yyyy'), 14, 992664950);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (268278586, 34, to_date('29-09-2007', 'dd-mm-yyyy'), 1, 673475478);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (722414092, 431, to_date('28-09-2011', 'dd-mm-yyyy'), 4, 485698844);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (474058394, 265, to_date('13-05-1997', 'dd-mm-yyyy'), 1, 402205007);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (673407336, 100, to_date('05-01-2017', 'dd-mm-yyyy'), 4, 199137043);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (703729263, 408, to_date('19-05-2011', 'dd-mm-yyyy'), 4, 71273362);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (561676102, 220, to_date('01-03-2018', 'dd-mm-yyyy'), 4, 670671149);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (178939047, 140, to_date('02-01-1990', 'dd-mm-yyyy'), 10, 844430650);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (342775988, 494, to_date('17-01-1998', 'dd-mm-yyyy'), 14, 36280567);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (655348727, 190, to_date('28-01-2009', 'dd-mm-yyyy'), 9, 249310996);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (894538054, 466, to_date('29-01-2007', 'dd-mm-yyyy'), 4, 92519490);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (432145983, 279, to_date('10-04-2011', 'dd-mm-yyyy'), 6, 770253624);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (896313876, 636, to_date('16-11-2008', 'dd-mm-yyyy'), 7, 103902646);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (202171384, 287, to_date('06-05-1971', 'dd-mm-yyyy'), 13, 393576903);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (73472715, 323, to_date('02-07-1979', 'dd-mm-yyyy'), 6, 247837735);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (789997163, 450, to_date('12-05-2021', 'dd-mm-yyyy'), 14, 952079976);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (873947658, 18, to_date('02-01-1998', 'dd-mm-yyyy'), 5, 890290774);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (259599234, 429, to_date('13-11-1998', 'dd-mm-yyyy'), 13, 788436504);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (44304219, 453, to_date('05-03-2021', 'dd-mm-yyyy'), 7, 121662109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (101879583, 139, to_date('24-10-2013', 'dd-mm-yyyy'), 6, 582743934);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (797142995, 372, to_date('14-06-1995', 'dd-mm-yyyy'), 12, 498155036);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (232743870, 500, to_date('28-04-2015', 'dd-mm-yyyy'), 9, 127821918);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (877539276, 192, to_date('04-01-1999', 'dd-mm-yyyy'), 9, 890290774);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (123518441, 169, to_date('01-11-2014', 'dd-mm-yyyy'), 12, 686698590);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (215809211, 18, to_date('16-10-1993', 'dd-mm-yyyy'), 6, 752764983);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (917240940, 378, to_date('23-04-1979', 'dd-mm-yyyy'), 10, 809127048);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (482005376, 359, to_date('08-09-1985', 'dd-mm-yyyy'), 9, 744342438);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (48751690, 491, to_date('16-01-2010', 'dd-mm-yyyy'), 1, 794922762);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (766855103, 404, to_date('28-04-1998', 'dd-mm-yyyy'), 2, 79984886);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (476723990, 489, to_date('15-06-1985', 'dd-mm-yyyy'), 11, 201391316);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (72817576, 350, to_date('30-07-1981', 'dd-mm-yyyy'), 12, 569429189);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (373854719, 616, to_date('08-02-1973', 'dd-mm-yyyy'), 9, 517634650);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (113066042, 636, to_date('13-05-1977', 'dd-mm-yyyy'), 12, 32049351);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (529196229, 498, to_date('31-07-2023', 'dd-mm-yyyy'), 11, 363052948);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (161599568, 59, to_date('01-11-1991', 'dd-mm-yyyy'), 11, 666953605);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (69104966, 224, to_date('23-06-2019', 'dd-mm-yyyy'), 8, 635662386);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (950569167, 58, to_date('06-07-2007', 'dd-mm-yyyy'), 9, 699864151);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (309820613, 83, to_date('03-06-2003', 'dd-mm-yyyy'), 8, 387211420);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (294955133, 527, to_date('26-04-1990', 'dd-mm-yyyy'), 2, 89100606);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (113668956, 469, to_date('25-02-2007', 'dd-mm-yyyy'), 10, 731142515);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (56911556, 441, to_date('09-04-1987', 'dd-mm-yyyy'), 9, 617758551);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (643164813, 282, to_date('27-04-2006', 'dd-mm-yyyy'), 7, 196295696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (468581292, 214, to_date('04-10-1975', 'dd-mm-yyyy'), 9, 254183134);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (271235358, 361, to_date('24-03-2010', 'dd-mm-yyyy'), 8, 887282476);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (972627089, 187, to_date('13-06-2011', 'dd-mm-yyyy'), 11, 416908680);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (740329511, 600, to_date('23-11-2023', 'dd-mm-yyyy'), 8, 770253624);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (523132035, 32, to_date('06-04-2009', 'dd-mm-yyyy'), 6, 329518955);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (838301238, 296, to_date('05-08-2024', 'dd-mm-yyyy'), 14, 582743934);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (938616996, 453, to_date('15-03-1982', 'dd-mm-yyyy'), 12, 714603536);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (666253530, 517, to_date('19-07-1997', 'dd-mm-yyyy'), 7, 73319693);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (783684296, 394, to_date('30-01-1971', 'dd-mm-yyyy'), 10, 857634572);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (182083568, 472, to_date('05-02-1974', 'dd-mm-yyyy'), 12, 944171827);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (908599989, 563, to_date('13-08-2016', 'dd-mm-yyyy'), 13, 773945524);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (420661845, 226, to_date('31-05-1996', 'dd-mm-yyyy'), 8, 177256205);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (535649481, 273, to_date('09-04-1998', 'dd-mm-yyyy'), 14, 333421520);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (896176278, 300, to_date('06-01-1999', 'dd-mm-yyyy'), 6, 276484140);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (567516147, 150, to_date('01-04-1979', 'dd-mm-yyyy'), 4, 376570056);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (342872311, 514, to_date('05-01-2000', 'dd-mm-yyyy'), 11, 518947468);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (233074711, 48, to_date('20-08-1993', 'dd-mm-yyyy'), 10, 839864465);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (872015678, 204, to_date('11-08-1977', 'dd-mm-yyyy'), 3, 12638587);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (366684880, 457, to_date('04-12-2001', 'dd-mm-yyyy'), 4, 819875448);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (36505847, 446, to_date('24-09-1975', 'dd-mm-yyyy'), 5, 143131406);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (861113594, 321, to_date('06-02-2020', 'dd-mm-yyyy'), 7, 324539265);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (242082772, 380, to_date('17-03-1995', 'dd-mm-yyyy'), 6, 819875448);
commit;
prompt 1300 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (381131314, 176, to_date('05-11-2016', 'dd-mm-yyyy'), 13, 84503456);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (382092349, 110, to_date('23-12-2019', 'dd-mm-yyyy'), 6, 935194922);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (986235526, 207, to_date('22-05-1998', 'dd-mm-yyyy'), 6, 923536778);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (59350221, 330, to_date('19-12-2023', 'dd-mm-yyyy'), 8, 440327900);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (420311890, 318, to_date('16-09-1972', 'dd-mm-yyyy'), 9, 958142341);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (83725273, 461, to_date('14-07-2015', 'dd-mm-yyyy'), 4, 103902646);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (212470513, 220, to_date('03-09-1999', 'dd-mm-yyyy'), 10, 188147669);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (702225081, 419, to_date('05-05-2005', 'dd-mm-yyyy'), 11, 820249517);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (53329006, 539, to_date('25-05-1997', 'dd-mm-yyyy'), 10, 835190007);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (763219347, 137, to_date('18-06-1976', 'dd-mm-yyyy'), 13, 995715649);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (957619306, 345, to_date('22-07-2018', 'dd-mm-yyyy'), 11, 440250930);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (188488796, 513, to_date('06-12-2000', 'dd-mm-yyyy'), 9, 333421520);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (44304219, 348, to_date('25-06-2004', 'dd-mm-yyyy'), 9, 410105143);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (155712522, 564, to_date('03-09-2010', 'dd-mm-yyyy'), 11, 507895090);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (28573790, 132, to_date('16-07-1995', 'dd-mm-yyyy'), 7, 569429189);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (790308092, 82, to_date('07-02-1981', 'dd-mm-yyyy'), 8, 378488167);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (707847577, 606, to_date('01-08-2014', 'dd-mm-yyyy'), 4, 519481550);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (610867905, 657, to_date('27-11-1998', 'dd-mm-yyyy'), 9, 692856389);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (697548235, 173, to_date('22-11-1991', 'dd-mm-yyyy'), 10, 689999565);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (427427003, 96, to_date('16-09-1989', 'dd-mm-yyyy'), 8, 162227499);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (36505847, 161, to_date('24-04-2001', 'dd-mm-yyyy'), 8, 302549197);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (706372965, 486, to_date('16-10-1982', 'dd-mm-yyyy'), 5, 457971338);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (5626957, 238, to_date('05-07-1993', 'dd-mm-yyyy'), 11, 701956875);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (129932475, 237, to_date('25-09-2006', 'dd-mm-yyyy'), 3, 935194922);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (302715872, 190, to_date('13-05-2010', 'dd-mm-yyyy'), 10, 895641532);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (931163682, 471, to_date('04-04-2013', 'dd-mm-yyyy'), 12, 351101580);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (675515920, 84, to_date('12-03-1989', 'dd-mm-yyyy'), 2, 809127048);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (254972152, 506, to_date('05-09-1999', 'dd-mm-yyyy'), 2, 470607412);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (625840894, 247, to_date('13-12-1993', 'dd-mm-yyyy'), 9, 517695961);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (720747593, 414, to_date('20-05-1984', 'dd-mm-yyyy'), 12, 216049651);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (82049226, 671, to_date('28-06-1992', 'dd-mm-yyyy'), 9, 968219989);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (73257448, 397, to_date('12-01-2008', 'dd-mm-yyyy'), 7, 710066917);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (487531615, 328, to_date('06-09-1971', 'dd-mm-yyyy'), 10, 284359297);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (473061533, 695, to_date('14-07-1991', 'dd-mm-yyyy'), 11, 629672609);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (775949856, 233, to_date('17-12-2019', 'dd-mm-yyyy'), 3, 433914048);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (558407185, 176, to_date('16-02-2009', 'dd-mm-yyyy'), 5, 324375529);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (777367994, 319, to_date('03-08-1987', 'dd-mm-yyyy'), 13, 366210712);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (62968273, 474, to_date('28-04-2006', 'dd-mm-yyyy'), 3, 8379588);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (607609200, 102, to_date('05-07-1997', 'dd-mm-yyyy'), 6, 890290774);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (1396149, 574, to_date('13-04-1987', 'dd-mm-yyyy'), 8, 788436504);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (837573080, 259, to_date('29-10-2006', 'dd-mm-yyyy'), 2, 204637922);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (540415135, 499, to_date('14-10-1984', 'dd-mm-yyyy'), 3, 788436504);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (232994015, 373, to_date('01-04-2020', 'dd-mm-yyyy'), 1, 65925109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (207609006, 189, to_date('27-11-1981', 'dd-mm-yyyy'), 14, 509519761);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (861992294, 165, to_date('05-05-2019', 'dd-mm-yyyy'), 10, 855522077);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (140402261, 84, to_date('16-10-1998', 'dd-mm-yyyy'), 1, 221300694);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (335015719, 666, to_date('25-11-1974', 'dd-mm-yyyy'), 12, 243145366);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (613226493, 558, to_date('16-02-2014', 'dd-mm-yyyy'), 6, 292815566);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (358850243, 388, to_date('30-06-1971', 'dd-mm-yyyy'), 2, 258901645);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (446287435, 427, to_date('11-07-1994', 'dd-mm-yyyy'), 14, 405226871);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (35248085, 421, to_date('30-09-2022', 'dd-mm-yyyy'), 10, 548404580);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (884278818, 339, to_date('31-12-2024', 'dd-mm-yyyy'), 12, 1543538);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (566335051, 186, to_date('29-05-1985', 'dd-mm-yyyy'), 13, 718408998);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (496955924, 678, to_date('04-09-2005', 'dd-mm-yyyy'), 3, 451316705);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (500715580, 328, to_date('17-09-1989', 'dd-mm-yyyy'), 4, 617292974);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (813986720, 113, to_date('17-05-1972', 'dd-mm-yyyy'), 7, 687449545);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (941464739, 52, to_date('24-07-2019', 'dd-mm-yyyy'), 8, 128545745);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (43025662, 672, to_date('26-07-2012', 'dd-mm-yyyy'), 11, 674823260);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (470994691, 380, to_date('25-12-2013', 'dd-mm-yyyy'), 8, 967121346);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (619664665, 309, to_date('23-01-1972', 'dd-mm-yyyy'), 13, 236653050);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (123691481, 227, to_date('27-11-2007', 'dd-mm-yyyy'), 3, 388996575);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (496955924, 593, to_date('23-05-1972', 'dd-mm-yyyy'), 1, 326283524);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (149003615, 1, to_date('16-04-1975', 'dd-mm-yyyy'), 1, 825668146);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (490312661, 90, to_date('28-09-1997', 'dd-mm-yyyy'), 14, 527339940);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (94566420, 574, to_date('29-06-1988', 'dd-mm-yyyy'), 7, 509519761);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (838524358, 629, to_date('30-04-2009', 'dd-mm-yyyy'), 11, 750450292);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (188488796, 295, to_date('07-10-1973', 'dd-mm-yyyy'), 5, 835190007);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (245092124, 373, to_date('18-11-1987', 'dd-mm-yyyy'), 7, 136766109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (775720063, 209, to_date('30-05-2021', 'dd-mm-yyyy'), 8, 675645102);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (558407185, 335, to_date('19-02-1997', 'dd-mm-yyyy'), 8, 276484140);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (356943905, 201, to_date('10-01-2015', 'dd-mm-yyyy'), 14, 615068764);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (613919979, 261, to_date('14-07-2011', 'dd-mm-yyyy'), 11, 296973061);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (410948270, 310, to_date('03-07-1984', 'dd-mm-yyyy'), 13, 196295696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (533109136, 416, to_date('21-07-1980', 'dd-mm-yyyy'), 1, 247837735);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (261420471, 261, to_date('18-10-1986', 'dd-mm-yyyy'), 14, 196295696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (729376590, 210, to_date('11-10-1993', 'dd-mm-yyyy'), 9, 324375529);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (885530745, 446, to_date('09-03-2009', 'dd-mm-yyyy'), 9, 236653050);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (381131314, 1, to_date('01-08-1980', 'dd-mm-yyyy'), 14, 339386425);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (70435672, 546, to_date('03-05-1981', 'dd-mm-yyyy'), 6, 579001671);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (672029714, 169, to_date('02-04-2000', 'dd-mm-yyyy'), 10, 121662109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (33478448, 598, to_date('05-05-2022', 'dd-mm-yyyy'), 12, 393576903);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (15959727, 157, to_date('25-06-1997', 'dd-mm-yyyy'), 2, 595446095);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (677650301, 469, to_date('15-06-1986', 'dd-mm-yyyy'), 10, 684968117);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (44465715, 43, to_date('09-12-2003', 'dd-mm-yyyy'), 1, 333421520);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (986235526, 266, to_date('26-01-2009', 'dd-mm-yyyy'), 6, 648829127);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (680043570, 78, to_date('12-01-1994', 'dd-mm-yyyy'), 1, 286496076);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (359535395, 7, to_date('16-10-2016', 'dd-mm-yyyy'), 1, 185926813);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (293806919, 200, to_date('09-03-1996', 'dd-mm-yyyy'), 12, 838491698);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (728982438, 189, to_date('23-10-1984', 'dd-mm-yyyy'), 8, 718802548);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (732050531, 540, to_date('12-06-1985', 'dd-mm-yyyy'), 10, 692812350);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (791866296, 598, to_date('17-10-2010', 'dd-mm-yyyy'), 11, 65925109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (820158625, 592, to_date('11-09-1997', 'dd-mm-yyyy'), 3, 302549197);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (978411914, 511, to_date('04-02-1999', 'dd-mm-yyyy'), 11, 622592331);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (892936953, 11, to_date('17-12-1990', 'dd-mm-yyyy'), 1, 62733937);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (338273592, 688, to_date('11-06-1987', 'dd-mm-yyyy'), 6, 62733937);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (846935422, 74, to_date('12-11-1978', 'dd-mm-yyyy'), 7, 32049351);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (900870464, 579, to_date('15-12-2011', 'dd-mm-yyyy'), 14, 8379588);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (946531589, 447, to_date('04-12-2000', 'dd-mm-yyyy'), 3, 187734366);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (488284443, 647, to_date('17-09-1980', 'dd-mm-yyyy'), 11, 710066917);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (561238982, 447, to_date('29-09-1987', 'dd-mm-yyyy'), 11, 794115696);
commit;
prompt 1400 records committed...
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (588794379, 148, to_date('01-10-1992', 'dd-mm-yyyy'), 1, 103902646);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (558407185, 135, to_date('18-01-2017', 'dd-mm-yyyy'), 5, 465891024);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (158644684, 466, to_date('06-05-1998', 'dd-mm-yyyy'), 6, 139099038);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (416565574, 348, to_date('08-07-1972', 'dd-mm-yyyy'), 2, 992664950);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (396677554, 538, to_date('05-12-1999', 'dd-mm-yyyy'), 4, 501487636);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (291484015, 41, to_date('05-01-2017', 'dd-mm-yyyy'), 11, 475443309);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (223432686, 421, to_date('30-04-1990', 'dd-mm-yyyy'), 14, 12638587);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (299788707, 664, to_date('12-04-2009', 'dd-mm-yyyy'), 7, 557511653);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (554726220, 261, to_date('19-12-2013', 'dd-mm-yyyy'), 14, 552251003);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (972627089, 680, to_date('18-08-1983', 'dd-mm-yyyy'), 9, 103914968);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (607609200, 361, to_date('08-04-1991', 'dd-mm-yyyy'), 14, 518947468);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (983801413, 649, to_date('08-06-2009', 'dd-mm-yyyy'), 1, 636108167);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (873680223, 121, to_date('25-07-2024', 'dd-mm-yyyy'), 4, 470607412);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (12227669, 232, to_date('30-04-1987', 'dd-mm-yyyy'), 7, 885765470);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (243673029, 448, to_date('01-07-2009', 'dd-mm-yyyy'), 13, 393576903);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (247593794, 471, to_date('05-02-1975', 'dd-mm-yyyy'), 14, 179391023);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (412181730, 42, to_date('08-10-2006', 'dd-mm-yyyy'), 2, 177256205);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (231689950, 642, to_date('20-07-1994', 'dd-mm-yyyy'), 8, 61071883);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (843531052, 61, to_date('31-07-2019', 'dd-mm-yyyy'), 1, 196295696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (289833124, 213, to_date('08-04-2014', 'dd-mm-yyyy'), 11, 470607412);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (988001390, 186, to_date('20-08-1984', 'dd-mm-yyyy'), 11, 569878396);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (541100519, 608, to_date('22-05-2023', 'dd-mm-yyyy'), 6, 855522077);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (775154294, 148, to_date('02-08-1988', 'dd-mm-yyyy'), 4, 463175157);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (415417607, 202, to_date('14-08-2001', 'dd-mm-yyyy'), 8, 12638587);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (419694395, 174, to_date('16-08-2009', 'dd-mm-yyyy'), 1, 783717113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (556202300, 24, to_date('11-07-2016', 'dd-mm-yyyy'), 1, 589872419);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (925999241, 480, to_date('29-04-1990', 'dd-mm-yyyy'), 14, 725503953);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (598290979, 54, to_date('12-04-1994', 'dd-mm-yyyy'), 5, 855522077);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (487531615, 197, to_date('12-10-2004', 'dd-mm-yyyy'), 11, 908122514);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (899893645, 37, to_date('17-05-1970', 'dd-mm-yyyy'), 10, 794922762);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (484342221, 243, to_date('13-05-1980', 'dd-mm-yyyy'), 13, 177256205);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (515635766, 245, to_date('04-11-1995', 'dd-mm-yyyy'), 7, 338347764);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (567741968, 309, to_date('20-06-1989', 'dd-mm-yyyy'), 5, 707132487);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (648463833, 545, to_date('16-11-1992', 'dd-mm-yyyy'), 6, 523666684);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (832059648, 71, to_date('04-07-1973', 'dd-mm-yyyy'), 12, 446907807);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (487691089, 447, to_date('12-07-1985', 'dd-mm-yyyy'), 9, 629672609);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (938616996, 621, to_date('20-02-2003', 'dd-mm-yyyy'), 9, 795991899);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (434645627, 632, to_date('23-05-1976', 'dd-mm-yyyy'), 14, 465891024);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (327909575, 311, to_date('20-02-2004', 'dd-mm-yyyy'), 6, 424240758);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (619664665, 206, to_date('02-04-1988', 'dd-mm-yyyy'), 4, 518947468);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (883328981, 440, to_date('09-06-1995', 'dd-mm-yyyy'), 1, 338347764);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (934996519, 620, to_date('25-09-2015', 'dd-mm-yyyy'), 13, 589872419);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (246872062, 271, to_date('11-07-1978', 'dd-mm-yyyy'), 14, 629672609);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (255866874, 26, to_date('26-12-1974', 'dd-mm-yyyy'), 13, 143131406);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (467086955, 128, to_date('27-08-2018', 'dd-mm-yyyy'), 13, 795991899);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (582544040, 392, to_date('09-02-2020', 'dd-mm-yyyy'), 9, 548404580);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (960513263, 584, to_date('13-01-1982', 'dd-mm-yyyy'), 5, 736009235);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (675515920, 401, to_date('30-08-2001', 'dd-mm-yyyy'), 12, 440327900);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (994500502, 567, to_date('07-04-1972', 'dd-mm-yyyy'), 3, 243172611);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (305388875, 7, to_date('31-08-2006', 'dd-mm-yyyy'), 14, 278839113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (599065821, 501, to_date('30-10-2022', 'dd-mm-yyyy'), 4, 278839113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (464642111, 8, to_date('02-08-2018', 'dd-mm-yyyy'), 14, 65925109);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (660239180, 169, to_date('05-02-1978', 'dd-mm-yyyy'), 6, 350437713);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (44304219, 409, to_date('10-11-1991', 'dd-mm-yyyy'), 13, 783717113);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (993320000, 290, to_date('02-07-2022', 'dd-mm-yyyy'), 13, 686698590);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (219208207, 54, to_date('23-12-2005', 'dd-mm-yyyy'), 6, 158304491);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (390943627, 51, to_date('23-05-2003', 'dd-mm-yyyy'), 10, 687449545);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (732771935, 120, to_date('08-10-2005', 'dd-mm-yyyy'), 7, 88263254);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (873680223, 201, to_date('27-09-1997', 'dd-mm-yyyy'), 14, 179391023);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (97993488, 230, to_date('23-03-2005', 'dd-mm-yyyy'), 6, 415804946);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (316034762, 165, to_date('27-09-2002', 'dd-mm-yyyy'), 14, 646600561);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (377433931, 40, to_date('18-03-1998', 'dd-mm-yyyy'), 2, 79984886);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (580613229, 236, to_date('17-12-2005', 'dd-mm-yyyy'), 9, 519481550);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (775154294, 627, to_date('01-12-2013', 'dd-mm-yyyy'), 2, 622592331);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (783933452, 172, to_date('22-09-1993', 'dd-mm-yyyy'), 8, 270924940);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (434645627, 16, to_date('29-02-2024', 'dd-mm-yyyy'), 1, 629672609);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (994936749, 214, to_date('25-06-1991', 'dd-mm-yyyy'), 13, 885765470);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (2857898, 310, to_date('14-09-2001', 'dd-mm-yyyy'), 1, 162227499);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (441026372, 77, to_date('21-09-1989', 'dd-mm-yyyy'), 5, 417081781);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (783684296, 351, to_date('30-11-2009', 'dd-mm-yyyy'), 11, 463175157);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (112064902, 540, to_date('12-09-2012', 'dd-mm-yyyy'), 12, 523666684);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (265119280, 259, to_date('28-08-1987', 'dd-mm-yyyy'), 7, 883311691);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (561676102, 74, to_date('21-02-2002', 'dd-mm-yyyy'), 3, 814503339);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (721516923, 648, to_date('07-12-2009', 'dd-mm-yyyy'), 2, 162227499);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (484342221, 11, to_date('15-05-2024', 'dd-mm-yyyy'), 11, 360390841);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (755928705, 321, to_date('29-07-2023', 'dd-mm-yyyy'), 2, 147527730);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (741735622, 574, to_date('25-02-2008', 'dd-mm-yyyy'), 14, 874315634);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (326121723, 434, to_date('05-05-2008', 'dd-mm-yyyy'), 14, 826859074);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (945571450, 505, to_date('20-11-1997', 'dd-mm-yyyy'), 5, 366210712);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (712378971, 327, to_date('05-06-1996', 'dd-mm-yyyy'), 14, 196295696);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (953845254, 102, to_date('14-08-2013', 'dd-mm-yyyy'), 6, 746027242);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (412264478, 588, to_date('15-07-1982', 'dd-mm-yyyy'), 6, 251745122);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (687463072, 561, to_date('20-03-2021', 'dd-mm-yyyy'), 4, 775851939);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (300127467, 285, to_date('16-12-2001', 'dd-mm-yyyy'), 3, 13912645);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (755928705, 96, to_date('23-10-2024', 'dd-mm-yyyy'), 11, 237165544);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (916043739, 584, to_date('28-04-1970', 'dd-mm-yyyy'), 13, 890715596);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (200571988, 630, to_date('02-11-1978', 'dd-mm-yyyy'), 5, 699496630);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (550597527, 327, to_date('13-01-2020', 'dd-mm-yyyy'), 14, 254183134);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (46687190, 638, to_date('03-02-1976', 'dd-mm-yyyy'), 1, 405226871);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (556202300, 15, to_date('06-08-2005', 'dd-mm-yyyy'), 14, 393576903);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (175052450, 246, to_date('25-11-2020', 'dd-mm-yyyy'), 3, 666953605);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (600298345, 593, to_date('21-04-2001', 'dd-mm-yyyy'), 2, 86118963);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (922601322, 9, to_date('21-08-2004', 'dd-mm-yyyy'), 6, 716162130);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (994500502, 453, to_date('11-06-2021', 'dd-mm-yyyy'), 14, 718408998);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (765696286, 475, to_date('01-06-2019', 'dd-mm-yyyy'), 5, 915165531);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (677227199, 673, to_date('26-04-2003', 'dd-mm-yyyy'), 8, 312448494);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (43674898, 632, to_date('25-12-1991', 'dd-mm-yyyy'), 6, 976997166);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (983801413, 378, to_date('10-03-1998', 'dd-mm-yyyy'), 6, 629672609);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (336885222, 615, to_date('24-02-2018', 'dd-mm-yyyy'), 5, 602194268);
insert into BOOKING (guest_id, room_number, entry_date, days, em_id)
values (381174773, 534, to_date('16-01-1973', 'dd-mm-yyyy'), 7, 326283524);
commit;
prompt 1500 records loaded
prompt Loading EMPLOYEE2...
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (995715649, 'Daffi', 'Douglass', 14706);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (3510623, 'Nicolas', 'Scarlin', 14140);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (867142561, 'Lilian', 'Beardsdale', 13070);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (297182278, 'Gregory', 'Hanley', 14580);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (880350184, 'Yehudit', 'Bernaldo', 17948);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (750280357, 'Elsa', 'Bewshea', 16230);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (118539023, 'Ferdinanda', 'Hathaway', 10955);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (431399007, 'Flory', 'Klugel', 18532);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (957232802, 'Emilee', 'Tolliday', 6235);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (161778091, 'Darcy', 'Cherrison', 14281);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (333421520, 'Moises', 'Roistone', 6970);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (285417351, 'Mina', 'Glenny', 9395);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (985038742, 'Alyssa', 'McCuish', 7502);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (153850202, 'Saundra', 'Gunson', 10160);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (795991899, 'Ernaline', 'Sawney', 7121);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (601965364, 'Stephen', 'Volkes', 10610);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (736502383, 'Donella', 'Stygall', 18195);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (889749658, 'Gleda', 'Banisch', 13372);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (612956128, 'Olly', 'Erni', 19318);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (236653050, 'Millisent', 'Hearons', 11925);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (935283934, 'Ronna', 'Gostall', 13132);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (504063163, 'Barnabe', 'Wilmore', 11827);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (840099986, 'Cayla', 'Giles', 12568);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (750114742, 'Toddy', 'Pinner', 8486);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (664253685, 'Nickolaus', 'Loffill', 8548);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (252952088, 'Aland', 'Goodliffe', 14532);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (195231112, 'Salaidh', 'Blackford', 11998);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (150279391, 'Trumann', 'Kelk', 8706);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (690299548, 'Veronike', 'Swan', 14371);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (45087593, 'Chloris', 'Sutherns', 11549);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (790743170, 'Keven', 'Dormand', 18602);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (65830166, 'Sibby', 'Kondratenko', 18605);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (815386042, 'Estelle', 'Hise', 11373);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (875446711, 'Isa', 'Marston', 7378);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (355822871, 'Myrta', 'Yeowell', 11746);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (247837735, 'Vilhelmina', 'MacKim', 9640);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (50555545, 'Mercedes', 'Aish', 15796);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (617758551, 'Reena', 'Connett', 8160);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (141867166, 'Peder', 'Gaze', 9937);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (505571921, 'Dosi', 'Matheson', 11707);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (736009235, 'Estrellita', 'Grichukhanov', 18770);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (436595841, 'Massimo', 'Lowne', 9841);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (409562234, 'Kurtis', 'Mangin', 18756);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (204637922, 'Erik', 'Ianelli', 11847);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (512940122, 'Stewart', 'Dimont', 16111);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (619048401, 'Gretel', 'Nolton', 6846);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (470607412, 'Rik', 'Coldham', 6688);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (461423109, 'Bellanca', 'Beilby', 18379);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (841097188, 'Ema', 'Saket', 10982);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (541171572, 'Odilia', 'Woolston', 18417);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (570740003, 'Dore', 'De Malchar', 11502);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (982455496, 'Wilma', 'McKinnell', 19420);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (762974855, 'Andre', 'Wozencraft', 18715);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (620659824, 'Janene', 'Camillo', 9808);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (405226871, 'Tadeo', 'Hayward', 16562);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (5145747, 'Letty', 'Huggons', 11343);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (633205472, 'Hugo', 'Skipton', 8460);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (92754515, 'Lyndel', 'Stollsteiner', 17217);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (164065604, 'Kylen', 'Warbey', 18994);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (967121346, 'Shanan', 'McGarvie', 15270);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (573284331, 'Abbie', 'Colman', 18281);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (885557193, 'Renelle', 'Itschakov', 14410);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (613574055, 'Currey', 'Simonelli', 17582);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (124559975, 'Kayley', 'Hopkynson', 13917);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (424240758, 'Gaspar', 'Devas', 6296);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (908122514, 'Celisse', 'Simnett', 6289);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (460536381, 'Aurlie', 'Sweynson', 17361);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (260360458, 'Jasmine', 'Keysel', 18624);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (86118963, 'Benedikt', 'Petrelli', 12627);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (636662463, 'Pattie', 'Hannis', 11788);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (616424937, 'Wini', 'Gorgen', 7490);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (758394292, 'Reider', 'Byrde', 12185);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (721248833, 'Ninette', 'Warman', 10901);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (36021497, 'Aaren', 'Tideswell', 18300);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (92519490, 'Olga', 'Rosebotham', 11449);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (419322496, 'Farra', 'Aberdalgy', 16393);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (831547449, 'Chlo', 'Croll', 15088);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (750200121, 'Lonnie', 'Tumioto', 10319);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (417081781, 'Ilsa', 'Nowill', 8064);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (668074819, 'Ivar', 'Mesias', 11246);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (980398109, 'Laina', 'Agius', 18847);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (607574361, 'Harmonia', 'Bice', 15069);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (724193455, 'Clemente', 'Wards', 19500);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (1543538, 'Velma', 'Studart', 15771);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (475443309, 'Brose', 'Driffe', 19741);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (543257923, 'Northrop', 'Volk', 13257);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (740363237, 'Hansiain', 'Bowshire', 7201);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (139017870, 'Godfrey', 'Pietrzak', 17840);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (736893815, 'Fitzgerald', 'Yearne', 11150);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (324375529, 'Derek', 'Pechan', 12775);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (509167884, 'Shaw', 'Blanchette', 11113);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (371676118, 'Mercy', 'Dillingstone', 11257);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (351101580, 'Vanna', 'Bruster', 16832);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (415954754, 'Gabrielle', 'Devonport', 9422);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (832448839, 'Giorgi', 'Jaime', 11404);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (73319693, 'Roth', 'Cowden', 10170);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (210274598, 'Jesse', 'Jenne', 16546);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (485898893, 'Boonie', 'Dulanty', 6348);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (766741215, 'Tobye', 'Jedraszczyk', 14317);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (103902646, 'Shawnee', 'McGoon', 10688);
commit;
prompt 100 records committed...
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (12943391, 'Jaimie', 'Allaway', 11135);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (836670970, 'Goddart', 'Basnall', 6766);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (392352078, 'Tiler', 'Ferbrache', 19058);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (136612880, 'Ernie', 'Flann', 10534);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (494704057, 'Sallee', 'Yukhnev', 13799);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (366558736, 'Barnie', 'Cricket', 8647);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (329518955, 'Gerrie', 'Harly', 10901);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (84503456, 'Josefina', 'Beckinsale', 16364);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (755558606, 'Jermayne', 'Lewsley', 14766);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (521522820, 'Becki', 'Gozzard', 9759);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (750494347, 'Anatol', 'Caudray', 7079);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (330219031, 'Jamaal', 'Matzaitis', 15771);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (422957628, 'Donovan', 'Griffith', 14137);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (635027893, 'Essie', 'Boden', 17328);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (794153511, 'Kinna', 'Comelini', 11946);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (57851358, 'Umberto', 'Moreton', 7498);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (935194922, 'Field', 'Raiston', 8002);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (350437713, 'Yvette', 'Leadbeatter', 7554);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (192823688, 'Hamlen', 'Ubsdale', 18729);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (348955707, 'Cliff', 'Hassur', 18392);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (820249517, 'Doug', 'Yesichev', 16962);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (524893329, 'Garland', 'Tregoning', 11844);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (462911907, 'Lacy', 'Joseph', 9011);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (595446095, 'Ernesto', 'Kenworthey', 8655);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (314134781, 'Damara', 'La Padula', 12426);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (141133895, 'Terra', 'Baldam', 13124);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (292870589, 'Ingaborg', 'Geratt', 18517);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (577630915, 'Kelsi', 'Surmeyer', 14136);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (725503953, 'Corliss', 'Widdop', 7579);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (744342438, 'Georgie', 'Mcwhinnie', 6736);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (320380411, 'Carlin', 'Farr', 7682);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (367187937, 'Kaleena', 'Rowet', 18264);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (715374790, 'Georgette', 'Cashen', 12069);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (879156975, 'Renaud', 'Chomiszewski', 19858);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (707132487, 'Annabal', 'Pigeon', 6582);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (440327900, 'Gard', 'Fritschmann', 16614);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (795287992, 'Cori', 'Ruston', 19828);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (890003369, 'Catlaina', 'Wrightam', 15801);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (888330861, 'Wolf', 'Mac Giolla Pheadair', 12551);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (992703090, 'Evonne', 'Powdrell', 6802);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (574141906, 'Carena', 'Stonhouse', 14877);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (766892662, 'Bud', 'Frankowski', 12072);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (274878278, 'Alicea', 'Reeme', 17620);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (611127729, 'Aguie', 'Minkin', 6787);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (598780758, 'Mervin', 'Yerbury', 13131);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (557186261, 'Alyosha', 'Gennrich', 15256);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (464875955, 'Ayn', 'Cawthry', 7315);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (391771971, 'Lorette', 'Spelling', 10748);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (992664950, 'Boycey', 'Crady', 7970);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (250697339, 'Kandy', 'Swarbrigg', 16189);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (770042193, 'Pearce', 'Ianinotti', 9654);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (915165531, 'Roberta', 'Troppmann', 13100);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (746027242, 'Wenona', 'Denholm', 16715);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (463175157, 'Deeann', 'Antrum', 7839);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (382970872, 'Rhoda', 'Cozens', 6171);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (92900047, 'Andreas', 'McKie', 18131);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (447456951, 'Kate', 'MacPaik', 18917);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (229526774, 'Isador', 'Elles', 11195);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (533940142, 'Cecilla', 'Jamary', 9657);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (401267747, 'Ber', 'Olsen', 16097);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (768175040, 'Shandy', 'Canada', 11837);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (895738147, 'Marty', 'Brodnecke', 16027);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (742289611, 'Gwenette', 'Stanfield', 12145);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (546621186, 'Ola', 'Cartmer', 14613);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (896897649, 'Barny', 'Ferrieri', 18647);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (635662386, 'Alaine', 'Cullerne', 8453);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (71961495, 'Mada', 'Avramov', 8181);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (179538595, 'Arielle', 'Southard', 16585);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (8379588, 'Buffy', 'Thewles', 11432);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (772304623, 'Hephzibah', 'Glasby', 15737);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (688661837, 'Judah', 'Roberson', 10735);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (978345655, 'Brigit', 'Kneath', 6109);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (74274374, 'Ulrica', 'Maylam', 13015);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (58797922, 'Marianna', 'Davids', 6431);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (452937229, 'Sumner', 'Coldwell', 13681);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (931832403, 'Delphine', 'Philp', 16926);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (602194268, 'Norri', 'Cockings', 18662);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (276484140, 'Krystle', 'Rootham', 19244);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (784902638, 'Marjory', 'Sinderland', 8082);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (529037563, 'Abdul', 'Horsburgh', 15045);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (97453943, 'Elspeth', 'Lacknor', 6164);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (378213984, 'Moise', 'Mochan', 10764);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (364271201, 'Viola', 'Sharvell', 13280);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (230746090, 'Isa', 'Burnsall', 13768);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (661319090, 'Constancia', 'Norvill', 12890);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (615068764, 'Sara', 'Mushrow', 8597);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (196295696, 'Cathrin', 'Turgoose', 9609);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (885641852, 'Rhett', 'Wareing', 18119);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (908223328, 'Lorri', 'McElvine', 15249);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (689946485, 'Albrecht', 'Keets', 10919);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (363143266, 'Susanne', 'Beamiss', 7012);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (92741060, 'Lauritz', 'Crispin', 17160);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (713018891, 'Mariam', 'Kalisz', 9882);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (833682521, 'Roxanne', 'Rieflin', 11732);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (243500803, 'Nancy', 'Arnould', 8909);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (95131359, 'Fernandina', 'Hurich', 8353);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (317878499, 'Vlad', 'Schistl', 11932);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (219505215, 'Lisette', 'Davidove', 14510);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (531484576, 'Bathsheba', 'Mulder', 16351);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (32049351, 'Hilde', 'Djekic', 19246);
commit;
prompt 200 records committed...
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (629672609, 'Mischa', 'Sibyllina', 10898);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (477692548, 'Gerrard', 'Feldberg', 8843);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (191662114, 'Ronnie', 'Le Sieur', 16932);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (596433578, 'Martin', 'Stanners', 15261);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (371369583, 'Evania', 'Streeting', 19484);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (984350743, 'Algernon', 'Janek', 18725);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (983321113, 'Marley', 'Hully', 16282);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (636858414, 'Alverta', 'Atyeo', 12712);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (734530174, 'Padget', 'Adamovitz', 7540);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (781838526, 'Ottilie', 'Surgison', 15038);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (617456121, 'Jeremiah', 'Tricker', 15768);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (904779406, 'Willyt', 'Axon', 11148);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (151191594, 'Raine', 'Exer', 14746);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (705906811, 'Nina', 'Eversfield', 14013);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (85187792, 'Elicia', 'MacChaell', 11446);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (335051579, 'Cammie', 'Marshallsay', 17467);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (347740027, 'Wesley', 'Siggee', 15653);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (911015410, 'Emiline', 'Lamzed', 14171);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (923536778, 'Ilyssa', 'Thunderman', 6342);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (937049426, 'Dara', 'Wilber', 7493);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (845919716, 'Foster', 'Brannon', 12820);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (525503259, 'Arabele', 'Weald', 8240);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (270924940, 'Elizabeth', 'Markovich', 11942);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (939662761, 'Janette', 'Caudell', 10331);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (382318427, 'Quentin', 'Linger', 7790);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (360390841, 'Dionis', 'Wallen', 10021);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (113955405, 'Florie', 'Bendik', 7475);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (348201260, 'Bearnard', 'Goscomb', 13812);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (128545745, 'Cassius', 'Woodman', 17688);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (925638640, 'Wendell', 'Yanuk', 7941);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (683844420, 'Howard', 'Pinson', 17201);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (770159297, 'Shelton', 'Holson', 19745);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (991004888, 'Hasty', 'Ayling', 18896);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (718740896, 'Tabbitha', 'Jewise', 6234);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (216049651, 'Lorin', 'Jindracek', 18205);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (873475462, 'Dierdre', 'Montilla', 7892);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (468288433, 'Gabrielle', 'Stainson', 11727);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (729794325, 'Roscoe', 'Simnett', 7058);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (305123941, 'Guillermo', 'McKerlie', 11651);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (210826506, 'Trumaine', 'Whitchurch', 17015);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (324539265, 'Gardner', 'Barlie', 9778);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (476246719, 'Darin', 'Negro', 14161);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (339386425, 'Alvera', 'Oxtarby', 10829);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (339934389, 'Sonni', 'Duprey', 16387);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (28981650, 'Timotheus', 'Nendick', 6635);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (527701313, 'Jaquenetta', 'Valens-Smith', 11925);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (671529549, 'Allayne', 'Brockest', 19853);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (224754446, 'Chrissie', 'Didball', 19285);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (942345154, 'Josepha', 'Lunt', 10529);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (759636101, 'Rayna', 'Ferber', 14518);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (279832793, 'Ellyn', 'Prodrick', 16838);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (820327381, 'Martie', 'Edridge', 7883);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (533590441, 'Dalston', 'Georgeou', 18826);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (237165544, 'Gwendolin', 'Tuxwell', 13449);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (350875712, 'Ruperta', 'Balm', 16867);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (865681239, 'Gwenore', 'Goodlake', 11062);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (98818483, 'Dalli', 'Kevis', 12323);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (326967736, 'Hunfredo', 'Giannazzi', 19700);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (913443185, 'Jillana', 'O''Hare', 16372);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (546579858, 'Garrik', 'Hutton', 12454);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (753895319, 'Elwin', 'Iliffe', 17634);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (393576903, 'Dorotea', 'Gallagher', 12342);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (702051510, 'Wash', 'Oxbe', 19396);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (308817183, 'Margette', 'Outhwaite', 18067);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (871657475, 'Zollie', 'Goodfield', 14659);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (763217823, 'Clementine', 'Cowie', 15184);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (916469846, 'Brunhilda', 'Aggiss', 19965);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (619863148, 'Noella', 'Blodgett', 12756);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (10805580, 'Alon', 'Markl', 18732);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (467517160, 'Sheba', 'Horbart', 15571);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (29765275, 'Lowe', 'Stilgo', 11502);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (970278070, 'Charin', 'Brayfield', 9944);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (816591045, 'Jerrilyn', 'Adams', 14606);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (518947468, 'Fawn', 'Clampe', 8601);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (117090238, 'Eugene', 'Baldacchino', 13108);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (980324985, 'Koo', 'Mc Mechan', 11548);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (81443054, 'Krispin', 'Gratland', 18877);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (629603811, 'Jaclyn', 'Kyngdon', 17015);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (839864465, 'Viola', 'Plott', 17557);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (185079831, 'Glenden', 'Ramirez', 17171);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (513852071, 'Illa', 'Pinkard', 10904);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (187734366, 'Pietrek', 'Douse', 8903);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (509275607, 'Garnette', 'McPheat', 14050);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (282271805, 'Ferd', 'Whitsun', 8020);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (284359297, 'Cal', 'Ringsell', 19675);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (861303903, 'Seth', 'Fagence', 16806);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (908126768, 'Gerry', 'Sackes', 18149);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (356111290, 'Derwin', 'Apfler', 11630);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (765478343, 'Lance', 'Pyne', 15141);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (48647594, 'Darn', 'Smallwood', 12562);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (230815566, 'Jenica', 'Handrok', 6448);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (699496630, 'April', 'Pilipets', 11153);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (751037691, 'Dian', 'Kneesha', 15623);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (699864151, 'Andree', 'Skayman', 14840);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (402048512, 'Antony', 'Johnys', 17776);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (878433748, 'Cora', 'Badsey', 17989);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (165238878, 'Jase', 'Zanassi', 19415);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (451316705, 'Feodor', 'Bowdery', 19777);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (352822839, 'Olly', 'Walklot', 13438);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (106525119, 'Leicester', 'Garken', 9258);
commit;
prompt 300 records committed...
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (178666074, 'Emmy', 'Gregorace', 16430);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (229615740, 'Koressa', 'Baskeyfield', 12958);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (198814553, 'Ferrell', 'Prall', 8242);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (162648142, 'Jeramey', 'Hammon', 18527);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (929548648, 'Haywood', 'Kinghorn', 11215);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (802934189, 'Norrie', 'Vassie', 16471);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (393450212, 'Elvina', 'Brogi', 9346);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (688925634, 'Bondie', 'Slimm', 6521);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (132010490, 'Jeremias', 'Sparrow', 8533);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (958142341, 'Colette', 'Heynen', 18050);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (127821918, 'Gerrie', 'Orbon', 14714);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (480127813, 'Fifine', 'Whotton', 13438);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (457971338, 'Tanhya', 'Olyff', 19707);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (970571233, 'Freddi', 'Beggi', 10998);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (658564281, 'Richart', 'MacPeice', 15982);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (655259001, 'Roana', 'Cumberlidge', 8654);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (360848854, 'Ximenez', 'Ricardot', 15898);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (913357506, 'Deva', 'Echallier', 13457);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (836579011, 'Tracy', 'Jennick', 19635);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (343490255, 'Peder', 'Kunrad', 7749);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (693610267, 'Ahmed', 'Bemlott', 7261);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (537175211, 'Floris', 'Dobrowolny', 11506);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (412258548, 'Francisco', 'Shovelin', 11941);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (12638587, 'Alicea', 'Horsewood', 12449);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (101953084, 'Leonhard', 'Hughlock', 18974);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (667931334, 'Kalle', 'Ison', 19320);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (560651761, 'Alidia', 'Semens', 19134);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (765357442, 'Oralee', 'Sabine', 8157);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (198266859, 'Jo', 'Batstone', 19527);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (498155036, 'Sofia', 'Probert', 15841);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (177256205, 'Myriam', 'McDaid', 14282);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (617292974, 'Analiese', 'Gonnard', 7744);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (774653648, 'Elana', 'Bultitude', 8616);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (127809455, 'Read', 'Wyvill', 12439);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (734196899, 'Matilda', 'Murty', 13014);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (522990860, 'Darby', 'Stetson', 10376);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (133348279, 'Erek', 'Terram', 11057);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (484704810, 'Roby', 'Abbatt', 15243);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (714011377, 'Sallie', 'Corkel', 6648);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (507973169, 'Constantia', 'Hedin', 19145);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (461714094, 'Tillie', 'Feldbaum', 13255);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (213954003, 'Rodge', 'Du Fray', 6510);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (780390378, 'Joli', 'Breckwell', 7243);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (210171934, 'Silvana', 'Varfalameev', 18865);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (736118185, 'Reese', 'Silvester', 15395);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (883311691, 'Mathew', 'Hulbert', 6367);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (618919088, 'Marlena', 'Traher', 15193);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (890715596, 'Toni', 'Ivanov', 12346);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (855522077, 'Gerard', 'Isted', 10863);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (887282476, 'Hart', 'Burress', 12417);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (752540023, 'Thibaud', 'Byas', 15602);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (533827406, 'Caitrin', 'Hacking', 8127);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (320141774, 'Phaedra', 'Telford', 13280);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (873911959, 'Buckie', 'Pitson', 8542);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (9385231, 'Nahum', 'Leavesley', 13440);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (141140098, 'Kale', 'Khomin', 19145);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (312578819, 'Marjorie', 'Santen', 7886);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (620579446, 'Reinaldos', 'Whettleton', 9174);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (841448621, 'Cris', 'Tieraney', 17860);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (635610945, 'Claiborne', 'Chewter', 15509);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (404040024, 'Neely', 'Adamiak', 18577);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (899339270, 'Carr', 'Markel', 18196);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (775851939, 'Dorian', 'Lineen', 7259);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (646600561, 'Dick', 'McIlhagga', 20761);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (251745122, 'Cirillo', 'Lampke', 11536);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (243172611, 'Athena', 'Klassmann', 14589);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (194691141, 'Jacquetta', 'Buzzing', 8400);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (794922762, 'Timofei', 'Pillinger', 6166);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (222801306, 'Garvin', 'Fattorini', 11380);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (458899046, 'Othella', 'MacCostigan', 14981);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (728666532, 'Raymund', 'Athowe', 19515);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (337896519, 'Clareta', 'Belderson', 14680);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (729586407, 'Cazzie', 'Cluley', 10327);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (89841640, 'Graehme', 'Henbury', 12963);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (750450292, 'Gabriellia', 'Hulles', 18791);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (983207552, 'Dulciana', 'Craiker', 11390);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (522740512, 'Reba', 'Broske', 16814);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (968219989, 'Miranda', 'Dwelley', 8510);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (984856473, 'Roby', 'Murkitt', 16369);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (475529168, 'Langston', 'Ecclestone', 7156);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (731142515, 'Imelda', 'Willgoose', 15829);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (568766870, 'Marco', 'Stevens', 10258);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (604301629, 'Everard', 'Edginton', 7565);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (764749496, 'Marje', 'Upshall', 12676);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (436518157, 'Dacia', 'Braemer', 14506);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (844430650, 'Katrina', 'Maxweell', 13288);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (278839113, 'Aundrea', 'Semrad', 10072);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (605049938, 'Catherine', 'Jenteau', 18947);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (484060511, 'See', 'Birrell', 8230);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (155803404, 'Brodie', 'Blundon', 14300);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (45438526, 'Bartholomeo', 'Johnes', 7795);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (104359686, 'Victor', 'Coggings', 15588);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (215458112, 'Anna', 'Leeuwerink', 6309);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (648829127, 'Grove', 'Drever', 8628);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (140279756, 'Rosemaria', 'Brockelsby', 8363);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (604314036, 'Byron', 'Cana', 8056);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (679191015, 'Anette', 'Borkin', 11035);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (606504218, 'Jacquette', 'Crafts', 17790);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (928762542, 'Tally', 'Stoves', 14479);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (579127292, 'Evelin', 'Brobyn', 17897);
commit;
prompt 400 records committed...
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (771231041, 'Bentlee', 'Bener', 15677);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (143131406, 'Darin', 'Wogdon', 10130);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (853727944, 'Zea', 'Miettinen', 19161);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (547926306, 'Lissy', 'Woodburn', 9145);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (589127937, 'Chane', 'Shannon', 19186);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (55152143, 'Demetria', 'Seldon', 15592);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (440250930, 'Mendel', 'Zuker', 6544);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (692361509, 'Papageno', 'Biggen', 15322);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (894962236, 'Vinni', 'Drew', 10637);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (638974516, 'Linoel', 'Doni', 7630);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (718798626, 'Ollie', 'Gentry', 12465);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (255340449, 'Yuma', 'Piesing', 10499);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (219601927, 'Chelsy', 'Daal', 9510);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (738849202, 'Hana', 'Snoddon', 12384);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (71273362, 'Sapphire', 'Cosens', 16334);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (845912900, 'Devin', 'Quarterman', 8920);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (705708588, 'Garrot', 'McBratney', 16052);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (272936841, 'Isak', 'Iwanowski', 13188);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (450177304, 'Melodee', 'McCarrison', 8724);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (536496809, 'June', 'McCaughey', 7995);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (686894254, 'Libbie', 'Ellinor', 8020);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (962949638, 'Lindsay', 'Balm', 15565);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (602578073, 'Elsinore', 'April', 19525);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (806062472, 'Rosalynd', 'Beckson', 12273);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (573212448, 'Misti', 'Dureden', 11311);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (211689744, 'Maible', 'Gladman', 8963);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (630014693, 'Cordelie', 'Juckes', 6451);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (158135826, 'Anabel', 'Guillerman', 15690);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (770253624, 'Norina', 'Craister', 16666);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (714536128, 'Joete', 'Willox', 14938);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (179391023, 'Malinda', 'Meecher', 18442);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (714603536, 'Normand', 'Zimmer', 11422);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (445298667, 'Connor', 'Sidney', 14311);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (768176070, 'Elissa', 'Pavy', 15854);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (757430241, 'Dynah', 'Skyrm', 9035);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (589872419, 'Shalne', 'Westcott', 16966);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (236775278, 'Malachi', 'Semerad', 7186);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (269806568, 'Shep', 'Furmage', 19117);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (501579980, 'Etta', 'Sarfati', 7556);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (97277835, 'Harper', 'Mace', 11734);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (791106708, 'Ahmed', 'Mordy', 19070);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (718802548, 'Brigitta', 'Simmonds', 16892);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (589301821, 'Ransom', 'Sindall', 19810);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (346535024, 'Barr', 'Oxtaby', 14919);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (905587707, 'Riannon', 'Hrycek', 14360);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (221300694, 'Rhianna', 'Veart', 13040);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (749304369, 'Lesly', 'Piens', 8125);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (592893787, 'Calli', 'Bickerdicke', 16968);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (174629155, 'Eleni', 'Palumbo', 12397);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (153241174, 'Theresita', 'Noah', 18076);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (953949724, 'Elton', 'Hesse', 10082);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (514193423, 'Dannie', 'Shinfield', 7898);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (552251003, 'Thorndike', 'Robart', 11153);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (852821102, 'Katie', 'Padula', 15655);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (884355434, 'Corinna', 'Giacoppoli', 19886);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (668406052, 'Michelina', 'Cusack', 17163);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (194563366, 'Verene', 'Jandak', 9324);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (843873632, 'Job', 'Smaleman', 6009);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (777823453, 'Madlen', 'Stuckford', 13948);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (201391316, 'Adrianna', 'Byram', 19312);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (769239384, 'Greg', 'Oak', 7463);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (884107374, 'Gaven', 'Dethloff', 9975);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (260701316, 'Gayler', 'Ostler', 17211);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (809127048, 'Ellen', 'Menendez', 6289);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (19960727, 'Griffy', 'Firmager', 17198);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (271582089, 'Priscella', 'McGuirk', 13488);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (651546201, 'Isabeau', 'Callinan', 9218);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (410105143, 'Kendal', 'Wain', 11566);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (911796368, 'Standford', 'M''Chirrie', 14260);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (284848175, 'Walton', 'Sworne', 16773);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (283601196, 'Tiebold', 'Nutkins', 9196);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (322731831, 'Grete', 'Crane', 11013);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (899011903, 'Cortie', 'Lukehurst', 19131);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (548404580, 'Georgette', 'Szach', 17240);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (252310393, 'Giffy', 'Schoffel', 18783);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (844365450, 'Vassili', 'Plimmer', 10410);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (431922813, 'Marlow', 'Housego', 6197);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (229116605, 'Ced', 'Beade', 8512);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (478795170, 'Taddeo', 'Roby', 6554);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (609576579, 'Alaric', 'Bjorkan', 12537);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (695389090, 'Upton', 'Farloe', 8658);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (246175620, 'Mile', 'Stourton', 17785);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (535400981, 'Bern', 'Clare', 18967);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (318498340, 'Murdoch', 'Dumbare', 6391);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (864900732, 'Raffaello', 'Jedras', 18050);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (387211420, 'Silvana', 'Jaycocks', 8767);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (224263754, 'Ree', 'Titterton', 19425);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (160327719, 'Miran', 'Staniford', 11593);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (649274470, 'Meir', 'Scandwright', 12436);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (53828981, 'Carly', 'Archbould', 17050);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (705406733, 'Remington', 'Bentzen', 12089);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (477036241, 'Jamaal', 'Lintall', 14006);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (873994241, 'Morty', 'Rozec', 9487);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (450037767, 'Cara', 'Callaway', 19052);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (211359005, 'Elden', 'McIlvenny', 15712);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (686698590, 'Aurelie', 'Rablan', 15021);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (978013441, 'Myles', 'Eliassen', 18653);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (717106749, 'Cassondra', 'Orleton', 18233);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (624290612, 'Pegeen', 'Ecob', 6410);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (624288890, 'Gunner', 'Cuddon', 18221);
commit;
prompt 500 records committed...
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (816508660, 'Vitoria', 'Pinhorn', 13755);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (261062200, 'Georgeanna', 'Harriskine', 9758);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (928545381, 'Vinny', 'Grouer', 8792);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (853130275, 'Daile', 'Lievesley', 16727);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (206288356, 'Horst', 'Wegman', 9442);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (441773370, 'Julianna', 'Vlasin', 9878);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (643514053, 'Renelle', 'Laughnan', 8023);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (787373986, 'Cyril', 'Kynd', 13522);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (617824992, 'Royal', 'Streeting', 8683);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (501487636, 'Aldus', 'McTurk', 17732);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (254183134, 'Athena', 'Leney', 10270);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (673475478, 'Garwood', 'Twallin', 10211);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (359618622, 'Bo', 'Sheilds', 6511);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (104098064, 'Eran', 'Bushen', 10876);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (754650176, 'Britte', 'Foxwell', 11039);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (205294997, 'Avrit', 'Hayland', 9973);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (990728222, 'Ranique', 'Tevlin', 16501);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (235534595, 'Eran', 'Manchester', 12978);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (258022923, 'Carla', 'Parkhouse', 6216);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (579001671, 'Dorise', 'Basilotta', 9522);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (594412801, 'Andros', 'Melrose', 12789);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (158520018, 'Marjie', 'Paggitt', 15135);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (349754704, 'Hilario', 'Thyng', 18767);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (342548019, 'Gonzales', 'Chittie', 14324);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (813522649, 'Ephrayim', 'McGraffin', 6727);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (61071883, 'Kania', 'Giocannoni', 7522);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (775391089, 'Lothaire', 'Lickess', 6171);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (228547715, 'Cyrill', 'Agdahl', 19531);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (33905474, 'Rog', 'Bisson', 7291);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (648058132, 'Laraine', 'Polycote', 17687);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (204242106, 'Ethelred', 'Nairy', 15742);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (915926672, 'Laurene', 'Cardnell', 8577);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (341085264, 'Page', 'Grolmann', 10578);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (569878396, 'Tandy', 'Skermer', 16907);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (477663053, 'Franciskus', 'Momery', 10666);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (783717113, 'Kylila', 'Furniss', 12009);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (555162069, 'Fan', 'Goymer', 15272);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (965734198, 'Rowena', 'Frankland', 8881);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (213989479, 'Adan', 'Girkins', 10209);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (564180130, 'Rafferty', 'Greschke', 11800);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (556894465, 'Pauletta', 'Delicate', 8691);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (679997666, 'Constantin', 'Hitchens', 8469);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (835190007, 'Gilly', 'McLanaghan', 6694);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (337802327, 'Nowell', 'Chataignier', 15748);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (670671149, 'Jackelyn', 'Lawrenceson', 10107);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (708515410, 'Syd', 'Mutlow', 6512);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (592458617, 'Skye', 'Camel', 19848);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (976997166, 'Dorita', 'Oselton', 8553);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (959701411, 'Umeko', 'McWhirter', 16187);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (326283524, 'Averell', 'Paladino', 13961);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (292608890, 'Eileen', 'Dugan', 17110);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (649429017, 'Travis', 'Trivett', 8575);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (684803812, 'Hakeem', 'Songust', 18378);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (788436504, 'Leopold', 'Yea', 18436);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (509519761, 'Rozalie', 'O''Sculley', 9043);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (507410925, 'Corbet', 'Cowans', 14205);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (20066528, 'Bibby', 'Ungerechts', 13507);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (838491698, 'Jean', 'Geroldini', 19537);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (403646529, 'Lennie', 'Lambert-Ciorwyn', 15741);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (244587046, 'Betta', 'De Ferraris', 7700);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (344615724, 'Kessiah', 'Gilluley', 16836);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (326029970, 'Tiffy', 'Clemot', 18423);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (152452318, 'Amalle', 'Bonavia', 7835);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (75905856, 'Frayda', 'Britland', 16302);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (700398931, 'Arline', 'Nind', 16092);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (756653140, 'Chrissy', 'Dorrity', 10507);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (482614855, 'Fernanda', 'Keel', 12288);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (851930168, 'Ellswerth', 'Cuzen', 7445);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (139099038, 'Bev', 'Delepine', 6998);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (718408998, 'Brigid', 'Fenelon', 12162);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (424601787, 'Fran', 'Vause', 7868);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (850817402, 'Nannette', 'Aspel', 16415);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (539023181, 'Westbrooke', 'Russ', 13912);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (313672129, 'Rourke', 'Crossley', 9567);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (817541888, 'Emlyn', 'Earl', 11042);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (698745157, 'Dante', 'Arrol', 8388);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (485698844, 'Alva', 'Perree', 12948);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (407859127, 'Meggie', 'Mallinder', 19682);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (162227499, 'Bert', 'Van Der Hoog', 14218);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (774234336, 'Teddi', 'Middiff', 15528);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (78120681, 'Ellwood', 'Tedder', 14037);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (360391366, 'Harriett', 'Bonnett', 7639);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (865788939, 'Rebeca', 'Sobczak', 8564);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (730269129, 'Shannah', 'Liley', 13210);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (388451690, 'Thaxter', 'Beavors', 7126);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (419144040, 'Ainslee', 'Paget', 10447);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (373674922, 'Sheila-kathryn', 'McCarrell', 11899);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (684968117, 'Tallie', 'Filppetti', 17615);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (374269823, 'Lindsay', 'Knocker', 17525);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (287426095, 'Gaye', 'Dennistoun', 11906);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (341587407, 'Bordie', 'Woolford', 14324);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (90992427, 'Fee', 'Winfindale', 18184);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (512303788, 'Ash', 'Choffin', 16012);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (78199489, 'Pat', 'O''Dowling', 11390);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (873868662, 'Yovonnda', 'Yanson', 14704);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (750287353, 'Abdul', 'Hurlston', 12790);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (10778317, 'Consalve', 'Cherry', 13657);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (249804553, 'Neille', 'Fleischmann', 13822);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (388996575, 'Jodee', 'Roos', 7705);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (954504053, 'Daphne', 'Jewers', 6361);
commit;
prompt 600 records committed...
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (692812350, 'Florie', 'Featherstone', 10727);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (103042300, 'Esteban', 'Badland', 18004);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (890290774, 'Pate', 'Keelinge', 14193);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (521273434, 'Lesli', 'Matveyev', 12661);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (670740078, 'Darleen', 'Docker', 16710);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (292815566, 'Eward', 'Hardiman', 15723);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (410846459, 'Reeta', 'Pudsall', 12345);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (796939742, 'Blake', 'Wale', 8654);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (886558356, 'Taber', 'Tomczak', 13249);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (944840657, 'Zulema', 'Mincini', 12113);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (530192612, 'Diana', 'Callicott', 6053);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (571626624, 'Jolie', 'de Banke', 19834);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (960746982, 'Perice', 'Mainland', 7600);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (323498503, 'Perl', 'Lardez', 16315);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (710066917, 'Dael', 'Jecks', 14290);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (140723312, 'Beverlie', 'Santon', 19684);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (795413328, 'Jae', 'Merrington', 11496);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (911880170, 'Althea', 'Gerling', 9919);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (380185536, 'Cirillo', 'Cotherill', 18053);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (65925109, 'Sileas', 'O''Shiel', 19811);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (423866989, 'Lidia', 'Gurwood', 9768);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (578645108, 'Renaud', 'Kerley', 13097);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (814747139, 'Ediva', 'Turfrey', 18259);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (631159996, 'Vivienne', 'Abbots', 6987);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (582743934, 'Chad', 'Shaudfurth', 16786);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (558245644, 'Barthel', 'Safe', 16744);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (751901189, 'Krystyna', 'Kulic', 8899);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (170769951, 'Deena', 'Vigors', 6672);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (319158200, 'Dix', 'Thorburn', 17535);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (746713885, 'Yuma', 'Tammadge', 14495);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (329376310, 'Xena', 'Osmond', 7594);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (805225066, 'Eleen', 'O''Moylane', 6457);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (102616200, 'Neddie', 'Skells', 8736);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (825668146, 'Massimiliano', 'Souten', 10155);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (189999334, 'Clare', 'O'' Culligan', 8000);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (636108167, 'Molli', 'Osant', 11307);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (14414038, 'Lorelei', 'Calf', 16931);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (778639839, 'Linnell', 'Blaxeland', 6567);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (646974723, 'Zsa zsa', 'Beardshaw', 13200);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (518835241, 'Sloane', 'Fosh', 6991);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (411591356, 'Vinnie', 'Keig', 17301);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (471725480, 'Ole', 'Yearn', 19984);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (665174011, 'Durand', 'Sommerville', 6865);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (93691607, 'Myrvyn', 'McMillan', 8800);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (523666684, 'Yardley', 'Justis', 9263);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (296973061, 'Dalila', 'Cabrales', 9460);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (639464118, 'Kevon', 'Galbraeth', 9243);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (414558547, 'Mario', 'Turmell', 14375);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (534686211, 'Biddy', 'Gounot', 14773);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (527965384, 'Astra', 'Balbeck', 19056);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (625019851, 'Cherilynn', 'Giabuzzi', 9826);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (242340509, 'Woodrow', 'Sywell', 16672);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (459162770, 'Justina', 'Mersh', 16516);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (847010531, 'Ardene', 'Kintzel', 15369);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (528067752, 'Naoma', 'Kingsmill', 8510);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (999433826, 'Levin', 'Yve', 11945);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (715071262, 'Susy', 'Chesterfield', 19524);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (456441628, 'Yanaton', 'Crandon', 8733);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (661209100, 'Ava', 'Stanfield', 7112);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (198446913, 'Costa', 'Baden', 7629);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (802809781, 'Inessa', 'Zoppo', 8473);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (801031572, 'Keith', 'Hallatt', 7921);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (714080743, 'Maxi', 'Fernando', 9744);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (715735126, 'Hillary', 'Treleaven', 11930);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (944171827, 'Cory', 'Cano', 9252);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (149367880, 'Carr', 'Arro', 13423);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (717602199, 'Fanni', 'Breissan', 19803);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (147527730, 'Junia', 'Bowditch', 12967);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (708570974, 'Jasun', 'Keat', 15657);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (546641058, 'Raimondo', 'Godball', 15033);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (557511653, 'Sloane', 'Yesenin', 9639);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (285807600, 'Vivi', 'Gravy', 12881);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (408899671, 'Shermie', 'Piff', 11172);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (779367460, 'Tate', 'Poppleton', 14115);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (993826957, 'Bekki', 'Labitt', 15883);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (88454946, 'Esteban', 'Paddemore', 11187);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (674823260, 'Minnnie', 'Batterton', 14267);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (715667008, 'Aggi', 'Piscopello', 17097);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (814503339, 'Krystle', 'Heigl', 16312);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (823013828, 'Ana', 'Jorin', 15619);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (140329983, 'Susan', 'Elverston', 14261);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (764131179, 'Janelle', 'Garlic', 14303);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (580416158, 'Ernst', 'Jerrome', 7679);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (691502586, 'Gradey', 'Huffer', 9380);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (91260225, 'Jess', 'Gurdon', 17909);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (158973954, 'Reid', 'Linne', 16063);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (188147669, 'Di', 'Brandrick', 7732);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (747898750, 'Georg', 'Clayden', 16722);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (844257581, 'Aubree', 'Diggar', 6272);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (519792063, 'Carlene', 'Glossup', 16937);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (137953172, 'Lanae', 'Marcam', 19251);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (905695294, 'Doe', 'Jeannel', 20800);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (382687347, 'Laurena', 'Gommey', 18218);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (609136779, 'Poppy', 'Tidball', 10203);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (924824869, 'Birgit', 'Lafee', 12142);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (352001327, 'Roderick', 'Gifford', 11896);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (487120328, 'Kathrine', 'Angove', 14436);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (740452768, 'Maddy', 'Clowton', 13054);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (216855349, 'Ginger', 'Bracegirdle', 17943);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (219975403, 'Penelope', 'Colbourne', 12775);
commit;
prompt 700 records committed...
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (273552538, 'Alane', 'Klass', 16132);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (465891024, 'Tanney', 'Mc Cahey', 9702);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (243145366, 'Fletcher', 'Clogg', 12693);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (926670662, 'Ermentrude', 'Ruston', 13194);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (429045023, 'Lissie', 'Corfield', 16403);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (229262738, 'Kerwin', 'Marc', 7254);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (431640318, 'Benito', 'Petrozzi', 16249);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (430312310, 'Luelle', 'Guild', 9450);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (111580867, 'Rania', 'Goldman', 9612);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (948482928, 'Goran', 'Sweetsur', 19474);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (553988911, 'Lela', 'Ousley', 12800);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (211788135, 'Artur', 'Kitchenman', 8301);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (354219910, 'Alexina', 'Archibald', 13257);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (975300652, 'Bowie', 'Widmore', 8352);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (583911015, 'Belicia', 'Bechley', 8097);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (768172721, 'Norbie', 'Brittan', 14602);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (888370975, 'Nerte', 'Doucette', 10934);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (85272737, 'Dennie', 'Willicott', 6436);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (201725685, 'Kaja', 'Carillo', 13060);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (249310996, 'Munmro', 'Arter', 13656);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (125538621, 'Wilek', 'Cardero', 12315);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (681848924, 'Fleming', 'Rayne', 17314);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (449289489, 'Fidelity', 'Crosson', 9341);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (62733937, 'Carita', 'Scneider', 13431);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (937893137, 'Dusty', 'Kinnar', 9431);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (689999565, 'Jo-ann', 'Cecere', 13579);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (118426724, 'Peter', 'Matuszkiewicz', 16759);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (426786479, 'Agnola', 'Snashall', 15832);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (18883803, 'Willdon', 'L''Hommee', 6386);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (582981637, 'Conrado', 'Dreinan', 8302);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (72406309, 'Barbette', 'Pankettman', 17083);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (529686226, 'Filmer', 'Erett', 16688);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (822928922, 'Rora', 'Geffinger', 14849);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (178117737, 'Zeb', 'Coxall', 7349);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (448955482, 'Deni', 'Courtney', 8668);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (375030653, 'Novelia', 'Fisher', 8255);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (463456582, 'Umeko', 'Moxstead', 13237);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (291412802, 'Maitilde', 'Gobel', 17505);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (666252932, 'Lilias', 'Hinkensen', 19502);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (507895090, 'Petey', 'Rusted', 14607);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (46651369, 'Lilith', 'Brockest', 10750);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (622592331, 'Pascale', 'Huntriss', 7210);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (227485160, 'Caz', 'Worpole', 14048);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (857634572, 'Benedetto', 'Whitwell', 14052);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (36280567, 'Ambrosio', 'Klain', 12138);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (995637522, 'Rollo', 'Gorman', 19968);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (25600113, 'Muriel', 'Sallter', 8496);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (910708121, 'Hanan', 'Scaysbrook', 17790);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (158824032, 'Florance', 'Dobson', 7541);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (569349982, 'Marielle', 'Watts', 8213);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (423684463, 'Mirabella', 'Cockson', 16127);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (175966745, 'Hatty', 'Bernholt', 15863);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (141420133, 'Bud', 'Lowery', 6517);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (822561014, 'Bill', 'Anneslie', 13317);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (262380974, 'Tierney', 'Klaaassen', 11516);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (258901645, 'Barbabra', 'Sima', 14172);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (825541986, 'Wenona', 'Linnemann', 12338);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (952079976, 'Danielle', 'Morrel', 15680);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (320257400, 'Davis', 'Matuschek', 12746);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (582736834, 'Martita', 'Castille', 12015);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (692856389, 'Mina', 'Danovich', 7811);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (762522269, 'Pip', 'Duprey', 13471);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (817825765, 'Michaeline', 'Dome', 15953);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (906230872, 'Joline', 'Rays', 15455);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (656069837, 'Anton', 'Stranahan', 12042);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (328950838, 'Baron', 'Robinet', 13783);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (654986636, 'Hastings', 'Welsh', 17393);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (246504695, 'Francesco', 'Tucsell', 6109);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (53299507, 'Ferris', 'Osmar', 18395);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (573441687, 'Jamey', 'Hartill', 9238);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (870641370, 'Page', 'Pichmann', 18324);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (801649896, 'Thaine', 'Saville', 19201);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (415804946, 'Kameko', 'Mold', 13469);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (416908680, 'Tawnya', 'Towey', 12255);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (363052948, 'Geri', 'Monaghan', 18888);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (705787767, 'Opalina', 'MattiCCI', 7859);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (462499367, 'Carmela', 'Broske', 6629);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (561258694, 'Rowen', 'Semrad', 6938);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (12563899, 'Bink', 'Jesteco', 17560);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (386248581, 'Kyrstin', 'Bruce', 6270);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (420420585, 'Zacherie', 'Adan', 16869);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (524670562, 'Suki', 'Obert', 16431);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (615684143, 'Tommi', 'Heaney`', 13771);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (49968460, 'Orlan', 'Sollas', 9342);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (166021665, 'Kelley', 'Canero', 9089);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (312448494, 'Moss', 'Petersen', 6623);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (13912645, 'Nigel', 'Cecere', 15372);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (762568462, 'Kellen', 'Nordass', 10969);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (840318660, 'Ludovico', 'Banck', 9720);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (773945524, 'Avram', 'Garfield', 6964);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (283625289, 'Rosaleen', 'Rogliero', 15578);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (771843414, 'Adham', 'Griswood', 14985);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (825896842, 'Harmonie', 'Ayer', 7001);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (187484274, 'Mabel', 'Mapham', 6576);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (527339940, 'Gal', 'Dollimore', 9761);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (242497574, 'Rafael', 'Frith', 10524);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (155663800, 'Lauryn', 'Marl', 16651);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (201130408, 'Idalia', 'Lowbridge', 8135);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (822341258, 'Stefan', 'De Bell', 16305);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (973621996, 'Kelila', 'Pinch', 14647);
commit;
prompt 800 records committed...
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (920632781, 'Francesco', 'MacCourt', 6809);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (264894276, 'Wald', 'Fealy', 6163);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (111833466, 'Joyann', 'Wingatt', 13258);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (217203442, 'Loreen', 'Eliassen', 13395);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (49586505, 'Cesaro', 'Erwin', 9294);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (9209401, 'Peadar', 'Bestar', 18430);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (673079881, 'Lynea', 'Glaisner', 13894);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (459627613, 'Dorothea', 'Million', 15171);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (716858810, 'Ronica', 'O''Brogane', 8601);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (88263254, 'Carlota', 'Ebbitt', 12840);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (79984886, 'Inez', 'Ferrari', 6200);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (68713931, 'Kerrie', 'Normant', 8398);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (199137043, 'Blayne', 'Golsby', 15769);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (392986323, 'Francois', 'Sisneros', 9015);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (289325901, 'Tanny', 'Imloch', 6804);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (724531712, 'Joyan', 'Koppeck', 12807);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (459550168, 'Kamilah', 'Simenon', 15776);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (837835299, 'Foster', 'Shilling', 17389);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (949702702, 'Steffie', 'Tomasino', 16900);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (192731092, 'Gwenore', 'Bynold', 11492);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (635983471, 'Granny', 'Langwade', 19274);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (391443816, 'Delinda', 'Tofpik', 15227);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (392994979, 'Kimberli', 'Conrart', 19321);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (29936885, 'Ase', 'Vaskin', 6703);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (153670287, 'Wayne', 'Dolle', 9359);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (56640603, 'Dewain', 'Shills', 18553);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (614749820, 'Bran', 'Bennetts', 19649);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (794115696, 'Chick', 'Cass', 16104);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (294873316, 'Dorothea', 'McGing', 19079);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (121118536, 'Kaitlynn', 'Signorelli', 19297);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (640394684, 'Brad', 'Burker', 11530);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (268000963, 'Gib', 'Kienzle', 7618);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (440772461, 'Vito', 'Duddy', 14283);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (841888510, 'Blair', 'Pessolt', 16585);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (438430790, 'Lucio', 'Doddemeede', 11449);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (64497400, 'Erick', 'Seden', 18294);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (899178862, 'Nicholle', 'O''Mullaney', 14483);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (418399888, 'Kristy', 'Avery', 11194);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (983757891, 'Junia', 'Tilliards', 15242);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (569429189, 'Zuzana', 'Benardeau', 16352);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (855883192, 'Crissie', 'Tune', 17010);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (892386761, 'Dredi', 'Gummery', 11806);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (86156727, 'Gregorius', 'McGarahan', 11054);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (517695961, 'Aleta', 'Baumadier', 14912);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (709929682, 'Hamel', 'Kluss', 14683);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (63614029, 'Nikkie', 'Yanyushkin', 12757);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (402205007, 'Aron', 'Pennick', 7476);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (628408315, 'Milicent', 'Robilliard', 18956);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (983242828, 'Effie', 'Woodhall', 16114);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (944963557, 'Siouxie', 'St. Hill', 14263);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (246240897, 'Neely', 'McComiskie', 16058);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (178317226, 'Christi', 'Dubble', 18034);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (434068749, 'Jeno', 'Sacase', 10941);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (826078406, 'Angele', 'Konmann', 7701);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (357840804, 'Heddi', 'Reder', 9983);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (86828346, 'Tarrah', 'Allman', 15308);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (708897547, 'Gertie', 'Reavell', 18982);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (132488139, 'Florinda', 'Tomasini', 12248);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (843214944, 'Esme', 'Gaylor', 14703);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (838539231, 'Israel', 'Sunnucks', 6624);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (926552527, 'Margi', 'Skurm', 9381);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (349532042, 'Chastity', 'Reeder', 19323);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (720668823, 'Lonee', 'Skeffington', 12894);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (950506091, 'Charis', 'Abthorpe', 9050);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (675645102, 'Hagan', 'Tremayne', 11643);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (415046221, 'Leanora', 'Coning', 19182);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (716162130, 'Haydon', 'Mardle', 19912);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (517679788, 'Juliann', 'Searson', 9170);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (663651663, 'Jada', 'Boc', 12714);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (89100606, 'Malachi', 'Hollyar', 9479);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (495720014, 'Selena', 'Penreth', 6101);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (141464821, 'Dory', 'Elia', 11787);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (232645053, 'Jeth', 'Wallicker', 9221);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (370269659, 'Ilse', 'Carless', 17916);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (770618703, 'Kimberlee', 'Eyer', 18051);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (789430976, 'Sidney', 'Schroder', 15059);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (180373387, 'Durante', 'Faraday', 13293);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (963568970, 'Patrizio', 'Mayhew', 18049);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (702231188, 'Bobby', 'Duchart', 8794);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (66135977, 'Bobbette', 'Ohm', 11263);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (631035590, 'Karl', 'Crosgrove', 9605);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (896315385, 'Erich', 'Guerrazzi', 17124);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (751610687, 'Leontyne', 'Gregori', 18496);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (687449545, 'Nicolai', 'Hebborn', 14273);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (302549197, 'Phelia', 'Bockings', 8045);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (653013987, 'Channa', 'Bredee', 17547);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (432069073, 'Clerissa', 'Kubasek', 13889);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (519481550, 'Annaliese', 'Flegg', 18553);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (48201694, 'Editha', 'Tutin', 12182);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (998822547, 'Vinny', 'Bohin', 10113);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (846779539, 'Deana', 'Varah', 17615);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (58317415, 'Joya', 'Confort', 17255);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (123022620, 'Dorise', 'Handman', 15857);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (483909248, 'Inger', 'Titheridge', 8907);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (594366892, 'Marlon', 'Elam', 19443);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (128344352, 'Regine', 'Caulton', 13803);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (357844780, 'Markus', 'Vinton', 17981);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (103914968, 'Ethelind', 'MacSweeney', 16107);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (752764983, 'Alon', 'Batts', 18724);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (155285136, 'Clarette', 'Ulster', 10808);
commit;
prompt 900 records committed...
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (519836665, 'Jo-anne', 'Hickinbottom', 7362);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (307000533, 'Evangelia', 'Ewbanche', 10569);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (201821857, 'Elvina', 'Maryan', 12379);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (185926813, 'Neill', 'Eteen', 17676);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (953672167, 'Wyatan', 'Alesin', 10701);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (973159467, 'Felicia', 'Blackwell', 13607);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (70508319, 'Marnie', 'Kleinstern', 10507);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (826859074, 'Manda', 'McSharry', 18022);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (355249589, 'Sioux', 'Briers', 7521);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (471997015, 'Cassie', 'Stanesby', 7217);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (366210712, 'Bink', 'Jurs', 12430);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (115866576, 'Stavros', 'Jaqueminet', 13387);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (502282914, 'Cherish', 'Lucock', 15470);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (547676914, 'Rubi', 'Pechet', 12196);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (445269041, 'Byron', 'Lorman', 16323);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (701956875, 'Gamaliel', 'Baelde', 12613);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (248462621, 'Rodolphe', 'Easdon', 11290);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (872383294, 'Mychal', 'Carmen', 15417);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (498820251, 'Miller', 'Vignal', 18615);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (847214868, 'Sinclare', 'Batchelour', 11885);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (140762549, 'Fidelio', 'Severwright', 12998);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (885765470, 'Britni', 'Giffaut', 6551);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (427970187, 'Jerrilyn', 'Tungay', 12590);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (188511147, 'Donna', 'Brisard', 15496);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (587444577, 'Elroy', 'Ozanne', 10547);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (197091282, 'Hirsch', 'Ream', 8262);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (803372797, 'Gunilla', 'Vibert', 7818);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (818315238, 'Aubree', 'Shulver', 18503);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (286496076, 'Tommie', 'Enterle', 17722);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (972191037, 'Nate', 'Bridel', 19819);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (123087326, 'Tina', 'Saltrese', 16365);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (489408501, 'Holly-anne', 'Blagbrough', 18110);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (787093235, 'Lora', 'Bearman', 13188);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (666953605, 'Aguste', 'Leadbetter', 18522);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (561418271, 'Allie', 'Christopherson', 18165);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (542376900, 'Loren', 'Gilson', 17101);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (150384729, 'Harv', 'Charle', 16767);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (171591246, 'Bennie', 'Melland', 16046);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (500766433, 'Bidget', 'Bellord', 11429);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (621782285, 'Ulrica', 'Purseglove', 10714);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (49645268, 'Aluino', 'Kuhlmey', 12376);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (400069766, 'Gustie', 'Yakubovics', 16633);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (508748267, 'Timmie', 'Linnane', 7191);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (825948511, 'Siegfried', 'Goold', 15449);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (633601303, 'Grove', 'Bythway', 17546);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (423967725, 'Nat', 'Brunger', 9255);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (59609069, 'Vincents', 'Bonder', 11083);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (290415816, 'Celestyn', 'Burdett', 18113);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (411756417, 'Bess', 'Hayley', 9972);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (144874633, 'Estelle', 'Mathieu', 13647);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (128815909, 'Guilbert', 'Avramovic', 16190);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (307417581, 'Nisse', 'Chaikovski', 19170);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (517634650, 'Livvy', 'Fillery', 11130);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (136766109, 'Glen', 'Kenealy', 16503);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (108128515, 'Shane', 'Caren', 6244);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (356588438, 'Lynde', 'Kyte', 14316);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (514457237, 'Karisa', 'Okroy', 15246);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (825714147, 'Byram', 'Crush', 18805);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (365554867, 'Winnie', 'Littleproud', 18993);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (959533473, 'Veronika', 'O''Carran', 11828);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (604232474, 'Lucky', 'Hardaway', 17162);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (68447854, 'Shannah', 'Cattroll', 12035);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (542329182, 'Roth', 'Solley', 16587);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (895641532, 'Odey', 'Lambshine', 14371);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (825690384, 'Carlo', 'Parsonson', 12385);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (295145758, 'Royal', 'Doone', 12193);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (161696309, 'Janeen', 'Rippingall', 13801);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (658535442, 'Elwyn', 'Bryning', 14953);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (657336000, 'Cosmo', 'Bouchier', 10510);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (200515695, 'Carmelina', 'Diggin', 19582);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (880125605, 'Brant', 'Doornbos', 16326);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (531170292, 'Marylin', 'Bendig', 11654);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (271526502, 'Orelee', 'Dunley', 17582);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (313776915, 'Zacharie', 'Gobbet', 7108);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (376570056, 'Shell', 'Garahan', 7131);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (338347764, 'Westley', 'Edwards', 11868);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (791214599, 'Marj', 'Shepperd', 19652);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (810703771, 'Carmel', 'Jonas', 17880);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (121662109, 'Janek', 'Croxon', 6870);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (590038744, 'Carl', 'Bockmann', 15879);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (266658796, 'Zena', 'Slate', 7922);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (487160536, 'Jermain', 'Wooton', 9118);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (341956755, 'Gunar', 'Taillard', 11244);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (395652680, 'Kenyon', 'Loines', 13863);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (742997917, 'Larisa', 'Sendley', 17632);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (819875448, 'Sheila-kathryn', 'Cawdron', 11722);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (433914048, 'Yvon', 'Pethick', 17480);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (795454404, 'Lucio', 'Yakebovitch', 9105);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (569020977, 'Ardys', 'Grossier', 16858);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (733833797, 'Roddie', 'Slyman', 7003);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (648255483, 'Linc', 'Philippault', 12074);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (774273855, 'Federica', 'Simmon', 13980);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (158304491, 'Alina', 'Jaime', 7424);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (676463686, 'Elvera', 'Quig', 18983);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (446907807, 'Rivy', 'Nickoll', 14064);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (783453192, 'Culley', 'Clackson', 11748);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (874315634, 'Taffy', 'Gaunson', 10162);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (378488167, 'Dahlia', 'Peert', 17476);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (672771740, 'Josie', 'Shall', 16890);
insert into EMPLOYEE2 (em_id, first_name, last_name, salary)
values (163507585, 'Jakob', 'Hamshaw', 10261);
commit;
prompt 1000 records loaded
prompt Loading RESERVATIONAGENT...
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (290415816, 'Intermediate', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (197091282, 'Expert', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (250697339, 'Expert', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (55152143, 'Expert', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (171591246, 'Intermediate', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (905587707, 'Intermediate', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (693610267, 'Expert', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (57851358, 'Intermediate', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (420420585, 'Expert', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (769239384, 'Expert', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (308817183, 'Beginner', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (502282914, 'Intermediate', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (189999334, 'Beginner', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (806062472, 'Expert', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (450177304, 'Beginner', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (350875712, 'Beginner', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (97277835, 'Expert', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (292870589, 'Beginner', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (230815566, 'Intermediate', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (194691141, 'Beginner', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (436518157, 'Intermediate', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (92900047, 'Intermediate', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (352001327, 'Expert', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (360391366, 'Intermediate', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (604301629, 'Expert', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (229262738, 'Beginner', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (957232802, 'Intermediate', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (619863148, 'Expert', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (970571233, 'Expert', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (757430241, 'Intermediate', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (323498503, 'Intermediate', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (139017870, 'Beginner', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (592893787, 'Expert', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (911796368, 'Intermediate', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (58797922, 'Intermediate', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (784902638, 'Intermediate', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (68447854, 'Intermediate', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (774653648, 'Beginner', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (124559975, 'Intermediate', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (431922813, 'Intermediate', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (973621996, 'Intermediate', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (89841640, 'Intermediate', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (715374790, 'Beginner', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (507973169, 'Expert', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (48647594, 'Intermediate', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (672771740, 'Beginner', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (459627613, 'Intermediate', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (555162069, 'Intermediate', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (873868662, 'Expert', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (822928922, 'Beginner', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (524893329, 'Intermediate', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (783453192, 'Beginner', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (475529168, 'Expert', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (423967725, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (764749496, 'Beginner', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (232645053, 'Intermediate', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (705406733, 'Expert', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (770618703, 'Intermediate', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (714011377, 'Intermediate', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (271582089, 'Beginner', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (556894465, 'Beginner', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (670740078, 'Expert', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (194563366, 'Intermediate', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (762974855, 'Expert', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (558245644, 'Intermediate', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (822341258, 'Beginner', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (158135826, 'Beginner', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (840318660, 'Expert', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (91260225, 'Intermediate', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (617456121, 'Expert', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (791106708, 'Beginner', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (252310393, 'Expert', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (766741215, 'Intermediate', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (624290612, 'Intermediate', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (382970872, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (861303903, 'Expert', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (746713885, 'Expert', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (533940142, 'Beginner', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (573212448, 'Beginner', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (944963557, 'Intermediate', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (833682521, 'Expert', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (993826957, 'Expert', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (580416158, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (845919716, 'Expert', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (326967736, 'Beginner', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (476246719, 'Intermediate', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (689946485, 'Beginner', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (729794325, 'Beginner', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (895738147, 'Beginner', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (14414038, 'Intermediate', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (104359686, 'Beginner', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (702231188, 'Beginner', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (899339270, 'Beginner', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (717106749, 'Intermediate', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (795413328, 'Expert', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (612956128, 'Beginner', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (273552538, 'Expert', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (392352078, 'Beginner', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (271526502, 'Intermediate', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (452937229, 'Expert', 5);
commit;
prompt 100 records committed...
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (885557193, 'Expert', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (714536128, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (101953084, 'Beginner', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (870641370, 'Expert', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (676463686, 'Beginner', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (942345154, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (681848924, 'Expert', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (102616200, 'Beginner', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (418399888, 'Beginner', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (920632781, 'Intermediate', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (817541888, 'Expert', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (638974516, 'Intermediate', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (911880170, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (185079831, 'Intermediate', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (774273855, 'Expert', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (937049426, 'Expert', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (578645108, 'Intermediate', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (579127292, 'Expert', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (671529549, 'Intermediate', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (625019851, 'Beginner', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (999433826, 'Intermediate', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (20066528, 'Intermediate', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (111580867, 'Beginner', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (604232474, 'Expert', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (865681239, 'Intermediate', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (518835241, 'Expert', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (90992427, 'Intermediate', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (928545381, 'Intermediate', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (774234336, 'Expert', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (649274470, 'Intermediate', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (191662114, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (765478343, 'Expert', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (411756417, 'Expert', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (673079881, 'Expert', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (589301821, 'Beginner', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (679997666, 'Beginner', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (536496809, 'Beginner', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (97453943, 'Beginner', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (408899671, 'Beginner', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (519836665, 'Intermediate', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (111833466, 'Expert', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (865788939, 'Beginner', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (729586407, 'Expert', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (210274598, 'Intermediate', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (620579446, 'Intermediate', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (477663053, 'Intermediate', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (341956755, 'Expert', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (649429017, 'Beginner', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (631159996, 'Expert', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (983207552, 'Expert', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (3510623, 'Intermediate', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (765357442, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (750287353, 'Intermediate', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (794153511, 'Expert', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (132488139, 'Intermediate', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (132010490, 'Beginner', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (216855349, 'Expert', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (852821102, 'Expert', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (395652680, 'Intermediate', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (133348279, 'Expert', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (826078406, 'Beginner', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (85187792, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (569349982, 'Intermediate', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (791214599, 'Beginner', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (153850202, 'Intermediate', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (721248833, 'Expert', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (905695294, 'Expert', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (853727944, 'Expert', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (108128515, 'Beginner', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (429045023, 'Expert', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (123087326, 'Beginner', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (19960727, 'Expert', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (574141906, 'Expert', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (477036241, 'Beginner', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (150279391, 'Intermediate', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (371676118, 'Expert', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (661209100, 'Beginner', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (851930168, 'Intermediate', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (590038744, 'Expert', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (295145758, 'Beginner', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (246175620, 'Beginner', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (577630915, 'Beginner', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (33905474, 'Beginner', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (847214868, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (81443054, 'Expert', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (589127937, 'Intermediate', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (643514053, 'Beginner', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (285807600, 'Beginner', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (975300652, 'Expert', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (224754446, 'Intermediate', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (431399007, 'Intermediate', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (178317226, 'Expert', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (357840804, 'Expert', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (477692548, 'Intermediate', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (423684463, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (759636101, 'Expert', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (127809455, 'Expert', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (843214944, 'Intermediate', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (521273434, 'Expert', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (630014693, 'Intermediate', 9);
commit;
prompt 200 records committed...
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (666252932, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (841097188, 'Expert', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (724193455, 'Intermediate', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (93691607, 'Intermediate', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (242340509, 'Intermediate', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (959533473, 'Expert', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (754650176, 'Beginner', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (724531712, 'Intermediate', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (471997015, 'Expert', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (161778091, 'Intermediate', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (118539023, 'Beginner', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (346535024, 'Expert', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (424601787, 'Beginner', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (53828981, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (313672129, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (45087593, 'Intermediate', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (561418271, 'Expert', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (365554867, 'Beginner', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (28981650, 'Intermediate', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (733833797, 'Beginner', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (953672167, 'Expert', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (498820251, 'Expert', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (248462621, 'Expert', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (582981637, 'Intermediate', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (582736834, 'Beginner', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (434068749, 'Beginner', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (459550168, 'Beginner', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (344615724, 'Expert', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (414558547, 'Beginner', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (426786479, 'Beginner', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (768175040, 'Intermediate', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (983242828, 'Beginner', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (524670562, 'Beginner', 3);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (342548019, 'Expert', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (547926306, 'Expert', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (616424937, 'Intermediate', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (525503259, 'Expert', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (801649896, 'Expert', 9);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (201821857, 'Intermediate', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (258022923, 'Expert', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (180373387, 'Beginner', 6);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (679191015, 'Expert', 10);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (363143266, 'Beginner', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (692361509, 'Beginner', 2);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (873911959, 'Beginner', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (92741060, 'Expert', 5);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (705906811, 'Intermediate', 8);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (619048401, 'Beginner', 7);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (461423109, 'Expert', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (818315238, 'Intermediate', 4);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (204242106, 'Beginner', 1);
insert into RESERVATIONAGENT (em_id, tech_proficiency, rating)
values (391771971, 'Beginner', 9);
commit;
prompt 252 records loaded
prompt Loading INFORM...
insert into INFORM (em_id, guest_id)
values (3510623, 195674427);
insert into INFORM (em_id, guest_id)
values (14414038, 54417215);
insert into INFORM (em_id, guest_id)
values (14414038, 401954315);
insert into INFORM (em_id, guest_id)
values (14414038, 775154294);
insert into INFORM (em_id, guest_id)
values (20066528, 259599234);
insert into INFORM (em_id, guest_id)
values (20066528, 911459484);
insert into INFORM (em_id, guest_id)
values (45087593, 476723990);
insert into INFORM (em_id, guest_id)
values (45087593, 612151249);
insert into INFORM (em_id, guest_id)
values (48647594, 163358336);
insert into INFORM (em_id, guest_id)
values (53828981, 345543710);
insert into INFORM (em_id, guest_id)
values (53828981, 578746202);
insert into INFORM (em_id, guest_id)
values (55152143, 48751690);
insert into INFORM (em_id, guest_id)
values (55152143, 52951373);
insert into INFORM (em_id, guest_id)
values (55152143, 119931121);
insert into INFORM (em_id, guest_id)
values (55152143, 399396234);
insert into INFORM (em_id, guest_id)
values (57851358, 862727578);
insert into INFORM (em_id, guest_id)
values (57851358, 951334175);
insert into INFORM (em_id, guest_id)
values (58797922, 718313033);
insert into INFORM (em_id, guest_id)
values (58797922, 814830056);
insert into INFORM (em_id, guest_id)
values (81443054, 396179343);
insert into INFORM (em_id, guest_id)
values (81443054, 737403223);
insert into INFORM (em_id, guest_id)
values (85187792, 138124043);
insert into INFORM (em_id, guest_id)
values (85187792, 595922257);
insert into INFORM (em_id, guest_id)
values (85187792, 994936749);
insert into INFORM (em_id, guest_id)
values (90992427, 611577581);
insert into INFORM (em_id, guest_id)
values (90992427, 892936953);
insert into INFORM (em_id, guest_id)
values (91260225, 431285163);
insert into INFORM (em_id, guest_id)
values (92741060, 283539035);
insert into INFORM (em_id, guest_id)
values (92741060, 837573080);
insert into INFORM (em_id, guest_id)
values (92900047, 600565025);
insert into INFORM (em_id, guest_id)
values (93691607, 928558453);
insert into INFORM (em_id, guest_id)
values (97453943, 296276986);
insert into INFORM (em_id, guest_id)
values (97453943, 933894141);
insert into INFORM (em_id, guest_id)
values (108128515, 720330162);
insert into INFORM (em_id, guest_id)
values (108128515, 988001390);
insert into INFORM (em_id, guest_id)
values (111580867, 685077320);
insert into INFORM (em_id, guest_id)
values (111833466, 161599568);
insert into INFORM (em_id, guest_id)
values (111833466, 881483798);
insert into INFORM (em_id, guest_id)
values (118539023, 818704753);
insert into INFORM (em_id, guest_id)
values (118539023, 994568560);
insert into INFORM (em_id, guest_id)
values (124559975, 685077320);
insert into INFORM (em_id, guest_id)
values (124559975, 766416870);
insert into INFORM (em_id, guest_id)
values (127809455, 619322937);
insert into INFORM (em_id, guest_id)
values (150279391, 309820613);
insert into INFORM (em_id, guest_id)
values (153850202, 512475504);
insert into INFORM (em_id, guest_id)
values (153850202, 540415135);
insert into INFORM (em_id, guest_id)
values (161778091, 578076200);
insert into INFORM (em_id, guest_id)
values (161778091, 637500348);
insert into INFORM (em_id, guest_id)
values (180373387, 672209411);
insert into INFORM (em_id, guest_id)
values (185079831, 96998887);
insert into INFORM (em_id, guest_id)
values (185079831, 220987929);
insert into INFORM (em_id, guest_id)
values (189999334, 951334175);
insert into INFORM (em_id, guest_id)
values (191662114, 616966685);
insert into INFORM (em_id, guest_id)
values (197091282, 535649481);
insert into INFORM (em_id, guest_id)
values (197091282, 566335051);
insert into INFORM (em_id, guest_id)
values (204242106, 468581292);
insert into INFORM (em_id, guest_id)
values (204242106, 598290979);
insert into INFORM (em_id, guest_id)
values (204242106, 953127555);
insert into INFORM (em_id, guest_id)
values (210274598, 785721807);
insert into INFORM (em_id, guest_id)
values (216855349, 369594238);
insert into INFORM (em_id, guest_id)
values (216855349, 468581292);
insert into INFORM (em_id, guest_id)
values (229262738, 541100519);
insert into INFORM (em_id, guest_id)
values (230815566, 490583178);
insert into INFORM (em_id, guest_id)
values (242340509, 193479284);
insert into INFORM (em_id, guest_id)
values (246175620, 12995079);
insert into INFORM (em_id, guest_id)
values (248462621, 928558453);
insert into INFORM (em_id, guest_id)
values (250697339, 83725273);
insert into INFORM (em_id, guest_id)
values (252310393, 50654111);
insert into INFORM (em_id, guest_id)
values (252310393, 490295282);
insert into INFORM (em_id, guest_id)
values (271582089, 490962785);
insert into INFORM (em_id, guest_id)
values (273552538, 600547797);
insert into INFORM (em_id, guest_id)
values (285807600, 52951373);
insert into INFORM (em_id, guest_id)
values (285807600, 83845943);
insert into INFORM (em_id, guest_id)
values (285807600, 769196457);
insert into INFORM (em_id, guest_id)
values (308817183, 894100813);
insert into INFORM (em_id, guest_id)
values (326967736, 488284443);
insert into INFORM (em_id, guest_id)
values (341956755, 277119141);
insert into INFORM (em_id, guest_id)
values (342548019, 610867905);
insert into INFORM (em_id, guest_id)
values (350875712, 99649496);
insert into INFORM (em_id, guest_id)
values (350875712, 370100164);
insert into INFORM (em_id, guest_id)
values (350875712, 554726220);
insert into INFORM (em_id, guest_id)
values (350875712, 586728337);
insert into INFORM (em_id, guest_id)
values (352001327, 336885222);
insert into INFORM (em_id, guest_id)
values (352001327, 798076468);
insert into INFORM (em_id, guest_id)
values (352001327, 917240940);
insert into INFORM (em_id, guest_id)
values (357840804, 827901595);
insert into INFORM (em_id, guest_id)
values (360391366, 182083568);
insert into INFORM (em_id, guest_id)
values (360391366, 530536798);
insert into INFORM (em_id, guest_id)
values (360391366, 673677392);
insert into INFORM (em_id, guest_id)
values (360391366, 818704753);
insert into INFORM (em_id, guest_id)
values (371676118, 184677469);
insert into INFORM (em_id, guest_id)
values (371676118, 387893781);
insert into INFORM (em_id, guest_id)
values (382970872, 437808690);
insert into INFORM (em_id, guest_id)
values (382970872, 446287435);
insert into INFORM (em_id, guest_id)
values (392352078, 399396234);
insert into INFORM (em_id, guest_id)
values (395652680, 10342911);
insert into INFORM (em_id, guest_id)
values (395652680, 175052450);
insert into INFORM (em_id, guest_id)
values (408899671, 568531463);
insert into INFORM (em_id, guest_id)
values (408899671, 720781363);
insert into INFORM (em_id, guest_id)
values (408899671, 783746163);
commit;
prompt 100 records committed...
insert into INFORM (em_id, guest_id)
values (411756417, 101879583);
insert into INFORM (em_id, guest_id)
values (411756417, 188488796);
insert into INFORM (em_id, guest_id)
values (411756417, 335912518);
insert into INFORM (em_id, guest_id)
values (411756417, 523132035);
insert into INFORM (em_id, guest_id)
values (414558547, 15959727);
insert into INFORM (em_id, guest_id)
values (414558547, 112064902);
insert into INFORM (em_id, guest_id)
values (418399888, 446287435);
insert into INFORM (em_id, guest_id)
values (420420585, 4192795);
insert into INFORM (em_id, guest_id)
values (420420585, 822620628);
insert into INFORM (em_id, guest_id)
values (423684463, 268278586);
insert into INFORM (em_id, guest_id)
values (423967725, 766855103);
insert into INFORM (em_id, guest_id)
values (424601787, 94566420);
insert into INFORM (em_id, guest_id)
values (424601787, 677650301);
insert into INFORM (em_id, guest_id)
values (426786479, 236336194);
insert into INFORM (em_id, guest_id)
values (426786479, 306494187);
insert into INFORM (em_id, guest_id)
values (426786479, 840425006);
insert into INFORM (em_id, guest_id)
values (431922813, 112756689);
insert into INFORM (em_id, guest_id)
values (431922813, 550597527);
insert into INFORM (em_id, guest_id)
values (450177304, 900745867);
insert into INFORM (em_id, guest_id)
values (452937229, 25891153);
insert into INFORM (em_id, guest_id)
values (452937229, 313345242);
insert into INFORM (em_id, guest_id)
values (452937229, 394921378);
insert into INFORM (em_id, guest_id)
values (459550168, 586728337);
insert into INFORM (em_id, guest_id)
values (459550168, 639383822);
insert into INFORM (em_id, guest_id)
values (459550168, 925514152);
insert into INFORM (em_id, guest_id)
values (461423109, 419327765);
insert into INFORM (em_id, guest_id)
values (475529168, 488321919);
insert into INFORM (em_id, guest_id)
values (476246719, 614580140);
insert into INFORM (em_id, guest_id)
values (476246719, 814540938);
insert into INFORM (em_id, guest_id)
values (477036241, 155712522);
insert into INFORM (em_id, guest_id)
values (477663053, 33478448);
insert into INFORM (em_id, guest_id)
values (477663053, 682925873);
insert into INFORM (em_id, guest_id)
values (477663053, 703485110);
insert into INFORM (em_id, guest_id)
values (477692548, 437808690);
insert into INFORM (em_id, guest_id)
values (477692548, 820070154);
insert into INFORM (em_id, guest_id)
values (498820251, 301650658);
insert into INFORM (em_id, guest_id)
values (518835241, 682925873);
insert into INFORM (em_id, guest_id)
values (519836665, 36505847);
insert into INFORM (em_id, guest_id)
values (524670562, 642152630);
insert into INFORM (em_id, guest_id)
values (525503259, 360902723);
insert into INFORM (em_id, guest_id)
values (533940142, 98168072);
insert into INFORM (em_id, guest_id)
values (533940142, 140291562);
insert into INFORM (em_id, guest_id)
values (536496809, 694978269);
insert into INFORM (em_id, guest_id)
values (547926306, 356334592);
insert into INFORM (em_id, guest_id)
values (555162069, 686816902);
insert into INFORM (em_id, guest_id)
values (556894465, 741735622);
insert into INFORM (em_id, guest_id)
values (561418271, 929382144);
insert into INFORM (em_id, guest_id)
values (573212448, 233509850);
insert into INFORM (em_id, guest_id)
values (574141906, 149604833);
insert into INFORM (em_id, guest_id)
values (574141906, 246324249);
insert into INFORM (em_id, guest_id)
values (578645108, 316034762);
insert into INFORM (em_id, guest_id)
values (579127292, 158644684);
insert into INFORM (em_id, guest_id)
values (582736834, 702225081);
insert into INFORM (em_id, guest_id)
values (582981637, 84937489);
insert into INFORM (em_id, guest_id)
values (582981637, 925999241);
insert into INFORM (em_id, guest_id)
values (589127937, 300129768);
insert into INFORM (em_id, guest_id)
values (589127937, 511459338);
insert into INFORM (em_id, guest_id)
values (589301821, 419630680);
insert into INFORM (em_id, guest_id)
values (589301821, 574019692);
insert into INFORM (em_id, guest_id)
values (590038744, 766945227);
insert into INFORM (em_id, guest_id)
values (592893787, 294955133);
insert into INFORM (em_id, guest_id)
values (592893787, 929114656);
insert into INFORM (em_id, guest_id)
values (592893787, 965378605);
insert into INFORM (em_id, guest_id)
values (604301629, 1396149);
insert into INFORM (em_id, guest_id)
values (616424937, 15898046);
insert into INFORM (em_id, guest_id)
values (616424937, 412181730);
insert into INFORM (em_id, guest_id)
values (616424937, 575479472);
insert into INFORM (em_id, guest_id)
values (617456121, 52951373);
insert into INFORM (em_id, guest_id)
values (617456121, 115305675);
insert into INFORM (em_id, guest_id)
values (619048401, 943456742);
insert into INFORM (em_id, guest_id)
values (619863148, 133998877);
insert into INFORM (em_id, guest_id)
values (619863148, 325919091);
insert into INFORM (em_id, guest_id)
values (619863148, 920930141);
insert into INFORM (em_id, guest_id)
values (624290612, 459094322);
insert into INFORM (em_id, guest_id)
values (625019851, 112727921);
insert into INFORM (em_id, guest_id)
values (631159996, 51527747);
insert into INFORM (em_id, guest_id)
values (638974516, 97993488);
insert into INFORM (em_id, guest_id)
values (643514053, 15959727);
insert into INFORM (em_id, guest_id)
values (643514053, 217960251);
insert into INFORM (em_id, guest_id)
values (649274470, 541100519);
insert into INFORM (em_id, guest_id)
values (649429017, 540309628);
insert into INFORM (em_id, guest_id)
values (666252932, 436359729);
insert into INFORM (em_id, guest_id)
values (666252932, 872015678);
insert into INFORM (em_id, guest_id)
values (671529549, 308779289);
insert into INFORM (em_id, guest_id)
values (672771740, 231689950);
insert into INFORM (em_id, guest_id)
values (673079881, 775276020);
insert into INFORM (em_id, guest_id)
values (676463686, 377718868);
insert into INFORM (em_id, guest_id)
values (676463686, 844228581);
insert into INFORM (em_id, guest_id)
values (679191015, 289833124);
insert into INFORM (em_id, guest_id)
values (681848924, 12002712);
insert into INFORM (em_id, guest_id)
values (681848924, 506253901);
insert into INFORM (em_id, guest_id)
values (693610267, 988001390);
insert into INFORM (em_id, guest_id)
values (702231188, 417330284);
insert into INFORM (em_id, guest_id)
values (705906811, 783933452);
insert into INFORM (em_id, guest_id)
values (705906811, 869068786);
insert into INFORM (em_id, guest_id)
values (714536128, 490295282);
insert into INFORM (em_id, guest_id)
values (714536128, 672884778);
insert into INFORM (em_id, guest_id)
values (715374790, 360753417);
insert into INFORM (em_id, guest_id)
values (715374790, 689965872);
insert into INFORM (em_id, guest_id)
values (717106749, 646294342);
commit;
prompt 200 records committed...
insert into INFORM (em_id, guest_id)
values (717106749, 702119967);
insert into INFORM (em_id, guest_id)
values (717106749, 812588537);
insert into INFORM (em_id, guest_id)
values (721248833, 809700027);
insert into INFORM (em_id, guest_id)
values (724531712, 812588537);
insert into INFORM (em_id, guest_id)
values (729794325, 512976318);
insert into INFORM (em_id, guest_id)
values (729794325, 585526082);
insert into INFORM (em_id, guest_id)
values (729794325, 836958309);
insert into INFORM (em_id, guest_id)
values (733833797, 548178067);
insert into INFORM (em_id, guest_id)
values (746713885, 117058091);
insert into INFORM (em_id, guest_id)
values (750287353, 578737286);
insert into INFORM (em_id, guest_id)
values (750287353, 619496339);
insert into INFORM (em_id, guest_id)
values (750287353, 721516923);
insert into INFORM (em_id, guest_id)
values (762974855, 2857898);
insert into INFORM (em_id, guest_id)
values (762974855, 707847577);
insert into INFORM (em_id, guest_id)
values (765357442, 32882149);
insert into INFORM (em_id, guest_id)
values (765357442, 629950329);
insert into INFORM (em_id, guest_id)
values (765357442, 639383822);
insert into INFORM (em_id, guest_id)
values (765478343, 487531615);
insert into INFORM (em_id, guest_id)
values (765478343, 498599129);
insert into INFORM (em_id, guest_id)
values (766741215, 43561107);
insert into INFORM (em_id, guest_id)
values (766741215, 524565161);
insert into INFORM (em_id, guest_id)
values (768175040, 268278586);
insert into INFORM (em_id, guest_id)
values (768175040, 892936953);
insert into INFORM (em_id, guest_id)
values (769239384, 780602171);
insert into INFORM (em_id, guest_id)
values (770618703, 335912518);
insert into INFORM (em_id, guest_id)
values (770618703, 432145983);
insert into INFORM (em_id, guest_id)
values (774234336, 616966685);
insert into INFORM (em_id, guest_id)
values (774234336, 782567954);
insert into INFORM (em_id, guest_id)
values (774234336, 939690145);
insert into INFORM (em_id, guest_id)
values (774273855, 625840894);
insert into INFORM (em_id, guest_id)
values (774273855, 732771935);
insert into INFORM (em_id, guest_id)
values (774653648, 158644684);
insert into INFORM (em_id, guest_id)
values (783453192, 441026372);
insert into INFORM (em_id, guest_id)
values (784902638, 667816831);
insert into INFORM (em_id, guest_id)
values (791214599, 57057664);
insert into INFORM (em_id, guest_id)
values (791214599, 619322937);
insert into INFORM (em_id, guest_id)
values (794153511, 337147026);
insert into INFORM (em_id, guest_id)
values (794153511, 355056278);
insert into INFORM (em_id, guest_id)
values (795413328, 437808690);
insert into INFORM (em_id, guest_id)
values (795413328, 535649481);
insert into INFORM (em_id, guest_id)
values (801649896, 186616883);
insert into INFORM (em_id, guest_id)
values (817541888, 123518441);
insert into INFORM (em_id, guest_id)
values (817541888, 336885222);
insert into INFORM (em_id, guest_id)
values (817541888, 953454618);
insert into INFORM (em_id, guest_id)
values (818315238, 766531363);
insert into INFORM (em_id, guest_id)
values (818315238, 899893645);
insert into INFORM (em_id, guest_id)
values (826078406, 82049226);
insert into INFORM (em_id, guest_id)
values (826078406, 820779695);
insert into INFORM (em_id, guest_id)
values (833682521, 170759957);
insert into INFORM (em_id, guest_id)
values (840318660, 988001390);
insert into INFORM (em_id, guest_id)
values (841097188, 930931397);
insert into INFORM (em_id, guest_id)
values (843214944, 313961966);
insert into INFORM (em_id, guest_id)
values (847214868, 300688294);
insert into INFORM (em_id, guest_id)
values (852821102, 188658855);
insert into INFORM (em_id, guest_id)
values (852821102, 644702328);
insert into INFORM (em_id, guest_id)
values (852821102, 900443642);
insert into INFORM (em_id, guest_id)
values (852821102, 965378605);
insert into INFORM (em_id, guest_id)
values (853727944, 533109136);
insert into INFORM (em_id, guest_id)
values (861303903, 630633714);
insert into INFORM (em_id, guest_id)
values (865681239, 240363167);
insert into INFORM (em_id, guest_id)
values (865681239, 754061026);
insert into INFORM (em_id, guest_id)
values (865788939, 184886653);
insert into INFORM (em_id, guest_id)
values (870641370, 880191755);
insert into INFORM (em_id, guest_id)
values (873868662, 186616883);
insert into INFORM (em_id, guest_id)
values (873911959, 420661845);
insert into INFORM (em_id, guest_id)
values (895738147, 242082772);
insert into INFORM (em_id, guest_id)
values (899339270, 216747431);
insert into INFORM (em_id, guest_id)
values (905695294, 86148440);
insert into INFORM (em_id, guest_id)
values (905695294, 554952007);
insert into INFORM (em_id, guest_id)
values (905695294, 630633714);
insert into INFORM (em_id, guest_id)
values (905695294, 820070154);
insert into INFORM (em_id, guest_id)
values (911796368, 18618685);
insert into INFORM (em_id, guest_id)
values (920632781, 57057664);
insert into INFORM (em_id, guest_id)
values (920632781, 523132035);
insert into INFORM (em_id, guest_id)
values (920632781, 827901595);
insert into INFORM (em_id, guest_id)
values (928545381, 964895751);
insert into INFORM (em_id, guest_id)
values (937049426, 677227199);
insert into INFORM (em_id, guest_id)
values (942345154, 51031485);
insert into INFORM (em_id, guest_id)
values (942345154, 401079390);
insert into INFORM (em_id, guest_id)
values (942345154, 524565161);
insert into INFORM (em_id, guest_id)
values (942345154, 825225057);
insert into INFORM (em_id, guest_id)
values (942345154, 844228581);
insert into INFORM (em_id, guest_id)
values (944963557, 322240297);
insert into INFORM (em_id, guest_id)
values (944963557, 358778389);
insert into INFORM (em_id, guest_id)
values (944963557, 933894141);
insert into INFORM (em_id, guest_id)
values (959533473, 296276986);
insert into INFORM (em_id, guest_id)
values (959533473, 342621082);
insert into INFORM (em_id, guest_id)
values (959533473, 775720063);
insert into INFORM (em_id, guest_id)
values (970571233, 866202787);
insert into INFORM (em_id, guest_id)
values (970571233, 939126537);
insert into INFORM (em_id, guest_id)
values (973621996, 158357659);
insert into INFORM (em_id, guest_id)
values (973621996, 524736554);
insert into INFORM (em_id, guest_id)
values (973621996, 751065784);
insert into INFORM (em_id, guest_id)
values (975300652, 983801413);
insert into INFORM (em_id, guest_id)
values (983207552, 487691089);
insert into INFORM (em_id, guest_id)
values (983242828, 33762037);
insert into INFORM (em_id, guest_id)
values (983242828, 289957147);
insert into INFORM (em_id, guest_id)
values (983242828, 490312661);
insert into INFORM (em_id, guest_id)
values (993826957, 215809211);
insert into INFORM (em_id, guest_id)
values (999433826, 76422842);
commit;
prompt 300 records loaded
prompt Loading RECEPTIONIST...
insert into RECEPTIONIST (em_id, shift, lang)
values (750200121, 'Evening', 'Bosnian');
insert into RECEPTIONIST (em_id, shift, lang)
values (507895090, 'Night', 'MÄori');
insert into RECEPTIONIST (em_id, shift, lang)
values (838491698, 'Morning', 'Tok Pisin');
insert into RECEPTIONIST (em_id, shift, lang)
values (602194268, 'Morning', 'Kashmiri');
insert into RECEPTIONIST (em_id, shift, lang)
values (284359297, 'Night', 'Tamil');
insert into RECEPTIONIST (em_id, shift, lang)
values (153241174, 'Evening', 'Hebrew');
insert into RECEPTIONIST (em_id, shift, lang)
values (5145747, 'Morning', 'Albanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (217203442, 'Morning', 'Swahili');
insert into RECEPTIONIST (em_id, shift, lang)
values (611127729, 'Morning', 'Punjabi');
insert into RECEPTIONIST (em_id, shift, lang)
values (656069837, 'Night', 'Ndebele');
insert into RECEPTIONIST (em_id, shift, lang)
values (825541986, 'Evening', 'Assamese');
insert into RECEPTIONIST (em_id, shift, lang)
values (825896842, 'Night', 'English');
insert into RECEPTIONIST (em_id, shift, lang)
values (552251003, 'Night', 'Hebrew');
insert into RECEPTIONIST (em_id, shift, lang)
values (450037767, 'Morning', 'Catalan');
insert into RECEPTIONIST (em_id, shift, lang)
values (795991899, 'Night', 'Croatian');
insert into RECEPTIONIST (em_id, shift, lang)
values (104098064, 'Evening', 'Bislama');
insert into RECEPTIONIST (em_id, shift, lang)
values (779367460, 'Morning', 'Japanese');
insert into RECEPTIONIST (em_id, shift, lang)
values (229615740, 'Night', 'Belarusian');
insert into RECEPTIONIST (em_id, shift, lang)
values (213954003, 'Night', 'Hiri Motu');
insert into RECEPTIONIST (em_id, shift, lang)
values (179391023, 'Night', 'Azeri');
insert into RECEPTIONIST (em_id, shift, lang)
values (402205007, 'Evening', 'Georgian');
insert into RECEPTIONIST (em_id, shift, lang)
values (850817402, 'Evening', 'Finnish');
insert into RECEPTIONIST (em_id, shift, lang)
values (689999565, 'Evening', 'Pashto');
insert into RECEPTIONIST (em_id, shift, lang)
values (270924940, 'Evening', 'Arabic');
insert into RECEPTIONIST (em_id, shift, lang)
values (498155036, 'Evening', 'Quechua');
insert into RECEPTIONIST (em_id, shift, lang)
values (543257923, 'Night', 'Irish Gaelic');
insert into RECEPTIONIST (em_id, shift, lang)
values (736118185, 'Morning', 'Khmer');
insert into RECEPTIONIST (em_id, shift, lang)
values (771231041, 'Evening', 'Bulgarian');
insert into RECEPTIONIST (em_id, shift, lang)
values (188147669, 'Night', 'Filipino');
insert into RECEPTIONIST (em_id, shift, lang)
values (86156727, 'Evening', 'Polish');
insert into RECEPTIONIST (em_id, shift, lang)
values (370269659, 'Morning', 'Bengali');
insert into RECEPTIONIST (em_id, shift, lang)
values (523666684, 'Morning', 'Tamil');
insert into RECEPTIONIST (em_id, shift, lang)
values (141420133, 'Morning', 'Hindi');
insert into RECEPTIONIST (em_id, shift, lang)
values (547676914, 'Night', 'Tamil');
insert into RECEPTIONIST (em_id, shift, lang)
values (888330861, 'Morning', 'Danish');
insert into RECEPTIONIST (em_id, shift, lang)
values (658564281, 'Evening', 'Estonian');
insert into RECEPTIONIST (em_id, shift, lang)
values (802809781, 'Morning', 'Dutch');
insert into RECEPTIONIST (em_id, shift, lang)
values (835190007, 'Evening', 'Tswana');
insert into RECEPTIONIST (em_id, shift, lang)
values (546641058, 'Evening', 'Lithuanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (283601196, 'Morning', 'German');
insert into RECEPTIONIST (em_id, shift, lang)
values (170769951, 'Morning', 'Arabic');
insert into RECEPTIONIST (em_id, shift, lang)
values (276484140, 'Evening', 'Macedonian');
insert into RECEPTIONIST (em_id, shift, lang)
values (794922762, 'Evening', 'Yiddish');
insert into RECEPTIONIST (em_id, shift, lang)
values (88263254, 'Evening', 'Italian');
insert into RECEPTIONIST (em_id, shift, lang)
values (206288356, 'Evening', 'French');
insert into RECEPTIONIST (em_id, shift, lang)
values (890715596, 'Morning', 'Burmese');
insert into RECEPTIONIST (em_id, shift, lang)
values (752540023, 'Night', 'Malay');
insert into RECEPTIONIST (em_id, shift, lang)
values (557511653, 'Night', 'Tsonga');
insert into RECEPTIONIST (em_id, shift, lang)
values (967121346, 'Night', 'French');
insert into RECEPTIONIST (em_id, shift, lang)
values (140762549, 'Night', 'Swahili');
insert into RECEPTIONIST (em_id, shift, lang)
values (736009235, 'Night', 'Northern Sotho');
insert into RECEPTIONIST (em_id, shift, lang)
values (686894254, 'Morning', 'Malay');
insert into RECEPTIONIST (em_id, shift, lang)
values (471725480, 'Night', 'West Frisian');
insert into RECEPTIONIST (em_id, shift, lang)
values (141140098, 'Night', 'Lithuanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (8379588, 'Evening', 'Afrikaans');
insert into RECEPTIONIST (em_id, shift, lang)
values (509519761, 'Night', 'Hebrew');
insert into RECEPTIONIST (em_id, shift, lang)
values (348201260, 'Night', 'Bislama');
insert into RECEPTIONIST (em_id, shift, lang)
values (839864465, 'Evening', 'Kyrgyz');
insert into RECEPTIONIST (em_id, shift, lang)
values (84503456, 'Morning', 'Punjabi');
insert into RECEPTIONIST (em_id, shift, lang)
values (136766109, 'Night', 'Georgian');
insert into RECEPTIONIST (em_id, shift, lang)
values (646600561, 'Morning', 'Lithuanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (32049351, 'Evening', 'English');
insert into RECEPTIONIST (em_id, shift, lang)
values (348955707, 'Morning', 'Malayalam');
insert into RECEPTIONIST (em_id, shift, lang)
values (326283524, 'Night', 'Polish');
insert into RECEPTIONIST (em_id, shift, lang)
values (200515695, 'Night', 'Thai');
insert into RECEPTIONIST (em_id, shift, lang)
values (393576903, 'Evening', 'Finnish');
insert into RECEPTIONIST (em_id, shift, lang)
values (809127048, 'Evening', 'Azeri');
insert into RECEPTIONIST (em_id, shift, lang)
values (89100606, 'Night', 'Arabic');
insert into RECEPTIONIST (em_id, shift, lang)
values (633601303, 'Night', 'Kyrgyz');
insert into RECEPTIONIST (em_id, shift, lang)
values (794115696, 'Night', 'Khmer');
insert into RECEPTIONIST (em_id, shift, lang)
values (770042193, 'Morning', 'Punjabi');
insert into RECEPTIONIST (em_id, shift, lang)
values (633205472, 'Night', 'Finnish');
insert into RECEPTIONIST (em_id, shift, lang)
values (294873316, 'Evening', 'Afrikaans');
insert into RECEPTIONIST (em_id, shift, lang)
values (892386761, 'Evening', 'Macedonian');
insert into RECEPTIONIST (em_id, shift, lang)
values (136612880, 'Morning', 'Tok Pisin');
insert into RECEPTIONIST (em_id, shift, lang)
values (595446095, 'Morning', 'Finnish');
insert into RECEPTIONIST (em_id, shift, lang)
values (716858810, 'Night', 'Pashto');
insert into RECEPTIONIST (em_id, shift, lang)
values (151191594, 'Morning', 'Mongolian');
insert into RECEPTIONIST (em_id, shift, lang)
values (199137043, 'Evening', 'Thai');
insert into RECEPTIONIST (em_id, shift, lang)
values (887282476, 'Evening', 'Lao');
insert into RECEPTIONIST (em_id, shift, lang)
values (339386425, 'Evening', 'Malayalam');
insert into RECEPTIONIST (em_id, shift, lang)
values (359618622, 'Morning', 'Malay');
insert into RECEPTIONIST (em_id, shift, lang)
values (440250930, 'Evening', 'Japanese');
insert into RECEPTIONIST (em_id, shift, lang)
values (952079976, 'Evening', 'Icelandic');
insert into RECEPTIONIST (em_id, shift, lang)
values (557186261, 'Night', 'French');
insert into RECEPTIONIST (em_id, shift, lang)
values (886558356, 'Morning', 'Bengali');
insert into RECEPTIONIST (em_id, shift, lang)
values (968219989, 'Morning', 'Oriya');
insert into RECEPTIONIST (em_id, shift, lang)
values (423866989, 'Morning', 'Telugu');
insert into RECEPTIONIST (em_id, shift, lang)
values (509167884, 'Evening', 'Greek');
insert into RECEPTIONIST (em_id, shift, lang)
values (141133895, 'Evening', 'Bulgarian');
insert into RECEPTIONIST (em_id, shift, lang)
values (415804946, 'Night', 'Papiamento');
insert into RECEPTIONIST (em_id, shift, lang)
values (617292974, 'Morning', 'Swedish');
insert into RECEPTIONIST (em_id, shift, lang)
values (366210712, 'Night', 'Yiddish');
insert into RECEPTIONIST (em_id, shift, lang)
values (896897649, 'Night', 'Finnish');
insert into RECEPTIONIST (em_id, shift, lang)
values (166021665, 'Evening', 'Gujarati');
insert into RECEPTIONIST (em_id, shift, lang)
values (778639839, 'Night', 'Oriya');
insert into RECEPTIONIST (em_id, shift, lang)
values (103914968, 'Morning', 'Lithuanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (178666074, 'Evening', 'Gujarati');
insert into RECEPTIONIST (em_id, shift, lang)
values (71273362, 'Morning', 'Romanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (254183134, 'Morning', 'Chinese');
commit;
prompt 100 records committed...
insert into RECEPTIONIST (em_id, shift, lang)
values (242497574, 'Night', 'Lao');
insert into RECEPTIONIST (em_id, shift, lang)
values (349532042, 'Night', 'Punjabi');
insert into RECEPTIONIST (em_id, shift, lang)
values (291412802, 'Evening', 'Tswana');
insert into RECEPTIONIST (em_id, shift, lang)
values (937893137, 'Night', 'Maltese');
insert into RECEPTIONIST (em_id, shift, lang)
values (356588438, 'Morning', 'Telugu');
insert into RECEPTIONIST (em_id, shift, lang)
values (228547715, 'Morning', 'Haitian Creole');
insert into RECEPTIONIST (em_id, shift, lang)
values (360390841, 'Night', 'Romanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (795287992, 'Evening', 'Armenian');
insert into RECEPTIONIST (em_id, shift, lang)
values (758394292, 'Morning', 'Korean');
insert into RECEPTIONIST (em_id, shift, lang)
values (666953605, 'Evening', 'Somali');
insert into RECEPTIONIST (em_id, shift, lang)
values (63614029, 'Night', 'Danish');
insert into RECEPTIONIST (em_id, shift, lang)
values (127821918, 'Morning', 'Swedish');
insert into RECEPTIONIST (em_id, shift, lang)
values (244587046, 'Night', 'Arabic');
insert into RECEPTIONIST (em_id, shift, lang)
values (152452318, 'Night', 'Romanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (343490255, 'Evening', 'Norwegian');
insert into RECEPTIONIST (em_id, shift, lang)
values (770253624, 'Morning', 'Tsonga');
insert into RECEPTIONIST (em_id, shift, lang)
values (752764983, 'Morning', 'Armenian');
insert into RECEPTIONIST (em_id, shift, lang)
values (118426724, 'Morning', 'Portuguese');
insert into RECEPTIONIST (em_id, shift, lang)
values (432069073, 'Night', 'Dari');
insert into RECEPTIONIST (em_id, shift, lang)
values (262380974, 'Morning', 'Tamil');
insert into RECEPTIONIST (em_id, shift, lang)
values (46651369, 'Morning', 'Dari');
insert into RECEPTIONIST (em_id, shift, lang)
values (751610687, 'Morning', 'Quechua');
insert into RECEPTIONIST (em_id, shift, lang)
values (78120681, 'Night', 'New Zealand Sign Language');
insert into RECEPTIONIST (em_id, shift, lang)
values (958142341, 'Night', 'German');
insert into RECEPTIONIST (em_id, shift, lang)
values (783717113, 'Evening', 'Pashto');
insert into RECEPTIONIST (em_id, shift, lang)
values (699496630, 'Evening', 'Marathi');
insert into RECEPTIONIST (em_id, shift, lang)
values (542329182, 'Night', 'Spanish');
insert into RECEPTIONIST (em_id, shift, lang)
values (541171572, 'Morning', 'Albanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (376570056, 'Morning', 'Dutch');
insert into RECEPTIONIST (em_id, shift, lang)
values (447456951, 'Morning', 'Dhivehi');
insert into RECEPTIONIST (em_id, shift, lang)
values (658535442, 'Evening', 'Greek');
insert into RECEPTIONIST (em_id, shift, lang)
values (196295696, 'Night', 'Kyrgyz');
insert into RECEPTIONIST (em_id, shift, lang)
values (995637522, 'Evening', 'Filipino');
insert into RECEPTIONIST (em_id, shift, lang)
values (155285136, 'Evening', 'Malayalam');
insert into RECEPTIONIST (em_id, shift, lang)
values (143131406, 'Morning', 'Tajik');
insert into RECEPTIONIST (em_id, shift, lang)
values (926670662, 'Morning', 'Fijian');
insert into RECEPTIONIST (em_id, shift, lang)
values (229526774, 'Night', 'Hebrew');
insert into RECEPTIONIST (em_id, shift, lang)
values (816591045, 'Evening', 'Tok Pisin');
insert into RECEPTIONIST (em_id, shift, lang)
values (25600113, 'Night', 'Portuguese');
insert into RECEPTIONIST (em_id, shift, lang)
values (670671149, 'Night', 'Azeri');
insert into RECEPTIONIST (em_id, shift, lang)
values (12943391, 'Night', 'Tswana');
insert into RECEPTIONIST (em_id, shift, lang)
values (980324985, 'Night', 'Bulgarian');
insert into RECEPTIONIST (em_id, shift, lang)
values (668074819, 'Morning', 'Hebrew');
insert into RECEPTIONIST (em_id, shift, lang)
values (75905856, 'Evening', 'Chinese');
insert into RECEPTIONIST (em_id, shift, lang)
values (617758551, 'Evening', 'Punjabi');
insert into RECEPTIONIST (em_id, shift, lang)
values (801031572, 'Evening', 'Belarusian');
insert into RECEPTIONIST (em_id, shift, lang)
values (251745122, 'Night', 'Moldovan');
insert into RECEPTIONIST (em_id, shift, lang)
values (976997166, 'Evening', 'Japanese');
insert into RECEPTIONIST (em_id, shift, lang)
values (71961495, 'Morning', 'Bislama');
insert into RECEPTIONIST (em_id, shift, lang)
values (744342438, 'Evening', 'Haitian Creole');
insert into RECEPTIONIST (em_id, shift, lang)
values (692812350, 'Evening', 'Ndebele');
insert into RECEPTIONIST (em_id, shift, lang)
values (285417351, 'Night', 'Tok Pisin');
insert into RECEPTIONIST (em_id, shift, lang)
values (716162130, 'Morning', 'Swahili');
insert into RECEPTIONIST (em_id, shift, lang)
values (286496076, 'Night', 'Dzongkha');
insert into RECEPTIONIST (em_id, shift, lang)
values (216049651, 'Night', 'Armenian');
insert into RECEPTIONIST (em_id, shift, lang)
values (313776915, 'Evening', 'Maltese');
insert into RECEPTIONIST (em_id, shift, lang)
values (746027242, 'Evening', 'Gujarati');
insert into RECEPTIONIST (em_id, shift, lang)
values (775391089, 'Evening', 'Thai');
insert into RECEPTIONIST (em_id, shift, lang)
values (387211420, 'Night', 'Macedonian');
insert into RECEPTIONIST (em_id, shift, lang)
values (147527730, 'Morning', 'Azeri');
insert into RECEPTIONIST (em_id, shift, lang)
values (686698590, 'Night', 'Punjabi');
insert into RECEPTIONIST (em_id, shift, lang)
values (255340449, 'Night', 'Zulu');
insert into RECEPTIONIST (em_id, shift, lang)
values (317878499, 'Morning', 'Lithuanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (569878396, 'Evening', 'Burmese');
insert into RECEPTIONIST (em_id, shift, lang)
values (210171934, 'Night', 'Khmer');
insert into RECEPTIONIST (em_id, shift, lang)
values (710066917, 'Night', 'Bislama');
insert into RECEPTIONIST (em_id, shift, lang)
values (36280567, 'Night', 'Maltese');
insert into RECEPTIONIST (em_id, shift, lang)
values (718740896, 'Morning', 'Spanish');
insert into RECEPTIONIST (em_id, shift, lang)
values (673475478, 'Evening', 'Romanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (279832793, 'Evening', 'Oriya');
insert into RECEPTIONIST (em_id, shift, lang)
values (604314036, 'Morning', 'Malagasy');
insert into RECEPTIONIST (em_id, shift, lang)
values (972191037, 'Night', 'Finnish');
insert into RECEPTIONIST (em_id, shift, lang)
values (338347764, 'Evening', 'Italian');
insert into RECEPTIONIST (em_id, shift, lang)
values (692856389, 'Evening', 'Dzongkha');
insert into RECEPTIONIST (em_id, shift, lang)
values (95131359, 'Morning', 'Lithuanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (885765470, 'Night', 'Amharic');
insert into RECEPTIONIST (em_id, shift, lang)
values (564180130, 'Morning', 'Chinese');
insert into RECEPTIONIST (em_id, shift, lang)
values (530192612, 'Morning', 'Mongolian');
insert into RECEPTIONIST (em_id, shift, lang)
values (569429189, 'Evening', 'Oriya');
insert into RECEPTIONIST (em_id, shift, lang)
values (79984886, 'Night', 'Aymara');
insert into RECEPTIONIST (em_id, shift, lang)
values (675645102, 'Evening', 'Romanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (762568462, 'Evening', 'Amharic');
insert into RECEPTIONIST (em_id, shift, lang)
values (725503953, 'Evening', 'Icelandic');
insert into RECEPTIONIST (em_id, shift, lang)
values (324375529, 'Night', 'Swedish');
insert into RECEPTIONIST (em_id, shift, lang)
values (419144040, 'Night', 'Bulgarian');
insert into RECEPTIONIST (em_id, shift, lang)
values (857634572, 'Evening', 'Malayalam');
insert into RECEPTIONIST (em_id, shift, lang)
values (211689744, 'Morning', 'Gagauz');
insert into RECEPTIONIST (em_id, shift, lang)
values (527339940, 'Evening', 'Macedonian');
insert into RECEPTIONIST (em_id, shift, lang)
values (380185536, 'Evening', 'Dzongkha');
insert into RECEPTIONIST (em_id, shift, lang)
values (622592331, 'Evening', 'Swedish');
insert into RECEPTIONIST (em_id, shift, lang)
values (312448494, 'Evening', 'Georgian');
insert into RECEPTIONIST (em_id, shift, lang)
values (258901645, 'Evening', 'Tok Pisin');
insert into RECEPTIONIST (em_id, shift, lang)
values (410105143, 'Morning', 'Malayalam');
insert into RECEPTIONIST (em_id, shift, lang)
values (836670970, 'Evening', 'Belarusian');
insert into RECEPTIONIST (em_id, shift, lang)
values (944840657, 'Night', 'Northern Sotho');
insert into RECEPTIONIST (em_id, shift, lang)
values (12638587, 'Morning', 'Polish');
insert into RECEPTIONIST (em_id, shift, lang)
values (915165531, 'Night', 'Thai');
insert into RECEPTIONIST (em_id, shift, lang)
values (433914048, 'Night', 'Hungarian');
insert into RECEPTIONIST (em_id, shift, lang)
values (92519490, 'Morning', 'Moldovan');
insert into RECEPTIONIST (em_id, shift, lang)
values (582743934, 'Morning', 'Kashmiri');
commit;
prompt 200 records committed...
insert into RECEPTIONIST (em_id, shift, lang)
values (446907807, 'Morning', 'West Frisian');
insert into RECEPTIONIST (em_id, shift, lang)
values (337896519, 'Night', 'Afrikaans');
insert into RECEPTIONIST (em_id, shift, lang)
values (995715649, 'Night', 'Czech');
insert into RECEPTIONIST (em_id, shift, lang)
values (568766870, 'Night', 'French');
insert into RECEPTIONIST (em_id, shift, lang)
values (266658796, 'Night', 'Latvian');
insert into RECEPTIONIST (em_id, shift, lang)
values (278839113, 'Night', 'Fijian');
insert into RECEPTIONIST (em_id, shift, lang)
values (896315385, 'Morning', 'Gagauz');
insert into RECEPTIONIST (em_id, shift, lang)
values (355249589, 'Morning', 'Sotho');
insert into RECEPTIONIST (em_id, shift, lang)
values (635027893, 'Morning', 'Thai');
insert into RECEPTIONIST (em_id, shift, lang)
values (74274374, 'Night', 'Aymara');
insert into RECEPTIONIST (em_id, shift, lang)
values (815386042, 'Evening', 'Hungarian');
insert into RECEPTIONIST (em_id, shift, lang)
values (204637922, 'Morning', 'Portuguese');
insert into RECEPTIONIST (em_id, shift, lang)
values (468288433, 'Morning', 'Lao');
insert into RECEPTIONIST (em_id, shift, lang)
values (351101580, 'Evening', 'Kannada');
insert into RECEPTIONIST (em_id, shift, lang)
values (596433578, 'Morning', 'Georgian');
insert into RECEPTIONIST (em_id, shift, lang)
values (9385231, 'Evening', 'Yiddish');
insert into RECEPTIONIST (em_id, shift, lang)
values (121118536, 'Morning', 'Icelandic');
insert into RECEPTIONIST (em_id, shift, lang)
values (221300694, 'Morning', 'Polish');
insert into RECEPTIONIST (em_id, shift, lang)
values (457971338, 'Night', 'Mongolian');
insert into RECEPTIONIST (em_id, shift, lang)
values (883311691, 'Evening', 'Kannada');
insert into RECEPTIONIST (em_id, shift, lang)
values (410846459, 'Night', 'Fijian');
insert into RECEPTIONIST (em_id, shift, lang)
values (509275607, 'Evening', 'West Frisian');
insert into RECEPTIONIST (em_id, shift, lang)
values (609136779, 'Morning', 'Armenian');
insert into RECEPTIONIST (em_id, shift, lang)
values (629672609, 'Morning', 'Amharic');
insert into RECEPTIONIST (em_id, shift, lang)
values (908126768, 'Evening', 'Mongolian');
insert into RECEPTIONIST (em_id, shift, lang)
values (573441687, 'Evening', 'Tajik');
insert into RECEPTIONIST (em_id, shift, lang)
values (885641852, 'Evening', 'Dzongkha');
insert into RECEPTIONIST (em_id, shift, lang)
values (269806568, 'Night', 'Swati');
insert into RECEPTIONIST (em_id, shift, lang)
values (890003369, 'Morning', 'GuaranÃ­');
insert into RECEPTIONIST (em_id, shift, lang)
values (144874633, 'Evening', 'Danish');
insert into RECEPTIONIST (em_id, shift, lang)
values (789430976, 'Morning', 'Hiri Motu');
insert into RECEPTIONIST (em_id, shift, lang)
values (935194922, 'Morning', 'Spanish');
insert into RECEPTIONIST (em_id, shift, lang)
values (465891024, 'Morning', 'Georgian');
insert into RECEPTIONIST (em_id, shift, lang)
values (913357506, 'Morning', 'Albanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (820249517, 'Evening', 'Khmer');
insert into RECEPTIONIST (em_id, shift, lang)
values (740363237, 'Night', 'English');
insert into RECEPTIONIST (em_id, shift, lang)
values (292815566, 'Morning', 'Assamese');
insert into RECEPTIONIST (em_id, shift, lang)
values (49968460, 'Evening', 'Gujarati');
insert into RECEPTIONIST (em_id, shift, lang)
values (518947468, 'Night', 'Amharic');
insert into RECEPTIONIST (em_id, shift, lang)
values (915926672, 'Evening', 'Punjabi');
insert into RECEPTIONIST (em_id, shift, lang)
values (894962236, 'Night', 'Khmer');
insert into RECEPTIONIST (em_id, shift, lang)
values (451316705, 'Night', 'German');
insert into RECEPTIONIST (em_id, shift, lang)
values (1543538, 'Morning', 'Tok Pisin');
insert into RECEPTIONIST (em_id, shift, lang)
values (441773370, 'Morning', 'Hungarian');
insert into RECEPTIONIST (em_id, shift, lang)
values (187734366, 'Evening', 'Tetum');
insert into RECEPTIONIST (em_id, shift, lang)
values (573284331, 'Night', 'Portuguese');
insert into RECEPTIONIST (em_id, shift, lang)
values (507410925, 'Morning', 'Persian');
insert into RECEPTIONIST (em_id, shift, lang)
values (374269823, 'Night', 'Kyrgyz');
insert into RECEPTIONIST (em_id, shift, lang)
values (718798626, 'Morning', 'Zulu');
insert into RECEPTIONIST (em_id, shift, lang)
values (819875448, 'Evening', 'French');
insert into RECEPTIONIST (em_id, shift, lang)
values (750450292, 'Morning', 'Lithuanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (363052948, 'Night', 'French');
insert into RECEPTIONIST (em_id, shift, lang)
values (158304491, 'Evening', 'Yiddish');
insert into RECEPTIONIST (em_id, shift, lang)
values (701956875, 'Evening', 'Indonesian');
insert into RECEPTIONIST (em_id, shift, lang)
values (750280357, 'Evening', 'Khmer');
insert into RECEPTIONIST (em_id, shift, lang)
values (628408315, 'Morning', 'French');
insert into RECEPTIONIST (em_id, shift, lang)
values (128545745, 'Night', 'Spanish');
insert into RECEPTIONIST (em_id, shift, lang)
values (825668146, 'Night', 'New Zealand Sign Language');
insert into RECEPTIONIST (em_id, shift, lang)
values (517634650, 'Night', 'Afrikaans');
insert into RECEPTIONIST (em_id, shift, lang)
values (890290774, 'Morning', 'Aymara');
insert into RECEPTIONIST (em_id, shift, lang)
values (548404580, 'Morning', 'Hiri Motu');
insert into RECEPTIONIST (em_id, shift, lang)
values (445298667, 'Night', 'Malayalam');
insert into RECEPTIONIST (em_id, shift, lang)
values (153670287, 'Night', 'Haitian Creole');
insert into RECEPTIONIST (em_id, shift, lang)
values (85272737, 'Evening', 'Spanish');
insert into RECEPTIONIST (em_id, shift, lang)
values (62733937, 'Night', 'Moldovan');
insert into RECEPTIONIST (em_id, shift, lang)
values (405226871, 'Morning', 'Armenian');
insert into RECEPTIONIST (em_id, shift, lang)
values (422957628, 'Morning', 'Punjabi');
insert into RECEPTIONIST (em_id, shift, lang)
values (252952088, 'Night', 'Telugu');
insert into RECEPTIONIST (em_id, shift, lang)
values (243172611, 'Morning', 'Nepali');
insert into RECEPTIONIST (em_id, shift, lang)
values (440772461, 'Morning', 'Hebrew');
insert into RECEPTIONIST (em_id, shift, lang)
values (445269041, 'Evening', 'Icelandic');
insert into RECEPTIONIST (em_id, shift, lang)
values (382318427, 'Morning', 'Romanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (357844780, 'Evening', 'Malagasy');
insert into RECEPTIONIST (em_id, shift, lang)
values (855522077, 'Night', 'Quechua');
insert into RECEPTIONIST (em_id, shift, lang)
values (162227499, 'Morning', 'Swedish');
insert into RECEPTIONIST (em_id, shift, lang)
values (579001671, 'Morning', 'Norwegian');
insert into RECEPTIONIST (em_id, shift, lang)
values (844365450, 'Night', 'Pashto');
insert into RECEPTIONIST (em_id, shift, lang)
values (227485160, 'Morning', 'Kurdish');
insert into RECEPTIONIST (em_id, shift, lang)
values (707132487, 'Evening', 'Burmese');
insert into RECEPTIONIST (em_id, shift, lang)
values (646974723, 'Morning', 'Khmer');
insert into RECEPTIONIST (em_id, shift, lang)
values (635662386, 'Night', 'Pashto');
insert into RECEPTIONIST (em_id, shift, lang)
values (378488167, 'Night', 'Kannada');
insert into RECEPTIONIST (em_id, shift, lang)
values (983757891, 'Morning', 'Kyrgyz');
insert into RECEPTIONIST (em_id, shift, lang)
values (103902646, 'Morning', 'Pashto');
insert into RECEPTIONIST (em_id, shift, lang)
values (718802548, 'Night', 'Hiri Motu');
insert into RECEPTIONIST (em_id, shift, lang)
values (427970187, 'Evening', 'Tsonga');
insert into RECEPTIONIST (em_id, shift, lang)
values (417081781, 'Evening', 'Fijian');
insert into RECEPTIONIST (em_id, shift, lang)
values (805225066, 'Morning', 'Persian');
insert into RECEPTIONIST (em_id, shift, lang)
values (684803812, 'Night', 'Pashto');
insert into RECEPTIONIST (em_id, shift, lang)
values (734196899, 'Night', 'Mongolian');
insert into RECEPTIONIST (em_id, shift, lang)
values (438430790, 'Night', 'Aymara');
insert into RECEPTIONIST (em_id, shift, lang)
values (874315634, 'Night', 'Afrikaans');
insert into RECEPTIONIST (em_id, shift, lang)
values (950506091, 'Night', 'Japanese');
insert into RECEPTIONIST (em_id, shift, lang)
values (117090238, 'Evening', 'German');
insert into RECEPTIONIST (em_id, shift, lang)
values (187484274, 'Evening', 'Irish Gaelic');
insert into RECEPTIONIST (em_id, shift, lang)
values (65925109, 'Evening', 'Quechua');
insert into RECEPTIONIST (em_id, shift, lang)
values (163507585, 'Evening', 'Kurdish');
insert into RECEPTIONIST (em_id, shift, lang)
values (728666532, 'Evening', 'Georgian');
insert into RECEPTIONIST (em_id, shift, lang)
values (787093235, 'Morning', 'Spanish');
insert into RECEPTIONIST (em_id, shift, lang)
values (177256205, 'Night', 'Pashto');
commit;
prompt 300 records committed...
insert into RECEPTIONIST (em_id, shift, lang)
values (475443309, 'Evening', 'Amharic');
insert into RECEPTIONIST (em_id, shift, lang)
values (895641532, 'Morning', 'Malagasy');
insert into RECEPTIONIST (em_id, shift, lang)
values (648829127, 'Evening', 'Norwegian');
insert into RECEPTIONIST (em_id, shift, lang)
values (648255483, 'Evening', 'Ndebele');
insert into RECEPTIONIST (em_id, shift, lang)
values (461714094, 'Morning', 'Kyrgyz');
insert into RECEPTIONIST (em_id, shift, lang)
values (674823260, 'Evening', 'Indonesian');
insert into RECEPTIONIST (em_id, shift, lang)
values (832448839, 'Morning', 'Malayalam');
insert into RECEPTIONIST (em_id, shift, lang)
values (687449545, 'Evening', 'Dari');
insert into RECEPTIONIST (em_id, shift, lang)
values (86118963, 'Night', 'Tswana');
insert into RECEPTIONIST (em_id, shift, lang)
values (718408998, 'Night', 'Yiddish');
insert into RECEPTIONIST (em_id, shift, lang)
values (651546201, 'Night', 'Japanese');
insert into RECEPTIONIST (em_id, shift, lang)
values (333421520, 'Morning', 'Italian');
insert into RECEPTIONIST (em_id, shift, lang)
values (73319693, 'Morning', 'Lithuanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (513852071, 'Night', 'Macedonian');
insert into RECEPTIONIST (em_id, shift, lang)
values (775851939, 'Evening', 'Tok Pisin');
insert into RECEPTIONIST (em_id, shift, lang)
values (517695961, 'Evening', 'Japanese');
insert into RECEPTIONIST (em_id, shift, lang)
values (125538621, 'Morning', 'Malayalam');
insert into RECEPTIONIST (em_id, shift, lang)
values (908122514, 'Night', 'Dari');
insert into RECEPTIONIST (em_id, shift, lang)
values (796939742, 'Morning', 'Sotho');
insert into RECEPTIONIST (em_id, shift, lang)
values (788436504, 'Morning', 'Thai');
insert into RECEPTIONIST (em_id, shift, lang)
values (268000963, 'Morning', 'Tamil');
insert into RECEPTIONIST (em_id, shift, lang)
values (501487636, 'Morning', 'Papiamento');
insert into RECEPTIONIST (em_id, shift, lang)
values (66135977, 'Evening', 'Swati');
insert into RECEPTIONIST (em_id, shift, lang)
values (121662109, 'Evening', 'Tetum');
insert into RECEPTIONIST (em_id, shift, lang)
values (705787767, 'Morning', 'Dari');
insert into RECEPTIONIST (em_id, shift, lang)
values (838539231, 'Evening', 'Telugu');
insert into RECEPTIONIST (em_id, shift, lang)
values (826859074, 'Night', 'Armenian');
insert into RECEPTIONIST (em_id, shift, lang)
values (416908680, 'Night', 'Belarusian');
insert into RECEPTIONIST (em_id, shift, lang)
values (328950838, 'Morning', 'Catalan');
insert into RECEPTIONIST (em_id, shift, lang)
values (211359005, 'Night', 'Estonian');
insert into RECEPTIONIST (em_id, shift, lang)
values (992664950, 'Morning', 'Ndebele');
insert into RECEPTIONIST (em_id, shift, lang)
values (944171827, 'Evening', 'Hindi');
insert into RECEPTIONIST (em_id, shift, lang)
values (249310996, 'Evening', 'Norwegian');
insert into RECEPTIONIST (em_id, shift, lang)
values (424240758, 'Evening', 'Gujarati');
insert into RECEPTIONIST (em_id, shift, lang)
values (598780758, 'Evening', 'Tswana');
insert into RECEPTIONIST (em_id, shift, lang)
values (845912900, 'Night', 'Georgian');
insert into RECEPTIONIST (em_id, shift, lang)
values (302549197, 'Evening', 'French');
insert into RECEPTIONIST (em_id, shift, lang)
values (440327900, 'Morning', 'Swahili');
insert into RECEPTIONIST (em_id, shift, lang)
values (13912645, 'Evening', 'Hebrew');
insert into RECEPTIONIST (em_id, shift, lang)
values (61071883, 'Evening', 'Estonian');
insert into RECEPTIONIST (em_id, shift, lang)
values (948482928, 'Night', 'Croatian');
insert into RECEPTIONIST (em_id, shift, lang)
values (615068764, 'Morning', 'Tamil');
insert into RECEPTIONIST (em_id, shift, lang)
values (192731092, 'Evening', 'Pashto');
insert into RECEPTIONIST (em_id, shift, lang)
values (350437713, 'Evening', 'Tsonga');
insert into RECEPTIONIST (em_id, shift, lang)
values (613574055, 'Night', 'Punjabi');
insert into RECEPTIONIST (em_id, shift, lang)
values (463175157, 'Night', 'Tswana');
insert into RECEPTIONIST (em_id, shift, lang)
values (714603536, 'Evening', 'Armenian');
insert into RECEPTIONIST (em_id, shift, lang)
values (329518955, 'Morning', 'Italian');
insert into RECEPTIONIST (em_id, shift, lang)
values (953949724, 'Night', 'Tajik');
insert into RECEPTIONIST (em_id, shift, lang)
values (978345655, 'Morning', 'Catalan');
insert into RECEPTIONIST (em_id, shift, lang)
values (855883192, 'Evening', 'Tetum');
insert into RECEPTIONIST (em_id, shift, lang)
values (762522269, 'Evening', 'Lao');
insert into RECEPTIONIST (em_id, shift, lang)
values (756653140, 'Night', 'Malay');
insert into RECEPTIONIST (em_id, shift, lang)
values (984350743, 'Evening', 'Fijian');
insert into RECEPTIONIST (em_id, shift, lang)
values (636858414, 'Night', 'Ndebele');
insert into RECEPTIONIST (em_id, shift, lang)
values (236653050, 'Morning', 'Fijian');
insert into RECEPTIONIST (em_id, shift, lang)
values (185926813, 'Night', 'Ndebele');
insert into RECEPTIONIST (em_id, shift, lang)
values (247837735, 'Evening', 'Croatian');
insert into RECEPTIONIST (em_id, shift, lang)
values (699864151, 'Morning', 'Mongolian');
insert into RECEPTIONIST (em_id, shift, lang)
values (844430650, 'Night', 'Dutch');
insert into RECEPTIONIST (em_id, shift, lang)
values (412258548, 'Evening', 'Kyrgyz');
insert into RECEPTIONIST (em_id, shift, lang)
values (205294997, 'Morning', 'Sotho');
insert into RECEPTIONIST (em_id, shift, lang)
values (458899046, 'Evening', 'Dhivehi');
insert into RECEPTIONIST (em_id, shift, lang)
values (636108167, 'Evening', 'Khmer');
insert into RECEPTIONIST (em_id, shift, lang)
values (320257400, 'Night', 'Kyrgyz');
insert into RECEPTIONIST (em_id, shift, lang)
values (222801306, 'Night', 'Swedish');
insert into RECEPTIONIST (em_id, shift, lang)
values (522740512, 'Evening', 'Kashmiri');
insert into RECEPTIONIST (em_id, shift, lang)
values (949702702, 'Evening', 'Romanian');
insert into RECEPTIONIST (em_id, shift, lang)
values (923536778, 'Evening', 'Zulu');
insert into RECEPTIONIST (em_id, shift, lang)
values (388996575, 'Night', 'Bislama');
insert into RECEPTIONIST (em_id, shift, lang)
values (691502586, 'Night', 'Swahili');
insert into RECEPTIONIST (em_id, shift, lang)
values (814503339, 'Night', 'Bislama');
insert into RECEPTIONIST (em_id, shift, lang)
values (237165544, 'Morning', 'Macedonian');
insert into RECEPTIONIST (em_id, shift, lang)
values (684968117, 'Morning', 'Tswana');
insert into RECEPTIONIST (em_id, shift, lang)
values (284848175, 'Night', 'Amharic');
insert into RECEPTIONIST (em_id, shift, lang)
values (139099038, 'Night', 'Latvian');
insert into RECEPTIONIST (em_id, shift, lang)
values (731142515, 'Night', 'Azeri');
insert into RECEPTIONIST (em_id, shift, lang)
values (236775278, 'Morning', 'Swati');
insert into RECEPTIONIST (em_id, shift, lang)
values (470607412, 'Night', 'Moldovan');
insert into RECEPTIONIST (em_id, shift, lang)
values (773945524, 'Morning', 'Assamese');
insert into RECEPTIONIST (em_id, shift, lang)
values (864900732, 'Night', 'Zulu');
insert into RECEPTIONIST (em_id, shift, lang)
values (589872419, 'Night', 'Korean');
insert into RECEPTIONIST (em_id, shift, lang)
values (296973061, 'Evening', 'Bengali');
insert into RECEPTIONIST (em_id, shift, lang)
values (519481550, 'Night', 'Yiddish');
insert into RECEPTIONIST (em_id, shift, lang)
values (485698844, 'Night', 'Yiddish');
insert into RECEPTIONIST (em_id, shift, lang)
values (770159297, 'Night', 'Amharic');
insert into RECEPTIONIST (em_id, shift, lang)
values (607574361, 'Evening', 'Bosnian');
insert into RECEPTIONIST (em_id, shift, lang)
values (836579011, 'Night', 'Spanish');
insert into RECEPTIONIST (em_id, shift, lang)
values (621782285, 'Night', 'Kyrgyz');
insert into RECEPTIONIST (em_id, shift, lang)
values (787373986, 'Evening', 'Montenegrin');
insert into RECEPTIONIST (em_id, shift, lang)
values (243145366, 'Night', 'Bulgarian');
insert into RECEPTIONIST (em_id, shift, lang)
values (324539265, 'Evening', 'Malayalam');
insert into RECEPTIONIST (em_id, shift, lang)
values (201391316, 'Night', 'Oriya');
insert into RECEPTIONIST (em_id, shift, lang)
values (867142561, 'Night', 'English');
commit;
prompt 394 records loaded
prompt Loading REQUEST...
insert into REQUEST (guest_id, room_number)
values (2857898, 245);
insert into REQUEST (guest_id, room_number)
values (2857898, 423);
insert into REQUEST (guest_id, room_number)
values (3298276, 342);
insert into REQUEST (guest_id, room_number)
values (4192795, 223);
insert into REQUEST (guest_id, room_number)
values (4893073, 432);
insert into REQUEST (guest_id, room_number)
values (5626957, 280);
insert into REQUEST (guest_id, room_number)
values (5626957, 667);
insert into REQUEST (guest_id, room_number)
values (10342911, 251);
insert into REQUEST (guest_id, room_number)
values (12227669, 144);
insert into REQUEST (guest_id, room_number)
values (13638529, 176);
insert into REQUEST (guest_id, room_number)
values (18697101, 25);
insert into REQUEST (guest_id, room_number)
values (27337730, 172);
insert into REQUEST (guest_id, room_number)
values (31428778, 595);
insert into REQUEST (guest_id, room_number)
values (33478448, 326);
insert into REQUEST (guest_id, room_number)
values (33478448, 438);
insert into REQUEST (guest_id, room_number)
values (36505847, 8);
insert into REQUEST (guest_id, room_number)
values (36505847, 186);
insert into REQUEST (guest_id, room_number)
values (36505847, 541);
insert into REQUEST (guest_id, room_number)
values (41324453, 92);
insert into REQUEST (guest_id, room_number)
values (43561107, 214);
insert into REQUEST (guest_id, room_number)
values (44304219, 318);
insert into REQUEST (guest_id, room_number)
values (44465715, 260);
insert into REQUEST (guest_id, room_number)
values (44465715, 414);
insert into REQUEST (guest_id, room_number)
values (46687190, 2);
insert into REQUEST (guest_id, room_number)
values (48751690, 265);
insert into REQUEST (guest_id, room_number)
values (50979660, 174);
insert into REQUEST (guest_id, room_number)
values (51003258, 383);
insert into REQUEST (guest_id, room_number)
values (51527747, 410);
insert into REQUEST (guest_id, room_number)
values (53329006, 227);
insert into REQUEST (guest_id, room_number)
values (53329006, 531);
insert into REQUEST (guest_id, room_number)
values (53329006, 637);
insert into REQUEST (guest_id, room_number)
values (60744916, 177);
insert into REQUEST (guest_id, room_number)
values (62968273, 280);
insert into REQUEST (guest_id, room_number)
values (64736067, 355);
insert into REQUEST (guest_id, room_number)
values (70435672, 633);
insert into REQUEST (guest_id, room_number)
values (75542571, 594);
insert into REQUEST (guest_id, room_number)
values (76422842, 546);
insert into REQUEST (guest_id, room_number)
values (83725273, 522);
insert into REQUEST (guest_id, room_number)
values (83725273, 694);
insert into REQUEST (guest_id, room_number)
values (84149896, 449);
insert into REQUEST (guest_id, room_number)
values (84937489, 96);
insert into REQUEST (guest_id, room_number)
values (84937489, 336);
insert into REQUEST (guest_id, room_number)
values (84937489, 436);
insert into REQUEST (guest_id, room_number)
values (86661404, 523);
insert into REQUEST (guest_id, room_number)
values (89349836, 93);
insert into REQUEST (guest_id, room_number)
values (95063677, 289);
insert into REQUEST (guest_id, room_number)
values (96329222, 520);
insert into REQUEST (guest_id, room_number)
values (98290342, 45);
insert into REQUEST (guest_id, room_number)
values (101425911, 66);
insert into REQUEST (guest_id, room_number)
values (107056788, 531);
insert into REQUEST (guest_id, room_number)
values (107056788, 648);
insert into REQUEST (guest_id, room_number)
values (108944425, 458);
insert into REQUEST (guest_id, room_number)
values (112727921, 57);
insert into REQUEST (guest_id, room_number)
values (112727921, 587);
insert into REQUEST (guest_id, room_number)
values (112756689, 380);
insert into REQUEST (guest_id, room_number)
values (113066042, 356);
insert into REQUEST (guest_id, room_number)
values (116057021, 682);
insert into REQUEST (guest_id, room_number)
values (117058091, 542);
insert into REQUEST (guest_id, room_number)
values (124045879, 45);
insert into REQUEST (guest_id, room_number)
values (127479756, 521);
insert into REQUEST (guest_id, room_number)
values (144615441, 607);
insert into REQUEST (guest_id, room_number)
values (158357659, 127);
insert into REQUEST (guest_id, room_number)
values (159361012, 232);
insert into REQUEST (guest_id, room_number)
values (175052450, 641);
insert into REQUEST (guest_id, room_number)
values (178939047, 391);
insert into REQUEST (guest_id, room_number)
values (178939047, 644);
insert into REQUEST (guest_id, room_number)
values (184886653, 31);
insert into REQUEST (guest_id, room_number)
values (184886653, 74);
insert into REQUEST (guest_id, room_number)
values (186616883, 540);
insert into REQUEST (guest_id, room_number)
values (188658855, 241);
insert into REQUEST (guest_id, room_number)
values (188776074, 395);
insert into REQUEST (guest_id, room_number)
values (193479284, 273);
insert into REQUEST (guest_id, room_number)
values (195674427, 680);
insert into REQUEST (guest_id, room_number)
values (198437423, 72);
insert into REQUEST (guest_id, room_number)
values (198437423, 311);
insert into REQUEST (guest_id, room_number)
values (198753994, 671);
insert into REQUEST (guest_id, room_number)
values (200571988, 588);
insert into REQUEST (guest_id, room_number)
values (208298661, 675);
insert into REQUEST (guest_id, room_number)
values (208298661, 687);
insert into REQUEST (guest_id, room_number)
values (212470513, 675);
insert into REQUEST (guest_id, room_number)
values (214466955, 453);
insert into REQUEST (guest_id, room_number)
values (216971089, 560);
insert into REQUEST (guest_id, room_number)
values (217859613, 244);
insert into REQUEST (guest_id, room_number)
values (217859613, 485);
insert into REQUEST (guest_id, room_number)
values (233074711, 199);
insert into REQUEST (guest_id, room_number)
values (236280802, 414);
insert into REQUEST (guest_id, room_number)
values (236336194, 60);
insert into REQUEST (guest_id, room_number)
values (236336194, 449);
insert into REQUEST (guest_id, room_number)
values (237881862, 39);
insert into REQUEST (guest_id, room_number)
values (239682226, 181);
insert into REQUEST (guest_id, room_number)
values (240720425, 542);
insert into REQUEST (guest_id, room_number)
values (240720425, 548);
insert into REQUEST (guest_id, room_number)
values (247593794, 606);
insert into REQUEST (guest_id, room_number)
values (248951167, 31);
insert into REQUEST (guest_id, room_number)
values (254972152, 116);
insert into REQUEST (guest_id, room_number)
values (261803388, 482);
insert into REQUEST (guest_id, room_number)
values (262822559, 171);
insert into REQUEST (guest_id, room_number)
values (265119280, 342);
insert into REQUEST (guest_id, room_number)
values (266687507, 492);
insert into REQUEST (guest_id, room_number)
values (268044474, 129);
commit;
prompt 100 records committed...
insert into REQUEST (guest_id, room_number)
values (268044474, 521);
insert into REQUEST (guest_id, room_number)
values (268044474, 541);
insert into REQUEST (guest_id, room_number)
values (268278586, 98);
insert into REQUEST (guest_id, room_number)
values (270808716, 489);
insert into REQUEST (guest_id, room_number)
values (272899495, 6);
insert into REQUEST (guest_id, room_number)
values (273836904, 661);
insert into REQUEST (guest_id, room_number)
values (275350122, 6);
insert into REQUEST (guest_id, room_number)
values (275350122, 120);
insert into REQUEST (guest_id, room_number)
values (276278048, 15);
insert into REQUEST (guest_id, room_number)
values (276278048, 297);
insert into REQUEST (guest_id, room_number)
values (276278048, 341);
insert into REQUEST (guest_id, room_number)
values (278947834, 169);
insert into REQUEST (guest_id, room_number)
values (282186141, 212);
insert into REQUEST (guest_id, room_number)
values (284862147, 147);
insert into REQUEST (guest_id, room_number)
values (289471751, 44);
insert into REQUEST (guest_id, room_number)
values (289833124, 119);
insert into REQUEST (guest_id, room_number)
values (292758151, 301);
insert into REQUEST (guest_id, room_number)
values (293806919, 565);
insert into REQUEST (guest_id, room_number)
values (295421736, 643);
insert into REQUEST (guest_id, room_number)
values (296276986, 376);
insert into REQUEST (guest_id, room_number)
values (296299402, 158);
insert into REQUEST (guest_id, room_number)
values (300129768, 10);
insert into REQUEST (guest_id, room_number)
values (300129768, 608);
insert into REQUEST (guest_id, room_number)
values (300129768, 641);
insert into REQUEST (guest_id, room_number)
values (301443611, 645);
insert into REQUEST (guest_id, room_number)
values (303063139, 628);
insert into REQUEST (guest_id, room_number)
values (303579252, 463);
insert into REQUEST (guest_id, room_number)
values (313961966, 125);
insert into REQUEST (guest_id, room_number)
values (315806874, 566);
insert into REQUEST (guest_id, room_number)
values (316034762, 127);
insert into REQUEST (guest_id, room_number)
values (316034762, 652);
insert into REQUEST (guest_id, room_number)
values (316034762, 686);
insert into REQUEST (guest_id, room_number)
values (320993503, 165);
insert into REQUEST (guest_id, room_number)
values (321174615, 131);
insert into REQUEST (guest_id, room_number)
values (321174615, 536);
insert into REQUEST (guest_id, room_number)
values (322240297, 94);
insert into REQUEST (guest_id, room_number)
values (325919091, 454);
insert into REQUEST (guest_id, room_number)
values (327909575, 636);
insert into REQUEST (guest_id, room_number)
values (337147026, 284);
insert into REQUEST (guest_id, room_number)
values (342621082, 203);
insert into REQUEST (guest_id, room_number)
values (342775988, 529);
insert into REQUEST (guest_id, room_number)
values (345543710, 604);
insert into REQUEST (guest_id, room_number)
values (346067054, 213);
insert into REQUEST (guest_id, room_number)
values (346067054, 419);
insert into REQUEST (guest_id, room_number)
values (358150371, 182);
insert into REQUEST (guest_id, room_number)
values (359010250, 347);
insert into REQUEST (guest_id, room_number)
values (359010250, 649);
insert into REQUEST (guest_id, room_number)
values (362794289, 78);
insert into REQUEST (guest_id, room_number)
values (362794289, 569);
insert into REQUEST (guest_id, room_number)
values (369594238, 610);
insert into REQUEST (guest_id, room_number)
values (370100164, 26);
insert into REQUEST (guest_id, room_number)
values (373854719, 449);
insert into REQUEST (guest_id, room_number)
values (373876324, 105);
insert into REQUEST (guest_id, room_number)
values (381174773, 182);
insert into REQUEST (guest_id, room_number)
values (381174773, 572);
insert into REQUEST (guest_id, room_number)
values (383404908, 553);
insert into REQUEST (guest_id, room_number)
values (387893781, 34);
insert into REQUEST (guest_id, room_number)
values (389943790, 157);
insert into REQUEST (guest_id, room_number)
values (389943790, 350);
insert into REQUEST (guest_id, room_number)
values (390943627, 152);
insert into REQUEST (guest_id, room_number)
values (390943627, 392);
insert into REQUEST (guest_id, room_number)
values (393469268, 125);
insert into REQUEST (guest_id, room_number)
values (394921378, 408);
insert into REQUEST (guest_id, room_number)
values (396179343, 121);
insert into REQUEST (guest_id, room_number)
values (396938920, 130);
insert into REQUEST (guest_id, room_number)
values (396938920, 573);
insert into REQUEST (guest_id, room_number)
values (399396234, 66);
insert into REQUEST (guest_id, room_number)
values (407794519, 132);
insert into REQUEST (guest_id, room_number)
values (412041638, 154);
insert into REQUEST (guest_id, room_number)
values (412041638, 578);
insert into REQUEST (guest_id, room_number)
values (412184279, 55);
insert into REQUEST (guest_id, room_number)
values (418448292, 99);
insert into REQUEST (guest_id, room_number)
values (418452768, 638);
insert into REQUEST (guest_id, room_number)
values (420311890, 219);
insert into REQUEST (guest_id, room_number)
values (420661845, 165);
insert into REQUEST (guest_id, room_number)
values (420927989, 75);
insert into REQUEST (guest_id, room_number)
values (421379614, 670);
insert into REQUEST (guest_id, room_number)
values (426957042, 259);
insert into REQUEST (guest_id, room_number)
values (427427003, 558);
insert into REQUEST (guest_id, room_number)
values (432611063, 2);
insert into REQUEST (guest_id, room_number)
values (433070647, 194);
insert into REQUEST (guest_id, room_number)
values (437808690, 298);
insert into REQUEST (guest_id, room_number)
values (445018524, 92);
insert into REQUEST (guest_id, room_number)
values (449275572, 391);
insert into REQUEST (guest_id, room_number)
values (464642111, 236);
insert into REQUEST (guest_id, room_number)
values (470914472, 118);
insert into REQUEST (guest_id, room_number)
values (473061533, 572);
insert into REQUEST (guest_id, room_number)
values (473061533, 598);
insert into REQUEST (guest_id, room_number)
values (476023236, 288);
insert into REQUEST (guest_id, room_number)
values (482005376, 513);
insert into REQUEST (guest_id, room_number)
values (484373323, 83);
insert into REQUEST (guest_id, room_number)
values (486704013, 298);
insert into REQUEST (guest_id, room_number)
values (486704013, 303);
insert into REQUEST (guest_id, room_number)
values (487531615, 440);
insert into REQUEST (guest_id, room_number)
values (488284443, 55);
insert into REQUEST (guest_id, room_number)
values (492461632, 530);
insert into REQUEST (guest_id, room_number)
values (492461632, 613);
insert into REQUEST (guest_id, room_number)
values (498951940, 143);
insert into REQUEST (guest_id, room_number)
values (499925094, 599);
insert into REQUEST (guest_id, room_number)
values (500715580, 176);
commit;
prompt 200 records committed...
insert into REQUEST (guest_id, room_number)
values (505035378, 117);
insert into REQUEST (guest_id, room_number)
values (505035378, 528);
insert into REQUEST (guest_id, room_number)
values (506377909, 357);
insert into REQUEST (guest_id, room_number)
values (511329433, 378);
insert into REQUEST (guest_id, room_number)
values (511459338, 380);
insert into REQUEST (guest_id, room_number)
values (511459338, 523);
insert into REQUEST (guest_id, room_number)
values (512475504, 441);
insert into REQUEST (guest_id, room_number)
values (514183516, 85);
insert into REQUEST (guest_id, room_number)
values (517536968, 112);
insert into REQUEST (guest_id, room_number)
values (517536968, 639);
insert into REQUEST (guest_id, room_number)
values (519412704, 333);
insert into REQUEST (guest_id, room_number)
values (523451806, 636);
insert into REQUEST (guest_id, room_number)
values (524565161, 54);
insert into REQUEST (guest_id, room_number)
values (524565161, 595);
insert into REQUEST (guest_id, room_number)
values (524736554, 202);
insert into REQUEST (guest_id, room_number)
values (533109136, 497);
insert into REQUEST (guest_id, room_number)
values (533472996, 136);
insert into REQUEST (guest_id, room_number)
values (535649481, 334);
insert into REQUEST (guest_id, room_number)
values (535649481, 667);
insert into REQUEST (guest_id, room_number)
values (539619029, 573);
insert into REQUEST (guest_id, room_number)
values (540309628, 381);
insert into REQUEST (guest_id, room_number)
values (542905475, 34);
insert into REQUEST (guest_id, room_number)
values (556202300, 593);
insert into REQUEST (guest_id, room_number)
values (566335051, 556);
insert into REQUEST (guest_id, room_number)
values (573376389, 251);
insert into REQUEST (guest_id, room_number)
values (574019692, 210);
insert into REQUEST (guest_id, room_number)
values (578076200, 357);
insert into REQUEST (guest_id, room_number)
values (578746202, 221);
insert into REQUEST (guest_id, room_number)
values (581395647, 193);
insert into REQUEST (guest_id, room_number)
values (583464144, 339);
insert into REQUEST (guest_id, room_number)
values (583464144, 407);
insert into REQUEST (guest_id, room_number)
values (583464144, 679);
insert into REQUEST (guest_id, room_number)
values (588614902, 500);
insert into REQUEST (guest_id, room_number)
values (591346237, 280);
insert into REQUEST (guest_id, room_number)
values (595922257, 309);
insert into REQUEST (guest_id, room_number)
values (600080684, 292);
insert into REQUEST (guest_id, room_number)
values (604312430, 127);
insert into REQUEST (guest_id, room_number)
values (604312430, 602);
insert into REQUEST (guest_id, room_number)
values (604314524, 574);
insert into REQUEST (guest_id, room_number)
values (606478972, 620);
insert into REQUEST (guest_id, room_number)
values (610398259, 102);
insert into REQUEST (guest_id, room_number)
values (610398259, 375);
insert into REQUEST (guest_id, room_number)
values (613226493, 129);
insert into REQUEST (guest_id, room_number)
values (613334540, 428);
insert into REQUEST (guest_id, room_number)
values (618703571, 458);
insert into REQUEST (guest_id, room_number)
values (619664665, 48);
insert into REQUEST (guest_id, room_number)
values (620639250, 176);
insert into REQUEST (guest_id, room_number)
values (620639250, 192);
insert into REQUEST (guest_id, room_number)
values (623452048, 498);
insert into REQUEST (guest_id, room_number)
values (624221074, 310);
insert into REQUEST (guest_id, room_number)
values (626639881, 334);
insert into REQUEST (guest_id, room_number)
values (634098291, 688);
insert into REQUEST (guest_id, room_number)
values (637473229, 13);
insert into REQUEST (guest_id, room_number)
values (637500348, 272);
insert into REQUEST (guest_id, room_number)
values (638881720, 284);
insert into REQUEST (guest_id, room_number)
values (643164813, 676);
insert into REQUEST (guest_id, room_number)
values (643895054, 135);
insert into REQUEST (guest_id, room_number)
values (648701220, 541);
insert into REQUEST (guest_id, room_number)
values (655273545, 609);
insert into REQUEST (guest_id, room_number)
values (655273545, 632);
insert into REQUEST (guest_id, room_number)
values (655348727, 17);
insert into REQUEST (guest_id, room_number)
values (655348727, 333);
insert into REQUEST (guest_id, room_number)
values (660239180, 672);
insert into REQUEST (guest_id, room_number)
values (666253530, 305);
insert into REQUEST (guest_id, room_number)
values (671362011, 37);
insert into REQUEST (guest_id, room_number)
values (673407336, 635);
insert into REQUEST (guest_id, room_number)
values (676188928, 270);
insert into REQUEST (guest_id, room_number)
values (676188928, 596);
insert into REQUEST (guest_id, room_number)
values (676829750, 677);
insert into REQUEST (guest_id, room_number)
values (677446448, 376);
insert into REQUEST (guest_id, room_number)
values (679355403, 534);
insert into REQUEST (guest_id, room_number)
values (681951092, 306);
insert into REQUEST (guest_id, room_number)
values (682508863, 557);
insert into REQUEST (guest_id, room_number)
values (682508863, 586);
insert into REQUEST (guest_id, room_number)
values (682925873, 10);
insert into REQUEST (guest_id, room_number)
values (682925873, 146);
insert into REQUEST (guest_id, room_number)
values (685077320, 536);
insert into REQUEST (guest_id, room_number)
values (686816902, 439);
insert into REQUEST (guest_id, room_number)
values (690114896, 162);
insert into REQUEST (guest_id, room_number)
values (693123424, 252);
insert into REQUEST (guest_id, room_number)
values (694978269, 349);
insert into REQUEST (guest_id, room_number)
values (696617440, 10);
insert into REQUEST (guest_id, room_number)
values (697548235, 515);
insert into REQUEST (guest_id, room_number)
values (699749179, 388);
insert into REQUEST (guest_id, room_number)
values (701630400, 247);
insert into REQUEST (guest_id, room_number)
values (701630400, 469);
insert into REQUEST (guest_id, room_number)
values (702119967, 230);
insert into REQUEST (guest_id, room_number)
values (706377025, 69);
insert into REQUEST (guest_id, room_number)
values (706847449, 317);
insert into REQUEST (guest_id, room_number)
values (707847577, 14);
insert into REQUEST (guest_id, room_number)
values (718313033, 96);
insert into REQUEST (guest_id, room_number)
values (718313033, 516);
insert into REQUEST (guest_id, room_number)
values (718475955, 653);
insert into REQUEST (guest_id, room_number)
values (718475955, 681);
insert into REQUEST (guest_id, room_number)
values (720747593, 697);
insert into REQUEST (guest_id, room_number)
values (729376590, 521);
insert into REQUEST (guest_id, room_number)
values (731429529, 542);
insert into REQUEST (guest_id, room_number)
values (740517841, 76);
insert into REQUEST (guest_id, room_number)
values (747597237, 612);
insert into REQUEST (guest_id, room_number)
values (750789404, 28);
commit;
prompt 300 records committed...
insert into REQUEST (guest_id, room_number)
values (750789404, 127);
insert into REQUEST (guest_id, room_number)
values (750789404, 134);
insert into REQUEST (guest_id, room_number)
values (765511772, 38);
insert into REQUEST (guest_id, room_number)
values (766416870, 422);
insert into REQUEST (guest_id, room_number)
values (766945227, 432);
insert into REQUEST (guest_id, room_number)
values (772536129, 68);
insert into REQUEST (guest_id, room_number)
values (775624090, 385);
insert into REQUEST (guest_id, room_number)
values (775624090, 636);
insert into REQUEST (guest_id, room_number)
values (775949856, 158);
insert into REQUEST (guest_id, room_number)
values (780602171, 233);
insert into REQUEST (guest_id, room_number)
values (783863063, 141);
insert into REQUEST (guest_id, room_number)
values (785721807, 103);
insert into REQUEST (guest_id, room_number)
values (785721807, 593);
insert into REQUEST (guest_id, room_number)
values (788085938, 141);
insert into REQUEST (guest_id, room_number)
values (791512667, 105);
insert into REQUEST (guest_id, room_number)
values (795871548, 8);
insert into REQUEST (guest_id, room_number)
values (798075804, 437);
insert into REQUEST (guest_id, room_number)
values (798076468, 391);
insert into REQUEST (guest_id, room_number)
values (798874886, 260);
insert into REQUEST (guest_id, room_number)
values (799039636, 326);
insert into REQUEST (guest_id, room_number)
values (801851413, 654);
insert into REQUEST (guest_id, room_number)
values (804712853, 268);
insert into REQUEST (guest_id, room_number)
values (807109039, 592);
insert into REQUEST (guest_id, room_number)
values (814830056, 533);
insert into REQUEST (guest_id, room_number)
values (816395737, 85);
insert into REQUEST (guest_id, room_number)
values (816395737, 317);
insert into REQUEST (guest_id, room_number)
values (818704753, 139);
insert into REQUEST (guest_id, room_number)
values (820070154, 183);
insert into REQUEST (guest_id, room_number)
values (821603494, 681);
insert into REQUEST (guest_id, room_number)
values (824012038, 518);
insert into REQUEST (guest_id, room_number)
values (828551975, 552);
insert into REQUEST (guest_id, room_number)
values (833911512, 325);
insert into REQUEST (guest_id, room_number)
values (837573080, 213);
insert into REQUEST (guest_id, room_number)
values (838449960, 587);
insert into REQUEST (guest_id, room_number)
values (838524358, 548);
insert into REQUEST (guest_id, room_number)
values (843604069, 401);
insert into REQUEST (guest_id, room_number)
values (849525653, 629);
insert into REQUEST (guest_id, room_number)
values (858830943, 527);
insert into REQUEST (guest_id, room_number)
values (859350816, 159);
insert into REQUEST (guest_id, room_number)
values (862875266, 435);
insert into REQUEST (guest_id, room_number)
values (866437249, 334);
insert into REQUEST (guest_id, room_number)
values (866437249, 476);
insert into REQUEST (guest_id, room_number)
values (868754386, 449);
insert into REQUEST (guest_id, room_number)
values (868761412, 548);
insert into REQUEST (guest_id, room_number)
values (873947658, 226);
insert into REQUEST (guest_id, room_number)
values (873947658, 609);
insert into REQUEST (guest_id, room_number)
values (877077950, 159);
insert into REQUEST (guest_id, room_number)
values (877573026, 188);
insert into REQUEST (guest_id, room_number)
values (880191755, 303);
insert into REQUEST (guest_id, room_number)
values (881483798, 589);
insert into REQUEST (guest_id, room_number)
values (883328981, 587);
insert into REQUEST (guest_id, room_number)
values (884967228, 522);
insert into REQUEST (guest_id, room_number)
values (888759649, 381);
insert into REQUEST (guest_id, room_number)
values (894538054, 679);
insert into REQUEST (guest_id, room_number)
values (895866713, 304);
insert into REQUEST (guest_id, room_number)
values (896313876, 199);
insert into REQUEST (guest_id, room_number)
values (900443642, 590);
insert into REQUEST (guest_id, room_number)
values (900745867, 537);
insert into REQUEST (guest_id, room_number)
values (900745867, 667);
insert into REQUEST (guest_id, room_number)
values (901112139, 274);
insert into REQUEST (guest_id, room_number)
values (901831830, 333);
insert into REQUEST (guest_id, room_number)
values (904921014, 123);
insert into REQUEST (guest_id, room_number)
values (909379902, 390);
insert into REQUEST (guest_id, room_number)
values (917034616, 138);
insert into REQUEST (guest_id, room_number)
values (917240940, 259);
insert into REQUEST (guest_id, room_number)
values (919760560, 696);
insert into REQUEST (guest_id, room_number)
values (922825288, 656);
insert into REQUEST (guest_id, room_number)
values (925999241, 647);
insert into REQUEST (guest_id, room_number)
values (928379443, 77);
insert into REQUEST (guest_id, room_number)
values (930829478, 544);
insert into REQUEST (guest_id, room_number)
values (930931397, 326);
insert into REQUEST (guest_id, room_number)
values (933894141, 291);
insert into REQUEST (guest_id, room_number)
values (933894141, 349);
insert into REQUEST (guest_id, room_number)
values (936356540, 593);
insert into REQUEST (guest_id, room_number)
values (939126537, 369);
insert into REQUEST (guest_id, room_number)
values (941464739, 508);
insert into REQUEST (guest_id, room_number)
values (941687249, 635);
insert into REQUEST (guest_id, room_number)
values (943456742, 66);
insert into REQUEST (guest_id, room_number)
values (944442979, 399);
insert into REQUEST (guest_id, room_number)
values (945571450, 353);
insert into REQUEST (guest_id, room_number)
values (950719512, 417);
insert into REQUEST (guest_id, room_number)
values (951334175, 123);
insert into REQUEST (guest_id, room_number)
values (954302901, 408);
insert into REQUEST (guest_id, room_number)
values (955915916, 99);
insert into REQUEST (guest_id, room_number)
values (955915916, 470);
insert into REQUEST (guest_id, room_number)
values (955915916, 615);
insert into REQUEST (guest_id, room_number)
values (957619306, 386);
insert into REQUEST (guest_id, room_number)
values (960553982, 25);
insert into REQUEST (guest_id, room_number)
values (960553982, 565);
insert into REQUEST (guest_id, room_number)
values (961163333, 520);
insert into REQUEST (guest_id, room_number)
values (961163333, 679);
insert into REQUEST (guest_id, room_number)
values (968028757, 223);
insert into REQUEST (guest_id, room_number)
values (968028757, 671);
insert into REQUEST (guest_id, room_number)
values (978411914, 357);
insert into REQUEST (guest_id, room_number)
values (986235526, 373);
insert into REQUEST (guest_id, room_number)
values (988781175, 32);
insert into REQUEST (guest_id, room_number)
values (999810624, 484);
insert into REQUEST (guest_id, room_number)
values (999810624, 665);
commit;
prompt 398 records loaded
prompt Enabling foreign key constraints for BOOKING...
alter table BOOKING enable constraint SYS_C009114;
alter table BOOKING enable constraint SYS_C009115;
prompt Enabling foreign key constraints for RESERVATIONAGENT...
alter table RESERVATIONAGENT enable constraint SYS_C009125;
prompt Enabling foreign key constraints for INFORM...
alter table INFORM enable constraint FK_EM_ID_INFORM;
alter table INFORM enable constraint SYS_C009130;
prompt Enabling foreign key constraints for RECEPTIONIST...
alter table RECEPTIONIST enable constraint SYS_C009135;
prompt Enabling foreign key constraints for REQUEST...
alter table REQUEST enable constraint SYS_C009139;
alter table REQUEST enable constraint SYS_C009140;
prompt Enabling triggers for GUEST...
alter table GUEST enable all triggers;
prompt Enabling triggers for ROOM...
alter table ROOM enable all triggers;
prompt Enabling triggers for BOOKING...
alter table BOOKING enable all triggers;
prompt Enabling triggers for EMPLOYEE2...
alter table EMPLOYEE2 enable all triggers;
prompt Enabling triggers for RESERVATIONAGENT...
alter table RESERVATIONAGENT enable all triggers;
prompt Enabling triggers for INFORM...
alter table INFORM enable all triggers;
prompt Enabling triggers for RECEPTIONIST...
alter table RECEPTIONIST enable all triggers;
prompt Enabling triggers for REQUEST...
alter table REQUEST enable all triggers;

set feedback on
set define on
prompt Done
