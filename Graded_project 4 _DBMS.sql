create database TravelOnTheGo;
use TravelOnTheGo;

create table PASSENGER(
	 Passesnger_id int primary key,
     Passenger_name varchar(50),
	 Category varchar(50),
	 Gender varchar(50),
	 Boarding_City varchar(50),
	 Destination_City varchar(50),
	 Distance int,
	 Bus_Type varchar(50)
	);
    
create table PRICE(
	 Price_id int primary key,
     Bus_Type varchar(50),
	 Distance int,
	 Price int
	);
    
insert into travelonthego.passenger values (1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into travelonthego.passenger values (2,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert into travelonthego.passenger values (3,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
insert into travelonthego.passenger values (4,'Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into travelonthego.passenger values (5,'Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper');
insert into travelonthego.passenger values (6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into travelonthego.passenger values (7,'Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper');
insert into travelonthego.passenger values (8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
insert into travelonthego.passenger values (9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');

insert into travelonthego.price values (1,'Sleeper',350,770);
insert into travelonthego.price values (2,'Sleeper',500,1100);
insert into travelonthego.price values (3,'Sleeper',600,1320);
insert into travelonthego.price values (4,'Sleeper',700,1540);
insert into travelonthego.price values (5,'Sleeper',1000,2200);
insert into travelonthego.price values (6,'Sleeper',1200,2640);
insert into travelonthego.price values (7,'Sleeper',1500,2700);
insert into travelonthego.price values (8,'Sitting',500,620);
insert into travelonthego.price values (9,'Sitting',600,744);
insert into travelonthego.price values (10,'Sitting',700,868);
insert into travelonthego.price values (11,'Sitting',1000,1240);
insert into travelonthego.price values (12,'Sitting',1200,1488);
insert into travelonthego.price values (13,'Sitting',1500,1860);

select Gender,count(Gender) as count from travelonthego.passenger where Distance>=600 group by Gender;

select min(Price) as minimum_price from travelonthego.price where Bus_Type = 'Sleeper';

select Passenger_name from travelonthego.passenger where Passenger_name like 'S%';

select Passenger_name,Boarding_City,Destination_City,passenger.Bus_Type,price.Price from travelonthego.passenger left join travelonthego.price on passenger.Bus_Type = price.Bus_Type and passenger.Distance = price.Distance;

select Passenger_name,price from travelonthego.passenger,travelonthego.price where passenger.Bus_Type = 'Sitting' and passenger.Distance = 1000 and passenger.Bus_Type=price.Bus_Type and passenger.Distance=price.Distance;

select Bus_Type,price from travelonthego.price where price.Distance=600;

select Distinct Distance from travelonthego.passenger order by Distance desc;

select Passenger_name, Distance*100/(select sum(Distance) from travelonthego.passenger) as percentage_travelled from travelonthego.passenger;

