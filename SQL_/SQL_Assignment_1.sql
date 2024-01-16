create table Customers(
[Customerid] char(5) not null,
[CompanyName] varchar(40) not null,
[contactName] char(30) null,
[Address] varchar(60) null,
[City] char(15) null,
[Phone] char(24) null,
[Fax] char(24) null
)
create table Orders(
[OrderId] integer not null,
[customerId] char(5) not null,
[Orderdate] datetime null,
[Shippeddate] datetime null,
[Freight] money null,
[Shipname] varchar(40) null,
[Shipaddres] varchar(60) null,
[Quantity] integer null
)
-- Using the ALTER TABLE statement, add a new column named shipregion to the Orders table. The fields should be nullable and contain integers.
alter table Orders add [shipregion] int null
select * from Orders

-- Using the ALTER TABLE statement, change the data type of the column shipregion from INTEGER to CHARACTER with length 8. The fields may contain null values.
alter table Orders alter column [shipregion] varchar(8) null

--Delete the formerly created column shipregion.
alter table Orders drop column [shipregion]

--Using the SQL Server Management Studio, try to instert a new row into the Orders table with the following values:
insert into Orders values( 10, 'ord01', getdate(), getdate(), 100.0, 'Windstar', 'Ocean' ,1) --Using the ALTER TABLE statement, add the current system date and time as the default value to the orderdate column of the Orders table.alter table Orders add default getdate() for [orderdate]--Rename the city column of the Customers table. The new name is Town.sp_rename 'Customers.city','Town'select * from Customers