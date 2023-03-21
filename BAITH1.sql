--Tạo và Setup dung lượng dữ liệu--

Create database QuanLyDeAn
on primary
(	size = 20MB,
	filegrowth = 1MB,
	maxsize = 1000MB,
	filename = 'D:\HoTenSV\QuanLyDeAn_Data.mdf',
	name = QuanLyDeAn_Data
)
log on
(	size = 6MB,
	filegrowth = 5%,
	maxsize = 20MB,
	filename = 'D:\HoTenSV\QuanLyDeAn_Log.ldf',
	name = QuanLyDeAn_Log
)	
--Tạo bảng trong database QuanLyDeAn--
use QuanLyDeAn
go
Create table NHANVIEN
(	MaNV	varchar(9)	primary key,
	HoNV	nvarchar(15),
	TenLot	nvarchar(30),
	TenNV	nvarchar(30),
	NgSinh	smalldatetime,
	DiaChi	nvarchar(150),
	Phai	nvarchar(3),
	Luong	numeric(18,0),
	Phong	varchar(2)
)
Create table PHONGBAN
(	MaPhg	varchar(2)	primary key,
	TenPhg	nvarchar(20)
)
Create table DEAN
(	MaDA	varchar(2)	primary key,
	TenDA	nvarchar(50),
	DDiemDA	varchar(20)
)
Create table PHANCONG
(	MaNV	varchar(9),
	MaDA	varchar(2),
	Thoigian	numeric(18,0),
	primary key (MaNV, MaDa)
)
Create table THANNHAN
(	MaNV	varchar(9),
	TenTN	varchar(20),
	NgaySinh	smalldatetime,
	Phai	varchar(3),
	QuanHe	varchar(15),
	primary key (MaNV, TenTN)
)

--Chỉnh sửa kiểu dữ liệu--
alter table PHONGBAN
alter column TenPhg nvarchar(30)

alter table DEAN
alter column DDiemDA nvarchar(20)

alter table THANNHAN 
alter column TenTN nvarchar(20) --cột TenTN lỗi ko sửa được vì nó ko cùng datatype với 2 khóa chính còn lại, nếu sửa phải sửa cả 3 cùng 1 datatype--

alter table THANNHAN
alter column Phai nvarchar(3)

alter table THANNHAN
alter column QuanHe nvarchar(15)

--Liên Kết Bảng--
ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN
FOREIGN KEY (Phong) REFERENCES PHONGBAN(MaPhg)

ALTER TABLE THANNHAN
ADD CONSTRAINT FK_THANHNHAN
FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG
FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_MADA
FOREIGN KEY (MaDA) REFERENCES DEAN(MaDA)

--Nhập dữ liệu vào bảng--
insert into NHANVIEN
values ('123','Đinh','Bá','Tiến','1982-02-27','Mộ Đức','Nam',null,'4')
insert into NHANVIEN
values('234','Nguyễn','Thanh','Tùng','1956-08-12','Sơn Tịnh','Nam',null,'5')
insert into NHANVIEN
values('345','Bùi','Thúy','Vũ',null,'Tư Nghĩa','Nữ',null,'4')
insert into NHANVIEN
values('456','Lê','Thị','Nhàn','1962-07-12','Mộ Đức','Nữ',null,'4')
insert into NHANVIEN
values('567','Nguyễn','Mạnh','Hùng','1985-03-25','Sơn Tịnh','Nam',null,'5')
insert into NHANVIEN
values('678','Trần','Hồng','Quan',null,'Bình Sơn','Nam',null,'5')
insert into NHANVIEN
values('789','Trần','Thanh','Tâm','1972-06-17','TP Quảng Ngãi','Nam',null,'5')
insert into NHANVIEN
values('890','Cao','Thanh','Huyền',null,'Tư Nghã','Nữ',null,'1')
insert into NHANVIEN
values('901','Vương','Ngọc','Quyền','1987-12-12','Mộ Đức','Nam',null,'1')

insert into PHONGBAN
values('1','Quản lý')
insert into PHONGBAN
values('4','Điều hành')
insert into PHONGBAN
values('5','Nghiên cứu')

insert DEAN
values('1','Nâng cao chất lượng muối','Sa Huỳnh')
insert DEAN
values('10','Xây dựng nhà máy chế biến thủy sản','Dung Quất')
insert DEAN
values('2','Phát triển hạ tầng mạng','TP Quảng Ngãi')
insert DEAN
values('20','Truyền tải cáp quang','TP Quảng Ngãi')
insert DEAN
values('3','Tin học hóa trường học','Ba tơ')
insert DEAN
values('30','Đào tạo nhân lực','Tịnh Phong')

insert PHANCONG
values('123','1','33')
insert PHANCONG
values('123','2','8')
insert PHANCONG
values('345','10','10')
insert PHANCONG
values('345','20','10')
insert PHANCONG
values('345','3','10')
insert PHANCONG
values('456','1','20')
insert PHANCONG
values('456','2','20')
insert PHANCONG
values('678','3','40')
insert PHANCONG
values('789','10','35')
insert PHANCONG
values('789','20','30')
insert PHANCONG
values('789','30','5')

insert THANNHAN
values('123','Châu','2005-10-30','Nữ','Con gái')
insert THANNHAN
values('123','Duy','2001-10-25','Nam','Con trai')
insert THANNHAN
values('123','Phương','1985-10-30','Nữ','Vợ chồng')
insert THANNHAN
values('234','Thanh','1980-04-05','Nữ','Con gái')
insert THANNHAN
values('345','Dương','1956-10-30','Nam','Vợ chồng')
insert THANNHAN
values('345','Khang','25/10/1982','Nam','Con trai')
insert THANNHAN
values('456','Hùng','1987-01-01','Nam','Con trai')
insert THANNHAN
values('901','Thương','1989-04-05','Nữ','Vợ chồng')

