USE [master]
GO
/****** Object:  Database [Sınav]    Script Date: 02.01.2020 04:20:50 ******/
CREATE DATABASE [Sınav]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sınav', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Sınav.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Sınav_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Sınav_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Sınav] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sınav].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sınav] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sınav] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sınav] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sınav] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sınav] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sınav] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sınav] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Sınav] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sınav] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sınav] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sınav] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sınav] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sınav] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sınav] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sınav] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sınav] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sınav] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sınav] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sınav] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sınav] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sınav] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sınav] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sınav] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sınav] SET RECOVERY FULL 
GO
ALTER DATABASE [Sınav] SET  MULTI_USER 
GO
ALTER DATABASE [Sınav] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sınav] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sınav] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sınav] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sınav', N'ON'
GO
USE [Sınav]
GO
/****** Object:  Table [dbo].[tblBrans]    Script Date: 02.01.2020 04:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBrans](
	[ogretmenBolum] [int] IDENTITY(1,1) NOT NULL,
	[bransAd] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblBrans] PRIMARY KEY CLUSTERED 
(
	[ogretmenBolum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblKatagori]    Script Date: 02.01.2020 04:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKatagori](
	[katagoriID] [int] IDENTITY(1,1) NOT NULL,
	[katagoriAd] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblKatagori] PRIMARY KEY CLUSTERED 
(
	[katagoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOgrenci]    Script Date: 02.01.2020 04:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOgrenci](
	[ogrenciID] [int] IDENTITY(1,1) NOT NULL,
	[ogrenciAd] [nvarchar](50) NULL,
	[ogrenciSoyad] [nvarchar](50) NULL,
	[ogrenciTelefon] [nvarchar](12) NULL,
	[ogrenciEmail] [nvarchar](50) NULL,
	[ogrenciSinif] [int] NULL,
	[ogrenciYetki1] [bit] NULL,
	[ogrenciYetki2] [bit] NULL,
	[ogrenciSifre] [nvarchar](20) NULL,
	[ogrenciKullanici] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblOgrenci] PRIMARY KEY CLUSTERED 
(
	[ogrenciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOgretmen]    Script Date: 02.01.2020 04:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOgretmen](
	[ogretmenID] [int] IDENTITY(1,1) NOT NULL,
	[ogretmenAd] [nvarchar](50) NULL,
	[ogretmenSoyad] [nvarchar](50) NULL,
	[ogretmenTelefon] [nvarchar](50) NULL,
	[ogretmenEmail] [nvarchar](50) NULL,
	[ogretmenYetki1] [bit] NULL,
	[ogretmenKullanici] [nvarchar](50) NULL,
	[ogretmenYetki2] [bit] NULL,
	[ogretmenSifre] [nvarchar](50) NULL,
	[ogretmenBolum] [int] NULL,
 CONSTRAINT [PK_tblOgretmen] PRIMARY KEY CLUSTERED 
(
	[ogretmenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSinif]    Script Date: 02.01.2020 04:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSinif](
	[ogrenciSinif] [int] NOT NULL,
	[sinifAd] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSinif] PRIMARY KEY CLUSTERED 
(
	[ogrenciSinif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSonuc]    Script Date: 02.01.2020 04:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSonuc](
	[ogrenciID] [int] NULL,
	[dogruSayisi] [int] NULL,
	[yanlisSayisi] [int] NULL,
	[testTarihi] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSoru]    Script Date: 02.01.2020 04:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSoru](
	[soruID] [int] IDENTITY(1,1) NOT NULL,
	[katagoriID] [int] NULL,
	[ogretmenID] [int] NULL,
	[soruResim] [nvarchar](150) NULL,
	[soruSoru] [nvarchar](max) NULL,
	[soruCevapA] [nvarchar](150) NULL,
	[soruCevapB] [nvarchar](150) NULL,
	[soruCevapC] [nvarchar](150) NULL,
	[soruCevapD] [nvarchar](150) NULL,
	[soruDogruCevap] [nvarchar](10) NULL,
	[soruSinif] [int] NULL,
 CONSTRAINT [PK_tblSoru] PRIMARY KEY CLUSTERED 
(
	[soruID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblYanlisSayisi]    Script Date: 02.01.2020 04:20:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblYanlisSayisi](
	[ogrenciID] [int] NULL,
	[katagoriID] [int] NULL,
	[yanlis] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblBrans] ON 

INSERT [dbo].[tblBrans] ([ogretmenBolum], [bransAd]) VALUES (1, N'Matametik')
INSERT [dbo].[tblBrans] ([ogretmenBolum], [bransAd]) VALUES (2, N'Fizik')
INSERT [dbo].[tblBrans] ([ogretmenBolum], [bransAd]) VALUES (3, N'Kimya')
INSERT [dbo].[tblBrans] ([ogretmenBolum], [bransAd]) VALUES (4, N'Tarih')
INSERT [dbo].[tblBrans] ([ogretmenBolum], [bransAd]) VALUES (5, N'Edebiyat')
SET IDENTITY_INSERT [dbo].[tblBrans] OFF
SET IDENTITY_INSERT [dbo].[tblKatagori] ON 

INSERT [dbo].[tblKatagori] ([katagoriID], [katagoriAd]) VALUES (1, N'Üslü Sayılar')
INSERT [dbo].[tblKatagori] ([katagoriID], [katagoriAd]) VALUES (2, N'Mutlak Değer')
INSERT [dbo].[tblKatagori] ([katagoriID], [katagoriAd]) VALUES (6, N'Ondalıklı sayılar')
INSERT [dbo].[tblKatagori] ([katagoriID], [katagoriAd]) VALUES (9, N'Problemler')
SET IDENTITY_INSERT [dbo].[tblKatagori] OFF
SET IDENTITY_INSERT [dbo].[tblOgrenci] ON 

INSERT [dbo].[tblOgrenci] ([ogrenciID], [ogrenciAd], [ogrenciSoyad], [ogrenciTelefon], [ogrenciEmail], [ogrenciSinif], [ogrenciYetki1], [ogrenciYetki2], [ogrenciSifre], [ogrenciKullanici]) VALUES (1, N'bekir', N'turan', N'5555555555', N'abc@s.com', 10, 1, NULL, N'1234', N'ogrenci')
INSERT [dbo].[tblOgrenci] ([ogrenciID], [ogrenciAd], [ogrenciSoyad], [ogrenciTelefon], [ogrenciEmail], [ogrenciSinif], [ogrenciYetki1], [ogrenciYetki2], [ogrenciSifre], [ogrenciKullanici]) VALUES (2, N'hasan', N'turan', N'6666666666', N'c@com', 11, 1, NULL, N'1234', N'hasan')
SET IDENTITY_INSERT [dbo].[tblOgrenci] OFF
SET IDENTITY_INSERT [dbo].[tblOgretmen] ON 

INSERT [dbo].[tblOgretmen] ([ogretmenID], [ogretmenAd], [ogretmenSoyad], [ogretmenTelefon], [ogretmenEmail], [ogretmenYetki1], [ogretmenKullanici], [ogretmenYetki2], [ogretmenSifre], [ogretmenBolum]) VALUES (1, N'asdasd', N'qewqwe', N'qwe', N'qwe', 1, N'asdf', 0, N'1234', 1)
INSERT [dbo].[tblOgretmen] ([ogretmenID], [ogretmenAd], [ogretmenSoyad], [ogretmenTelefon], [ogretmenEmail], [ogretmenYetki1], [ogretmenKullanici], [ogretmenYetki2], [ogretmenSifre], [ogretmenBolum]) VALUES (2, N'atakan', N'yıldırım', N'5555555555', N'a@b.com', 1, N'atakan', 0, N'123456789', 1)
SET IDENTITY_INSERT [dbo].[tblOgretmen] OFF
INSERT [dbo].[tblSinif] ([ogrenciSinif], [sinifAd]) VALUES (9, N'9.sınıf')
INSERT [dbo].[tblSinif] ([ogrenciSinif], [sinifAd]) VALUES (10, N'10.sınıf')
INSERT [dbo].[tblSinif] ([ogrenciSinif], [sinifAd]) VALUES (11, N'11.sınıf')
INSERT [dbo].[tblSinif] ([ogrenciSinif], [sinifAd]) VALUES (12, N'12.sınıf')
INSERT [dbo].[tblSinif] ([ogrenciSinif], [sinifAd]) VALUES (13, N'Mezun')
INSERT [dbo].[tblSonuc] ([ogrenciID], [dogruSayisi], [yanlisSayisi], [testTarihi]) VALUES (1, 5, 15, N'01.01.2020')
INSERT [dbo].[tblSonuc] ([ogrenciID], [dogruSayisi], [yanlisSayisi], [testTarihi]) VALUES (1, 4, 16, N'31.12.2019')
INSERT [dbo].[tblSonuc] ([ogrenciID], [dogruSayisi], [yanlisSayisi], [testTarihi]) VALUES (1, 11, 9, N'02.01.2020')
SET IDENTITY_INSERT [dbo].[tblSoru] ON 

INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (21, 1, 1, N'Resimler\yok.png', N'3 üzeri -3 sonucu hangisidir?', N'-27', N'27', N'1/27', N'33', N'C', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (22, 1, 1, N'Resimler\yok.png', N'5^(-1) sonucu nedir?', N'5', N'-5', N'1/5', N'-1/5', N'C', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (23, 1, 1, N'Resimler\yok.png', N'(-5)^4 ifadesinin değeri kaçtır?', N'25', N'125', N'-125', N'625', N'D', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (24, 1, 1, N'Resimler\yok.png', N'-6^2 ifadesinin değeri kaçtır?', N'-36', N'12', N'-12', N'-62', N'A', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (25, 1, 1, N'Resimler\yok.png', N'1) -3^2=-6    2-) 3^3=27 3-) -1^25=-25 kaç tanesi doğrudur?', N'1', N'2', N'3', N'hiçbir', N'A', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (26, 1, 1, N'Resimler\yok.png', N'Bir okulda toplanan 2^5 ton atık kağıt geri dönüşüme gönderilerek 4^4 ağaç kesilmekten kurtarılmıştır. Buna göre 1 ton atık kağıt ile kaç ağaç kesilmekten kurtarılabilir ?', N'2', N'4', N'8', N'16', N'C', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (27, 1, 1, N'Resimler\yok.png', N'(2^5)*(2^7) işlemin sonucu nedir?', N'2^57', N'2^12', N'2^(-2)', N'2^11', N'B', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (28, 1, 1, N'Resimler\yok.png', N'(2^12)/(2^11) işleminin sonucu nedir?', N'2', N'4', N'8', N'12', N'A', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (29, 1, 1, N'Resimler\yok.png', N'12548759 sayısının 0 kuvveti kaçtır ?', N'1', N'0', N'-1', N'12548759', N'A', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (30, 1, 1, N'Resimler\yok.png', N'0^9999 kaça eşittir?', N'1', N'9999', N'1/9999', N'0', N'D', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (31, 2, 1, N'Resimler\yok.png', N'x = -5 olduğuna göre mutlak değer 4x-25 ifadesinin sonucu nedir?', N'5', N'-45', N'-25', N'20', N'B', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (32, 2, 1, N'Resimler\8591631MD1.png', N'işleminin sonucu kaçtır?', N'1', N'2', N'3', N'4', N'A', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (33, 2, 1, N'Resimler\747551083MD2.png', N'işleminin sonucu nedir?', N'-4', N'4', N'0', N'6', N'B', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (34, 2, 1, N'Resimler\175913309MD3.png', N'olduğuna göre a.b nedir?', N'-5', N'1', N'6', N'-6', N'C', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (35, 2, 1, N'Resimler\864850378MD4.png', N'ise x.y nedir?', N'-10', N'5', N'-5', N'10', N'D', 10)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (36, 2, 1, N'Resimler\709606449md5.png', N'En küçük değeri kaçtır?', N'0', N'-2', N'2', N'-8', N'C', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (37, 2, 1, N'Resimler\903744357md6.png', N'ifadesinin en büyük değeri kaçtır?', N'10', N'2', N'10/3', N'5', N'B', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (38, 2, 1, N'Resimler\501884199md7.png', N'ifadesinin eşitti kaçtır?', N'2', N'2x', N'4', N'4x', N'A', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (39, 2, 1, N'Resimler\91066555md8.png', N'x değerlerinin toplamı kaçtır?', N'2', N'3', N'4', N'5', N'A', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (40, 2, 1, N'Resimler\554718737md9.png', N'denklemin çözüm kümesi nedir?', N'R', N'Boş küme', N'{-1,-3}', N'{-3,3}', N'B', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (45, 9, 1, N'Resimler\yok.png', N'17 den çıkarıldığı zaman 15 in 2/3 sinden 4 fazla bir sonuç veren sayı hangisidir?', N'3', N'4', N'5', N'6', N'A', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (46, 9, 1, N'Resimler\yok.png', N'Kendisinin 2 katı, yarısının karasine eşit olan sayı kaçtır?', N'8', N'6', N'4', N'2', N'D', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (47, 9, 1, N'Resimler\yok.png', N'Bir saat tam 1:30 u gösterdiği zaman akrep ile yelkovan arasındaki acı kaç derecedir?', N'120', N'135', N'90', N'105', N'B', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (48, 9, 1, N'Resimler\yok.png', N'2 katına 5 eklenince, 3 katından 19 eksik olan sayı kaçtır?', N'6', N'12', N'24', N'36', N'C', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (49, 9, 1, N'Resimler\yok.png', N'2 katına 5 eklenince, 3 katından 19 eksik olan sayı kaçtır?', N'6', N'12', N'24', N'36', N'C', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (50, 9, 1, N'Resimler\yok.png', N'1 koyun 4 kuzu ile, 1 kuzu 2 oğlak ile, 1koyun 12 tavuk ile değiştirilirse 6 tavuk kaç oğlak ile değiştirilir?', N'1', N'4', N'2', N'3', N'B', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (51, 9, 1, N'Resimler\yok.png', N'Toplamları 420 olan 3 sayıdan ikincisi birincisinin, üçünsüde ikincisinin 4 katı olduğuna göre, bu sayılardan en küçük olanı kaçtır?', N'25', N'20', N'15', N'10', N'B', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (52, 9, 1, N'Resimler\yok.png', N'100 ve 500 liradan oluşan 30 tane adet para toplamda 12,200 lira olduğuna göre 500 liralık kaç adet para vardır?', N'20', N'21', N'22', N'23', N'D', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (53, 9, 1, N'Resimler\yok.png', N'3 kalem ve 2 silgi 500 , 2 kalem 3 silgi 480 lira ise 1 kalem 1 silgiden kaç para fazladır?', N'40', N'30', N'20', N'25', N'C', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (54, 9, 1, N'Resimler\yok.png', N'17 katı ile 14 katı arasında 3600 sayı olan kaçtır?', N'1300', N'1200', N'1400', N'2400', N'B', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (55, 6, 2, N'Resimler\yok.png', N'21/5 in ondalıklı gösterime nedir?', N'3.6', N'4.1', N'4.2', N'4.3', N'C', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (56, 6, 2, N'Resimler\yok.png', N'(3,3/0,3)+(22,2/0,2)+(0,05/0,0005)-111 işleminin sonucu kaçtır?', N'1', N'11', N'41', N'21', N'D', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (57, 6, 2, N'Resimler\yok.png', N'Bir sayıyı 0,25 çarpmak kaça bölmek demektir?', N'2', N'4', N'8', N'2.5', N'B', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (58, 6, 2, N'Resimler\348731714ondalık1.png', N'işleminin sonucu kaçtır?', N'1/2', N'1', N'2', N'4', N'D', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (59, 6, 2, N'Resimler\883664366ondalık2.png', N'işleminin sonucu kaçtır?', N'1', N'2', N'3', N'4', N'A', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (60, 6, 2, N'Resimler\848465720ondalık3.png', N'işleminin sonucu kaçtır?', N'1', N'1/4', N'2/4', N'3/4', N'D', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (61, 6, 2, N'Resimler\yok.png', N'0,0703.(0,3-0,2) işlemin sonucu nedir?', N'0,00703', N'0,703', N'0,0703', N'-0,0703', N'A', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (62, 6, 2, N'Resimler\736349148ondalık4.png', N'Kesrinin sadeleşmiş sekli hangisidir?', N'-a', N'1-a', N'a', N'1+a', N'C', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (63, 6, 2, N'Resimler\yok.png', N'3,075 sayısının eşiti hangisidir?', N'123/40', N'40/9', N'15/9', N'21/6', N'A', 9)
INSERT [dbo].[tblSoru] ([soruID], [katagoriID], [ogretmenID], [soruResim], [soruSoru], [soruCevapA], [soruCevapB], [soruCevapC], [soruCevapD], [soruDogruCevap], [soruSinif]) VALUES (64, 6, 2, N'Resimler\141771158ondalık5.png', N'küçükten büyüğe doğru sıralanışı hangisidir?', N'a, b, c', N'a, c, b', N'b, c, a', N'c, a, b', N'A', 9)
SET IDENTITY_INSERT [dbo].[tblSoru] OFF
INSERT [dbo].[tblYanlisSayisi] ([ogrenciID], [katagoriID], [yanlis]) VALUES (1, 1, 4)
INSERT [dbo].[tblYanlisSayisi] ([ogrenciID], [katagoriID], [yanlis]) VALUES (1, 2, 7)
INSERT [dbo].[tblYanlisSayisi] ([ogrenciID], [katagoriID], [yanlis]) VALUES (1, 6, 9)
INSERT [dbo].[tblYanlisSayisi] ([ogrenciID], [katagoriID], [yanlis]) VALUES (1, 9, 3)
INSERT [dbo].[tblYanlisSayisi] ([ogrenciID], [katagoriID], [yanlis]) VALUES (2, 1, 1)
INSERT [dbo].[tblYanlisSayisi] ([ogrenciID], [katagoriID], [yanlis]) VALUES (2, 2, 1)
INSERT [dbo].[tblYanlisSayisi] ([ogrenciID], [katagoriID], [yanlis]) VALUES (2, 6, 1)
INSERT [dbo].[tblYanlisSayisi] ([ogrenciID], [katagoriID], [yanlis]) VALUES (2, 9, 1)
ALTER TABLE [dbo].[tblOgrenci]  WITH CHECK ADD  CONSTRAINT [FK_tblOgrenci_tblSinif] FOREIGN KEY([ogrenciSinif])
REFERENCES [dbo].[tblSinif] ([ogrenciSinif])
GO
ALTER TABLE [dbo].[tblOgrenci] CHECK CONSTRAINT [FK_tblOgrenci_tblSinif]
GO
ALTER TABLE [dbo].[tblOgretmen]  WITH CHECK ADD  CONSTRAINT [FK_tblOgretmen_tblBrans] FOREIGN KEY([ogretmenBolum])
REFERENCES [dbo].[tblBrans] ([ogretmenBolum])
GO
ALTER TABLE [dbo].[tblOgretmen] CHECK CONSTRAINT [FK_tblOgretmen_tblBrans]
GO
ALTER TABLE [dbo].[tblSonuc]  WITH CHECK ADD  CONSTRAINT [FK_tblSonuc_tblOgrenci] FOREIGN KEY([ogrenciID])
REFERENCES [dbo].[tblOgrenci] ([ogrenciID])
GO
ALTER TABLE [dbo].[tblSonuc] CHECK CONSTRAINT [FK_tblSonuc_tblOgrenci]
GO
ALTER TABLE [dbo].[tblSoru]  WITH CHECK ADD  CONSTRAINT [FK_tblSoru_tblKatagori] FOREIGN KEY([katagoriID])
REFERENCES [dbo].[tblKatagori] ([katagoriID])
GO
ALTER TABLE [dbo].[tblSoru] CHECK CONSTRAINT [FK_tblSoru_tblKatagori]
GO
ALTER TABLE [dbo].[tblSoru]  WITH CHECK ADD  CONSTRAINT [FK_tblSoru_tblOgretmen] FOREIGN KEY([ogretmenID])
REFERENCES [dbo].[tblOgretmen] ([ogretmenID])
GO
ALTER TABLE [dbo].[tblSoru] CHECK CONSTRAINT [FK_tblSoru_tblOgretmen]
GO
ALTER TABLE [dbo].[tblYanlisSayisi]  WITH CHECK ADD  CONSTRAINT [FK_tblYanlisSayisi_tblKatagori] FOREIGN KEY([katagoriID])
REFERENCES [dbo].[tblKatagori] ([katagoriID])
GO
ALTER TABLE [dbo].[tblYanlisSayisi] CHECK CONSTRAINT [FK_tblYanlisSayisi_tblKatagori]
GO
ALTER TABLE [dbo].[tblYanlisSayisi]  WITH CHECK ADD  CONSTRAINT [FK_tblYanlisSayisi_tblOgrenci] FOREIGN KEY([ogrenciID])
REFERENCES [dbo].[tblOgrenci] ([ogrenciID])
GO
ALTER TABLE [dbo].[tblYanlisSayisi] CHECK CONSTRAINT [FK_tblYanlisSayisi_tblOgrenci]
GO
USE [master]
GO
ALTER DATABASE [Sınav] SET  READ_WRITE 
GO
