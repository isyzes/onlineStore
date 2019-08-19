drop database store;
create database store;

use store;


create table hibernate_sequence (next_val bigint);
insert into hibernate_sequence values ( 1 );


create table address (
	id bigint not null,
	apartment varchar(255),
	city varchar(255),
	country varchar(255),
	mobile varchar(255),
	name varchar(255), state
	varchar(255),
	street varchar(255),
	zip varchar(255),

	primary key (id)
);

create table credit_cards (
	id bigint not null,
	card_number varchar(255),
	cvv varchar(255),
	expires varchar(255),
	holder varchar(255),

	primary key (id)
);

create table user (
	id bigint not null,
	activation_code varchar(255),
	email varchar(255),
	first_name varchar(255),
	activation_account bit,
	last_name varchar(255),
	password varchar(255),
	sex varchar(255),
	addresses_id bigint,
	credit_card_id bigint,

	primary key (id),
	foreign key (addresses_id) references address (id),
	foreign key (credit_card_id) references credit_cards (id)
);

create table email (id bigint not null, email varchar(255), primary key (id)) engine=MyISAM;

create table product_items (
	id bigint not null,
	avatar_photo varchar(255),
	brand varchar(255),
	name varchar(255),
	on_sale bit,
	price double precision,
	product_id bigint,
	size varchar(255),

	primary key (id)
);



create table user_role (
user_id bigint not null,
roles varchar(255),

foreign key (user_id) references user (id)
);

create table orders (
	id bigint not null,
	product_item_id bigint,

	primary key (id),
	foreign key (product_item_id) references product_items (id)
);

create table parcels (
	id bigint not null,
	address_id bigint,
	credit_card_id bigint,
	product_item_id bigint,

	primary key (id),
	foreign key (product_item_id) references product_items (id),
	foreign key (address_id) references address (id),
	foreign key (credit_card_id) references credit_cards (id)
) ;


create table basket (
user_id bigint not null,
order_id bigint not null,

foreign key (user_id) references user (id),
foreign key (order_id) references orders (id)
); -- корзина


create table purchases (
user_id bigint not null,
parcel_id bigint not null,

foreign key (user_id) references user (id),
foreign key (parcel_id) references parcels (id)
); -- покупки

create table product (
	id bigint not null,
	avatar_photo varchar(255),
	brand varchar(255),
	categories varchar(255),
	details varchar(600),
	main_photo varchar(255),
	name varchar(255),
	new_arrivals bit,
	price double precision,
	rating bigint,
	section varchar(255),
	special_offers bit,
	user_id bigint,

	primary key (id),
    foreign key (user_id) references user (id)
);

create table product_colour (
	product_id bigint not null,
	colour varchar(255),

    foreign key (product_id) references product (id)
);

create table product_photo (
	product_id bigint not null,
	photos varchar(255),

    foreign key (product_id) references product (id)
);

create table product_size (
	product_id bigint not null,
	size varchar(255),

    foreign key (product_id) references product (id)
);


create table products_related (
	product_id bigint not null,
	related_product_id bigint not null,

	foreign key (product_id) references product (id),
	foreign key (related_product_id) references product (id)
);


insert user(id ,email, password, activation_account) value (1, 'isyzes@gmail.com', '$2a$08$2BFxOjxveYsPrf8tY.VVe.0huNNeW3/nZiSxwAI0T5QB12RdPWnNO', 1);
insert user_role values(1, 'ROLE_ADMIN');
