USE [timphong]
go

CREATE TABLE [dbo].[taikhoan](
	id_tk INT IDENTITY(1,1) PRIMARY KEY,
	tentk NVARCHAR(30) NOT NULL UNIQUE,
	matkhau NVARCHAR(30) NOT NULL,
	quyen INT NOT NULL,
	email NVARCHAR(40) NOT NULL UNIQUE,
	sdt NVARCHAR(10) NOT NULL UNIQUE,
	ho NVARCHAR(10) NOT NULL,
	ten NVARCHAR(30) NOT NULL,
	anhdaidien VARCHAR(100)
);

CREATE TABLE [dbo].[theodoi](
	id_dc INT PRIMARY KEY,
	id_td INT,
	CONSTRAINT FK_theodoi FOREIGN KEY (id_dc) REFERENCES [dbo].[taikhoan](id_tk)
	on delete no action,
	CONSTRAINT FK_duoctheodoi FOREIGN KEY (id_td) REFERENCES [dbo].[taikhoan](id_tk)
	on delete cascade,
);

CREATE TABLE [dbo].[loaiphong](
	id_lp INT IDENTITY(1,1) PRIMARY KEY,
	tenloai NVARCHAR(30) NOT NULL
);

CREATE TABLE [dbo].[phong](
	id_p INT IDENTITY(1,1) PRIMARY KEY,
	ten NVARCHAR(100) NOT NULL,
	anhchinh nvarchar(100) unique,
	trangthai INT NOT NULL,
	chieudai FLOAT NOT NULL,
	chieurong FLOAT NOT NULL,
	gia INT NOT NULL,
	yeuthich INT,
	dcchitiet NVARCHAR(100) NOT NULL,
	mota NVARCHAR(500),
	ngaydang DATE,
	id_lp INT FOREIGN KEY REFERENCES [dbo].[loaiphong](id_lp)
	on delete set null,
	id_x BIGINT FOREIGN KEY REFERENCES [dbo].[XaPhuong](ID)
	on delete set null,
	id_tk INT FOREIGN KEY REFERENCES [dbo].[taikhoan](id_tk)
	on delete cascade
);

CREATE TABLE [dbo].[hinhanh](
	id_p int,
	stt int IDENTITY(1,1) ,
	hinhanh nvarchar(100),
	PRIMARY KEY (id_p, hinhanh),
	CONSTRAINT FK_hinhanh_p FOREIGN KEY (id_p) REFERENCES [dbo].[phong](id_p)
	on delete cascade
);

CREATE TABLE [dbo].[dathen](
	id_tk INT NOT NULL,
	id_p INT NOT NULL,
	trangthai INT,
	ngay DATE,
	gio TIME
	PRIMARY KEY (id_tk, id_p),
	CONSTRAINT FK_dathen_taikhoan FOREIGN KEY (id_tk) REFERENCES [dbo].[taikhoan](id_tk),
	CONSTRAINT FK_dathen_phong FOREIGN KEY (id_p) REFERENCES [dbo].[phong](id_p)
	on delete cascade
);

create table danhgia(
	id_dg int identity(1,1),
	id_p int not null,
	id_tk int not null,
	ngay date,
	sosao int,
	noidung nvarchar(300),
	PRIMARY KEY (id_dg, id_tk, id_p),
	CONSTRAINT FK_danhgia_taikhoan FOREIGN KEY (id_tk) REFERENCES [dbo].[taikhoan](id_tk),
	CONSTRAINT FK_danhgia_phong FOREIGN KEY (id_p) REFERENCES [dbo].[phong](id_p)
	on delete cascade
)