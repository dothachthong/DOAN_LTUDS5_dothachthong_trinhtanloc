CREATE DATABASE QUANLYNHASACH

CREATE TABLE admin
(
	username nchar(10) not null , primary key(username),
	password nchar(10) not null ,
	quyen nvarchar(20) not null 
)

CREATE TABLE THELOAI
(
	MaTL nchar(10) not null, primary key(MaTL),
	TenTL nvarchar(50) not null,
	DienGia nvarchar(50) 
)

CREATE TABLE NHOMLOAI
(
	MaNL nchar(10) not null, primary key(MaNL),
	TenNL nvarchar(100) not null,
	MaCL nchar(10) not null foreign key(MaCL) references CHUNGLOAI(MACL)
)

CREATE TABLE CHUNGLOAI
(
	MaCL nchar(10) not null, primary key(MaCL),
	TenCL nvarchar(100) not null,
	MaTL nchar(10) not null foreign key(MaTL) references THELOAI(MaTL),
	DienGiai nvarchar(50) 
)

CREATE TABLE NSX
(
	MaNSX nchar(10)  not null, primary key(MaNSX),
	TenNSX nvarchar(100) not null,
	DiaChi nvarchar(50) not null,
	SDT int 
)

CREATE TABLE NHACUNGCAP
(
	MaNCC nchar(10)not null , primary key(MaNCC),
	TenNCC nvarchar(100) not null,
	DiaChi nvarchar(50) not null,
	SDT int
)

CREATE TABLE NHANVIENN
(
	MaNV nchar(10) not null, primary key(MaNV),
	TenNV nvarchar(80) not null,
	ChucVu nvarchar(50)not null,
	DiaChi nvarchar(50) not null,
	GioiTinh nchar(5), 
	SDT int 
)

CREATE TABLE THIETBI 
(
	MaTB nchar(10) not null, primary key(MaTB),
	TenTB nvarchar(100) not null,
	DVT nchar(50) not null,
	DVT_Max nchar(10) ,
	DonGia int not null,
	GiaNhap int not null,
	SoLuongTon int not null,
	NgayCapNhap date ,
	MaNL nchar(10) not null foreign key (MaNL) references NHOMLOAI(MaNL),
	MaNSX nchar(10) not null foreign key (MaNSX) references NSX(MaNSX),
	MaKho nchar(10) not null foreign key (MaKho) references KHO(MaKho)
)

CREATE TABLE KHO
(
	MaKho nchar(10) not null, primary key(MaKho),
	TenKho nvarchar(50) not null
)

CREATE TABLE KHACHHANG
(
	MaKH nchar(10) not null, primary key(MaKH),
	TenKH nvarchar(80) not null ,
	MST Nvarchar(20) not null,
	DiaChi nvarchar(50) not null,
	GioiTinh nchar(5) ,
	SDT int
)

CREATE TABLE HOADON
(
	SoHD nchar(10) not null, primary key(SoHD),
	NgayLap_HD date not null,
	ThueXuat nchar(20) ,
	TongGiaTri int not null,
	MaNV nchar(10) not null foreign key(MaNV) references NHANVIENN(MaNV),
	MaKH nchar(10) not null foreign key(MaKH) references KHACHHANG(MaKH)
)

CREATE TABLE CT_HOADON
(
	SoHD nchar(10) not null , primary key(SoHD),
	MaTB nchar(10) not null ,
	SoLuong int not null,
	DonGia int not null,
	ThanhTien int not null
)

CREATE TABLE PHIEUNHAP
(
	SoPN nchar(10) not null, primary key(SoPN),
	NgayNhap_PN date not null,
	ThueXuat nchar(20) ,
	TongGiaTri int not null,
	MaNV nchar(10) not null foreign key(MaNV) references NHANVIENN(MaNV),
	MaNCC nchar(10) not null  foreign key(MaNCC) references NHACUNGCAP(MaNCC)
)

CREATE TABLE CT_PHIEUNHAP
(
	SoPN nchar(10)not null, primary key(SoPN),
	MaTB nchar(10) not null,
	SoLuong int not null,
	GiaNhap int not null,
	ThanhTien int not null
)

CREATE TABLE PHIEUCHI
(
	SoPC nchar(10) not null, primary key(SoPC),
	NgayLap_PC date not null,
	LyDoChi nvarchar(50) not null,
	SoTienChi int not null,
	SoPN nchar(10) not null foreign key(SoPN) references PHIEUNHAP(SoPN)
)

CREATE TABLE TB_THANHLY
(
	MaThanhLy nchar(10) not null, primary key(MaThanhLy),
	NgayThanhLy date not null,
	LyDoChiThanhLy nvarchar(50) ,
	HinhThucThanhLy nvarchar(50)not null,
	GhiChu nvarchar(50) 
)

CREATE TABLE CT_THANHLY
(
	MaThanhLy nchar(10)  not null, primary key(MaThanhLy),
	MaTB nchar(10) not null,
	SoLuong int not null,
	DonGia int not null,
	ThanhTien int not null
)

INSERT INTO admin(username,password,quyen)
VALUES ('tanloc','123456',N'Sách Hari Bóc Tơ')
INSERT INTO admin(username,password,quyen)
VALUES ('thachthong','123456',N'Sách SMLDA')

INSERT INTO THELOAI(MaTL,TenTL,DienGia)
VALUES ('1',N'MANGA',N'baka desu')
INSERT INTO THELOAI(MaTL,TenTL,DienGia)
VALUES ('2',N'Lập Trình',N'Học Khó Lắm À Nghen')
INSERT INTO THELOAI(MaTL,TenTL,DienGia)
VALUES ('2',N'Ngoại Ngữ',N'YEAH! WTF BABY')
INSERT INTO THELOAI(MaTL,TenTL,DienGia)
VALUES ('3',N'Đời Sống',N'Xã Hội Thật Chán')

INSERT INTO NHOMLOAI(MaNL,TenNL,MaCL)
VALUES ('1',N'SÁCH GIẢI TRÍ','1')
INSERT INTO NHOMLOAI(MaNL,TenNL,MaCL)
VALUES ('2',N'SÁCH HỌC TẬP','2')
INSERT INTO NHOMLOAI(MaNL,TenNL,MaCL)
VALUES ('3',N'SÁCH ĐỜI SỐNG XÃ HỘI','3')


INSERT INTO CHUNGLOAI(MaCL,TenCL,MaTL,DienGiai)
VALUES ('1',N'SÁCH GIẢI TRÍ','1',N'VUI THÔI')
INSERT INTO CHUNGLOAI(MaCL,TenCL,MaTL,DienGiai)
VALUES ('2',N'SÁCH HỌC TẬP','2',N'HỌC RIẾT HỌC MÃI')
INSERT INTO CHUNGLOAI(MaCL,TenCL,MaTL,DienGiai)
VALUES ('3',N'SÁCH ĐỜI SỐNG XÃ HỘI','3',N'CUỘC ĐỜI VẪN ĐẸP SAO')


INSERT INTO NSX(MaNSX,TenNSX,DiaChi,SDT)
VALUES ('1',N'NXB TP.HCM',N'QUẬN 1 , TP.HCM',092534553)
INSERT INTO NSX(MaNSX,TenNSX,DiaChi,SDT)
VALUES ('2',N'NXB HÀ NỘI',N'QUẬN BA ĐÌNH , HÀ NỘI',053434553)
INSERT INTO NSX(MaNSX,TenNSX,DiaChi,SDT)
VALUES ('3',N'NXB VŨNG TÀU',N'VÕ THỊ SÁU , TP.VŨNG TÀU',0422534553)

INSERT INTO NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT)
VALUES ('1',N'CÔNG TY SÁCH HƯNG THỊNH',N'SỐ 23 , TÂN PHÚ, TP.HCM',09434543)
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT)
VALUES ('2',N'CÔNG TY SÁCH THÀNH ĐẠT',N'SỐ 99 , GÒ VẤP, TP.HCM',094454543)
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT)
VALUES ('3',N'CÔNG TY SÁCH TOÀN PHÁT',N'109 , QUẬN TÂY HỒ, HÀ NỘI',094455643)

INSERT INTO NHANVIENN(MaNV,TenNV,ChucVu,DiaChi,GioiTinh,SDT)
VALUES ('QL1',N'TRỊNH TẤN LỘC',N'TỔNG GIÁM ĐỐC','ĐÔNG THẠNH , HÓC MÔN','NAM',059879724)
INSERT INTO NHANVIENN(MaNV,TenNV,ChucVu,DiaChi,GioiTinh,SDT)
VALUES ('NV1',N'DỖ THẠCH THÔNG',N'BẢO VỆ','ĐẢO CỦA QUÝ','3D',035663524)
INSERT INTO NHANVIENN(MaNV,TenNV,ChucVu,DiaChi,GioiTinh,SDT)
VALUES ('QL2',N'CHÂU TINH TRÌ',N'GIÁM ĐỐC','TÂY TẠNG','NAM',043423524)
INSERT INTO NHANVIENN(MaNV,TenNV,ChucVu,DiaChi,GioiTinh,SDT)
VALUES ('NV2',N'LÊ THÀNH VIỆT',N'NHÂN VIÊN MAKETING','LONG AN','NAM',023423524)
INSERT INTO NHANVIENN(MaNV,TenNV,ChucVu,DiaChi,GioiTinh,SDT)
VALUES ('NV3',N'NGUYỄN VÂN NGA',N'THƯ KÍ ','TP.HCM','NU',093423524)

INSERT INTO KHO(MaKho,TenKho)
VALUES ('1',N'KHO VỈNH AN')
INSERT INTO KHO(MaKho,TenKho)
VALUES ('2',N'KHO THIÊN LỢI')
INSERT INTO KHO(MaKho,TenKho)
VALUES ('3',N'KHO ĐỒNG QUÂN')

INSERT INTO THIETBI(MaTB,TenTB,DVT,DVT_Max,DonGia,GiaNhap,SoLuongTon,NgayCapNhap,MaNL,MaNSX,MaKho)
VALUES ('1',N'MÁY IN','VND','',2000000,2500000,30,'8/15/2018','2','1','3')
INSERT INTO THIETBI(MaTB,TenTB,DVT,DVT_Max,DonGia,GiaNhap,SoLuongTon,NgayCapNhap,MaNL,MaNSX,MaKho)
VALUES ('2',N'MÁY VI TÍNH','VND','',10000000,10500000,20,'7/16/2018','1','2','1')
INSERT INTO THIETBI(MaTB,TenTB,DVT,DVT_Max,DonGia,GiaNhap,SoLuongTon,NgayCapNhap,MaNL,MaNSX,MaKho)
VALUES ('3',N'MÁY PHÁT ÂM','VND','',1000000,1500000,10,'1/13/2017','3','3','2')


INSERT INTO KHACHHANG(MaKH,TenKH,MST,DiaChi,GioiTinh,SDT)
VALUES ('KH1','DƯƠNG QUÁ','113',N'CỰC LẠC CỐC','NAM',096365632)
INSERT INTO KHACHHANG(MaKH,TenKH,MST,DiaChi,GioiTinh,SDT)
VALUES ('KH2','TRƯƠNG VÔ KỴ','114',N'MINH GIÁO','NAM',0935635632)
INSERT INTO KHACHHANG(MaKH,TenKH,MST,DiaChi,GioiTinh,SDT)
VALUES ('KH3','TÂY MÔN KHÁCH','115',N'THIÊN HƯƠNG LẦU','NAM',0965435632)
INSERT INTO KHACHHANG(MaKH,TenKH,MST,DiaChi,GioiTinh,SDT)
VALUES ('KH4','LÝ MẠC SẦU','111',N'TỤ HIỀN TRANG','NU',034536543)

INSERT INTO HOADON(SoHD,NgayLap_HD,ThueXuat,TongGiaTri,MaNV,MaKH)
VALUES ('HD1','6/9/2018','',3000000,'NV1','KH1')
INSERT INTO HOADON(SoHD,NgayLap_HD,ThueXuat,TongGiaTri,MaNV,MaKH)
VALUES ('HD2','7/9/2018','',4000000,'NV1','KH2')
INSERT INTO HOADON(SoHD,NgayLap_HD,ThueXuat,TongGiaTri,MaNV,MaKH)
VALUES ('HD3','6/12/2018','',3500000,'NV2','KH2')
INSERT INTO HOADON(SoHD,NgayLap_HD,ThueXuat,TongGiaTri,MaNV,MaKH)
VALUES ('HD4','12/12/2018','',500000,'NV3','KH3')

INSERT INTO CT_HOADON(SoHD,MaTB,SoLuong,DonGia,ThanhTien)
VALUES ('HD1','1',10,3000000,3500000)
INSERT INTO CT_HOADON(SoHD,MaTB,SoLuong,DonGia,ThanhTien)
VALUES ('HD2','2',1,300000,350000)
INSERT INTO CT_HOADON(SoHD,MaTB,SoLuong,DonGia,ThanhTien)
VALUES ('HD3','3',5,1000000,1500000)



