CREATE TABLE customers (
   first_name VARCHAR(20) NOT NULL,
   last_name  VARCHAR(20) NOT NULL,
   phone      VARCHAR(20) NOT NULL,
   street     VARCHAR(50),
   zipcode    VARCHAR(5),
   CONSTRAINT customers_pk PRIMARY KEY (first_name, last_name, phone));


-- State Table
CREATE TABLE states (
    state_name varchar(20) not null,
    constraint state_pk primary key(state_name));

-- City Table 
Create TABLE city(
    state_name varchar(20) not null,
    city_name varchar(20) not null,
    cid integer not null,
    constraint city_pk primary key(cid),
    constraint state_city_fk foreign key(state_name)
        references states(state_name)
);

-- Airport Table
CREATE TABLE airport(
    airport_name varchar(20) not null,
    FAA_approved_abbreviation varchar(20) not null,
    cid integer not null,
    constraint airport_pk primary key(airport_name),
    constraint airport_city_fk foreign key(cid)
    references city(cid)
);

-- Airline Table
CREATE TABLE airline(
    aid integer not null,
    airline_name varchar(20) not null,
    cid integer not null,
    constraint airline_pk primary key(aid),
    constraint airline_city_fk foreign key(cid)
    references city(cid)
);

-- Airport-airline table
CREATE TABLE airport_airline
(
    airport_name varchar(20) not null,
    aid integer not null,
    constraint airport_airline_pk primary key(airport_name, aid),
    constraint airport_airline_airport_fk foreign key(airport_name)
    references airport(airport_name),
    constraint airport_airline_airline_fk foreign key(aid)
    references airline(aid)
);


-- Airplane Table
CREATE TABLE airplane(
    manufacurer varchar(20) not null,
    model_number varchar(20) not null,
    passenger_maximum varchar(20) not null,
    tail_number varchar(20) not null,
    plane_name varchar(20) not null,
    year_manufactured varchar(20) not null,
    aid integer not null,
    constraint airplane_pk primary key(tail_number),
    constraint airplane_airline_fk foreign key(aid)
    references airline(aid)
);
