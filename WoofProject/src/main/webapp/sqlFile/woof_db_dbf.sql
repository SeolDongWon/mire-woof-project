commit;
------------------------------------------------------------------------ACCOUNT
CREATE TABLE account (
	username    varchar2(200)	NOT NULL,
	password    varchar2(200)	NOT NULL,
	name        varchar2(200)	NOT NULL,
	tel	        varchar2(200)	NOT NULL,
	address     varchar2(200)	NOT NULL,
	state       varchar2(200)	DEFAULT 'active',
	regDate     date	        DEFAULT SYSDATE,
    CONSTRAINT account_pk PRIMARY KEY (username)
);

DROP TABLE account;
---------------------------------------------------------------------------ITEM
CREATE TABLE item (
    itemNo      number          NOT NULL,
    itemName    varchar2(200)   NOT NULL,
    price       number          NOT NULL,
    stock       number          NOT NULL,
    itemType    varchar2(200)   NOT NULL,
    itemSize    varchar2(200),
    itemRegDate date            DEFAULT SYSDATE,
    itemMainPic varchar2(200)   NOT NULL,
    itemSubPic  varchar2(200)   NOT NULL,
    itemDesc    varchar2(3000),
    CONSTRAINT item_pk PRIMARY KEY (itemNo)
);
CREATE SEQUENCE itemNo_seq
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

DROP TABLE item;
DROP SEQUENCE itemNo_seq;
----------------------------------------------------------------------------PET
CREATE TABLE pet (
    petNo       number          NOT NULL,
    username    varchar2(200)   NOT NULL,
    petName     varchar2(200)   NOT NULL,
    petAge      number          NOT NULL,
    petType     varchar2(200)   NOT NULL,
    petGender   varchar2(10)    NOT NULL,
    petDesc     varchar2(3000)  NOT NULL,
    petRegDate  date            DEFAULT SYSDATE,
    petModDate  date,
    adoptDate   date,
    petStatus   varchar2(200)   NOT NULL,
    petMainPic  varchar2(200)   NOT NULL,
    petSubPic   varchar2(200)   NOT NULL,
    CONSTRAINT pet_pk PRIMARY KEY (petNo),
    CONSTRAINT pet_fk FOREIGN KEY (username) REFERENCES account (username),
    CONSTRAINT petGender_ck CHECK (petGender IN('M', 'F'))
);
CREATE SEQUENCE petNo_seq
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

DROP TABLE pet;
DROP SEQUENCE petNo_seq;
---------------------------------------------------------------------------CART
CREATE TABLE cart (
    cartNo      number          NOT NULL,
    username    varchar2(200)   NOT NULL,
    itemNo      number          NOT NULL,
    itemName    varchar2(200)   NOT NULL,
    quantity    number          NOT NULL,
    price       number          NOT NULL,
    itemSize    varchar2(10),
    itemMainPic varchar2(200)   NOT NULL,
    checkStatus varchar2(10)    NOT NULL,
    CONSTRAINT cart_pk PRIMARY KEY (cartNo),
    CONSTRAINT cart_username_fk FOREIGN KEY (username) REFERENCES account (username),
    CONSTRAINT cart_itemNo_fk FOREIGN KEY (itemNo) REFERENCES item (itemNo),
    CONSTRAINT checkStatus_ck CHECK (checkStatus IN ('checked', 'unchecked'))
);
CREATE SEQUENCE cartNo_seq
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
    
DROP TABLE cart;
DROP SEQUENCE cartNo_seq;
----------------------------------------------------------------------ORDERITEM
CREATE TABLE orderItem (
    orderNo	    number	        NOT NULL,
	itemNo	    number	        NOT NULL,
	itemName	varchar2(200)	NOT NULL,
	quantity	number      	NOT NULL,
	price	    number      	NOT NULL,
	itemMainPic	varchar2(200)	NOT NULL,
    CONSTRAINT orderItem_pk PRIMARY KEY (orderNo),
    CONSTRAINT orderItem_fk FOREIGN KEY (itemNo) REFERENCES item (itemNo)
);
CREATE SEQUENCE orderNo_seq
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
    
DROP TABLE orderItem;
DROP SEQUENCE orderNo_seq;
-------------------------------------------------------------------ORDERHISTORY
CREATE TABLE orderHistory (
	orderNo	    number	        NOT NULL,
	username	varchar2(200)	NOT NULL,
	totalPrice	number	        NOT NULL,
    address	    varchar2(200)	NOT NULL,
	orderDate	date	        DEFAULT SYSDATE,
    CONSTRAINT orderHistory_pk PRIMARY KEY (orderNo),
    CONSTRAINT orderHistory_fk FOREIGN KEY (username) REFERENCES account (username)
);
CREATE SEQUENCE orderNo_seq
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
    
DROP TABLE orderHistory;
DROP SEQUENCE orderNo_seq;
-------------------------------------------------------------------------REVIEW
CREATE TABLE review (
    reviewNo	    number	        NOT NULL,
	username    	varchar2(200)	NOT NULL,
	itemNo      	number,
	petNo       	number,
	reviewTitle 	varchar2(2000)	NOT NULL,
	reviewDesc	    varchar2(2000)	NOT NULL,
	reviewRegDate	date	        DEFAULT SYSDATE,
	reviewModDate	date,
	reviewPic	    varchar2(200),
    CONSTRAINT review_pk PRIMARY KEY (reviewNo),
    CONSTRAINT review_username_fk FOREIGN KEY (username) REFERENCES account (username),
    CONSTRAINT review_itemNo_fk FOREIGN KEY (itemNo) REFERENCES item (itemNo),
    CONSTRAINT review_petNo_fk FOREIGN KEY (petNo) REFERENCES pet (petNo)
);
CREATE SEQUENCE reviewNo_seq
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

DROP TABLE review;
DROP SEQUENCE reviewNo_seq;
------------------------------------------------------------------------SERVICE
CREATE TABLE service (
    serviceNo	number	        NOT NULL,
	username	varchar2(200)	NOT NULL,
    itemNo	    number,
	petNo   	number,
	serviceDesc	varchar2(3000)	NOT NULL,
	response	varchar2(3000),
    CONSTRAINT service_pk PRIMARY KEY (serviceNo),
    CONSTRAINT service_username_fk FOREIGN KEY (username) REFERENCES account (username),
    CONSTRAINT service_itemNo_fk FOREIGN KEY (itemNo) REFERENCES item (itemNo),
    CONSTRAINT service_petNo_fk FOREIGN KEY (petNo) REFERENCES pet (petNo)
);
CREATE SEQUENCE serviceNo_seq
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

DROP TABLE service;
DROP SEQUENCE serviceNo_seq;
-------------------------------------------------------------------------NOTICE
CREATE TABLE notice (
    noticeNo	    number	        NOT NULL,
	noticeTitle	    varchar(200)	NOT NULL,
	noticeDesc	    varchar(2000)	NOT NULL,
	noticeRegDate	date	        DEFAULT sysdate,
	noticeModDate	date,
    CONSTRAINT notice_pk PRIMARY KEY (noticeNo)
);
CREATE SEQUENCE noticeNo_seq
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

DROP TABLE notice;
DROP SEQUENCE noticeNo_seq;
------------------------------------------------------------------------COMMENT
CREATE TABLE reply (
    replyNo   	number	        NOT NULL,
	petNo	        number,
	reviewNo    	number,
	username	    varchar2(200)	NOT NULL,
	reply	        varchar2(2000)	NOT NULL,
	replyRegDate	date	        DEFAULT sysdate,
	replyModDate	date,
    CONSTRAINT reply_pk PRIMARY KEY (replyNo),
    CONSTRAINT reply_username_fk FOREIGN KEY (username) REFERENCES account (username),
    CONSTRAINT reply_petNo_fk FOREIGN KEY (petNo) REFERENCES pet (petNo),
    CONSTRAINT reply_reviewNo_fk FOREIGN KEY (reviewNo) REFERENCES review (reviewNo)
);
CREATE SEQUENCE replyNo_seq
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

DROP TABLE reply;
DROP SEQUENCE replyNo_seq;
---------------------------------------------------------------------------TEST