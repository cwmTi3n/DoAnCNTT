﻿USE [timphong]

/* INSERT TABLE taikhoan */
/* admin */
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('admin1', '123456', 1, 'admin1.timphongtro@email.com', '0986111222', 'Lưu', 'Ngạn Lâm')
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('admin2', '123456', 1, 'admin2.timphongtro@email.com', '0123456789', 'Hồ', 'Kim Tiền')
/* user */
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('user1', '123456', 2, 'user1@gmail.com', '0986123456', 'Lý', 'Tiến Thành')
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('user2', '123456', 2, 'user2@gmail.com', '0986123123', 'Trương', 'Thuận Hòa')
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('user3', '123456', 2, 'user3@gmail.com', '0986123789', 'Hà', 'Văn Nhân')
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('user4', '123456', 2, 'user4@gmail.com', '0986123654', 'Ngô', 'Anh Lượng')
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('user5', '123456', 2, 'user5@gmail.com', '0986123321', 'Nguyễn', 'Hoàng Nhật')
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('user6', '123456', 2, 'user6@gmail.com', '0986123987', 'Trương', 'Phạm Lý Hương')
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('user7', '123456', 2, 'user7@gmail.com', '0986123879', 'Đặng', 'Mai Hương')
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('user8', '123456', 2, 'user8@gmail.com', '0986123978', 'Ngô', 'Thanh Phú')
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('user9', '123456', 2, 'user9@gmail.com', '0986123645', 'Trần', 'Tiến Thành')
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('user10', '123456', 2, 'user10@gmail.com', '0986123564', 'Nguyễn', 'Tiến Dũng')
/* seller */
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('seller1', '123456', 3, 'seller1@gmail.com', '0986456123', 'Phan', 'Thanh Sang')
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('seller2', '123456', 3, 'seller2@gmail.com', '0986456456', 'Võ', 'Gia Bảo')
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('seller3', '123456', 3, 'seller3@gmail.com', '0986456789', 'Võ', 'Nhật Lam')
INSERT INTO [dbo].[taikhoan] (tentk, matkhau, quyen, email, sdt, ho, ten) VALUES ('seller4', '123456', 3, 'seller4@gmail.com', '0986456654', 'Trần', 'Hoàng Phúc')


/* INSERT TABLE theodoi 
INSERT INTO [dbo].[theodoi] (id_dc, id_td) VALUES (1, 11)
INSERT INTO [dbo].[theodoi] (id_dc, id_td) VALUES (1, 12)
INSERT INTO [dbo].[theodoi] (id_dc, id_td) VALUES (1, 13)
INSERT INTO [dbo].[theodoi] (id_dc, id_td) VALUES (1, 14)
INSERT INTO [dbo].[theodoi] (id_dc, id_td) VALUES (2, 11)
INSERT INTO [dbo].[theodoi] (id_dc, id_td) VALUES (3, 13)
INSERT INTO [dbo].[theodoi] (id_dc, id_td) VALUES (3, 14)
INSERT INTO [dbo].[theodoi] (id_dc, id_td) VALUES (4, 11)
INSERT INTO [dbo].[theodoi] (id_dc, id_td) VALUES (4, 12)
INSERT INTO [dbo].[theodoi] (id_dc, id_td) VALUES (4, 13)
*/

/* INSERT TABLE loaiphong */
INSERT INTO [dbo].[loaiphong] (tenloai) VALUES ('trọ')
INSERT INTO [dbo].[loaiphong] (tenloai) VALUES ('khách sạn')
INSERT INTO [dbo].[loaiphong] (tenloai) VALUES ('Home stay')
INSERT INTO [dbo].[loaiphong] (tenloai) VALUES ('Nhà nghỉ')
INSERT INTO [dbo].[loaiphong] (tenloai) VALUES ('Pen House')
INSERT INTO [dbo].[loaiphong] (tenloai) VALUES ('Trung tâm thương mại')


/* INSERT TABLE phong 
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '1 Trường Chinh', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 2.5, 5.5, 1000000, 0, '96 Nguyễn Tri Phương', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 1, 'abc', 3, 5, 500000, 0, '7 Phan Bội Châu', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 1, 'abc', 3, 5, 500000, 0, '112 Phạm Văn Đồng', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '99/5 Nguyễn Bính', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '661 Nguyễn Kiệm', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '321 Tân Sơn Nhất', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '255 Võ Minh Đức', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '36 Nguyễn Tri Phương', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '22 Bạch Đằng', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '2 Lũy Bán Bích', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '3 Nguyễn Tất Thành', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '53 Nguyễn Thị Minh Khai', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '256 QL 51', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '487 CMT8', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '152 Phan Bội Châu', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '99 Võ Văn Ngân', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '75 Sư Văn Hạnh', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '29 Lê Hồng Phong', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '51 Võ Thị Sáu', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '39 Lê Thị Trung', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '63 Lê Văn Lương', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '9 Nguyễn Trãi', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '8 Nguyễn Văn Tiết', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '199 Nguyễn Văn Linh', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '33/7 Nguyễn Văn Trỗi', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '55/6 Nguyễn Thái Bình', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '486 Nguyễn Đức Thuận', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '552 Nguyễn Huệ', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '31 Nguyễn Thái Bình', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '66 Lý Thường Kiệt', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '331 Lý Thái Tổ', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '229 Lý Chính Thắng', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '118 Lý Tự Trọng', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '156 Phan Đình Phùng', 'Phòng giá rẻ', 1,47, 11)
INSERT INTO [dbo].[phong] (ten, trangthai, hinhanh, chieudai, chieurong, gia, yeuthich, dcchitiet, mota, id_lp, id_x, id_tk) VALUES ('Phòng giá rẻ', 0, 'abc', 3, 5, 500000, 0, '186 Phan Đăng Lưu', 'Phòng giá rẻ', 1,47, 11)
*/