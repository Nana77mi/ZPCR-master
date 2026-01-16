show databases;

create database if not exists test;

use test;

show tables;

drop table if exists comment;
drop table if exists `order`;
drop table if exists image;
drop table if exists car;
drop table if exists user;

create table if not exists user(
                                   id int primary key auto_increment,
                                   username varchar(25),
                                   password varchar(25),
                                   age int,
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

create table if not exists image(
                                    file_name varchar(255) primary key,
                                    car_id int references car(id)
);

create table if not exists `order`(
                                      id char(16) primary key,
                                      user_id int references user(id),
                                      car_id int references car(id),
                                      status varchar(20),
                                      description varchar(255),
                                      appoint_start_time date,
                                      appoint_return_time date,
                                      real_appoint_start_time timestamp,
                                      real_appoint_return_time timestamp,
                                      order_start_time timestamp,
                                      order_finish_time timestamp,
                                      payment_method varchar(50),
                                      payment_id varchar(50),
                                      price double,
                                      remark varchar(255),
                                      extra_fee double,
                                      arrearage_payment_id varchar(50),
                                      refunded_fee double
);

create table if not exists comment(
                                      id int primary key auto_increment,
                                      content varchar(255),
                                      time date,
                                      user_id int references user(id),
                                      car_id int references car(id)
);


insert into user (id, username, password, age, gender, address, driving_license, phone_number, role)
values (1, 'root', 'root', 114514, 'male', 'Wen Hui', '10086', '13901434002', 'ROLE_ADMIN');

insert into car (id, brand, type,introduction, number_of_seats, number_of_doors, luggage_capacity, fuel_type, transmission_type,
                 license_plate_number, daily_rent)
values (1, 'volvo', 'S60', '这是一段介绍', 5, 5, 427, '95#', '7档双离合', '苏A6H8V6', 300);
insert into car (id, brand, type, introduction, number_of_seats, number_of_doors, luggage_capacity, fuel_type, transmission_type,
                 license_plate_number, daily_rent)
values (2, '奥迪', 'A4L', '这是一段介绍', 5, 5, 424, '95#', '7档双离合', '苏A12345', 299);

insert into `order` (id, user_id, car_id, status, description, appoint_start_time, appoint_return_time, order_start_time, order_finish_time, payment_method, payment_id, price)
values ('0000000000000001', 1, 1, 'Appointed', '这是一辆超级豪华跑车', current_date, current_date, current_timestamp, null, 'alipay', '1145141919810', 0.01);

insert into comment (content, time, user_id, car_id)
values ('车辆很新，体验不错。', current_date, 1, 1);
