show databases
create database if not exists ineuron
use ineuron
create table if not exists bank_details(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int,
housing varchar(30),
loan varchar(30),
contact varchar(30),
`day` int,
`month` varchar(30),
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30))

show tables
describe bank_details

insert into bank_details values
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no")

insert into bank_details values
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(57,"services","married","secondary","no",162,"yes","no","unknown",5,"may",174,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",0,"yes","no","unknown",5,"may",54,1,-1,0,"unknown","no"),
(28,"blue-collar","married","secondary","no",723,"yes","yes","unknown",5,"may",262,1,-1,0,"unknown","no"),
(56,"management","married","tertiary","no",779,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(32,"blue-collar","single","primary","no",23,"yes","yes","unknown",5,"may",160,1,-1,0,"unknown","no"),
(25,"services","married","secondary","no",50,"yes","no","unknown",5,"may",342,1,-1,0,"unknown","no"),
(40,"retired","married","primary","no",0,"yes","yes","unknown",5,"may",181,1,-1,0,"unknown","no"),
(44,"admin.","married","secondary","no",-372,"yes","no","unknown",5,"may",172,1,-1,0,"unknown","no"),
(39,"management","single","tertiary","no",255,"yes","no","unknown",5,"may",296,1,-1,0,"unknown","no"),
(52,"entrepreneur","married","secondary","no",113,"yes","yes","unknown",5,"may",127,1,-1,0,"unknown","no"),
(46,"management","single","secondary","no",-246,"yes","no","unknown",5,"may",255,2,-1,0,"unknown","no"),
(36,"technician","single","secondary","no",265,"yes","yes","unknown",5,"may",348,1,-1,0,"unknown","no"),
(57,"technician","married","secondary","no",839,"no","yes","unknown",5,"may",225,1,-1,0,"unknown","no")

select * from bank_details

select age, job from bank_details

select `default`, age from bank_details

select * from bank_details where age = 58

select job from bank_details where age = 58

select * from bank_details where job = 'management' and balance > 100

select * from bank_details where education = 'secondary' or balance < 100 order by balance

select distinct job from bank_details

select * from bank_details order by age

select * from bank_details order by age desc

select count(*) from bank_details

select sum(balance) from bank_details

select avg(balance) from bank_details

select min(balance) from bank_details

select * from bank_details where balance = (select min(balance) from bank_details)

select marital, count(*) from bank_details group by marital

select marital, count(*), sum(balance), avg(balance) from bank_details group by marital

select marital, count(*), sum(balance), avg(balance) from bank_details group by marital having sum(balance) > 300

set sql_safe_updates = 0

update bank_details set balance = 5 where job = 'unknown'

select * from bank_details where job = 'unknown'

update bank_details set contact = 'known', y = 'yes' where `month` = 'may'

update bank_details set `default` = 'no' where `default` = 'sunil'

select * from bank_details where job = 'unknown'

delete from bank_details where job = 'unknown'

select * from bank_details

select count(*) from bank_details

delimiter &&
create procedure select_pro()
begin
	select * from bank_details;
end &&

call select_pro()

delimiter &&
create procedure pre_filter()
begin
	select * from bank_details where job = 'management' and balance > 100;
end &&

call pre_filter()

delimiter &&
create procedure pre_filter1(in var int)
begin
	select * from bank_details where job = 'management' and balance > var;
end &&

call pre_filter1(200)

delimiter &&
create procedure pre_filter2(in var1 varchar(30), in var int)
begin
	select * from bank_details where job = var1 and balance > var;
end &&

call pre_filter2('services', 20)

call select_pro()

select job, age, education, y from bank_details

select job, age, education, y from bank_details where age = 58

select * from (select job, age, education, y from bank_details) as a where a.age = 58

create view bank_view1 as select job, age, education, y from bank_details

select * from bank_view1 where age = 58

create table if not exists bank_details1(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int,
housing varchar(30),
loan varchar(30),
contact varchar(30),
`day` int,
`month` varchar(30),
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30))

show tables

insert into bank_details1 select * from bank_details

select * from bank_details1

select bank_details.age, bank_details.job, bank_details.marital from bank_details inner join bank_details1 on bank_details.age = bank_details1.age

create table if not exists bank_details2(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int,
housing varchar(30),
loan varchar(30),
contact varchar(30),
`day` int,
`month` varchar(30),
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30))

insert into bank_details2 select * from bank_details where age = 58

select * from bank_details2

select bank_details.age, bank_details.job, bank_details.marital from bank_details inner join bank_details2 on bank_details.age = bank_details2.age

select bank_details.age, bank_details.job, bank_details.marital from bank_details right join bank_details2 on bank_details.age = bank_details2.age

select bank_details.age, bank_details.job, bank_details.marital from bank_details left join bank_details2 on bank_details.age = bank_details2.age

drop database sunil

drop database sunil2