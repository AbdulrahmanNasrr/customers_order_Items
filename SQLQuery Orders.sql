create database ownerneeds;

create  table Orders(
orderId varchar(20) primary key
);

create table Order_Items(
order_item_Id varchar(20) primary key,
orderId varchar(20) ,
foreign key (orderId) references Orders(orderId));

alter table Order_Items
Add  item_Id varchar(20)

alter table Order_Items
add item_price Decimal(10,2)

alter table Order_Items
Add foreign key (item_Id) references Items(item_Id)



create table Items(
item_Id varchar(20) primary key,
item_name varchar(20) ,
item_price decimal(10,2),
item_size  varchar(10));


create table Ingredients(
ingredint_Id varchar(20) primary key,
ingredient_Name varchar(20),
ingredient_price decimal(10,2));



create table Item_Ingredient(
item_Id varchar(20),
foreign key (item_Id) references Items(item_Id),
ingredint_Id varchar(20),
foreign key (ingredint_Id) references Ingredients(Ingredint_Id),
quantity_required int);


create table inventory(
inventory_id int primary key,
item_Id varchar(20),
foreign key (item_Id ) references Items(item_Id ),
ingredint_Id varchar(20),
foreign key (ingredint_Id) references Ingredients(Ingredint_Id),
quantity int);

select *from inventory;

select *from Item_Ingredient ;


select *from Ingredients ;


select *from Items;


select *from  Order_Items;

select *from Orders;


INSERT INTO Orders (orderId) VALUES ('ORD001'), ('ORD002');

INSERT INTO Items (item_Id, item_name, item_price, item_size) 
VALUES ('ITM001', 'Pizza', 12.99, 'Large'),
       ('ITM002', 'Burger', 5.99, 'Medium'),
       ('ITM003', 'Pasta', 9.50, 'Small');



INSERT INTO Ingredients (ingredint_Id, ingredient_Name, ingredient_price) 
VALUES ('ING001', 'Flour', 0.50),
       ('ING002', 'Tomato Sauce', 1.00),
       ('ING003', 'Cheese', 2.00);


INSERT INTO Item_Ingredient (item_Id, ingredint_Id, quantity_required)
VALUES ('ITM001', 'ING001', 2), -- Pizza requires 2 units of flour
       ('ITM001', 'ING002', 1), -- Pizza requires 1 unit of tomato sauce
       ('ITM001', 'ING003', 1), -- Pizza requires 1 unit of cheese
       ('ITM002', 'ING001', 1), -- Burger requires 1 unit of flour
       ('ITM003', 'ING003', 1); -- Pasta requires 1 unit of cheese


INSERT INTO Inventory (inventory_id, item_Id, ingredint_Id, quantity) 
VALUES (1, 'ITM001', 'ING001', 100), -- 100 units of Flour in stock for Pizza
       (2, 'ITM001', 'ING002', 50),  -- 50 units of Tomato Sauce in stock for Pizza
       (3, 'ITM001', 'ING003', 20);  -- 20 units of Cheese in stock for Pizza

INSERT INTO Order_Items (order_item_Id, orderId, item_Id, item_price)
VALUES ('ORDITEM001', 'ORD001', 'ITM001', 12.99), -- First order contains Pizza
       ('ORDITEM002', 'ORD001', 'ITM002', 5.99),  -- First order also contains Burger
       ('ORDITEM003', 'ORD002', 'ITM003', 9.50);  -- Second order contains Pasta


INSERT INTO Orders (orderId) 
VALUES ('ORD003'), ('ORD004'), ('ORD005'), ('ORD006'), ('ORD007'), 
       ('ORD008'), ('ORD009'), ('ORD010'), ('ORD011'), ('ORD012');


INSERT INTO Items (item_Id, item_name, item_price, item_size) 
VALUES ('ITM004', 'Salad', 4.99, 'Small'),
       ('ITM005', 'Fries', 2.50, 'Medium'),
       ('ITM006', 'Chicken Wings', 8.99, 'Large'),
       ('ITM007', 'Steak', 14.99, 'Large'),
       ('ITM008', 'Soda', 1.50, 'Small'),
       ('ITM009', 'Water', 0.99, 'Small'),
       ('ITM010', 'Tacos', 6.75, 'Medium');

INSERT INTO Ingredients (ingredint_Id, ingredient_Name, ingredient_price) 
VALUES ('ING004', 'Lettuce', 0.25),
       ('ING005', 'Chicken', 3.00),
       ('ING006', 'Potato', 0.75),
       ('ING007', 'Beef', 5.00),
       ('ING008', 'Soda Syrup', 0.50),
       ('ING009', 'Taco Shell', 1.00),
       ('ING010', 'Seasoning', 0.20);

INSERT INTO Item_Ingredient (item_Id, ingredint_Id, quantity_required)
VALUES ('ITM004', 'ING004', 1), -- Salad requires 1 unit of lettuce
       ('ITM006', 'ING005', 3), -- Chicken Wings require 3 units of chicken
       ('ITM005', 'ING006', 2), -- Fries require 2 units of potato
       ('ITM007', 'ING007', 1), -- Steak requires 1 unit of beef
       ('ITM008', 'ING008', 1), -- Soda requires 1 unit of soda syrup
       ('ITM010', 'ING009', 2), -- Tacos require 2 units of taco shells
       ('ITM010', 'ING010', 1); -- Tacos also require 1 unit of seasoning


INSERT INTO Inventory (inventory_id, item_Id, ingredint_Id, quantity) 
VALUES (4, 'ITM004', 'ING004', 200),  -- 200 units of Lettuce in stock for Salad
       (5, 'ITM006', 'ING005', 100),  -- 100 units of Chicken in stock for Wings
       (6, 'ITM005', 'ING006', 150),  -- 150 units of Potato in stock for Fries
       (7, 'ITM007', 'ING007', 50),   -- 50 units of Beef in stock for Steak
       (8, 'ITM008', 'ING008', 300),  -- 300 units of Soda Syrup in stock for Soda
       (9, 'ITM010', 'ING009', 120),  -- 120 units of Taco Shell in stock for Tacos
       (10, 'ITM010', 'ING010', 400); -- 400 units of Seasoning in stock for Tacos



INSERT INTO Order_Items (order_item_Id, orderId, item_Id, item_price)
VALUES ('ORDITEM004', 'ORD003', 'ITM004', 4.99),  -- Third order contains Salad
       ('ORDITEM005', 'ORD003', 'ITM006', 8.99),  -- Third order also contains Chicken Wings
       ('ORDITEM006', 'ORD004', 'ITM007', 14.99), -- Fourth order contains Steak
       ('ORDITEM007', 'ORD005', 'ITM008', 1.50),  -- Fifth order contains Soda
       ('ORDITEM008', 'ORD006', 'ITM009', 0.99),  -- Sixth order contains Water
       ('ORDITEM009', 'ORD007', 'ITM005', 2.50),  -- Seventh order contains Fries
       ('ORDITEM010', 'ORD008', 'ITM010', 6.75),  -- Eighth order contains Tacos
       ('ORDITEM011', 'ORD009', 'ITM006', 8.99),  -- Ninth order contains Chicken Wings
       ('ORDITEM012', 'ORD010', 'ITM004', 4.99);  -- Tenth order contains Salad



INSERT INTO Orders (orderId) 
VALUES ('ORD013'), ('ORD014'), ('ORD015'), ('ORD016'), ('ORD017'), 
       ('ORD018'), ('ORD019'), ('ORD020'), ('ORD021'), ('ORD022');


INSERT INTO Items (item_Id, item_name, item_price, item_size) 
VALUES ('ITM011', 'Soup', 3.50, 'Medium'),
       ('ITM012', 'Pancakes', 5.25, 'Large'),
       ('ITM013', 'Fried Rice', 7.99, 'Medium'),
       ('ITM014', 'Sushi Roll', 9.75, 'Small'),
       ('ITM015', 'Grilled Cheese', 4.50, 'Small'),
       ('ITM016', 'Milkshake', 3.99, 'Medium'),
       ('ITM017', 'Hot Dog', 4.99, 'Small');


INSERT INTO Ingredients (ingredint_Id, ingredient_Name, ingredient_price) 
VALUES ('ING011', 'Rice', 1.00),
       ('ING012', 'Cheese', 2.50),
       ('ING013', 'Bread', 0.80),
       ('ING014', 'Milk', 1.25),
       ('ING015', 'Sausage', 2.75),
       ('ING016', 'Fish', 4.50),
       ('ING017', 'Vegetables', 1.50);


INSERT INTO Item_Ingredient (item_Id, ingredint_Id, quantity_required)
VALUES ('ITM011', 'ING017', 2), -- Soup requires 2 units of vegetables
       ('ITM012', 'ING014', 1), -- Pancakes require 1 unit of milk
       ('ITM013', 'ING011', 2), -- Fried Rice requires 2 units of rice
       ('ITM014', 'ING016', 1), -- Sushi Roll requires 1 unit of fish
       ('ITM015', 'ING012', 1), -- Grilled Cheese requires 1 unit of cheese
       ('ITM015', 'ING013', 2), -- Grilled Cheese also requires 2 units of bread
       ('ITM017', 'ING015', 1), -- Hot Dog requires 1 unit of sausage
       ('ITM017', 'ING013', 1); -- Hot Dog also requires 1 unit of bread

	INSERT INTO Inventory (inventory_id, item_Id, ingredint_Id, quantity) 
VALUES (11, 'ITM011', 'ING017', 100),  -- 100 units of Vegetables in stock for Soup
       (12, 'ITM012', 'ING014', 50),   -- 50 units of Milk in stock for Pancakes
       (13, 'ITM013', 'ING011', 200),  -- 200 units of Rice in stock for Fried Rice
       (14, 'ITM014', 'ING016', 30),   -- 30 units of Fish in stock for Sushi Roll
       (15, 'ITM015', 'ING012', 60),   -- 60 units of Cheese in stock for Grilled Cheese
       (16, 'ITM015', 'ING013', 120),  -- 120 units of Bread in stock for Grilled Cheese
       (17, 'ITM017', 'ING015', 70),   -- 70 units of Sausage in stock for Hot Dog
       (18, 'ITM017', 'ING013', 80);   -- 80 units of Bread in stock for Hot Dog


INSERT INTO Order_Items (order_item_Id, orderId, item_Id, item_price)
VALUES ('ORDITEM013', 'ORD011', 'ITM011', 3.50),  -- Eleventh order contains Soup
       ('ORDITEM014', 'ORD012', 'ITM012', 5.25),  -- Twelfth order contains Pancakes
       ('ORDITEM015', 'ORD013', 'ITM013', 7.99),  -- Thirteenth order contains Fried Rice
       ('ORDITEM016', 'ORD014', 'ITM014', 9.75),  -- Fourteenth order contains Sushi Roll
       ('ORDITEM017', 'ORD015', 'ITM015', 4.50),  -- Fifteenth order contains Grilled Cheese
       ('ORDITEM018', 'ORD016', 'ITM016', 3.99),  -- Sixteenth order contains Milkshake
       ('ORDITEM019', 'ORD017', 'ITM017', 4.99),  -- Seventeenth order contains Hot Dog
       ('ORDITEM020', 'ORD018', 'ITM011', 3.50),  -- Eighteenth order contains Soup
       ('ORDITEM021', 'ORD019', 'ITM013', 7.99),  -- Nineteenth order contains Fried Rice
       ('ORDITEM022', 'ORD020', 'ITM014', 9.75);  -- Twentieth order contains Sushi Roll



	select *from Order_Items ;

	
	select *from  Inventory ;

	select *from Item_Ingredient;

INSERT INTO Orders (orderId) 
VALUES ('ORD023'), ('ORD024'), ('ORD025'), ('ORD026'), ('ORD027'), 
       ('ORD028'), ('ORD029'), ('ORD030'), ('ORD031'), ('ORD032');

INSERT INTO Items (item_Id, item_name, item_price, item_size) 
VALUES ('ITM018', 'Pizza', 12.99, 'Large'),
       ('ITM019', 'Ice Cream', 3.99, 'Small'),
       ('ITM020', 'Spaghetti', 9.50, 'Medium'),
       ('ITM021', 'Burger', 7.25, 'Medium'),
       ('ITM022', 'Lasagna', 11.75, 'Large'),
       ('ITM023', 'Apple Pie', 4.99, 'Small'),
       ('ITM024', 'Salmon Fillet', 14.99, 'Large');

INSERT INTO Ingredients (ingredint_Id, ingredient_Name, ingredient_price) 
VALUES ('ING018', 'Tomato Sauce', 1.25),
       ('ING019', 'Mozzarella', 2.00),
       ('ING020', 'Beef Patty', 3.00),
       ('ING021', 'Spaghetti Pasta', 1.50),
       ('ING022', 'Salmon', 5.50),
       ('ING023', 'Apple', 1.00),
       ('ING024', 'Pasta Sheets', 2.50);




	   INSERT INTO Item_Ingredient (item_Id, ingredint_Id, quantity_required)
VALUES ('ITM018', 'ING018', 2), -- Pizza requires 2 units of tomato sauce
       ('ITM018', 'ING019', 1), -- Pizza requires 1 unit of mozzarella
       ('ITM021', 'ING020', 1), -- Burger requires 1 unit of beef patty
       ('ITM020', 'ING021', 2), -- Spaghetti requires 2 units of spaghetti pasta
       ('ITM022', 'ING019', 1), -- Lasagna requires 1 unit of mozzarella
       ('ITM022', 'ING024', 2), -- Lasagna requires 2 units of pasta sheets
       ('ITM024', 'ING022', 1), -- Salmon Fillet requires 1 unit of salmon
       ('ITM023', 'ING023', 2); -- Apple Pie requires 2 units of apple







INSERT INTO Inventory (inventory_id, item_Id, ingredint_Id, quantity) 
VALUES (19, 'ITM018', 'ING018', 150),  -- 150 units of Tomato Sauce in stock for Pizza
       (20, 'ITM018', 'ING019', 120),  -- 120 units of Mozzarella in stock for Pizza
       (21, 'ITM021', 'ING020', 80),   -- 80 units of Beef Patty in stock for Burger
       (22, 'ITM020', 'ING021', 200),  -- 200 units of Spaghetti Pasta in stock for Spaghetti
       (23, 'ITM024', 'ING022', 60),   -- 60 units of Salmon in stock for Salmon Fillet
       (24, 'ITM023', 'ING023', 100),  -- 100 units of Apple in stock for Apple Pie
       (25, 'ITM022', 'ING024', 90),   -- 90 units of Pasta Sheets in stock for Lasagna
       (26, 'ITM022', 'ING019', 100);  -- 100 units of Mozzarella in stock for Lasagna




INSERT INTO Order_Items (order_item_Id, orderId, item_Id, item_price)
VALUES ('ORDITEM023', 'ORD021', 'ITM018', 12.99),  -- Twenty-first order contains Pizza
       ('ORDITEM024', 'ORD022', 'ITM019', 3.99),   -- Twenty-second order contains Ice Cream
       ('ORDITEM025', 'ORD023', 'ITM020', 9.50),   -- Twenty-third order contains Spaghetti
       ('ORDITEM026', 'ORD024', 'ITM021', 7.25),   -- Twenty-fourth order contains Burger
       ('ORDITEM027', 'ORD025', 'ITM022', 11.75),  -- Twenty-fifth order contains Lasagna
       ('ORDITEM028', 'ORD026', 'ITM023', 4.99),   -- Twenty-sixth order contains Apple Pie
       ('ORDITEM029', 'ORD027', 'ITM024', 14.99),  -- Twenty-seventh order contains Salmon Fillet
       ('ORDITEM030', 'ORD028', 'ITM020', 9.50),   -- Twenty-eighth order contains Spaghetti
       ('ORDITEM031', 'ORD029', 'ITM018', 12.99),  -- Twenty-ninth order contains Pizza
       ('ORDITEM032', 'ORD030', 'ITM022', 11.75);  -- Thirtieth order contains Lasagna


	   select *from inventory;

select *from Item_Ingredient ;


select *from Ingredients ;


select *from Items;


select *from  Order_Items;

select *from Orders;




select top 5 *from Order_Items;


select top 6 *from Ingredients;

select *from Ingredients  where ingredient_Name='Potato';

SELECT distinct  ingredient_price from Ingredients;

SELECT * from Ingredients;
select distinct ingredient_Name from Ingredients;

select distinct quantity_required from Item_Ingredient ;

select *from Item_Ingredient ;



select ingredient_price, ingredint_Id from Ingredients 
union
select cast(quantity_required  as decimal(10,2)), ingredint_Id from Item_Ingredient
order by ingredint_Id;




select ingredient_price from Ingredients 
union
select cast(quantity_required  as decimal(10,2)) from Item_Ingredient
order by ingredient_price;


select * from Order_Items order by item_price asc;

select distinct item_price from Order_Items;


select * from Items

select item_name ,max(item_price)as maximum
from Items
group by item_name
having(count(*)=1)

select avg(item_price) from Items

select item_name ,min(item_price)as minimum
from Items
group by item_name
having(count(*)=1 )

select max(item_price)from Items;
select min(item_price)from Items;

select * from Ingredients

select  Ingredint_id ,ingredient_price,avg(ingredient_price) over (order by ingredint_id  rows between 4 preceding and 10 following) from Ingredients


select Ingredint_id , ingredient_price ,dense_rank () over(order by ingredient_price desc) as Rank_price from Ingredients

select *from inventory;

select count(quantity) from inventory 

select sum(quantity )from inventory

select inventory_id , quantity, DENSE_RANK() over(order by quantity desc )as Rank_quantity from inventory

select *from Order_Items

select order_item_Id , item_price ,DENSE_RANK() over (order by item_price desc)as Rank_price from Order_Items

select order_item_Id , item_price, sum(item_price) over(partition by item_price) from Order_Items