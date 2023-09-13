-- câu lệnh tạo database sql
CREATE DATABASE learnSql
GO

-- câu lệnh sử dụng database vừa tạo
USE learnSql
-- go để ngăt từng khối lệnh 
GO

--câu lệnh tạo 1 bảng 
-- [name] để tránh trùng câu lệnh của hệ thống sql 
create table category(
	id int primary key identity,
	[name] nvarchar(100) NOT NULL UNIQUE, 
	status int DEFAULT 0
)
GO

--câu lệnh tạo 1 bảng 
-- [name] để tránh trùng câu lệnh của hệ thống sql 
create table product(
	id int primary key identity,
	[name] nvarchar(150) NOT NULL,
	category_id int NOT NULL,
	status int default 0,
	created_date date DEFAULT GETDATE(),
	foreign key (category_id) references category(id)
)
GO

-- câu-lệnh-thay-doi-cau-truc-bang-voi-alter-table


-- câu lệnh thêm column ALTER TABLE tên_bảng ADD tên_cột kiểu_dữ_liệu_cột
	ALTER TABLE product ADD price float NOT NULL;

-- câu lệnh xóa column  ALTER TABLE tên_bảng DROP COLUMN tên_cột
	 --ALTER TABLE category DROP COLUMN status;

-- câu lệnh thay đổi tên column 
	EXEC sp_rename 'product.name', 'pro_name';

-- câu lệnh thay đổi kiểu dữ liệu column ALTER TABLE table_name ALTER COLUMN column_name datatype
	--ALTER TABLE product ALTER COLUMN status tinyint;


	/*
		INSER DATA SQL
	*/

-- câu lệnh thêm mới dữ liệu cho bảng category
Insert into category([name]) values
(N'Điện thoại'),
(N'Lap top'),
(N'Đồng Hồ'),
(N'P C'),
(N'Linh Kiện')

Go

-- câu lệnh thêm mới dữ liệu cho bảng product
insert into product(pro_name, price, category_id) values
('Laptop HP 6ZF65PA Bạc',12000000, 1),
('Laptop HP 8RK37PC Bạc ',17000000, 2),
('Máy tính xách tay HP Silver ',15000000, 3),
('Laptop HP Pen N4417U ',18000000, 4),
('Laptop HP Pav 5HV88PA i3 ',20000000, 1),
('Laptop HP Pav W10SL ',20000000, 2)

Go

	/*
		SELECT DATA SQL
	*/

	SELECT * FROM category;

	SELECT * FROM product;



	/*
		UPDATE DATA SQL
	*/

-- UPDATE value category with column name and status
	UPDATE category
	SET name = 'PC', status = 1
	WHERE id = 4;

-- delete sql 
	DELETE FROM product WHERE id = 6;


--tạo view sql
CREATE VIEW view_product AS
SELECT * FROM product


-- select data view 
select * from view_product;
