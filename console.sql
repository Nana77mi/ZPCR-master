show databases ;

create database test;

use test;

show tables ;

drop table user;
drop table car;
drop table `order`;
drop table image;

create table if not exists user(
                                   id int primary key auto_increment,
                                   username varchar(25) ,
                                   password varchar(25) ,
                                   age int ,
                                   gender varchar(10),
                                   address varchar(255),
                                   driving_license varchar(255),
                                   phone_number varchar(20),
                                   role varchar(20)
);

create table if not exists car(
                                  id int primary key auto_increment,
                                  brand varchar(50),
                                  type varchar(100),
                                  introduction varchar(255),
                                  number_of_seats int,
                                  number_of_doors int,
                                  luggage_capacity double,
                                  fuel_type varchar(10),
                                  transmission_type varchar(100),
                                  license_plate_number varchar(10),
                                  daily_rent double
);

create table if not exists `order`(
                                      id char(16) primary key,
                                      user_id int references user(id),
                                      car_id int references car(id),
                                      description varchar(255),
                                      status varchar(20),
                                      start_outlet varchar(255),
                                      return_outlet varchar(255),
                                      real_appoint_start_time timestamp,
                                      real_appoint_return_time timestamp,
                                      appoint_start_time date,
                                      appoint_return_time date,
                                      order_start_time timestamp,
                                      order_finish_time timestamp,
                                      payment_method varchar(50),
                                      payment_id varchar(50),
                                      price double
);

create table if not exists image(
                                    file_name varchar(255) primary key ,
                                    car_id int references car(id)
);



insert into user (id, username, password, age, gender, address, driving_license, phone_number) VALUES (1, 'root', 'root', 114514, 'male', 'Wen Hui', '10086', '13901434002');

insert into car (id, brand, type,introduction, number_of_seats, number_of_doors, luggage_capacity, fuel_type, transmission_type,
                 license_plate_number, daily_rent)
values (1, 'volvo', 'S60', '这是一段介绍', 5, 5, 427, '95#', '7档双离合', '苏A6H8V6', 300);
insert into car (id, brand, type, introduction, number_of_seats, number_of_doors, luggage_capacity, fuel_type, transmission_type,
                 license_plate_number, daily_rent)
values (2, '奥迪', 'A4L', '这是一段介绍', 5, 5, 424, '95#', '7档双离合', '苏A12345', 299);

insert into `order` (id, user_id, car_id, description, status, appoint_start_time, appoint_return_time, order_start_time, order_finish_time, payment_method, payment_id, price)
VALUES ('0000000000000001', 13, 1, '这是一辆超级豪华跑车', 'Appoint', current_date, current_date, current_timestamp, current_timestamp, 'alipay', '1145141919810', 0.01);

insert into `order` (id, user_id, car_id, description, status, appoint_start_time, appoint_return_time, order_start_time, order_finish_time, payment_method, payment_id, price)
VALUES ('0000000000000002', 13, 2, '这是一辆超级豪华跑车', 'Finished', current_date, current_date, current_timestamp, current_timestamp, 'alipay', '1145141919810', 0.01);

update user set address=123 where id = 1;

select *
from user;

insert into user (id, username, password, age, gender, address, driving_license, phone_number) VALUES (2, '1', '1', 11, 'male', 'Wen Hui', '10086', '13901434002');
insert into user (id, username, password, age, gender, address, driving_license, phone_number, role) VALUES (3, 'root', 'root', 114514, 'male', 'Wen Hui', '10086', '13901434002', 'ROLE_ADMIN');
