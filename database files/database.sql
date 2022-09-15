use alcoholic;
-- creating table

-- select * from alcohol_costs;

-- creating alcohol_costs table
drop table if exists `alcohol_costs`;

create table `alcohol_costs`(
`type_id` int not null,
`cost_id` int not null,
`unit_price` float (4,2),
`drink_amount` int not null
);

drop table if exists `alcohol_types`;

create table `alcohol_types` (
`type_id` int not null auto_increment,
`description` varchar(200) not null,
`unit` varchar(100) not null,
`percentage_alcohol` FLOAT(3,1),
`standard_drink` FLOAT(3,1),
primary key (`type_id`)
);
-- Filling up data for alcohol_types
insert into alcohol_types (`description`,`unit`,`percentage_alcohol`,`standard_drink`) values ('Full/Mid-strength Beer','Pot/Middy',4.5,1.1);
insert into alcohol_types (`description`,`unit`,`percentage_alcohol`,`standard_drink`) values ('Low-strength Beer','Pot/Middy',2.7,0.6);
insert into alcohol_types (`description`,`unit`,`percentage_alcohol`,`standard_drink`) values ('Glass-Wine','Average glass',12.5,1.5);
insert into alcohol_types (`description`,`unit`,`percentage_alcohol`,`standard_drink`) values ('Bottle-Wine','Bottle',13.0,7.7);

insert into alcohol_types (`description`,`unit`,`percentage_alcohol`,`standard_drink`) values ('Both Full/Mid-strength Beer and Low-strength Beer with same proportion','Pot/Middy',3.6,0.9);
insert into alcohol_types (`description`,`unit`,`percentage_alcohol`,`standard_drink`) values ('Both Full/Mid-strength Beer and Low-strength Beer with 1:2 proportion','Pot/Middy',3.3,0.8);
insert into alcohol_types (`description`,`unit`,`percentage_alcohol`,`standard_drink`) values ('Both Full/Mid-strength Beer and Low-strength Beer with 2:1 proportion','Pot/Middy',3.9,1.0);

insert into alcohol_types (`description`,`unit`,`percentage_alcohol`,`standard_drink`) values ('Both Full/Mid-strength Beer and glass of wine with same proportion','Pot/Middy/glass',8.5,1.3);
insert into alcohol_types (`description`,`unit`,`percentage_alcohol`,`standard_drink`) values ('Both Low-strength Beer and glass of wine with same proportion','Pot/Middy/glass',7.6,1.1);

insert into alcohol_types (`description`,`unit`,`percentage_alcohol`,`standard_drink`) values ('Full/Mid-strength and Low-strength Beer and glass of wine with same proportion','Pot/Middy/glass',6.6,1.1);
insert into alcohol_types (`description`,`unit`,`percentage_alcohol`,`standard_drink`) values ('Full/Mid-strength and Low-strength Beer and bottle of wine with same proportion','Pot/Middy/glass/bottle',6.6,2.7);

-- select* from alcohol_types;

-- creating costs table

drop table if exists `item_option`;
create table `item_option` (
`ITEM_ID` int not null auto_increment,
`ITEM_NAME` varchar(200) not null,
`ITEM_COST` int not null,
`cost_id` int not null,
primary key (`ITEM_ID`)
);

insert into item_option (`ITEM_NAME`, `ITEM_COST`) values ('Cinema ticket with popcorn', 24);
insert into item_option (`ITEM_NAME`, `ITEM_COST`) values ('Family swim pass at your local suburb', 26);
insert into item_option (`ITEM_NAME`, `ITEM_COST`) values ('Bowling for the whole family', 35);
insert into item_option (`ITEM_NAME`, `ITEM_COST`) values ('Salsa class for couples', 42);
insert into item_option (`ITEM_NAME`, `ITEM_COST`) values ('Monthly gym membership', 96);
insert into item_option (`ITEM_NAME`, `ITEM_COST`) values ('355 nappies for little ones', 104);
insert into item_option (`ITEM_NAME`, `ITEM_COST`) values ('High speed internet for whole family', 140);
insert into item_option (`ITEM_NAME`, `ITEM_COST`) values ('One fancy date night', 164);


update `item_option`
set cost_id = 1 where item_option.`ITEM_COST` < 25;

update `item_option`
set cost_id = 2 where item_option.`ITEM_COST`>= 25 and item_option.`ITEM_COST` < 50;

update `item_option`
set cost_id = 3 where item_option.`ITEM_COST` BETWEEN 50 and 100;

update `item_option`
set cost_id = 4 where item_option.`ITEM_COST` > 100;


insert into item_option (`cost_id`,`ITEM_NAME`, `ITEM_COST`) values (1,'A cup of coffee', 5);
insert into item_option (`cost_id`,`ITEM_NAME`, `ITEM_COST`) values (1,'High quality breakfast cereal (500g)', 10);
insert into item_option (`cost_id`,`ITEM_NAME`, `ITEM_COST`) values (2,'Traditional thai massage (30 minutes)', 45);
insert into item_option (`cost_id`,`ITEM_NAME`, `ITEM_COST`) values (3,'Traditional thai massage (60 minutes)', 75);
insert into item_option (`cost_id`,`ITEM_NAME`, `ITEM_COST`) values (4,'Steam spa and full body massage (90 minutes)', 165);
insert into item_option (`cost_id`,`ITEM_NAME`, `ITEM_COST`) values (1,'Ticket for child Playcenter', 12);
insert into item_option (`cost_id`,`ITEM_NAME`, `ITEM_COST`) values (1,'A box of fast-food meal for one person', 18);
insert into item_option (`cost_id`,`ITEM_NAME`, `ITEM_COST`) values (1,'New skin-care product', 23);
insert into item_option (`cost_id`,`ITEM_NAME`, `ITEM_COST`) values (3,'Premium quality child-toy', 65);
insert into item_option (`cost_id`,`ITEM_NAME`, `ITEM_COST`) values (3,'Australian Open Tenis single-session ticket', 51);
insert into item_option (`cost_id`,`ITEM_NAME`, `ITEM_COST`) values (3,'Australian Open Tenis multi-session ticket', 112);


select distinct unit_price from alcohol_costs;







drop table if exists `costs`;

create table `costs` (
`cost_id` int not null auto_increment,
`description` varchar(200) not null,
`cost_range` varchar(50),
primary key (`cost_id`)
);

insert into costs (`description`,`cost_range`) values ('low costing','1 to 25 dollars weekly');
insert into costs (`description`,`cost_range`) values ('moderate costing','26 to 50 dollars weekly');
insert into costs (`description`,`cost_range`) values ('high costing','50 to 100 dollars weekly');
insert into costs (`description`,`cost_range`) values ('very high costing', '100+ dollars weekly');





insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 1);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 2);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 3);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 4);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 5);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 6);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 7);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 8);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 9);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 10);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 11);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 12);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 13);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 14);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 15);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 16);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 17);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 18);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 19);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 20);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 21);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 22);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 23);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 24);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 25);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 26);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 27);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 28);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 29);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 30);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 31);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 32);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 33);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 34);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 35);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 36);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 37);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 38);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 39);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 40);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 41);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 42);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 43);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 44);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 45);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 46);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 47);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 48);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 49);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 50);

insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 51);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 52);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 53);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 54);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 55);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 56);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 57);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 58);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 59);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 60);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 61);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 62);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 63);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 64);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 65);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 66);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 67);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 68);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 69);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 70);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 71);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 72);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 73);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 74);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 75);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 76);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 77);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 78);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 79);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 80);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 81);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 82);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 83);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 84);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 85);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 86);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 87);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 88);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 89);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 90);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 91);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 92);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 93);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 94);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 95);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 96);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 97);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 98);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 99);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (1, 2.15, 100);


insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 1);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 2);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 3);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 4);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 5);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 6);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 7);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 8);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 9);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 10);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 11);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 12);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 13);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 14);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 15);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 16);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 17);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 18);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 19);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 20);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 21);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 22);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 23);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 24);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 25);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 26);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 27);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 28);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 29);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 30);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 31);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 32);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 33);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 34);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 35);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 36);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 37);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 38);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 39);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 40);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 41);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 42);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 43);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 44);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 45);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 46);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 47);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 48);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 49);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 50);

insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 51);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 52);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 53);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 54);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 55);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 56);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 57);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 58);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 59);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 60);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 61);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 62);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 63);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 64);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 65);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 66);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 67);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 68);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 69);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 70);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 71);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 72);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 73);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 74);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 75);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 76);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 77);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 78);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 79);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 80);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 81);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 82);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 83);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 84);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 85);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 86);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 87);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 88);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 89);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 90);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 91);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 92);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 93);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 94);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 95);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 96);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 97);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 98);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 99);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (2, 3.25, 100);


insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 1);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 2);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 3);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 4);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 5);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 6);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 7);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 8);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 9);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 10);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 11);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 12);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 13);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 14);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 15);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 16);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 17);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 18);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 19);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 20);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 21);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 22);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 23);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 24);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 25);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 26);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 27);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 28);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 29);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 30);

insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 31);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 32);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 33);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 34);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 35);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 36);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 37);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 38);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 39);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 40);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 41);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 42);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 43);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 44);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 45);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 46);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 47);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 48);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 49);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 50);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 51);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 52);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 53);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 54);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 55);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 56);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 57);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 58);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 59);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (3, 6.0, 60);


insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 1);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 2);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 3);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 4);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 5);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 6);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 7);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 8);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 9);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 10);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 11);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 12);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 13);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 14);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 15);

insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 16);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 17);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 18);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 19);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 20);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 21);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 22);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 23);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 24);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 25);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 26);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 27);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 28);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 29);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (4, 20.0, 30);



insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 2);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 4);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 6);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 8);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 10);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 12);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 14);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 16);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 18);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 20);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 22);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 24);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 26);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 28);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 30);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 32);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 34);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 36);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 38);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 40);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 42);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 44);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 46);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 48);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 50);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 52);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 54);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 56);

insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 58);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 60);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 62);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 64);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 66);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 68);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 70);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 72);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 74);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 76);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 78);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 80);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 82);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 84);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 86);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 88);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 90);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 92);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 94);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 96);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 98);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (5, 2.7, 100);




insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 3);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 6);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 9);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 12);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 15);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 18);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 21);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 24);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 27);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 30);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 33);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 36);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 39);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 42);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 45);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 48);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 51);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 54);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 57);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 60);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 63);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 66);

insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 69);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 72);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 75);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 78);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 81);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 84);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 87);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 90);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 93);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 96);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 99);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (6, 2.9, 100);




insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 3);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 6);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 9);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 12);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 15);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 18);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 21);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 24);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 27);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 30);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 33);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 36);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 39);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 42);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 45);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 48);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 51);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 54);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 57);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 60);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 63);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 66);

insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 69);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 72);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 75);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 78);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 81);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 84);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 87);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 90);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 93);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 96);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 99);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (7, 2.5, 102);




insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 2);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 4);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 6);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 8);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 10);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 12);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 14);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 16);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 18);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 20);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 22);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 24);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 26);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 28);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 30);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 32);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 34);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 36);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 38);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 40);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 42);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 44);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 46);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 48);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 50);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 52);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 54);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 56);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 58);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 60);

insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 62);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 64);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 66);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 68);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 70);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 72);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 74);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 76);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 78);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 80);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 82);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 84);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 86);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 88);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 90);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 92);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 94);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 96);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 98);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 100);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (8, 4.1, 102);




insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 2);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 4);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 6);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 8);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 10);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 12);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 14);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 16);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 18);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 20);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 22);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 24);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 26);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 28);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 30);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 32);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 34);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 36);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 38);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 40);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 42);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 44);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 46);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 48);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 50);

insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 52);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 54);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 56);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 58);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 60);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 62);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 64);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 66);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 68);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 70);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 72);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 74);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 76);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 78);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 80);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (9, 4.6, 82);



insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 3);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 6);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 9);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 12);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 15);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 18);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 21);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 24);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 27);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 30);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 33);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 36);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 39);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 42);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 45);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 48);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 51);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 54);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 57);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 60);

insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 63);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 66);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 69);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 72);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 75);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 78);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 81);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 84);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 87);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 90);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 93);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 96);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 99);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (10, 3.8, 102);



insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 3);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 6);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 9);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 12);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 15);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 18);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 21);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 24);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 27);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 30);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 33);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 36);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 39);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 42);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 45);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 48);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 51);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 54);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 57);
insert into alcohol_costs (`type_id`,`unit_price`, `drink_amount`) values (11, 8.5, 60);



-- select * from alcohol_costs;

update `alcohol_costs`
set cost_id = 1 where alcohol_costs.`unit_price` * alcohol_costs.`drink_amount` < 25;

update `alcohol_costs`
set cost_id = 2 where alcohol_costs.`unit_price` * alcohol_costs.`drink_amount` >25 and 
alcohol_costs.`unit_price` * alcohol_costs.`drink_amount` <50;

update `alcohol_costs`
set cost_id = 3 where alcohol_costs.`unit_price` * alcohol_costs.`drink_amount` Between 50 and 100;

update `alcohol_costs`
set cost_id = 4 where alcohol_costs.`unit_price` * alcohol_costs.`drink_amount` > 100;



alter table `alcohol_costs` ADD primary key(`type_id`,`cost_id`, `drink_amount`);

alter table `item_option` ADD  FOREIGN KEY ( `cost_id` ) REFERENCES costs ( `cost_id` )  ON DELETE CASCADE ON UPDATE RESTRICT;
alter table `alcohol_costs` ADD  FOREIGN KEY ( `type_id` ) REFERENCES alcohol_types ( `type_id` ) ON DELETE CASCADE ON UPDATE RESTRICT;
alter table `alcohol_costs` ADD  FOREIGN KEY ( `cost_id` ) REFERENCES costs ( `cost_id` ) ON DELETE CASCADE ON UPDATE RESTRICT;



select * from item_option;

select alcohol_costs.drink_amount * alcohol_costs.unit_price as Total_Cost 
From alcohol_types, alcohol_costs
where alcohol_costs.drink_amount  = 30
and alcohol_types.type_id = 2
and alcohol_types.type_id = alcohol_costs.type_id;

-- What is my expenditure type(high, low, moderate etc) when I drink 30 drinks of low strength beer in a week
select costs.description as 'Alcohol Expenditure Nature '
From alcohol_types, alcohol_costs, costs
where drink_amount  = 30
and alcohol_types.type_id = 2
and alcohol_types.type_id = alcohol_costs.type_id
and alcohol_costs.cost_id = costs.cost_id;

select distinct alcohol_costs.`unit_price` * alcohol_costs.`drink_amount` as `Your weekly alcohol expense`
From alcohol_types, alcohol_costs, costs, item_option
where alcohol_costs.drink_amount  = 13
and alcohol_types.type_id = 4
and alcohol_types.type_id = alcohol_costs.type_id
and alcohol_costs.cost_id = costs.cost_id
and costs.cost_id = item_option.cost_id ;

-- How much a drinker spent who drinks all types (regular beer, low carb beer, wine) of alcohol and 
-- drink number is 18 and what else he could buy if he did not spend money for alcohol 
select item_option.item_name as 'You could buy any of this for same expenditure of alcohols weekly'
From alcohol_types, alcohol_costs, costs, item_option
where alcohol_costs.drink_amount  = 18
and alcohol_types.type_id = 11
and alcohol_types.type_id = alcohol_costs.type_id
and alcohol_costs.cost_id = costs.cost_id
and costs.cost_id = item_option.cost_id ;

-- How much a drinker spent who drinks moderately (5 to 10 drinks in a week) of low strength beer and 
--  and what else he could buy if he did not spend money for alcohol 

select  min(alcohol_costs.`unit_price` * alcohol_costs.`drink_amount`) as `Your minimum weekly alcohol expense`,
max(alcohol_costs.`unit_price` * alcohol_costs.`drink_amount`) as `Your maximum weekly alcohol expense`
From alcohol_types, alcohol_costs, costs, item_option
where alcohol_costs.drink_amount between 5 and 10
and alcohol_types.type_id = 2  
and alcohol_types.type_id = alcohol_costs.type_id
and alcohol_costs.cost_id = costs.cost_id
and costs.cost_id = item_option.cost_id ;

-- What else a drinker could buy if he did not spend money for alcohol who drinks moderately (5 to 10 drinks in a week) of low strength beer 

select distinct alcohol_types.description as 'Alcohol choice',
item_option.item_name as 'You could buy instead of alcohols weekly'
From alcohol_types, alcohol_costs, costs, item_option
where alcohol_costs.drink_amount  between 1 and 5
and alcohol_types.type_id = 1
and alcohol_types.type_id = alcohol_costs.type_id
and alcohol_costs.cost_id = costs.cost_id
and costs.cost_id = item_option.cost_id ;

-- What kind of drinks or combination of drinks I can drink if I am a binge drinker (who drinks at least 12 standard-drinks in a day, 84 drinks in a week)
-- What will be the expenditure for each combination

select  alcohol_types.description as `Your drink choice`, 
min(alcohol_costs.`unit_price` * alcohol_costs.`drink_amount`) as `Your minimum weekly alcohol expense`
From alcohol_types, alcohol_costs, costs, item_option
where alcohol_costs.drink_amount >= 84
and alcohol_types.type_id = alcohol_costs.type_id
and alcohol_costs.cost_id = costs.cost_id
and costs.cost_id = item_option.cost_id 
group by alcohol_types.description;


SHOW CREATE TABLE costs;
SHOW CREATE TABLE item_option;

select * from alcoholic.item_option;

select a.description as 'Your alcohol choice', a.percentage_alcohol as 'Alcohol % in each drink', 
ac.unit_price as 'Price of alcohol', ac.drink_amount as 'Weekly drink quantity', 
ceil(unit_price*ac.drink_amount) as 'Total weekly expenditure on alcohol($)', 
i.item_name as 'What you could buy?', i.item_cost as 'Cost(AUD)'
From alcohol_types a, alcohol_costs ac, costs c, item_option i
where a.type_id = ac.type_id
and ac.cost_id = c.cost_id
and c.cost_id = i.cost_id
and  ac.unit_price*ac.drink_amount >= i.item_cost
order by ac.unit_price*ac.drink_amount;

select distinct a.description as 'Your alcohol choice', a.percentage_alcohol as 'Alcohol % in each drink', 
ac.unit_price as 'Price of alcohol(AUD)'
From alcohol_types a, alcohol_costs ac
where a.type_id = ac.type_id;

select  i.item_name as 'What items you could buy?', i.item_cost as 'Item Cost (AUD)'
From item_option i;

select distinct alcohol_types.description as `Alcohol_choice`, 
item_option.item_name as `Your_buying_option`, item_option.item_cost as Cost
From alcohol_types, alcohol_costs, costs, item_option
where alcohol_costs.drink_amount > 25
and alcohol_types.type_id =1
and item_option.item_cost not in (
select item_option.item_cost 
From alcohol_types, alcohol_costs, costs, item_option
where alcohol_types.type_id =1
and alcohol_costs.drink_amount between 11 and 25
and  alcohol_costs.unit_price*alcohol_costs.drink_amount >= item_option.item_cost
and alcohol_types.type_id = alcohol_costs.type_id
and alcohol_costs.cost_id = costs.cost_id
and costs.cost_id = item_option.cost_id)
and  alcohol_costs.unit_price*alcohol_costs.drink_amount >= item_option.item_cost
and alcohol_types.type_id = alcohol_costs.type_id
and alcohol_costs.cost_id = costs.cost_id
and costs.cost_id = item_option.cost_id 
order by alcohol_costs.unit_price*alcohol_costs.drink_amount;


