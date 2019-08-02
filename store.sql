drop database store;
create database store;

use store;

create table address (
	id bigint not null,
	apartment varchar(255),
	city varchar(255),
	country varchar(255),
	mobile varchar(255),
	name varchar(255),
	state varchar(255),
	street varchar(255),
	zip varchar(255),
	primary key (id)
) engine=MyISAM;

create table credit_cards (
	id bigint not null,
	card_number varchar(255),
	cvv varchar(255),
	expires varchar(255),
	holder varchar(255),
	primary key (id)
) engine=MyISAM;

create table email (
	id bigint not null auto_increment,
	email varchar(255),
	primary key (id)
) engine=MyISAM;

create table orders (
	id bigint not null,
	product_item_id bigint,
	user_id bigint,
	primary key (id)
) engine=MyISAM;

create table parcels (
	id bigint not null,
	address_id bigint,
	credit_card_id bigint,
	product_item_id bigint,
	user_id bigint,
	primary key (id)
) engine=MyISAM;

create table product_items (
	id bigint not null,
	avatar_photo varchar(255),
	brand varchar(255),
	name varchar(255),
	price double precision,
  size varchar(255),
  product_id bigint not null,
  on_sale bit,
  primary key (id)
) engine=MyISAM;

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
	primary key (id)
) engine=MyISAM;

create table product_colour (
	product_id bigint not null,
	colour varchar(255)
) engine=MyISAM;

create table product_photo (
	product_id bigint not null,
	photos varchar(255)
) engine=MyISAM;

create table product_size (
	product_id bigint not null,
	size varchar(255)
) engine=MyISAM;

create table products_related (
	product_id bigint not null,
	related_product_id bigint not null,
	primary key (product_id, related_product_id)
) engine=MyISAM;

create table user (
	id bigint not null,
	email varchar(255),
	first_name varchar(255),
	last_name varchar(255),
	password varchar(255),
	sex varchar(255),
	addresses_id bigint,
	credit_card_id bigint,
	activation_code varchar(255),
	activation_account bit,
	primary key (id)
) engine=MyISAM;

create table user_role (
	user_id bigint not null,
	roles varchar(255)
) engine=MyISAM;

create table hibernate_sequence (
	next_val bigint
) engine=MyISAM;

insert into hibernate_sequence values ( 3 );

alter table orders add constraint FK787ibr3guwp6xobrpbofnv7le foreign key (product_item_id) references product_items (id);
alter table orders add constraint FKel9kyl84ego2otj2accfd8mr7 foreign key (user_id) references user (id);

alter table parcels add constraint FK27jom1bfw7009bl7tx44v139q foreign key (address_id) references address (id);
alter table parcels add constraint FK9them9i1dwlovu4qu4d5wqa5j foreign key (credit_card_id) references credit_cards (id);
alter table parcels add constraint FKahvdqnn9a87ijmtn86k82fsx2 foreign key (product_item_id) references product_items (id);
alter table parcels add constraint FKmf3sm7ue2jqyomlff3vjsgoi8 foreign key (user_id) references user (id);

alter table product add constraint FK979liw4xk18ncpl87u4tygx2u foreign key (user_id) references user (id);
alter table product_colour add constraint FKostupxgkfnf4c38ce9r95ipsq foreign key (product_id) references product (id);
alter table product_photo add constraint FKsgi4krgb65fktq55a5xw6seqq foreign key (product_id) references product (id);
alter table product_size add constraint FK8i3jm2ctt0lsyeik2wt76yvv0 foreign key (product_id) references product (id);
alter table products_related add constraint FKcr6he8dr5sfx09lvpn27h0xdg foreign key (related_product_id) references product (id);
alter table products_related add constraint FKnkmjqyq85uwp7cn42q09yj41t foreign key (product_id) references product (id);

alter table user add constraint FK53252plvatm5ofj7qscphscd foreign key (addresses_id) references address (id);
alter table user add constraint FKn9kd6c57vf9fj6e5fno030qjt foreign key (credit_card_id) references credit_cards (id);
alter table user_role add constraint FK859n2jvi8ivhui0rl0esws6o foreign key (user_id) references user (id);

insert user(id ,email, password) value (1, 'isyzes@gmail.com', '$2a$08$2BFxOjxveYsPrf8tY.VVe.0huNNeW3/nZiSxwAI0T5QB12RdPWnNO');
insert user_role values(1, 'ROLE_ADMIN');

insert into product (user_id, avatar_photo, brand, categories, details, main_photo, name, new_arrivals, price, rating, section, special_offers, id)
  values (1, '74134d62-a736-45df-849f-91cf451d7c56.8.jpg', 'Brand', 'MEN', 'Details', '004b9109-ddec-4bff-9230-09555bd685b2.w8.jpg', 'Watches', 'true', '100.0', null, 'Hoodies & Sweatshirts', 'true', 2);


insert into product_colour (product_id, colour) values (2, 'COLOR4');
insert into product_size (product_id, size) values (2, 'L')