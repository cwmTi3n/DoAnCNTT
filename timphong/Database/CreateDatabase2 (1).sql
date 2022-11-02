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
	ten NVARCHAR(30) NOT NULL
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
	trangthai INT NOT NULL,
	hinhanh NVARCHAR(500) NOT NULL,
	chieudai FLOAT NOT NULL,
	chieurong FLOAT NOT NULL,
	gia INT NOT NULL,
	yeuthich INT,
	dcchitiet NVARCHAR(100) NOT NULL,
	mota NVARCHAR(500),
	ngaydang DATE,
	id_lp INT FOREIGN KEY REFERENCES [dbo].[loaiphong](id_lp)
	on delete set null,
	id_t BIGINT FOREIGN KEY REFERENCES [dbo].[TinhThanhPho](ID)
	on delete set null,
	id_tk INT FOREIGN KEY REFERENCES [dbo].[taikhoan](id_tk)
	on delete cascade
);

CREATE TABLE [dbo].[dathen](
	id_tk INT NOT NULL,
	id_p INT NOT NULL,
	luu INT,
	xacnhan INT,
	ngay DATE,
	gio TIME
	PRIMARY KEY (id_tk, id_p),
	CONSTRAINT FK_taikhoan FOREIGN KEY (id_tk) REFERENCES [dbo].[taikhoan](id_tk)
	on delete cascade,
	CONSTRAINT FK_phong FOREIGN KEY (id_p) REFERENCES [dbo].[phong](id_p)
);
