-- 23520622 Ngô Lê Tấn Huy 
-- Câu 1 InClass
-- Tao bang KHACHHANG
CREATE TABLE KHACHHANG 
(
	MAKH char(4) primary key,
	HOTEN varchar(40), 
	DCHI varchar(50), 
	SODT varchar(20), 
	NGSINH smalldatetime, 
	NGDK smalldatetime, 
	DOANHSO money
);
-- Tao bang NHANVIEN
CREATE TABLE NHANVIEN
(
	MANV char(4) primary key, 
	HOTEN varchar(40), 
	SODT varchar(20), 
	NGVL smalldatetime
);
-- Tao bang SANPHAM
CREATE TABLE SANPHAM
(
	MASP char(4) primary key, 
	TENSP varchar(40),
	DVT varchar(20), 
	NUOCSX varchar(40),
	GIA money
);
-- Tao bang HOADON
CREATE TABLE HOADON
(
	SOHD int primary key, 
	NGHD smalldatetime,
	MAKH char(4), 
	MANV char(4), 
	TRIGIA money, 
	FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH), 
	FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
);
-- Tao bang CTHD
CREATE TABLE CTHD
(
	SOHD int, 
	MASP char(4),
	SL int, 
	primary key (SOHD, MASP),
	FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD),
	FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
);
-----------------kết thúc câu 1------------------------
--Câu 2
ALTER TABLE SANPHAM ADD GHICHU VARCHAR(20);
-----------------kết thúc câu 2------------------------
--Câu 3
ALTER TABLE KHACHHANG ADD LOAIKH tinyint;
-----------------kết thúc câu 3------------------------
--Câu 4
ALTER TABLE SANPHAM ALTER COLUMN GHICHU VARCHAR(100);
-----------------kết thúc câu 4------------------------
--Câu 5
ALTER TABLE SANPHAM DROP COLUMN GHICHU;
-----------------kết thúc câu 5------------------------
--Câu 6
ALTER TABLE KHACHHANG
ADD CONSTRAINT check_loaikh CHECK (LOAIKH IN ( 'Vang lai', 'Thuong xuyen', 'Vip'));
-----------------kết thúc câu 6------------------------
--Câu 7
ALTER TABLE SANPHAM
ADD CONSTRAINT check_dvt CHECK(DVT IN ('cay', 'hop', 'cai', 'quyen', 'chuc'));
-----------------kết thúc câu 7------------------------
--Câu 8
ALTER TABLE SANPHAM
ADD CONSTRAINT check_gia CHECK (GIA >=500); 
-----------------kết thúc câu 8------------------------
--Câu 9
ALTER TABLE CTHD 
ADD CONSTRAINT check_sl CHECK (SL>=1);
-----------------kết thúc câu 9------------------------
--Câu 10
ALTER TABLE KHACHHANG 
ADD CONSTRAINT check_ngaydk_ngays CHECK (NGDK > NGSINH);
-----------------kết thúc câu 10------------------------
