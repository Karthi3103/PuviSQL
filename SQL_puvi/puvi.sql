create database puviagam;
use puviagam;

create table employee(SNO int auto_increment primary key,
                      emp_id varchar(20) unique,
					  emp_name varchar(50),
                      emp_email_id varchar(100) unique,
                      emp_password varchar(50),
                      emp_phone bigint,
                      emp_address varchar(400));
                      
                      
                      select project_site_number from employee;
			
                      
/* Stored procudure for auto increament*/
DELIMITER $$
CREATE TRIGGER employee_before_insert
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
  DECLARE next_id INT;
  SET next_id = (SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'employee' AND table_schema = DATABASE());
  SET NEW.emp_id = CONCAT('PAE_', LPAD(next_id, 1, '0'));
END$$
DELIMITER ;
/* End Stored procudure for auto increament*/
				
desc employee;
select * from employee;
truncate employee;

insert into employee values( "PAE002", "Muthu", "Muthu@gmail.com", "12345", 8569748569, "42/5, 4th sector, KK Nagar, chennai, Tamil Nadu, 600048");

insert into employee(emp_name,emp_email_id,emp_password,emp_phone,emp_address) values("karthi","karthi@gmail.com","12345",7896321456,"kknagar");
drop table employee;




/* customer details*/
                      create table customer(SNO int auto_increment primary key,
					  customer_id varchar(30) unique,
					  customer_name varchar(30),
                      customer_email_id varchar(50),
                      customer_password varchar(50),
                      customer_phone bigint,
                      customer_gender varchar(30),
                      Date_of_Birth varchar(15),
                      customer_address varchar(300),
                      project_site_number varchar(200)   ,
                      
                      site_location varchar(50) default "Processing",
                      site_area varchar(50) default "Processing",
                      site_district varchar(15) default "Processing",
                      site_state varchar(15) default "Processing",
                      site_pincode bigint default 0,
                      site_details varchar(500) default "Processing",
                      
                      emp_id varchar(20),
                      
                      phase_1 varchar(500) default "updating",
					  phase_1_remarks varchar(500) default "updating",
                       
                      phase_2 varchar(500) default "updating",
					  phase_2_remarks varchar(500) default "updating",
                       
                      phase_3 varchar(500) default "updating",
					  phase_3_remarks varchar(500) default "updating",
                       
                      phase_4 varchar(500) default "updating",
					  phase_4_remarks varchar(500) default "updating",
                       
                      phase_5 varchar(500) default "updating",
					  phase_5_remarks varchar(500) default "updating",
                       
                      phase_6 varchar(500) default "updating",
					  phase_6_remarks varchar(500) default "updating",
                       
                      phase_7 varchar(500) default "updating",
					  phase_7_remarks varchar(500) default "updating",
                       
                      phase_8 varchar(500) default "updating",
					  phase_8_remarks varchar(500) default "updating");
                      
                      
                      
                      
/* Stored procudure for auto increament*/
DELIMITER $$
CREATE TRIGGER customer_before_insert
BEFORE INSERT ON customer
FOR EACH ROW
BEGIN
  DECLARE next_id INT;
  SET next_id = (SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'customer' AND table_schema = DATABASE());
  SET NEW.customer_id = CONCAT('PAC_', LPAD(next_id, 1, '0'));
  SET NEW.project_site_number = CONCAT('PASITE_', LPAD(next_id, 1, '0'));
END$$
DELIMITER ;

/* End Stored procudure for auto increament*/

desc customer;
select * from customer;
drop table customer;
truncate customer;
insert into customer values("Karthi C", "karthi@gmail.com", "54321", 9874587985, "48/4, 5th sector, Anna Nagar, chennai, Tamil Nadu, 600050", 1, "Ramapuram", "10th sector", "chennai", "Tamil Nadu",  600047, "1058 sq.feet");

insert into customer( customer_name,customer_email_id, customer_password, customer_phone,  customer_gender, Date_of_Birth, customer_address) values("Karthi C", "k@gmail.com", "54321", 9874587985, "Male","05-04-2000", "48/4, 5th sector, Anna Nagar, chennai, Tamil Nadu, 600050");

insert into customer(site_location, site_area, site_district, site_state, site_pincode,  site_details) values("kknagar", "kknagar", "chennai", "TN", 632569, "sitedetail");

update customer set project_site_number = 001, site_location = "KKnagar", site_area="kk nagar", site_district="chennai", site_state="TN",  site_pincode = 523652,  site_details="site detail" where customer_id="CT001";






/*  Cost Details */

create table price_details(Sno int auto_increment primary key,
                           price_date date,
                           sand float,
                           cement float,
                           brick float,
                           steel float,
                           paint float,
                           flooring float,
                           kitchen_granite float);
                           
create table price_details(Sno int auto_increment primary key,
                           price_date date,
                           sand float,   3
                           cement float, 4
                           brick float,  5
                           steel float,  6
                           outer_paint float, 7
                           inner_paint float, 8
                           flooring float,    9
                           electrical_plumbing float, 10
                           bathroom_materials_amount float, 11
                           bathroom_door_amount float, 12
                           basic_main_door float, 13 
                           premium_main_door float, 14 
                           ultrapremium_main_door float, 15
                           bedroom_door_amount float,   16
                           window_cost float,   17 
                           kitchen_granite_amount float);  18 
                           
insert into 
price_details(price_date, sand, cement, brick, steel, outer_paint, inner_paint, flooring, electrical_plumbing, bathroom_materials_amount, 
bathroom_door_amount, basic_main_door,  premium_main_door, ultrapremium_main_door, bedroom_door_amount, window_cost, kitchen_granite_amount) 
values(now(), 65, 460, 10, 75, 30, 50, 150, 250, 20000, 3000, 50000, 75000, 100000, 12000, 700, 150);

desc price_details;	
drop table price_details;	

insert into price_details values(1,now(),50.0,420.0,5.0,67.0,460.0,100.0,3750.0);
insert into price_details values(2,now(),50.0,40.0,5.0,6.0,40.0,7.0,3750.0);
insert into price_details values(3,now(),0.00,40.0,5.0,6.0,40.0,7.0,3750.0);





truncate price_details;

update price_details set sand=55.5 where Sno=1;



/* temporary estimation table  */                          
create table temp_estimation(Sno int auto_increment primary key,
                              name varchar(50),
                              email_id varchar(50),
                              phone bigint,
                              date_of_estimation datetime,
                              area_measurement double,
                              
                              sandQuantity double,
                              sandAmount double,
                              
                              cementQuantity double,
                              cementAmount double,
                              
                              brickQuantity double,
                              brickAmount double,
                              
                              steelQuantity double,
                              steelAmount double,
                              
                              outerpaintArea double,
                              outerPaintAmount double,
                              
                              innerpaintArea double,
                              innerPaintAmount double,
                              
                              basementAmount double,
                              
                              flooring double,
                              flooringAmount double,
                              
                              electrical_plumbingAmount double,
                              
                              bathroomMatreialsAmount double,
                              
                              bathroomDoorAmount double,
                              
                              mainDoorAmount double,
                              
                              bedRoomDoor_Amount double,
                              
                              windowsCost double, 
                              
                              kitchenGraniteAmount double,
                              
                              totalCost double);
desc  temp_estimation;  
drop table temp_estimation; 
insert into temp_estimation values(1,"Muthu", "m@gmail.com",1000,1,2,3,4,5,6,7,8,9,10,11,12,13,14); 
select * from   temp_estimation; 
insert into  temp_estimation(name, email_id, date_of_estimation, area_measurement, sandQuantity, sandAmount, cementQuantity, cementAmount, brickQuantity, 
                             brickAmount, steelQuantity, steelAmount, paintQuantity, paintAmount, flooring, flooringAmount, kitchenGraniteAmount,
                             totalCost) values(?,?,now(),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);
truncate temp_estimation;    

select * from temp_estimation where  email_id="karthi@gmail.com" ;                        


			






