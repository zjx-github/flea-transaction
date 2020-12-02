/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/12/2 17:21:43                           */
/*==============================================================*/


drop table if exists admin;

drop table if exists demand_label;

drop table if exists label;

drop table if exists pro_demand;

drop table if exists product;

drop table if exists product_label;

drop table if exists product_pic;

drop table if exists user;

drop table if exists user_favorites;

drop table if exists user_message;

drop table if exists user_order;

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   admin_id             varchar(50) not null,
   password             varchar(50) not null,
   primary key (admin_id)
);

/*==============================================================*/
/* Table: demand_label                                          */
/*==============================================================*/
create table demand_label
(
   demand_id            int not null,
   label_id             int not null,
   primary key (demand_id, label_id)
);

/*==============================================================*/
/* Table: "label"                                               */
/*==============================================================*/
create table label
(
   label_id             int not null,
   label_name           varchar(50) not null,
   primary key (label_id)
);

/*==============================================================*/
/* Table: pro_demand                                            */
/*==============================================================*/
create table pro_demand
(
   demand_id            int not null,
   user_id              int,
   demand_name          varchar(50) not null,
   demand_description   varchar(1024) not null,
   demand_price         float not null,
   primary key (demand_id)
);

/*==============================================================*/
/* Table: product                                               */
/*==============================================================*/
create table product
(
   product_id           int not null,
   user_id              int,
   product_name         varchar(50) not null,
   product_price        float not null,
   product_description  varchar(1024) not null,
   primary key (product_id)
);

/*==============================================================*/
/* Table: product_label                                         */
/*==============================================================*/
create table product_label
(
   product_id           int not null,
   label_id             int not null,
   primary key (product_id, label_id)
);

/*==============================================================*/
/* Table: product_pic                                           */
/*==============================================================*/
create table product_pic
(
   product_id           int,
   product_pictrue      varchar(255)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              int not null,
   user_name            varchar(255),
   user_email           varchar(100),
   user_phone           varchar(50),
   password             varchar(50),
   user_credit          float,
   user_avator          varchar(255),
   realname             varchar(50),
   idcard               varchar(50),
   stunumber            varchar(50),
   primary key (user_id)
);

/*==============================================================*/
/* Table: user_favorites                                        */
/*==============================================================*/
create table user_favorites
(
   user_id              int not null,
   product_id           int not null,
   primary key (user_id, product_id)
);

/*==============================================================*/
/* Table: user_message                                          */
/*==============================================================*/
create table user_message
(
   user_id              int not null,
   product_id           int not null,
   message              varchar(1024),
   primary key (user_id, product_id)
);

/*==============================================================*/
/* Table: user_order                                            */
/*==============================================================*/
create table user_order
(
   user_id              int not null,
   product_id           int not null,
   order_status         varchar(50) not null,
   primary key (user_id, product_id)
);

alter table demand_label add constraint FK_demand_label foreign key (demand_id)
      references pro_demand (demand_id) on delete restrict on update restrict;

alter table demand_label add constraint FK_demand_label2 foreign key (label_id)
      references label (label_id) on delete restrict on update restrict;

alter table pro_demand add constraint FK_user_demand foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table product add constraint FK_user_pro foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table product_label add constraint FK_product_label foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table product_label add constraint FK_product_label2 foreign key (label_id)
      references label (label_id) on delete restrict on update restrict;

alter table product_pic add constraint FK_pro_pic foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table user_favorites add constraint FK_user_favorites foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table user_favorites add constraint FK_user_favorites2 foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table user_message add constraint FK_user_message foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table user_message add constraint FK_user_message2 foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table user_order add constraint FK_user_order foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table user_order add constraint FK_user_order2 foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

