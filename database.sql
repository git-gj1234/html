#drop database store;
create database STORE;
use STORE;

create table Users(
	UID int auto_increment primary key,
    User_name varchar(50),
    House_no varchar(10),
    street_building varchar(30),
    Locality varchar(50),
    phone_number bigint,
    email varchar(50),
    password int
);

#drop table store_inv;
CREATE TABLE `store_inv` (
  `PID` varchar(10) NOT NULL primary key,
  `Name` varchar(50) NOT NULL,
  `quan` int DEFAULT 0 check(quan>=0),
  `price` float NOT NULL,
  `category` varchar(20) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `info` varchar(50) DEFAULT NULL
) ;

create table Delivery_boizz(
	DID int primary key,
    Delivery_name varchar(50),
    status varchar(20) default 'active' check (status in ('active','busy','inactive')),
    phone_number bigint, 
    License_number int unique,
    password int,
    aadhaar bigint   
);

create table Orders(
	OID int auto_increment primary key,
    UID int ,
    DID int default null,
    status varchar(20) default 'ordered' check (status in ('ordered','dlivery confirmed','delivered')),    
    Date_of_order date default null,
	Date_of_delivery date default null,
    total double default 0,
    foreign key (DID) references Delivery_boizz(DID),
    foreign key (UID) references Users(UID)
);

#drop table bills;
create table Bills(
	OID int,
    PID varchar(10),
    quan int,
    foreign key (OID) references Orders(OID),
    foreign key (PID) references store_inv(PID)
);

create table cart(
  UID int,
  PID varchar(10),
  quan int,
  foreign key (UID) references Users(UID),
  foreign key (PID) references store_inv(PID)
);

insert into users values(1,"Adithya",4,"aq1","jpnagar",7818239203,"a@gmail.com",102345);
insert into users values(2,"Amal",6,"we4","Basvanagudi",2135829032,"am@gmail.com",123456); 
insert into users values(3,"chetna",9,"cdr5","this locality",3853298567,"c@gmail.com",456246); 

insert into delivery_boizz values(3213,"slave 1","active",1234567890,483295,124623,45322);
insert into delivery_boizz values(3214,"slave 45","inactive",1233661190,483293,2345642,78965);
insert into delivery_boizz values(3215,"slave 14","busy",1849603925,483298,3456,77899);


INSERT INTO `store_inv` (`PID`, `Name`, `quan`, `price`, `category`, `link`, `info`) VALUES
('b01', 'Muffin', 10, 120, 'baked goods', 'images/muffin.jpg\r\n', 'A chocolate muffin for the afternoon'),
('b02', 'Cup Cake', 12, 90, 'baked goods', 'images/cake.jpg', 'A birthday celebration?'),
('c01', 'Golden Wheat (1Kg)', 18, 100, 'cereals', 'images/wheat.jpg', 'Golden, Yellow wheat'),
('c02', 'White rice', 100, 100, 'cereals', 'images/rice.jpg', 'White clean husked rice'),
('c03', 'Barley (1Kg)', 20, 100, 'cereals', 'images/barley.jpg', 'A kilogram of barley flour'),
('cn01', 'Rasgulla', 45, 200, 'canned', 'images/rasgulla.jpg', 'Your favourite sweet, now in a can'),
('cn02', 'Beans', 34, 80, 'canned', 'images/beans.jpg', 'Canned beans, ready to serve'),
('cn03', 'Canned noodles', 27, 55, 'canned', 'images/noodles.jpg', 'A tin of canned noodles'),
('d01', 'GoodLife Toned Milk (1L)', 5, 62, 'dairy', 'images/milk.jpg', 'Fresh and Toned Cow Milk from Good life'),
('d02', 'Taaza Toned Milk (1L)', 10, 70, 'dairy', 'images/taaza_milk.jpg', 'Taaza Milk with your morning coffee'),
('d03', 'Curd Ndandini (500g)', 10, 17, 'dairy', 'images/curd.jpg', 'Curd from nandini to fish up your meals'),
('d04', 'Milky Mist Paneer (500g)', 12, 281, 'dairy', 'images/paneer.jpg', 'Crisp diced paneer'),
('d05', 'D\'lecta Natural Cheddar Cheese(200g)', 34, 387, 'dairy', 'images/cheese.jpg', 'Care for a hint of cheese?'),
('de01', 'surfexcel', 20, 300, 'Daily Essentials', 'images/surf.jpg', 'Sufexcel matic liquid to wash your clothes'),
('de02', 'Odonil Room Freshner (3)', 1, 300, 'Daily Essentials', 'images/odonil.jpg', 'Add fragrance to your room'),
('ds01', 'Amul Ice cream', 20, 90, 'Desserts', 'images/icecream.jpg', 'The perfect dessert'),
('f01', 'Shimla Apple (1 kg)', 20, 62, 'fruits', 'images/apple.jpg', 'Only the finest apples from Shimla'),
('f02', 'Robusta Banana (4 pc)', 50, 58, 'fruits', 'images/banana.jpg', 'Fresh Yellow Bananas'),
('f03', 'Thai Guava (1 kg)', 40, 47, 'fruits', 'images/guava.jpg', 'Guavas from Thailand'),
('f04', 'Imported Blueberries (120 g)', 60, 184, 'fruits', 'images/blueberry.jpg', 'The best blueberries'),
('f05', 'Semiripe Avacado (1 pc)', 67, 109, 'fruits', 'images/avacado.jpg', 'Crave an avacado?'),
('f06', 'Pineapple (Ananas) (1 pc)', 45, 52, 'fruits', 'images/pineapple.jpg', 'Ananas.....'),
('f07', 'Green Kiwi (3 pc)', 23, 85, 'fruits', 'images/kiwi.jpg', 'Is it a bird or a fruit?'),
('f08', 'Figs(Anjurada Hannu (250 g)', 34, 50, 'fruits', 'images/fig.jpg', 'Quality Figs'),
('f09', 'Kinnow Orange(Kithale) (500 g)', 54, 43, 'fruits', 'images/orange.jpg', 'Is it orange ?'),
('f10', 'Fresh Tender Coconut (1 pc)', 65, 113, 'fruits', 'images/coconut.jpg', 'Tender coconut water to quench your thirst'),
('f11', 'Pomegranate (500 g)', 76, 93, 'fruits', 'images/pomogrenate.jpg', 'Juicy red pomograntes'),
('f12', 'Green Pear(500 g)', 87, 67, 'fruits', 'images/pear.jpg', 'Ripe green pears'),
('f13', 'Pinky Strawberry(1 pack)', 45, 62, 'fruits', 'images/strawberry.jpg', 'A royal fruit for our royal customers'),
('f14', 'Green Grapes(Dhraakshi) (500 g)', 89, 53, 'fruits', 'images/grapes.jpg', 'The finest green grapes'),
('f15', 'Cherry Tomato (200 g)', 20, 20, 'fruits', 'images/tomato.jpg', 'Is it a fruit or a vegetable?'),
('fz01', 'Freeze dried fruits', 24, 150, 'Freeze dried', 'images/freeze.jpg', 'Short on space?'),
('g01', 'French Toast', 20, 45, 'Gourment foods', 'images/frenchtoast.jpg', 'A quick breakfast'),
('p01', 'Toor Dal-Supreme Harvest(1 kg)', 26, 145, 'pulses', 'images/toor_dal.jpg', 'The higher quality toor daal'),
('p02', 'Moong Dal-Supreme Harvest(1 kg)', 56, 146, 'pulses', 'images/moong_dal.jpg', 'A cosuin of toor-daal....?'),
('p03', 'Moong Chilka-Supreme Harvest(500 g)', 78, 74, 'pulses', 'images/moong_chilka.jpg', 'Quality Moong-Chilka'),
('p04', 'Urad Dal Split-Supreme Harvest(1 kg)', 92, 149, 'pulses', 'images/urad_dal_split.jpg', 'Regular split urad daal'),
('p05', 'Urad Dal Whole-Supreme Harvest(1 kg)', 69, 145, 'pulses', 'images/urad_dal_whole.jpg', 'The whole package'),
('pf01', 'kurkure', 23, 10, 'packed foods', 'images/kurkure.jpg', 'A midnight snack'),
('pf02', 'Lays', 34, 10, 'packed foods', 'images/lays.jpg', 'Can\'t have a party without lays'),
('re01', 'Jeera rice', 29, 60, 'Ready to eat', 'images/jeera.jpg', ' A ready to eat meal from mtr'),
('v01', 'Onion(1 kg)', 22, 31, 'vegetables', 'images/onion.jpg', 'Brings tears to your eyes'),
('v02', 'Potato(1 kg)', 8, 41, 'vegetables', 'images/potato.jpg', 'A versatile vegetable'),
('v03', 'Red Carrot(1 kg)', 28, 26, 'vegetables', 'images/carrot.jpg', 'Long, red carrots'),
('v04', 'Cauliflower (1 pc)', 32, 31, 'vegetables', 'images/cauliflower.jpg', 'A leafy vegetable indeed'),
('v05', 'Arugula(1 kg)', 120, 78, 'vegetables', 'images/arugula.jpg', 'A whole unit of Arugula'),
('v06', 'Lettuce(1 kg)', 120, 38, 'vegetables', 'images/lettuce.jpg', 'Let-us eat '),
('v07', 'Mustard greens(1 kg)', 210, 71, 'vegetables', 'images/mustard.jpg', 'Tiny beads'),
('v08', 'Bok choy(1 kg)', 30, 90, 'vegetables', 'images/bok_choy.jpg', 'A whole unit of Bok Choy'),
('v09', 'Horseradish(1 kg)', 40, 33, 'vegetables', 'images/raddish.jpg', 'Is it related to horses?'),
('v10', 'Sugar beet(1 kg)', 45, 21, 'vegetables', 'images/beetroot.jpg', 'Hefty red beetroots'),
('v11', 'Celeriac(1 kg)', 60, 13, 'vegetables', 'images/celeriac.jpg', 'All the celeriac you need'),
('v12', 'Daikon(1 kg)', 45, 17, 'vegetables', 'images/daikon.jpg', 'Heard of me?'),
('v13', 'Celery(1 kg)', 35, 62, 'vegetables', 'images/celery.jpg', 'That\'s a lot of celery'),
('v14', 'Turnip(1 kg)', 67, 67, 'vegetables', 'images/turnip.jpg', 'Will it spin like a top?'),
('v15', 'Kohlrabi(1 kg)', 56, 45, 'vegetables', 'images/kohlrabi.jpg', 'A big vegetable');


create view bill as select bills.oid,bills.pid,bills.quan,bills.quan*store_inv.price from bills,store_inv where bills.pid = store_inv.pid; 

delimiter |
create trigger reduce_quantity
after insert on bills
for each row
update store_inv 
set quan = quan - new.quan
where pid = new.pid;
|
delimiter ;

delimiter |
create trigger generate_total
after insert on bills
for each row
update orders 
set total = total + (new.quan*(select price from store_inv where pid = new.pid))
where oid = new.oid;
|
delimiter ;