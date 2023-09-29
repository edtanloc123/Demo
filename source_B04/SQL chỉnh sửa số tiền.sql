Create Database DBCayCanhNhomB04;

use DBCayCanhNhomB04;
-- Bang AdminUser

CREATE TABLE [dbo].[AdminUser] (
    [ID]           INT            NOT NULL,
    [NameUser]     NVARCHAR (50) NULL,
    [RoleUser]     NVARCHAR (50) NULL,
    [PasswordUser] NCHAR (50)     NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

--Bang Category
CREATE TABLE [dbo].[Category] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [IDCate]   NCHAR (20)     NOT NULL,
    [NameCate] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([IDCate] ASC)
);
--Bang Customer
CREATE TABLE [dbo].[Customer] (
    [IDCus]    INT            IDENTITY (1, 1) NOT NULL,
    [NameCus]  NVARCHAR (50) NULL,
    [PhoneCus] NVARCHAR (15)  NULL,
    [EmailCus] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([IDCus] ASC)
);

--Bang Product
CREATE TABLE [dbo].[Product] (
    [ProductID]     INT             IDENTITY (1, 1) NOT NULL,
    [NamePro]       NVARCHAR (50)  NULL,
    [DecriptionPro] NVARCHAR (50)  NULL,
    [Category]      NCHAR (20)      NULL,
    [Price]         DECIMAL (20, 3) NULL,
    [ImagePro]      NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_Pro_Category] FOREIGN KEY ([Category]) REFERENCES [dbo].[Category] ([IDCate])
);
--Bang OrderPro
CREATE TABLE [dbo].[OrderPro] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [DateOrder]        DATE           NULL,
    [IDCus]            INT            NULL,
    [AddressDeliverry] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IDCus]) REFERENCES [dbo].[Customer] ([IDCus])
);

--Bang OrderDetail
CREATE TABLE [dbo].[OrderDetail] (
    [ID]        INT        IDENTITY (1, 1) NOT NULL,
    [IDProduct] INT        NULL,
    [IDOrder]   INT        NULL,
    [Quantity]  INT        NULL,
    [UnitPrice] FLOAT (53) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IDProduct]) REFERENCES [dbo].[Product] ([ProductID]),
    FOREIGN KEY ([IDOrder]) REFERENCES [dbo].[OrderPro] ([ID])
);

-- Insert d? li?u
use DBCayCanhNhomB04;

------AdminUser
Insert into AdminUser (ID, NameUser, RoleUser, PasswordUser)
	values (1, 'TanLoc', 'TanLoc', '1122334455')
Insert into AdminUser (ID, NameUser, RoleUser, PasswordUser)
	values (2, 'VuLoc', 'VuLoc', '5544332211')
Insert into AdminUser (ID, NameUser, RoleUser, PasswordUser)
	values (3, 'QuangVinh', 'QuangVinh', '15082003')
Insert into AdminUser (ID, NameUser, RoleUser, PasswordUser)
	values (4, 'HuuThang', 'HuuThang', '1234554321')

------Customer
Insert into Customer (NameCus, PhoneCus, EmailCus)
	values (N'Trần Tấn Lộc', '0903784512', 'trantanloc@gmail.com')
Insert into Customer (NameCus, PhoneCus, EmailCus)
	values (N'Vũ Minh Lộc', '0913678345', 'vuminhloc@gmail.com')
Insert into Customer (NameCus, PhoneCus, EmailCus)
	values (N'Ngô Quang Vinh', '0918555954', 'quangvinhngo@gmail.com')
Insert into Customer (NameCus, PhoneCus, EmailCus)
	values (N'Nguyễn Hữu Thắng', '0903784541', 'nguyenhuuthang@gmail.com')

------Category
Insert into Category (IDCate, NameCate)
    Values(N'CTS', N'Cây thủy sinh')
Insert into Category (IDCate, NameCate)
    Values(N'CNTVP', N'Cây nội thất - văn phòng')
Insert into Category (IDCate, NameCate)
    Values(N'CDB', N'Cây để bàn')
Insert into Category (IDCate, NameCate)
    Values(N'CTG', N'Cây treo giỏ')
Insert into Category (IDCate, NameCate)
    Values(N'CATBM', N'Cây ăn trái bóng mát')
Insert into Category (IDCate, NameCate)
    Values(N'MCCC', N'Mẫu chậu cây cảnh')
select * from Category

--------Product
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Cau Tiểu Trâm', N'cây thân thảo hoá gỗ', N'CDB', 175, '/Content/images/img1.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Cọ Ta', N'cuống lá dày, dài và có gai ở mép', N'CDB', 180, '/Content/images/img2.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Dứa Cảnh Nến', N'cây thân cỏ, có thân giả', N'CDB', 175, '/Content/images/img3.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Đuôi Công Xanh', N'cây thân thảo, sống được quanh năm', N'CDB', 245, '/Content/images/img4.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Dương Xỉ Nhún', N'có lá đẹp, giúp lọc không khí', N'CDB', 155, '/Content/images/img5.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Hạnh Phúc để bàn', N'Hoa của cây có màu trắng, mọc sát nách lá', N'CDB', 250, '/Content/images/img6.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Hồng Môn', N'mọc thành bụi và có thân ngắn', N'CDB', 245, '/Content/images/img7.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Hương Thảo', N'cây nhỏ, cao khoảng 1 - 2m', N'CDB', 180, '/Content/images/img8.png')


Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Nga My', N'thân cột thấp, màu xám bạc', N'CATBM', 900, '/Content/images/img9.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Osaka', N'cây trung mộc, cao khoảng từ 10 đến 20m', N'CATBM', 1000, '/Content/images/img10.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Phúc', N'cây thân gỗ thường xanh', N'CATBM', 1500, '/Content/images/img11.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây tre vàng', N'có vóc dáng đẹp, ít gai', N'CATBM', 200, '/Content/images/img12.png')


Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Bạch Mã Hoàng Tử', N'cây thuộc thân thảo, sống lâu năm', N'CNTVP', 650, '/Content/images/img13.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Cau Hawai', N'cây thân bụi, nhỏ và có chiều cao nhất là 3m', N'CNTVP', 650, '/Content/images/img14.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Cau Nhật-Cau Vàng', N'dáng đẹp, thân cứng cáp', N'CNTVP', 750, '/Content/images/img15.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Hồng Môn Lớn', N'cây sống lâu năm, thường mọc thành bụi', N'CNTVP',800, '/Content/images/img16.png')


Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây cỏ đồng tiền', N'thân thảo mềm, có lá dạng hình tròn', N'CTS', 30, '/Content/images/img17.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây kim tiền', N'loại cây dễ chùm, sống lâu năm', N'CTS', 700, '/Content/images/img18.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Ngọc Ngân Thủy Sinh', N'có lá khá nổi bật', N'CTS',180, '/Content/images/img19.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Lưỡi Hổ Thủy Sinh', N'sở hữu khả năng lọc khí cực tốt', N'CTS', 185, '/Content/images/img20.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Phú Quý Thủy Sinh', N'thân thảo mềm, có lá dạng hình tròn', N'CTS', 170, '/Content/images/img21.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Thanh Tú', N'thân thảo, mọc theo bụi', N'CTS', 65, '/Content/images/img22.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Trầu Bà Thủy Sinh', N'hân thảo leo, thân tròn mập', N'CTS', 180, '/Content/images/img23.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây trúc phú quý', N'thân thảo sống lâu năm', N'CTS', 275, '/Content/images/img24.png')

	 
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Hoa Dừa Cạn', N'mọc thành bụi, lá xanh quanh năm', N'CTG', 65, '/Content/images/img25.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Cây Thanh Tú', N'thân thảo, mọc theo bụi', N'CTG', 65, '/Content/images/img26.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Dạ Yến Thảo', N'sở hữu rất nhiều màu sắc', N'CTG', 95, '/Content/images/img27.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Trầu Bà Cẩm Thạch', N'thân cỏ, dạng dây leo, sống lâu năm', N'CTG', 95, '/Content/images/img28.png')


Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Chậu CN 30-60', N'xi măng giả đá', N'MCCC', 300, '/Content/images/img29.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Chậu composite hình thang cao', N'sản xuất và tổng hợp từ sợi thủy tinh', N'MCCC', 700, '/Content/images/img30.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Chậu giọt nước', N'xi măng đá mài tròn hình Giọt Nước', N'MCCC', 300, '/Content/images/img31.png')
Insert into Product (NamePro, DecriptionPro, Category, Price, ImagePro)
    values (N'Chậu trụ tròn bầu đáy', N'đá mài đen, trụ tròn', N'MCCC', 350, '/Content/images/img32.png')


--------OrderPro
Insert into OrderPro (DateOrder, IDCus, AddressDeliverry)
	values ('01/01/2022', 1, N'155 Su Vạn Hạnh,q10')

--------OrderDetail
Insert into OrderDetail (IDProduct, IDOrder, Quantity, UnitPrice)
	values (1, 1, 5, 600)

	ALTER TABLE Customer
ADD UserName varchar(50), Password nvarchar(50)
