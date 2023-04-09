
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
y varchar(30)
)

show tables

describe bank_details

insert into bank_details values
(58,"management","married","tertiary","no",2143,"yes","no","unknown",5,"may",261,1,-1,0,"unknown","no"),
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
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
(28,"blue-collar","married","secondary","no",723,"yes","yes","unknown",5,"may",262,1,-1,0,"unknown","no")

select * from bank_details

select age, job from bank_details

select `default`, age from bank_details

select * from bank_details where age = 58

select job from bank_details where age = 58

select * from bank_details where job = 'management' and balance > 100

select * from bank_details where education = 'secondary' or balance < 100 order by balance

select distinct job from bank_details

select distinct education from bank_details

select distinct `day` from bank_details

select * from bank_details order by age

select * from bank_details order by age desc

select count(*) from bank_details #counting total rows of the records

select sum(balance) from bank_details

select avg(balance) from bank_details

select min(balance) from bank_details

select max(balance) from bank_details

select * from bank_details where balance = (select min(balance) from bank_details)

select * from bank_details

select marital, count(*) from bank_details group by marital

select marital, count(*), sum(balance), avg(balance) from bank_details group by marital

select marital, count(*), sum(balance), avg(balance) from bank_details group by marital having sum(balance) > 300
show databases
use ineuron
show tables

select * from bank_details order by age

select count(*) from bank_details

set sql_safe_updates = 0 #first script to update the data in a table

update bank_details set balance = 0 where job = 'unknown'

update bank_details set contact = 'known', y = 'yes' where `month` = 'may'

update bank_details set `default` = 'NULL' where `default` = 'no'

delete from bank_details where job = 'unknown'

delimiter &&
create procedure select_pro()
begin
	select * from bank_details;
end &&

call select_pro()

delimiter &&
create procedure pre_filter()
begin
	select * from bank_details where job = 'retired' and balance > 200;
end &&

call pre_filter()

delimiter &&
create procedure pre_filter1(in var int)
begin
	select * from bank_details where job = 'retired' and balance > var;
end &&

call pre_filter1(50)

delimiter &&
create procedure pre_filter2(in var1 varchar(30), in var2 int)
begin
	select * from bank_details where job = var1 and balance > var2;
end &&

delimiter &&
create procedure pre_filter3(in var1 varchar(30), in var2 int)
begin
	select * from bank_details where job = var1 and balance > var2;
end &&

call pre_filter3('technician', 50)

call select_pro()

#view is subset of table

select * from (select age, job, education, balance, housing from bank_details) as a where a.age = 58

select age, job, education, balance, housing from bank_details where age = 58

#difference between line 152 and 154 is that in line number 152, it is searching the date only inside a subset of the table.
#while in line 154, it is searching the data from the whole table

create view bank_view as select age, job, education, balance, housing from bank_details

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
y varchar(30)
)

show tables

insert into bank_details1 select * from bank_details

select * from bank_details1 order by age

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
y varchar(30)
)

insert into bank_details2 select * from bank_details where age = 58
select * from bank_details2
select * from bank_details1

select bank_details1.age, bank_details1.job, bank_details1.marital from bank_details1 inner join bank_details2 on bank_details1.age = bank_details2.age

select bank_details1.age, bank_details1.job, bank_details1.marital from bank_details1 inner join bank_details2 on bank_details1.age = bank_details2.age