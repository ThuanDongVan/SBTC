create database QuanLyDeAn;
use QuanLyDeAn;
create table DEAN(
MADA varchar(2) not null primary key,
TENDA nvarchar(50),
DDIEM_DA varchar(20),
PHONG varchar(2)
);
create table PHONGBAN(
MAPHG varchar(2) not null primary key,
TENPHG varchar(20),
TRPHG varchar(9),
NG_NHANC datetime
);
create table DIADIEM_PHG(
MAPHG varchar(2) not null,
DIADIEM varchar(20),
primary key (MAPHG, DIADIEM),
foreign key (MAPHG) references PHONGBAN(MAPHG)
);
create table THANNHAN(
MA_NVIEN varchar(9) not null,
TENTN varchar (20) ,
NGSINH datetime,
PHAI varchar(3),
QUANHE varchar(15),
primary key(MA_NVIEN, TENTN)

);
create table PHANCONG(
MA_NVIEN varchar(9) not null,
SODA varchar(2),
THOiGIAN numeric(18,0),
primary key(MA_NVIEN, SODA)
);
create table NHANVIEN(
MANV varchar(9) not null primary key,
HOVN varchar(15),
TENLOT varchar(30),
TENNV varchar(30),
NGSINH datetime,
DCHI varchar(150),
PHAI varchar(3),
LUONG numeric(18,0),
MA_NQL varchar(9),
PHG varchar(2)
);
alter table THANNHAN add
foreign key  (MA_NVIEN) References NHANVIEN(MANV);
alter table PHANCONG add
foreign key (SODA) references DEAN(MADA);
alter table NHANVIEN add
foreign key (MA_NQL) references NHANVIEN(MANV);
alter table PHONGBAN add
foreign key (TRPHG) references NHANVIEN(MANV);
alter table PHANCONG add
foreign key (MA_NVIEN) references NHANVIEN(MANV);

insert into QuanLyDeAn.DEAN values
 (1, 'De an 1', 'NHA TRANG', 5),
 (2, 'De an 2', 'HA NOI', 2),
 (3, 'De an 3', 'BINH DUONG', 1),
 (4, 'De an 4', 'CAN THO', 3),
 (5, 'De an 5', 'NHA TRANG', 4)
 ;
  insert into QuanLyDeAn.NHANVIEN values
('NV001', 'Le', 'Minh', 'Thoi', '1975/8/2', 'BINH DUONG', 'NU', 55000, 'NV001', 1),
('NV002', 'Le', 'Minh', 'Tung', '1985/3/2', 'NHA TRANG', 'NAM', 55000, 'NV002', 2),
('NV003', 'Le', 'Minh', 'Thanh', '1975/8/2', 'BINH DUONG', 'NAM', 55000, 'NV003', 3),
('NV004', 'Le', 'Minh', 'Tri', '1953/8/2', 'CAN THO', 'NAM', 45000, 'NV004', 4),
('NV005', 'Le', 'Minh', 'Tinh', '1998/8/5', 'VUNG TAU', 'NAM', 85000,'NV005', 5),
('NV006', 'Nguyen', 'Thi', 'Nga', '1909/9/2', 'HA NOI', 'Nu', 85000, 'NV003', 3),
('NV007', 'Chuong', 'Anh', 'Ngoc', '1099/6/2', 'VUNG TAU', 'Nu', 85000, 'NV004', 4)
;
 insert into QuanLyDeAn.PHANCONG values 
 ('NV001', 4, 1000),
 ('NV002', 2, 1000),
 ('NV003', 1, 1000),
 ('NV004', 3, 1000),
 ('NV005', 5, 1000)
 ;
  insert into QuanLyDeAn.THANNHAN values
 ('NV001', 'A', '1964/12/4', 'NAM', 'CHA'),
 ('NV001', 'B', '1969/1/12', 'NU', 'ME'),
 ('NV001', 'C', '1999/1/4', 'NU', 'VO'),
 ('NV002', 'D', '1956/10/28', 'NAM', 'CHA'),
 ('NV003', 'E', '1999/1/4', 'NAM', 'ANH'),
 ('NV004', 'F', '1999/1/4', 'NU', 'CHI'),
 ('NV005', 'M', '1999/1/4', 'NU', 'VO')
 ;

insert into QuanLyDeAn.PHONGBAN values 
 (1, n'Điều hành', 'NV001', '2023/4/4'),
 (2, n'Nghiên cứu', 'NV002', '2023/9/6'),
 (3, n'Nhân sự', 'NV003','2023/7/14'),
 (4, n'Kế toán', 'NV004', '2023/5/4'),
 (5, n'Kinh doanh', 'NV005', '2023/10/4');
 insert into QuanLyDeAn.DIADIEM_PHG values
 (1, 'NHA TRANG'),
 (2, 'CAN THO'),
 (3, 'TP HCM'),
 (4, 'HAU GIANG'),
 (5, 'HA NOI');
 -- 1.Tìm các nhân viên làm việc ở phòng số 5  
select *
from nhanvien nv, phongban pb
where nv.PHG = pb.MAPHG
and pb.MAPHG = '5';

-- 2.Tìm các nhân viên có mức lương trên 25000  
select *
from NHANVIEN
where LUONG > 25000;

-- 3.Tìm các nhân viên có mức lương trên 65,000 ở phòng 1 hoặc các nhân viên có mức lương trên 70,000 ở phòng 2  
select  nv.*
from nhanvien nv, phongban pb
where nv .PHG = pb . MAPHG 
	and (( Luong > 65000 and pb.MAPHG = “1” )	
	or ( Luong > 70000 and pb.MAPHG = “2” ));

-- 4.Cho biết họ tên đầy đủ của các nhân viên ở TP HCM  
select concat(HONV,' ',TENLOT,' ',TENNV) as 'hovaten',a.DCHI
from nhan a
where a.DCHI= 'TP HCM';

-- 5.Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N'  
select concat(HOVN,' ',TENLOT,' ',TENNV) as'hovaten'
from NHANVIEN A
where A.HOVN LIKE N'N%';

-- 6.Cho biết ngày sinh và địa chỉ của nhân viên Lê Minh Tính  
 Select NGSINH, DCHI
From NHANVIEN
Where HOVN =  'LE'  and TENLOT =  'MINH'  and TENNV =  'TINH' ;

-- 7.Cho biết các nhân viên có năm sinh trong khoảng 1955 đến 1975  
 Select * 
From NHANVIEN
Where year (NGSINH) BETWEEN 1955 and 1975 ;
-- 8.Cho biết các nhân viên và năm sinh của nhân viên  
   Select NHANVIEN.MANV, YEAR( NHANVIEN.NGSINH) AS   'năm sinh'  
   From NHANVIEN ;

-- 9.Cho biết các nhân viên và tuổi của nhân viên
SELECT concat(HOVN,' ',TENLOT,' ',TENNV) as 'hovaten',YEAR(curdate())-  YEAR(NGSINH) AS 'TUỔI'
from NHANVIEN;  
  
-- 10.Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng 
 select TENPHG ,DIADIEM
FROM PHONGBAN A, DIADIEM_phg B
WHERE A.MAPHG = B.MAPHG;

-- 11.Tìm tên những người trưởng phòng của từng phòng ban  
select concat(HOVN,' ',TENLOT,' ',TENNV) as 'hovatentruongphong'
from NHANVIEN a, PHONGBAN b
where a.MANV = b.TRPHG;

-- 12.Tìm tên và địa chỉ của tất cả các nhân viên của phòng 'Điều hành'  
select TENNV
from PHONGBAN a, NHANVIEN b
where a.TRPHG=b.MANV and TENPHG like N'%Dieu Hanh';

-- 13.Với mỗi đề án ở Nha TRang, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.  
 select TENDA,TENPHG,NG_NHANC,concat(HOVN,' ',TENLOT,' ',TENNV) as 'hovatentruongphong'
 from DEAN a, PHONGBAN b, NHANVIEN c
 where a.PHONG=b.MAPHG and b.TRPHG=c.MANV and DDIEM_DA like N'%NHA TRANG';

-- 14.Tìm tên những nữ nhân viên và tên người thân của họ  
 select n.TENNV, t.TENNV
FROM NHANVIEN AS n,THANHNHAN AS t
WHERE n.MANV = t.MA_NHANVIEN
AND nPHAI = 'NU';

-- 15.Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó  
  Select concat(a.HOVN,' ',a.TENLOT,' ',a.TENNV) as
 'HOVATENNV',concat(b.HOVN,' ',b.TENLOT,' ',b.TENNV) as 'HOVATENNQL'
from NHANVIEN a, NHANVIEN b
where a.MANV = b.MA_NQL;

-- 16.Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người trưởng phòng và họ tên người quản lý trực tiếp của nhân viên đó.
select concat(a.HOVN,' ',a.TENLOT,' ',a.TENNV) as 'HOVATENNV', concat(c.HOVN,' ', c.TENLOT,' ',c.TENNV) as 'HOVATENTRPHG', concat(b.HOVN,' ', b.TENLOT,' ', b.TENNV) as 'HOVATENNQL'
from NHANVIEN a, NHANVIEN b, NHANVIEN c, PHONGBAN d
where b.MANV = a.MA_NQL and d.MAPHG=a.PHG and c.MANV = d.TRPHG ;   

-- 17.Tên những nhân viên phòng số 5 có tham gia vào đề án "Xây dựng nhà máy chế biến thủy sản" và tên người quản lý trực tiếp.  
select concat(a.HOVN,' ',a.TENLOT,' ',a.TENNV) as 'TENNHANVIENDEAN'
from NHANVIEN a, NHANVIEN b, DEAN c
where a.MA_NQL= b.MANV and a.PHG = c.PHONG and a.PHG = 5 and c.TENDA like N'Xây dựng nhà máy chế biến thủy sản" và tên người quản lý trực tiếp';

-- 18.Cho biết tên các đề án mà nhân viên Trần Anh Tuấn đã tham gia.
select c.TENDA
from NHANVIEN a, PHANCONG b, DEAN c
where a.MANV = b.MA_NVIEN and b.SODA= c.MADA and HOVN = N'Le' and TENLOT=N'Minh' and TENNV=N'Tinh';
 -- Câu 19: Cho biết số lượng đề án của công ty  
 select count(SoDA) as SoluongDA
 from DEAN da, PHANCONG pc, NHANVIEN nv
 where da.MADA = pc.SODA and nv.MANV = pc.MA_NVIEN;

 -- Câu 20: 20.Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì  
select count(SoDA) as SoLuongDA
 from DEAN da, PHANCONG pc, NHANVIEN nv, PHONGBAN pb
 where da.MADA = pc.SODA and nv.MANV = pc.MA_NVIEN and nv.MANV = pb.TRPHG
	and pb.TENPHG = 'Nghiên Cứu';
 
 -- Câu 21:Cho biết lương trung bình của các nữ nhân viên
 select Avg(LUONG) as LuongTB
 from NHANVIEN
 where PHAI = 'Nu';

-- Câu 22: Cho biết số thân nhân của nhân viên ‘Lê Thanh Sang'
select concat(HOVN,' ',TENLOT,' ',TENNV) as HoTenNV, count(tn.MA_NVIEN) as SoLuongTN
from NHANVIEN nv, THANNHAN tn
where nv.MANV = tn.MA_NVIEN and MANV = 
	(select MANV
    from NHANVIEN
    where MANV = 'NV001')
group by HoTenNV;

-- Câu 23: Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
select da.TENDA, sum(pc.THOIGIAN) as 'Gio Lam Viec 1 tuan'
from DEAN da, NHANVIEN nv, PHANCONG pc
where da.MADA = pc.SODA
and nv.MANV = pc.MA_NVIEN
group by da.TENDA;

-- Câu 24: Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó
select da.TENDA, count(MANV) as SoLuongNV
from DEAN da, NHANVIEN nv, PHANCONG pc
where da.MADA = pc.SODA
and nv.MANV = pc.MA_NVIEN
group by da.TENDA;

-- Câu 25: Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó.  
select concat(HOVN,' ',TENLOT,' ',TENNV) as HoTenNV, count(tn.MA_NVIEN) as SoLuongTN
from DEAN da, NHANVIEN nv, PHANCONG pc, THANNHAN tn 
where da.MADA = pc.SODA
and nv.MANV = pc.MA_NVIEN and nv.MANV = tn.MA_NVIEN
group by HoTenNV;

-- Câu 26: Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó đã tham gia.
select concat(HOVN,' ',TENLOT,' ',TENNV) as HoTenNV, count(da.MADA) as SoLuongDA
from DEAN da, NHANVIEN nv, PHANCONG pc 
where da.MADA = pc.SODA
and nv.MANV = pc.MA_NVIEN
group by HoTenNV;

-- Câu 27: Với mỗi nhân viên, cho biết số lượng nhân viên mà nhân viên đó quản lý trực tiếp.    
select MA_NQL, count(MANV) as SoLuongNV
from NHANVIEN
where MA_NQL is not null
group by MA_NQL;

-- 28.Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.  
select pb.MAPHG, avg(NV.LUONG) AS 'ltrungbinh', PB.TENPHG, count(nv.MANV) AS 'SLNV'
FROM PHONGBAN Pb, NHANVIEN nv
WHERE pb.TRPHG = nv.MANV
GROUP BY pb.MAPHG, pb.TENPHG
HAVING avg(NV.LUONG) > 30000;

-- 29.Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.  
SELECT
    PB.TENPHG AS TEN_PHONG_BAN,
    COUNT(NV.MANV) AS SO_LUONG_NHAN_VIEN
FROM
    QuanLyDeAn.PHONGBAN PB
INNER JOIN
    QuanLyDeAn.NHANVIEN NV ON PB.MAPHG = NV.PHG
GROUP BY
    PB.TENPHG
HAVING
    AVG(NV.LUONG) > 30000;
-- 30.Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì  
SELECT
    PB.TENPHG AS TEN_PHONG_BAN,
    COUNT(D.MADA) AS SO_LUONG_DE_AN_CHU_TRI
FROM
    QuanLyDeAn.PHONGBAN PB
LEFT JOIN
    QuanLyDeAn.DEAN D ON PB.MAPHG = D.PHONG
GROUP BY
    PB.TENPHG;
-- 31.Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì 

 SELECT
    PB.TENPHG AS TEN_PHONG_BAN,
    NV.HOVN AS HO_TRUONG_PHONG,
    NV.TENLOT AS TEN_LOT_TRUONG_PHONG,
    NV.TENNV AS TEN_TRUONG_PHONG,
    COUNT(D.MADA) AS SO_LUONG_DE_AN_CHU_TRI
FROM
    QuanLyDeAn.PHONGBAN PB
JOIN
    QuanLyDeAn.NHANVIEN NV ON PB.MAPHG = NV.MANV
LEFT JOIN
    QuanLyDeAn.DEAN D ON PB.MAPHG = D.PHONG
GROUP BY
    PB.TENPHG,
    NV.HOVN,
    NV.TENLOT,
    NV.TENNV;
-- 32.Với mỗi phòng ban có mức lương trung bình lớn hơn 50,000, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì.  
     SELECT
    PB.TENPHG AS TEN_PHONG_BAN,
    COUNT(D.MADA) AS SO_LUONG_DE_AN_CHU_TRI
FROM
    QuanLyDeAn.PHONGBAN PB
LEFT JOIN
    QuanLyDeAn.NHANVIEN NV ON PB.MAPHG = NV.MANV
LEFT JOIN
    QuanLyDeAn.DEAN D ON PB.MAPHG = D.PHONG
GROUP BY
    PB.TENPHG
HAVING
    AVG(NV.LUONG) > 50000;
-- 33.Cho biết số đề án diễn ra tại từng địa điểm  
SELECT
    DP.DIADIEM AS DIA_DIEM,
    COUNT(D.MADA) AS SO_LUONG_DE_AN
FROM
    QuanLyDeAn.DIADIEM_PHG DP
LEFT JOIN
    QuanLyDeAn.DEAN D ON DP.MAPHG = D.PHONG
GROUP BY
    DP.DIADIEM;

-- 34.Với mỗi đề án, cho biết tên đề án và số lượng công việc của đề án này.  
 SELECT
    D.TENDA AS TEN_DE_AN,
    COUNT(PC.SODA) AS SO_LUONG_CONG_VIEC
FROM
    QuanLyDeAn.DEAN D
LEFT JOIN
    QuanLyDeAn.PHANCONG PC ON D.MADA = PC.SODA
GROUP BY
    D.TENDA;
-- 35.Với mỗi công việc trong đề án có mã đề án là 20, cho biết số lượng nhân viên được phân công . 
SELECT
    PC.SODA AS MA_CONG_VIEC,
    COUNT(PC.MA_NVIEN) AS SO_LUONG_NHAN_VIEN_PHAN_CONG
FROM
    QuanLyDeAn.PHANCONG PC
JOIN
    QuanLyDeAn.DEAN D ON PC.SODA = D.MADA
WHERE
    D.MADA = '20'
GROUP BY
    PC.SODA;
   
-- 36.Cho biết danh sách các đề án (MADA) có: nhân công với họ (HONV) là 'Lê' hoặc có người trưởng phòng chủ trì đề án với họ (HONV) là 'Lê'.  

select da.MADA, nv.HOVN
from DEAN da, NHANVIEN nv, PHANCONG pc
where da.MADA = pc.SODA
and pc.MA_NVIEN = nv.MANV
and nv.HOVN = (select* 
     from NHANVIEN n1, NHANVIEN n_NQL
     where n1.MANV = n_NQL.MA_NQL
     and n1.HOVN = 'Le' or n_NQL.HOVN = 'Le'
     );
     
-- 37.Danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân nhân. 
SELECT
    NV.HOVN,
    NV.TENLOT,
    NV.TENNV
FROM
    QuanLyDeAn.NHANVIEN NV
JOIN (
    SELECT
        MA_NVIEN,
        COUNT(*) AS SO_LUONG_THAN_NHAN
    FROM
        QuanLyDeAn.THANNHAN
    GROUP BY
        MA_NVIEN
    HAVING
        COUNT(*) > 2
) TN ON NV.MANV = TN.MA_NVIEN;
 
-- 38.Danh sách những nhân viên (HONV, TENLOT, TENNV) không có thân nhân nào (dùng NOT IN, LEFT JOIN, NOT EXISTS) 
-- NOT IN
SELECT
    NV.HOVN,
    NV.TENLOT,
    NV.TENNV
FROM
    QuanLyDeAn.NHANVIEN NV
WHERE
    NV.MANV NOT IN (SELECT DISTINCT MA_NVIEN FROM QuanLyDeAn.THANNHAN);

-- Sử dụng LEFT JOIN
SELECT
    NV.HOVN,
    NV.TENLOT,
    NV.TENNV
FROM
    QuanLyDeAn.NHANVIEN NV
LEFT JOIN
    QuanLyDeAn.THANNHAN TN ON NV.MANV = TN.MA_NVIEN
WHERE
    TN.MA_NVIEN IS NULL;
-- NOT EXISTS
SELECT
    NV.HOVN,
    NV.TENLOT,
    NV.TENNV
FROM
    QuanLyDeAn.NHANVIEN NV
WHERE
    NOT EXISTS (SELECT 1 FROM QuanLyDeAn.THANNHAN TN WHERE NV.MANV = TN.MA_NVIEN);
-- 39.Danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu một thân nhân.  
SELECT DISTINCT
    NV.HOVN,
    NV.TENLOT,
    NV.TENNV
FROM
    QuanLyDeAn.NHANVIEN NV
JOIN
    QuanLyDeAn.THANNHAN TN ON NV.MANV = TN.MA_NVIEN
WHERE
    NV.MANV IN (SELECT DISTINCT MA_NVIEN FROM QuanLyDeAn.THANNHAN);

-- 40.Tìm họ (HONV) của những trưởng phòng chưa có gia đình.  
SELECT DISTINCT
    NV.HOVN
FROM
    QuanLyDeAn.NHANVIEN NV
LEFT JOIN
    QuanLyDeAn.THANNHAN TN ON NV.MANV = TN.MA_NVIEN
WHERE
    NV.PHAI = 'NAM' -- Lọc ra trưởng phòng nam
    AND TN.MA_NVIEN IS NULL; -- Lọc ra trưởng phòng chưa có gia đình
    
    
-- Phần Views
-- Câu 1:1.Viết truy vấn liệt kê tên các nhân viên cùng với các dự án mà nhân viên đó tham gia. Run và kiểm tra kết quả. 
create view lietke as
select concat(HOVN,' ',TENLOT,' ',TENNV ) as HoTenNV, TENDA
from NHANVIEN NV inner join DEAN DA on NV.PHG = DA.PHONG;

#câu 2:
  create view NV_DA as
	select concat(HOVN,' ',TENLOT,' ',TENNV ) as HoTenNV
	from NHANVIEN NV inner join PHANCONG DA on NV.MANV = DA.MA_NVIEN;

#3.	Thêm một dòng tùy ý vào bảng PHANCONG, sau đó thực hiện lệnh 
#SELECT * FROM NV_DA, kết quả có thay đổi so với câu 2 không?. Tại sao? 
 insert into QuanLyDeAn.PHANCONG values 
 ('NV006', 5, 1000);
 
 SELECT * FROM NV_DA;
 #=> kết quả sẻ thêm 1 dòng dữ liệu vào. vì khi thêm dữ liệu vào bảng thì view sẽ tự cập nhật lại
 
# 4.	Thực hiện lệnh: UPDATE  NV_DA 
#SET TENDA = N’ Quản lý các dự án CNTT thông tin’ 
#WHERE TENDA=N’Resort nghỉ dưỡng’ 
#Câu lệnh có thực hiện được không?. Tại sao? 
#Thực hiện câu lệnh: SELECT * FROM NV_DA và SELECT * FROM DEAN để xem sự thay đổi dữ liệu 

UPDATE  NV_DA 
SET TENDA = N' Quản lý các dự án CNTT thông tin'
WHERE TENDA=N'Resort nghỉ dưỡng' ;
#=> lỗi, vì sai kiểu dữ liệu
SELECT * FROM NV_DA ;
SELECT * FROM DEAN;

#câu 5:
SELECT concat(NV.HOVN, ' ' , NV.TENLOT , ' ' , NV.TENNV) AS HoTen,
       D.TENDA AS TenDuAn,
       PC.THOiGIAN * NV.LUONG AS Luong
FROM NHANVIEN NV
JOIN PHANCONG PC ON NV.MANV = PC.MA_NVIEN
JOIN DEAN D ON PC.SODA = D.MADA
ORDER BY Luong;

# Phần Triger
#1.Tạo triggers trên bảng nhân viên cho thao tác UPDATE. Khi có thao tác UPDATE xảy ra trên field TENNV thì thông báo cho người dùng ‘Không được cập nhật’ và hủy thao tác. 
use quanlydean;
DELIMITER $$
CREATE TRIGGER tr_employees_update
BEFORE UPDATE ON NHANVIEN
FOR EACH ROW
BEGIN
    IF NEW.TENNV <> OLD.TENNV THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không được cập nhật';
    END IF;
END;
$$
DELIMITER ;


#2Thêm một cột ToTal_Time vào trong bảng nhân viên. Viết trigger cho thao tác insert, update, delete trên bảng PhanCong. Khi có mẫu tin được thêm vào, hay cập nhật, hay xóa thì ToTal_Time được tính lại tương ứng cho nhân viên được phân công. Lưu ý, giả sử ban đầu ToTal_Time = 0. ToTal_Time là tổng thời gian phân công cho nhân viên của các dự án.
#Insert
DELIMITER $$
CREATE TRIGGER tr_PhanCong_Insert
AFTER INSERT ON PHANCONG
FOR EACH ROW
BEGIN
    -- Cập nhật cột ToTal_Time cho nhân viên khi có phân công mới
    UPDATE NHANVIEN
    SET ToTal_Time = ToTal_Time + NEW.THoiGIAN
    WHERE MANV = NEW.MA_NVIEN;
END;
$$
DELIMITER ;
#update
DELIMITER $$
CREATE TRIGGER tr_PhanCong_Update
AFTER UPDATE ON PHANCONG
FOR EACH ROW
BEGIN
    -- Cập nhật cột ToTal_Time cho nhân viên khi có sự thay đổi trong phân công
    -- Trừ thời gian cũ và cộng thời gian mới
    UPDATE NHANVIEN
    SET ToTal_Time = ToTal_Time - OLD.THoiGIAN + NEW.THoiGIAN
    WHERE MANV = NEW.MA_NVIEN;
END;
$$
DELIMITER ;
#delete
DELIMITER $$
CREATE TRIGGER tr_PhanCong_Delete
AFTER DELETE ON PHANCONG
FOR EACH ROW
BEGIN
    -- Cập nhật cột ToTal_Time cho nhân viên khi có phân công bị xóa
    UPDATE NHANVIEN
    SET ToTal_Time = ToTal_Time - OLD.THoiGIAN
    WHERE MANV = OLD.MA_NVIEN;
END;
$$
DELIMITER ;

#3Tạo trigger cho thao tác insert, update trên bảng Nhanvien để kiểm tra ràng buộc liên thuộc tính giữa ngày sinh và Hire_date, trong đó ngày sinh luôn luôn < Hire_date – 40. (40 là giá trị của datepart ‘ yy’).
DELIMITER $$
CREATE TRIGGER tr_Nhanvien_Insert_Update
BEFORE INSERT ON NHANVIEN
FOR EACH ROW
BEGIN
    DECLARE min_birthdate DATE;
    SET min_birthdate = DATE_SUB(CURRENT_DATE, INTERVAL 40 YEAR);

    IF NEW.NGSINH >= min_birthdate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngày sinh phải nhỏ hơn (ngày hiện tại - 40 năm).';
    END IF;
END;
$$
DELIMITER ;

#4.Tạo trigger để kiểm tra thao tác insert trên bảng THANNHAN sao cho số lượng thân nhân được thêm vào tương ứng với một nhân viên không quá 5 người. 
DELIMITER $$
CREATE TRIGGER tr_Thannhan_Insert
BEFORE INSERT ON THANNHAN
FOR EACH ROW
BEGIN
    DECLARE num_thannhan INT;
    
    -- Đếm số lượng thân nhân của nhân viên
    SELECT COUNT(*) INTO num_thannhan
    FROM THANNHAN
    WHERE MA_NVIEN = NEW.MA_NVIEN;
    
    IF num_thannhan >= 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể thêm thêm thân nhân. Số lượng thân nhân đã đạt tối đa (5).';
    END IF;
END;
$$
DELIMITER ;




 