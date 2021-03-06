USE [master]
GO
/****** Object:  Database [demo1CRUD]    Script Date: 3/21/2021 9:42:20 PM ******/
CREATE DATABASE [demo1CRUD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'demo1CRUD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\demo1CRUD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'demo1CRUD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\demo1CRUD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [demo1CRUD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [demo1CRUD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [demo1CRUD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [demo1CRUD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [demo1CRUD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [demo1CRUD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [demo1CRUD] SET ARITHABORT OFF 
GO
ALTER DATABASE [demo1CRUD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [demo1CRUD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [demo1CRUD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [demo1CRUD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [demo1CRUD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [demo1CRUD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [demo1CRUD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [demo1CRUD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [demo1CRUD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [demo1CRUD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [demo1CRUD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [demo1CRUD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [demo1CRUD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [demo1CRUD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [demo1CRUD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [demo1CRUD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [demo1CRUD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [demo1CRUD] SET RECOVERY FULL 
GO
ALTER DATABASE [demo1CRUD] SET  MULTI_USER 
GO
ALTER DATABASE [demo1CRUD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [demo1CRUD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [demo1CRUD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [demo1CRUD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [demo1CRUD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [demo1CRUD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'demo1CRUD', N'ON'
GO
ALTER DATABASE [demo1CRUD] SET QUERY_STORE = OFF
GO
USE [demo1CRUD]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/21/2021 9:42:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Srno] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](500) NOT NULL,
	[City] [nvarchar](500) NULL,
	[State] [nvarchar](500) NULL,
	[Country] [nvarchar](500) NULL,
	[Departmant] [nvarchar](500) NULL,
	[Flag] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Srno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Emloyee]    Script Date: 3/21/2021 9:42:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_Emloyee]
@Srno int ,
@EmpName Nvarchar(500),
@City Nvarchar(500),
@State Nvarchar(500),
@Country Nvarchar(500),
@Departmant Nvarchar(500),
@Flag Nvarchar(50)

as begin
   if (@Flag = 'insert')
   begin
        insert into dbo.Employee
		(EmpName, City, State, Country, Departmant)
		Values
		(@EmpName, @City, @State, @Country, @Departmant)
	end

	Else if(@Flag = 'update')

	begin
		update dbo.Employee set 
		EmpName = @EmpName,
		City =  @City,
		State = @State,
		Country = @Country,
		Departmant = @Departmant
		where Srno = @Srno
     End

	 Else if(@Flag = 'delete')
	 begin
	    delete from Employee
		where Srno = @Srno
     end
	 else if(@Flag = 'getid')
	 begin
		select * from Employee where Srno = @Srno
	end
	 Else if( @Flag = 'get')
	 begin
	     select * from Employee
     end
end
GO
USE [master]
GO
ALTER DATABASE [demo1CRUD] SET  READ_WRITE 
GO
