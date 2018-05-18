create database RENTA;

use RENTA;



create table TipoEmpleado(
	idTipoEmpleado int not null primary key AUTO_INCREMENT,
	descEmpleado varchar(50)
);

create table EmpleadoRenta(
	idEmpleado int not null primary key AUTO_INCREMENT,
	nombreEmpleado varchar(50),
	apPaternoEmpleado varchar(50),
	apMaternoEmpleado varchar(50),
	entidadEmpleado varchar(50),
	municipioEmpleado varchar(50),
	coloniaEmpleado varchar(50),
	calleEmpleado varchar(100),
	noExterior int,
	noInterior int,
	cpEmpleado int,
	telEmpleado varchar(10),
	emailEmpleado varchar(254),
	passEmpleado varchar(16),
	idTipoEmpleado int not null,
	generoEmpleado varchar(1),
	foreign key(idTipoEmpleado) references TipoEmpleado(idTipoEmpleado) on delete cascade on update cascade
);


create table ClienteRenta(
	idCliente int not null primary key AUTO_INCREMENT,
	idEmpleado int not null,
	NombreCliente varchar(50),
	apPaterno varchar(50),
	apMaterno varchar(50),
	rfcCliente varchar(10),
	entidadCliente varchar(50),
	municipioCliente varchar(50),
	coloniaCliente varchar(50),
	calleCliente varchar(100),
	noExterior int,
	noInterior int,
	cpCliente int,
	telCliente varchar(10),
	emailCliente varchar(254),
	passCliente varchar(16),
	generoCliente varchar(1),
	foreign key(idEmpleado) references EmpleadoRenta(idEmpleado) on delete cascade on update cascade
);

create table TipoAuto(
	idTipo int not null primary key AUTO_INCREMENT,
	tipoAuto varchar(50)
);

create table AutomovilMarca(
	idMarca int not null primary key AUTO_INCREMENT,
	nomMarca varchar(50)
);

create table Sucursal(
	idSucursal int not null primary key AUTO_INCREMENT,
	nombreSucursal varchar(50),
	estadoSucursal varchar(50),
	coloniaSucursal varchar(50),
	calleSucursal varchar(50),
	cpSucursal int,
	telSucursal varchar(10)
);

create table EstadoAuto(
	idEstado  int not null primary key,
	estadoAuto varchar(20)
);

create table Automovil(
	matriculaAuto varchar(10) not null primary key,
	nombreAuto varchar(50),
	colorAuto varchar(45),
	modeloAuto int,
	capacidadAuto int,
	kilometrajeAuto int,
	precioAuto double,
	idSucursal int not null,
	idMarca int not null,
	idTipo int not null,
	idEstado int not null,
	foreign key(idEstado) references EstadoAuto(idEstado) on delete cascade on update cascade,
	foreign key(idSucursal) references Sucursal(idSucursal) on delete cascade on update cascade,
	foreign key(idMarca) references AutomovilMarca(idMarca) on delete cascade on update cascade,
	foreign key(idTipo) references TipoAuto(idTipo) on delete cascade on update cascade
);

create table TipoPago(
	idTipoPago int not null primary key ,
	tipoPago varchar(50)
);

create table Renta(
	idRenta int not null primary key AUTO_INCREMENT,
	idCliente int not null,
	matricula varchar(10) not null,
	descripcionRenta varchar(200),
	fechaInicioRenta varchar(10),
	fechaFinRenta varchar(10),
	totalRenta double,
	unidadesRenta int,
	tipoPago int not null,
	foreign key(tipoPago) references TipoPago(idTipoPago) on delete cascade on update cascade,
	foreign key(idCliente) references ClienteRenta(idCliente) on delete cascade on update cascade,
	foreign key(matricula) references Automovil(matriculaAuto) on delete cascade on update cascade 
);





create table SucursalPersona(
	idSucursal int not null,
	idEmpleado int not null,
	primary key(idSucursal,idEmpleado),
	foreign key(idSucursal) references Sucursal(idSucursal) on delete cascade on update cascade,
	foreign key(idEmpleado) references EmpleadoRenta(idEmpleado) on delete cascade on update cascade
);

create table Proveedor(
	idProveedor int not null primary key AUTO_INCREMENT,
	nombreProveedor varchar(50),
	emailProveedor varchar(50),
	telProveedor varchar(10)
);

create table ProveedorSucursal(
	idProveedor int not null,
	idSucursal int not null,
	primary key(idSucursal, idProveedor),
	foreign key(idSucursal) references Sucursal(idSucursal) on delete cascade on update cascade,
	foreign key(idProveedor) references Proveedor(idProveedor) on delete cascade on update cascade

);

create table Adquisicion(
	idAdquisicion int not null primary key AUTO_INCREMENT,
	idProveedor int not null,
	idEmpleado int not null,
	fechaAdquisicion varchar(10),
	totalAquisicion double,
	foreign key(idProveedor) references Proveedor(idProveedor) on delete cascade on update cascade,
	foreign key(idEmpleado) references EmpleadoRenta(idEmpleado) on delete cascade on update cascade
);

create table DetalleAdquisicion(
	idDetalleAdquisicion int not null primary key AUTO_INCREMENT,
	idAdquisicion int not null,
	nombreAuto varchar(50),
	modeloAuto int,
	unidadesAuto int,
	precioTotal double,
	precioUnitario double,
	foreign key(idDetalleAdquisicion) references Adquisicion(idAdquisicion) on delete cascade on update cascade
);


create table Cuenta(
	numeroDeCuenta varchar(15) not null primary key,
	idCliente int not null,
	idDetalleCuenta int not null,
	saldo double,
	foreign key(idDetalleCuenta) references DetalleCuenta(idDetalleCuenta) on delete cascade on update cascade,
	foreign key(idCliente) references ClienteRenta(idCliente) on delete cascade on update cascade
);

create table DetalleCuenta(
	idDetalleCuenta int not null primary key AUTO_INCREMENT,
	detalleCuenta varchar(250),
	fechaAdquisicionSaldo varchar(10),
	fechaLimitePago varchar(10),
	pagoMinimo double,
	intereses varchar(15)
);



insert into Sucursal values(1,"Presta Autos Azcapotzalco","Ciudad de Mexico","Claveria","Miguel Hidalgo",20134,"5512456790"),
(2,"Presta Autos Centro","Ciudad de Mexico","Centro","Eje Central Lazaro Cardenas",10345,"5589124410"),
(3,"Presta Autos Santa Monica","Estado de Mexico","Tlalnepantla Centro","Av. Santa Monica",24569,"5545612309");

insert into AutomovilMarca values(1,"Volkswagen"),
(2,"Ford"),
(3,"General Motors"), 
(5,"Nissan"),
(6,"Toyota"),
(7,"Renault"),
(8,"Hunday"),
(9,"KIA"),
(10,"Seat");

insert into TipoAuto values(1,"Hatchback"),
(2,"CUV"),
(3,"Sedan"),
(4,"SUV"),
(5,"Station Wagon"),
(6,"Pick Up"),
(7,"Coupe"),
(8,"Minivan"),
(9,"Convertible"),
(10,"Van"),
(11,"Super Deportivo");

insert into Proveedor values(1,"Volkswagen de Mexico S.A. DE C.V.","manuelLS007@gmail.com", "222-30359"),
(2,"Ford Motor Company S.A DE C.V.","MariaRoszAriO1@hotmail.com.mx","0180071984"),
(3,"General Motors de Mexico S.DE R.L DE C.V.","deathAzul15@live.com","018005080"),
(5,"Nissan Motor Company S.A DE C.V.","maquinacementera1001@hotmail.com","55533399"),
(6,"Toyota Motor Sales Mexico S. R.L. C.V.","laChiquiz@hotmail.com","80033143"),
(7,"Renault Mexico S.A DE C.V.","ismaRojHerMex@gmail.com","55513360"),
(8,"Hunday Motor Sales Mexico S.A. DE C.V.","gloryInParis77@yahoo.com","55412220"),
(9,"KIA Motors Mexico S.A. DE C.V.","criiizRoldanF98@outlook.com","015547800"),
(10,"Seat S.A.","josraMartiVale5@hotmail.com","018008357"); 

insert into ProveedorSucursal values(1,1),(2,1),(5,1),(6,2),(7,2),(8,2),(9,3),(10,3);

insert into TipoEmpleado values(1,"Administrador"),(2,"Agente de Venta");
insert into TipoPago values(1,"EFECTIVO"),(2,"TARJETA");
insert into EstadoAuto values(1,"OCUPADO"),(2,"DISPONIBLE");

insert into EmpleadoRenta values(1,"Jose Rafael","Martinez","Valenzuela","Ciudad de Mexico","Cuauhtemoc","Centro","Av. 20 de noviembre",56,12,68300,"55513360","josraMartiVale5@hotmail.com","mmm",1,"M");

