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
	matriculaAuto varchar(15) not null primary key,
	nombreAuto varchar(50),
	colorAuto varchar(45),
	modeloAuto int,
	kilometrajeAuto int,
	precioAuto double,
	descripcion varchar(700),
	descripcionCantidad varchar(100),
	rutaAuto varchar(200),
	rutaSalpicaderas varchar(200),
	rutaInteriores varchar(200),
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
	idTipoPago int not null primary key,
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
(3,"Volvo"), 
(4,"Nissan"),
(5,"Toyota"),
(6,"Renault"),
(7,"Hunday"),
(8,"KIA"),
(9,"Seat");

insert into TipoAuto values(1,"Hatchback"),
(2,"CUV"),
(3,"Sedan"),
(4,"SUV"),
(5,"Station Wagon"),
(6,"Pick Up"),
(7,"Coupe"),
(8,"Convertible"),
(9,"Van"),
(10,"Super Deportivo");

insert into Proveedor values(1,"Volkswagen de Mexico S.A. DE C.V.","manuelLS007@gmail.com", "222-30359"),
(2,"Ford Motor Company S.A DE C.V.","MariaRoszAriO1@hotmail.com.mx","0180071984"),
(3,"Volvo S.DE R.L DE C.V.","deathAzul15@live.com","018005080"),
(4,"Nissan Motor Company S.A DE C.V.","maquinacementera1001@hotmail.com","55533399"),
(5,"Toyota Motor Sales Mexico S. R.L. C.V.","laChiquiz@hotmail.com","80033143"),
(6,"Renault Mexico S.A DE C.V.","ismaRojHerMex@gmail.com","55513360"),
(7,"Hunday Motor Sales Mexico S.A. DE C.V.","gloryInParis77@yahoo.com","55412220"),
(8,"KIA Motors Mexico S.A. DE C.V.","criiizRoldanF98@outlook.com","015547800"),
(9,"Seat S.A.","josraMartiVale5@hotmail.com","018008357"); 

insert into ProveedorSucursal values(1,1),(2,1),(5,1),(6,2),(7,2),(8,2),(9,3),(10,3);

insert into TipoEmpleado values(1,"Administrador"),(2,"Agente de Venta");
insert into TipoPago values(1,"EFECTIVO"),(2,"TARJETA");
insert into EstadoAuto values(1,"OCUPADO"),(2,"DISPONIBLE");

insert into EmpleadoRenta values(1,"Jose Rafael","Martinez","Valenzuela","Ciudad de Mexico","Cuauhtemoc","Centro","Av. 20 de noviembre",56,12,68300,"55513360","josraMartiVale5@hotmail.com","mmm",1,"M");

-- Sucursal Azcapotzalco 

-- Autos KIA
insert into Automovil values("ABC-123","Rio","Rojo",2017,120000,125236.50,"Espacioso, práctico y polivalente, el Kia Rio 2017 ofrece una capacidad de maletero de 325 litros respecto a los 288 litros del modelo de 2015. Por su tamaño exterior y longitud de 4065 mm, clasificamos el Kia Rio en la categoría de coches utilitarios.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/KIA/Rio/rio1.png","Images/Sucursal/Marcas/KIA/Rio/rio2.png","Images/Sucursal/Marcas/KIA/Rio/rio3.png",1,8,1,2),
	("ABD-123","Sorento","Gris",2017,120000,125236.50,"El espacioso interior permite que hasta 7 personas viajen en el Kia Sorento 2015 con comodidad. Por su tamaño, características, altura libre al suelo de 18 cm y longitud de 4780 mm, clasificamos el Kia Sorento en la categoría de SUV grandes y todoterrenos.","Espacio interior de 7 plazas.","Images/Sucursal/Marcas/KIA/Sorento/sorento1.png","Images/Sucursal/Marcas/KIA/Sorento/sorento2.png","Images/Sucursal/Marcas/KIA/Sorento/sorento3.png",1,8,1,2),
	("ABE-123","Proceed","Rojo",2017,120000,125236.50,"Con silueta dinámico, el Kia pro_cee'd 2016 es la versión 3 puertas y 4 centímetros más bajo que el cee'd de 5 puertas.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/KIA/Proceed/proceed1.png","Images/Sucursal/Marcas/KIA/Proceed/proceed2.png","Images/Sucursal/Marcas/KIA/Proceed/proceed3.png",1,8,1,2),
("ABF-234","Niro","Azul Petroleo",2017,120000,125236.50,"El nuevo Kia Niro 2017 es un crossover híbrido de exterior compacto y interior espacioso de 4,36 metros de longitud. Por su tamaño, características, altura libre al suelo de 16 cm y longitud de 4355 mm, clasificamos el Kia Niro en la categoría de SUV compactos. Compara el Kia Niro con otros híbridos de tamaño similar. El modelo híbrido enchufable recibe el nombre de Niro PHEV.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/KIA/Niro/niro1.png","Images/Sucursal/Marcas/KIA/Niro/niro2.png","Images/Sucursal/Marcas/KIA/Niro/niro3.png",1,8,1,2);

-- Nissan
insert into Automovil values("ABG-256","Micra","Naranja",2017,120020,135236.50,"La quinta generación del Nissan Micra tiene un diseño expresivo y dinámicas proporciones con una longitud 17 centímetros mayor. Por su tamaño exterior y longitud de 3995 mm, clasificamos el Nissan Micra en la categoría de coches utilitarios.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Nissan/Micra/micra1.png","Images/Sucursal/Marcas/Nissan/Micra/micra2.png","Images/Sucursal/Marcas/Nissan/Micra/micra3.png",1,4,2,2),
("ABH-287","NP300","Naranja",2016,120020,325236.50,"El robusto pick-up Nissan NP300 Navara 2016 tiene una capacidad de carga de 1 tonelada y de remolque de 3,5 toneladas y ofrece un confortable interior para 5 pasajeros en su versión doble cabina. Por su zona de carga posterior, prestaciones, altura libre al suelo de 22 cm y longitud de 5330 mm, clasificamos el Nissan NP300 Navara en la categoría de vehículos pick-up.
	Espacio interior de 5 plazas","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Nissan/NP300/navara1.png","Images/Sucursal/Marcas/Nissan/NP300/navara2.png","Images/Sucursal/Marcas/Nissan/NP300/navara3.png",1,4,4,2),
("ABI-222","X-Trail","Naranja",2017,120020,235236.50,"Más grande que el Qashqai, el Nissan X-Trail 2017 ofrece una tercera fila de asientos opcional abatible al 50/50 y una segunda fila deslizante para alternar entre espacio de piernas y espacio de carga. Por su tamaño, características, altura libre al suelo de 20 cm y longitud de 4690 mm, clasificamos el Nissan X-Trail en la categoría de SUV medianos.
	","Espacio interior de 7 plazas.","Images/Sucursal/Marcas/Nissan/XTrail/xtrail1.png","Images/Sucursal/Marcas/Nissan/XTrail/xtrail2.png","Images/Sucursal/Marcas/Nissan/XTrail/xtrail3.png",1,4,5,2),
("ABJ-222","Qashqai","Azul Claro",2017,120020,215236.50,"El Nissan Qashqai se renueva en 2017 con un diseño exterior más contemporáneo, mayores niveles de calidad interior y más tecnología. Por su tamaño, características, altura libre al suelo de 18 cm y longitud de 4394 mm, clasificamos el Nissan Qashqai en la categoría de SUV compactos.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Nissan/Qashqai/qashqai1.png","Images/Sucursal/Marcas/Nissan/Qashqai/qashqai2.png","Images/Sucursal/Marcas/Nissan/Qashqai/qashqai3.png",1,4,8,2);

-- HYUNDAI
insert into Automovil values("ABK-256","I30-Fastback","Azul Marino",2018,121020,175236.50,"El nuevo Hyundai i30 Fastback 2018 es la última incorporación a la gama i30 con un diseño elegante de coupé 5 puertas y una experiencia de conducción más dinámica. Por su tamaño exterior y longitud de 4455 mm, clasificamos el Hyundai i30 Fastback en la categoría de berlinas medianas.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Hyundai/i30fastback/i30fastback1.png","Images/Sucursal/Marcas/Hyundai/i30fastback/i30fastback2.png","Images/Sucursal/Marcas/Hyundai/i30fastback/i30fastback3.png",1,7,3,2),
("ABl-287","I30-N","Azul Claro",2016,147020,155236.50,"Con una imagen potente y deportiva, el Hyundai i30 N 2018 es el primer vehículo de altas prestaciones de Hyundai bajo la línea N.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Hyundai/i30N/i30n1.png","Images/Sucursal/Marcas/Hyundai/i30N/i30n2.png","Images/Sucursal/Marcas/Hyundai/i30N/i30n3.png",1,7,7,2),
("BDM-222","Elantra","Naranja",2017,120020,235236.50,"La sexta generación del Hyundai Elantra se presenta en 2016 con un diseño contemporáneo y orientado al conductor. Por su tamaño exterior y longitud de 4570 mm, clasificamos el Hyundai Elantra en la categoría de berlinas medianas.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Hyundai/Elantra/elantra1.png","Images/Sucursal/Marcas/Hyundai/Elantra/elantra2.png","Images/Sucursal/Marcas/Hyundai/Elantra/elantra3.png",1,7,9,2),
("ABN-222","Kona","Verde Pistache",2018,120320,275236.50,"Hyundai entra en el segmento B-SUV con el nuevo Hyundai Kona 2018 de diseño audaz y vanguardista para los conductores urbanos modernos. Por su tamaño, características, altura libre al suelo de 17 cm y longitud de 4165 mm, clasificamos el Hyundai Kona en la categoría de crossover pequeños. ","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Hyundai/Kona/kona1.png","Images/Sucursal/Marcas/Hyundai/Kona/kona2.png","Images/Sucursal/Marcas/Hyundai/Kona/kona3.png",1,7,3,2),
("ABO-222","I40","Azul Claro",2015,100020,315236.50,"Renovado y totalmente estilizado, el Hyundai i40 2015 tiene una longitud de 4,75 metros. Por su tamaño exterior y longitud de 4745 mm, clasificamos el Hyundai i40 en la categoría de berlinas grandes.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Hyundai/i40/i401.png","Images/Sucursal/Marcas/Hyundai/i40/i402.png","Images/Sucursal/Marcas/Hyundai/i40/i403.png",1,7,1,2);

-- Ford
insert into Automovil values("ABQ-256","Fiesta","Rojo",2017,171020,175236.50,"Con un diseño aerodinámico 7 centímetros más largo, el Ford Fiesta 2017 se moderniza con más tecnología y ofrece más espacio para las piernas, tanto delante como detrás. Por su tamaño exterior y longitud de 4040 mm, clasificamos el Ford Fiesta en la categoría de coches utilitarios.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Ford/Fiesta/fiesta1.png","Images/Sucursal/Marcas/Ford/Fiesta/fiesta2.png","Images/Sucursal/Marcas/Ford/Fiesta/fiesta3.png",1,2,3,2),
("ABR-287","CMAX","Rojo",2016,147620,155636.50,"Ford renueva el C-MAX y Grand C-MAX con espacio cómodo y flexible para 5 personas en el primero y 5 o 7 personas en el segundo, manteniendo sus longitudes en 4,38 y 4,52 metros respectivamente. Por su flexibilidad interior, optimización del espacio y altura de 1610 mm, clasificamos el Ford C-MAX en la categoría de monovolúmenes.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Ford/CMAX/cmax1.png","Images/Sucursal/Marcas/Ford/CMAX/cmax2.png","Images/Sucursal/Marcas/Ford/CMAX/cmax3.png",1,2,7,2),
("ABT-212","MUSTANG","Naranja",2018,122020,235236.50,"También disponible en carrocería descapotable, el Ford Mustang se actualiza en 2018 manteniendo sus medidas exteriores. Por su mecánica de altas prestaciones y altura de 1381 mm, clasificamos el Ford Mustang en la categoría de coches deportivos.","Espacio interior de 4 plazas.","Images/Sucursal/Marcas/Ford/Mustang/mustang1.png","Images/Sucursal/Marcas/Ford/Mustang/mustang2.png","Images/Sucursal/Marcas/Ford/Mustang/mustang3.png",1,2,9,2),
("ABU-232","MONDEO","Azul Marino",2015,123320,275236.50,"Con nuevo frontal, diseño innovador y ingeniería de precisión, el Ford Mondeo 2015 mide 4,87 metros de longitud. Por su tamaño exterior y longitud de 4871 mm, clasificamos el Ford Mondeo en la categoría de berlinas grandes.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Ford/Mondeo/mondeo1.png","Images/Sucursal/Marcas/Ford/Mondeo/mondeo2.png","Images/Sucursal/Marcas/Ford/Mondeo/mondeo3.png",1,2,3,2),
("ABV-252","KA","Amarillo",2016,104020,315436.50,"El nuevo Ford Ka+ 2016 es 31 centímetros más largo que el Ka que sustituye (se acerca a la longitud del Fiesta) con cabina más amplia para 5 plazas y 5 puertas. Por su tamaño exterior y longitud de 3929 mm, clasificamos el Ford Ka+ en la categoría de coches utilitarios.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Ford/KA/ka1.png","Images/Sucursal/Marcas/Ford/KA/ka2.png","Images/Sucursal/Marcas/Ford/KA/ka3.png",1,2,3,2);

-- Volkswagen
insert into Automovil values("ABW-256","Polo","Gris",2017,171020,175236.50,"La sexta generación del Volkswagen Polo es 8 centímetros más larga, 7 centímetros más ancha y tiene un maletero de mayor capacidad. Por su tamaño exterior y longitud de 4053 mm, clasificamos el Volkswagen Polo en la categoría de coches utilitarios.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Volkswagen/Polo/polo1.png","Images/Sucursal/Marcas/Volkswagen/Polo/polo2.png","Images/Sucursal/Marcas/Volkswagen/Polo/polo3.png",1,1,3,2),
("ABX-287","Beetle","Amarillo",2016,147620,155636.50,"Volkswagen renueva el Beetle en 2016 con similares medidas exteriores y un nuevo frontal. Por su tamaño exterior y longitud de 4288 mm, clasificamos el Volkswagen Beetle en la categoría de coches compactos.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Volkswagen/Beeatle/beetle1.png","Images/Sucursal/Marcas/Volkswagen/Beeatle/beetle2.png","Images/Sucursal/Marcas/Volkswagen/Beeatle/beetle3.png",1,1,7,2),
("ABY-212","Scirocco","Azul",2018,122020,235236.50,"La silueta dinámica con ambiciones deportivas del Volkswagen Scirocco 2014 es 1 cm más bajo y 1 cm más ancho. Por su mecánica de altas prestaciones y altura de 1398 mm, clasificamos el Volkswagen Scirocco en la categoría de coches deportivos.","Espacio interior de 4 plazas.","Images/Sucursal/Marcas/Volkswagen/Sciroco/scirocco1.png","Images/Sucursal/Marcas/Volkswagen/Sciroco/scirocco2.png","Images/Sucursal/Marcas/Volkswagen/Sciroco/scirocco3.png",1,1,9,2),
("ABZ-232","Golf","Amarillo",2015,123320,275236.50,"Con tecnología de última generación, el Volkswagen Golf se renueva en 2017 manteniendo sus medidas exteriores. Por su tamaño exterior y longitud de 4258 mm, clasificamos el Volkswagen Golf en la categoría de coches compactos. El modelo híbrido enchufable recibe el nombre de Golf GTE. El modelo eléctrico recibe el nombre de e-Golf.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Volkswagen/Golf/golf1.png","Images/Sucursal/Marcas/Volkswagen/Golf/golf2.png","Images/Sucursal/Marcas/Volkswagen/Golf/golf3.png",1,1,3,2),
("BCA-212","Passat","Azul Petroleo",2016,122020,235236.50,"De aspecto impresionante y silueta larga con líneas limpias y elegantes, el Volkswagen Passat 2015 tiene una longitud de 4,77 metros. Por su tamaño exterior y longitud de 4767 mm, clasificamos el Volkswagen Passat en la categoría de berlinas grandes. El modelo híbrido enchufable recibe el nombre de Passat GTE.","Espacio interior de 4 plazas.","Images/Sucursal/Marcas/Volkswagen/Passat/passat1.png","Images/Sucursal/Marcas/Volkswagen/Passat/passat2.png","Images/Sucursal/Marcas/Volkswagen/Passat/passat3.png",1,1,9,2),
("BCB-232","Jetta","Gris",2015,123320,275236.50,"El Volkswagen Jetta 2015 es una berlina de proporciones equilibradas con una imagen elegante y deportiva. Por su tamaño exterior y longitud de 4659 mm, clasificamos el Volkswagen Jetta en la categoría de berlinas medianas.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Volkswagen/Jetta/jetta1.png","Images/Sucursal/Marcas/Volkswagen/Jetta/jetta2.png","Images/Sucursal/Marcas/Volkswagen/Jetta/jetta3.png",1,1,3,2),
("BCC-252","Touran","Azul Cielo",2016,104020,315436.50,"El Volkswagen Touran 2016 combina las dimensiones compactas que requiere la conducción urbana con un habitáculo confortable y modulable para hasta 7 plazas. Por su flexibilidad interior, optimización del espacio y altura de 1659 mm, clasificamos el Volkswagen Touran en la categoría de monovolúmenes.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Volkswagen/Touran/touran1.png","Images/Sucursal/Marcas/Volkswagen/Touran/touran2.png","Images/Sucursal/Marcas/Volkswagen/Touran/touran3.png",1,1,3,2);

-- TOYOTA
insert into Automovil values("BCD-232","Prius","Rojo",2016,125350,285236.50,"Con un estilo deportivo y moderno, el Toyota Prius 2016 (híbrido ya en 1997) aumenta su longitud 6 centímetros y dispone de una nueva batería para su motor eléctrico que permite aumentar el tamaño de su maletero. Por su tamaño exterior y longitud de 4540 mm, clasificamos el Toyota Prius en la categoría de berlinas medianas. Compara el Toyota Prius con otros híbridos de tamaño similar. El modelo híbrido enchufable recibe el nombre de Prius Plug-In.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Toyota/Prius/prius1.png","Images/Sucursal/Marcas/Toyota/Prius/prius2.png","Images/Sucursal/Marcas/Toyota/Prius/prius3.png",1,5,3,2),
("BCE-212","C-HR","Negro",2018,122025,252436.50,"De tecnología híbrida y diseño anguloso, el nuevo Toyota C-HR es un crossover de menor tamaño que el RAV4 con una longitud de 4,36 metros. Por su tamaño, características, altura libre al suelo de 15 cm y longitud de 4360 mm, clasificamos el Toyota C-HR en la categoría de SUV compactos. Compara el Toyota C-HR con otros híbridos de tamaño similar.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Toyota/CHR/chr1.png","Images/Sucursal/Marcas/Toyota/CHR/chr2.png","Images/Sucursal/Marcas/Toyota/CHR/chr3.png",1,5,9,2),
("BCF-232","Land","Verde Militar",2018,153320,246236.50,"Disponible en 3 y 5 puertas con distinta longitud, el Toyota Land Cruiser 2018 combina calidad y fiabilidad con un elevado rendimiento todoterreno y confort en carretera. Por su tamaño, características, altura libre al suelo de 21 cm y longitud de 4840 mm, clasificamos el Toyota Land Cruiser 5p en la categoría de SUV grandes y todoterrenos.","Espacio interior de 7 plazas.","Images/Sucursal/Marcas/Toyota/Land/land1.png","Images/Sucursal/Marcas/Toyota/Land/land2.png","Images/Sucursal/Marcas/Toyota/Land/land3.png"	,1,5,3,2),
("BCG-232","Hilux","Rojo",2016,123520,235236.50,"Disponible en tres carrocerías con la misma longitud total, el Toyota Hilux doble cabina 2016 ofrece 5 cómodas plazas con una tonelada de carga neta en plataforma y una distancia libre al suelo de hasta 29,3 cm. Por su zona de carga posterior, prestaciones, altura libre al suelo de 21 cm y longitud de 5330 mm, clasificamos el Toyota Hilux en la categoría de vehículos pick-up.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Toyota/Hilux/hilux1.png","Images/Sucursal/Marcas/Toyota/Hilux/hilux2.png","Images/Sucursal/Marcas/Toyota/Hilux/hilux3.png",1,5,3,2),
("BCH-252","Rav-4","Blanco",2016,104025,365436.50,"Con una imagen más moderna y dinámica, el Toyota RAV4 2016 aumenta su longitud 4 centímetros hasta los 4,6 metros para este SUV con más de 20 años de historia. Por su tamaño, características, altura libre al suelo de 18 cm y longitud de 4605 mm, clasificamos el Toyota RAV4 en la categoría de SUV medianos. El modelo híbrido recibe el nombre de RAV4 hybrid.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Toyota/RAV4/rav41.png","Images/Sucursal/Marcas/Toyota/RAV4/rav42.png","Images/Sucursal/Marcas/Toyota/RAV4/rav43.png",1,5,3,2);

-- SEAT
insert into Automovil values("BCI-y32","Leon","Azul",2017,123320,275236.50,"Con diseño compacto y aerodinámico, el 3 puertas SEAT León SC 2017 mantiene las medidas exteriores.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Seat/Leon/leon1.png","Images/Sucursal/Marcas/Seat/Leon/leon2.png","Images/Sucursal/Marcas/Seat/Leon/leon3.png",1,9,3,2),
("BCJ-2y2","Toledo","Cafe",2012,122020,235236.50,"Vuelve el Seat Toledo en 2012 en bella sinergia con el actual ADN de diseño Seat con una longitud de 4,48 metros. Por su tamaño exterior y longitud de 4482 mm, clasificamos el Seat Toledo en la categoría de berlinas medianas.","Espacio interior de 4 plazas.","Images/Sucursal/Marcas/Seat/Toledo/toledo1.png","Images/Sucursal/Marcas/Seat/Toledo/toledo2.png","Images/Sucursal/Marcas/Seat/Toledo/toledo3.png",1,9,9,2),
("BCK-2y2","Ateca","Blanco",2016,104020,315436.50,"El SEAT Ateca 2016 se sitúa como un competidor en el segmento de los SUV para ofrecer a los conductores lo que necesitan tanto en ciudad como fuera de ella. Por su tamaño, características, altura libre al suelo de 18 cm y longitud de 4363 mm, clasificamos el Seat Ateca en la categoría de SUV compactos.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Seat/Ateca/ateca1.png","Images/Sucursal/Marcas/Seat/Ateca/ateca2.png","Images/Sucursal/Marcas/Seat/Ateca/ateca3.png",1,9,3,2);

-- Renault
insert into Automovil values("BCL-232","Clio","Rojo",2016,123320,275236.50,"Con 20 centímetros adicionales respecto al Clio y mayor capacidad de maletero, Renault actualiza en 2016 el Clio Sport Tourer manteniendo las medidas exteriores. Por su versatilidad, mayor espacio trasero y longitud de 4267 mm, clasificamos el Renault Clio Sport Tourer en la categoría de coches familiares.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Renault/Clio/clio1.png","Images/Sucursal/Marcas/Renault/Clio/clio2.png","Images/Sucursal/Marcas/Renault/Clio/clio3.png",1,6,3,2),
("BCM-252","koleos","Blanco",2017,104020,315436.50,"De mayor tamaño que el Kadjar, el Renault Koleos 2017 es un SUV de anchas espaldas, flancos atléticos y con un amplio interior. Por su tamaño, características, altura libre al suelo de 21 cm y longitud de 4673 mm, clasificamos el Renault Koleos en la categoría de SUV medianos.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Renault/Koleos/koleos1.png","Images/Sucursal/Marcas/Renault/Koleos/koleos2.png","Images/Sucursal/Marcas/Renault/Koleos/koleos3.png",1,6,3,2);

-- Volvo
insert into Automovil values("BCN-2c2","V40","Azul Marino",2016,123020,295236.50,"Con ligeros retoques, Volvo renueva en 2016 el compacto de la gama V40 manteniendo las medidas exteriores. Por su tamaño exterior y longitud de 4369 mm, clasificamos el Volvo V40 en la categoría de coches compactos.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Volvo/v40/v401.png","Images/Sucursal/Marcas/Volvo/v40/v402.png","Images/Sucursal/Marcas/Volvo/v40/v403.png",1,3,3,2),
("BCO-21c","V60","Blanco",2018,122000,235237.50,"El familiar Volvo V60 2018 gana en amplitud y maletero con 13 centímetros de mayor longitud aunque con 6 centímetros de menor altura. Por su versatilidad, mayor espacio trasero y longitud de 4761 mm, clasificamos el Volvo V60 en la categoría de coches familiares. El modelo híbrido enchufable recibe el nombre de V60 Twin Engine.","Espacio interior de 4 plazas.","Images/Sucursal/Marcas/Volvo/v60/v601.png","Images/Sucursal/Marcas/Volvo/v60/v602.png","Images/Sucursal/Marcas/Volvo/v60/v603.png",1,3,9,2),
("BCP-25c","XC90","Gris",2016,100020,315436.50,"El lujoso SUV sueco Volvo XC90 2015 dispone de una espaciosa y elegante cabina para hasta 7 plazas. Por su tamaño, características, altura libre al suelo de 23 cm y longitud de 4950 mm, clasificamos el Volvo XC90 en la categoría de SUV grandes y todoterrenos. El modelo híbrido enchufable recibe el nombre de XC90 Twin Engine.","Espacio interior de 7 plazas.","Images/Sucursal/Marcas/Volvo/xc90/xc901.png","Images/Sucursal/Marcas/Volvo/xc90/xc902.png","Images/Sucursal/Marcas/Volvo/xc90/xc903.png",1,3,3,2);



-- Sucursal Centro 

-- Autos KIA
insert into Automovil values("zBC-123","Rio","Rojo",2017,120000,125236.50,"Espacioso, práctico y polivalente, el Kia Rio 2017 ofrece una capacidad de maletero de 325 litros respecto a los 288 litros del modelo de 2015. Por su tamaño exterior y longitud de 4065 mm, clasificamos el Kia Rio en la categoría de coches utilitarios.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/KIA/Rio/rio1.png","Images/Sucursal/Marcas/KIA/Rio/rio2.png","Images/Sucursal/Marcas/KIA/Rio/rio3.png",2,8,1,2),
("zBF-234","Niro","Azul Petroleo",2017,120000,125236.50,"El nuevo Kia Niro 2017 es un crossover híbrido de exterior compacto y interior espacioso de 4,36 metros de longitud. Por su tamaño, características, altura libre al suelo de 16 cm y longitud de 4355 mm, clasificamos el Kia Niro en la categoría de SUV compactos. Compara el Kia Niro con otros híbridos de tamaño similar. El modelo híbrido enchufable recibe el nombre de Niro PHEV.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/KIA/Niro/niro1.png","Images/Sucursal/Marcas/KIA/Niro/niro2.png","Images/Sucursal/Marcas/KIA/Niro/niro3.png",2,8,1,2);

-- Nissan
insert into Automovil values("zBG-256","Micra","Naranja",2017,120020,135236.50,"La quinta generación del Nissan Micra tiene un diseño expresivo y dinámicas proporciones con una longitud 17 centímetros mayor. Por su tamaño exterior y longitud de 3995 mm, clasificamos el Nissan Micra en la categoría de coches utilitarios.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Nissan/Micra/micra1.png","Images/Sucursal/Marcas/Nissan/Micra/micra2.png","Images/Sucursal/Marcas/Nissan/Micra/micra3.png",2,4,2,2),
("zBJ-222","Qashqai","Azul Claro",2017,120020,215236.50,"El Nissan Qashqai se renueva en 2017 con un diseño exterior más contemporáneo, mayores niveles de calidad interior y más tecnología. Por su tamaño, características, altura libre al suelo de 18 cm y longitud de 4394 mm, clasificamos el Nissan Qashqai en la categoría de SUV compactos.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Nissan/Qashqai/qashqai1.png","Images/Sucursal/Marcas/Nissan/Qashqai/qashqai2.png","Images/Sucursal/Marcas/Nissan/Qashqai/qashqai3.png",2,4,8,2);

-- HYUNDAI
insert into Automovil values("zBK-256","I30-Fastback","Azul Marino",2018,121020,175236.50,"El nuevo Hyundai i30 Fastback 2018 es la última incorporación a la gama i30 con un diseño elegante de coupé 5 puertas y una experiencia de conducción más dinámica. Por su tamaño exterior y longitud de 4455 mm, clasificamos el Hyundai i30 Fastback en la categoría de berlinas medianas.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Hyundai/i30fastback/i30fastback1.png","Images/Sucursal/Marcas/Hyundai/i30fastback/i30fastback2.png","Images/Sucursal/Marcas/Hyundai/i30fastback/i30fastback3.png",2,7,3,2),
("zBN-222","Kona","Verde Pistache",2018,120320,275236.50,"Hyundai entra en el segmento B-SUV con el nuevo Hyundai Kona 2018 de diseño audaz y vanguardista para los conductores urbanos modernos. Por su tamaño, características, altura libre al suelo de 17 cm y longitud de 4165 mm, clasificamos el Hyundai Kona en la categoría de crossover pequeños. ","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Hyundai/Kona/kona1.png","Images/Sucursal/Marcas/Hyundai/Kona/kona2.png","Images/Sucursal/Marcas/Hyundai/Kona/kona3.png",2,7,3,2),
("zBO-222","I40","Azul Claro",2015,100020,315236.50,"Renovado y totalmente estilizado, el Hyundai i40 2015 tiene una longitud de 4,75 metros. Por su tamaño exterior y longitud de 4745 mm, clasificamos el Hyundai i40 en la categoría de berlinas grandes.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Hyundai/i40/i401.png","Images/Sucursal/Marcas/Hyundai/i40/i402.png","Images/Sucursal/Marcas/Hyundai/i40/i403.png",2,7,1,2);

-- Ford
insert into Automovil values("zBQ-256","Fiesta","Rojo",2017,171020,175236.50,"Con un diseño aerodinámico 7 centímetros más largo, el Ford Fiesta 2017 se moderniza con más tecnología y ofrece más espacio para las piernas, tanto delante como detrás. Por su tamaño exterior y longitud de 4040 mm, clasificamos el Ford Fiesta en la categoría de coches utilitarios.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Ford/Fiesta/fiesta1.png","Images/Sucursal/Marcas/Ford/Fiesta/fiesta2.png","Images/Sucursal/Marcas/Ford/Fiesta/fiesta3.png",2,2,3,2),
("zBU-232","MONDEO","Azul Marino",2015,123320,275236.50,"Con nuevo frontal, diseño innovador y ingeniería de precisión, el Ford Mondeo 2015 mide 4,87 metros de longitud. Por su tamaño exterior y longitud de 4871 mm, clasificamos el Ford Mondeo en la categoría de berlinas grandes.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Ford/Mondeo/mondeo1.png","Images/Sucursal/Marcas/Ford/Mondeo/mondeo2.png","Images/Sucursal/Marcas/Ford/Mondeo/mondeo3.png",2,2,3,2),
("zBV-252","KA","Amarillo",2016,104020,315436.50,"El nuevo Ford Ka+ 2016 es 31 centímetros más largo que el Ka que sustituye (se acerca a la longitud del Fiesta) con cabina más amplia para 5 plazas y 5 puertas. Por su tamaño exterior y longitud de 3929 mm, clasificamos el Ford Ka+ en la categoría de coches utilitarios.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Ford/KA/ka1.png","Images/Sucursal/Marcas/Ford/KA/ka2.png","Images/Sucursal/Marcas/Ford/KA/ka3.png",2,2,3,2);

-- Volkswagen
insert into Automovil values("zBW-256","Polo","Gris",2017,171020,175236.50,"La sexta generación del Volkswagen Polo es 8 centímetros más larga, 7 centímetros más ancha y tiene un maletero de mayor capacidad. Por su tamaño exterior y longitud de 4053 mm, clasificamos el Volkswagen Polo en la categoría de coches utilitarios.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Volkswagen/Polo/polo1.png","Images/Sucursal/Marcas/Volkswagen/Polo/polo2.png","Images/Sucursal/Marcas/Volkswagen/Polo/polo3.png",2,1,3,2),
("zBZ-232","Golf","Amarillo",2015,123320,275236.50,"Con tecnología de última generación, el Volkswagen Golf se renueva en 2017 manteniendo sus medidas exteriores. Por su tamaño exterior y longitud de 4258 mm, clasificamos el Volkswagen Golf en la categoría de coches compactos. El modelo híbrido enchufable recibe el nombre de Golf GTE. El modelo eléctrico recibe el nombre de e-Golf.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Volkswagen/Golf/golf1.png","Images/Sucursal/Marcas/Volkswagen/Golf/golf2.png","Images/Sucursal/Marcas/Volkswagen/Golf/golf3.png",2,1,3,2),
("zCA-212","Passat","Azul Petroleo",2016,122020,235236.50,"De aspecto impresionante y silueta larga con líneas limpias y elegantes, el Volkswagen Passat 2015 tiene una longitud de 4,77 metros. Por su tamaño exterior y longitud de 4767 mm, clasificamos el Volkswagen Passat en la categoría de berlinas grandes. El modelo híbrido enchufable recibe el nombre de Passat GTE.","Espacio interior de 4 plazas.","Images/Sucursal/Marcas/Volkswagen/Passat/passat1.png","Images/Sucursal/Marcas/Volkswagen/Passat/passat2.png","Images/Sucursal/Marcas/Volkswagen/Passat/passat3.png",2,1,9,2),
("zCC-252","Touran","Azul Cielo",2016,104020,315436.50,"El Volkswagen Touran 2016 combina las dimensiones compactas que requiere la conducción urbana con un habitáculo confortable y modulable para hasta 7 plazas. Por su flexibilidad interior, optimización del espacio y altura de 1659 mm, clasificamos el Volkswagen Touran en la categoría de monovolúmenes.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Volkswagen/Touran/touran1.png","Images/Sucursal/Marcas/Volkswagen/Touran/touran2.png","Images/Sucursal/Marcas/Volkswagen/Touran/touran3.png",2,1,3,2);

-- TOYOTA
insert into Automovil values("zCD-232","Prius","Rojo",2016,125350,285236.50,"Con un estilo deportivo y moderno, el Toyota Prius 2016 (híbrido ya en 1997) aumenta su longitud 6 centímetros y dispone de una nueva batería para su motor eléctrico que permite aumentar el tamaño de su maletero. Por su tamaño exterior y longitud de 4540 mm, clasificamos el Toyota Prius en la categoría de berlinas medianas. Compara el Toyota Prius con otros híbridos de tamaño similar. El modelo híbrido enchufable recibe el nombre de Prius Plug-In.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Toyota/Prius/prius1.png","Images/Sucursal/Marcas/Toyota/Prius/prius2.png","Images/Sucursal/Marcas/Toyota/Prius/prius3.png",2,5,3,2),
("zCE-212","C-HR","Negro",2018,122025,252436.50,"De tecnología híbrida y diseño anguloso, el nuevo Toyota C-HR es un crossover de menor tamaño que el RAV4 con una longitud de 4,36 metros. Por su tamaño, características, altura libre al suelo de 15 cm y longitud de 4360 mm, clasificamos el Toyota C-HR en la categoría de SUV compactos. Compara el Toyota C-HR con otros híbridos de tamaño similar.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Toyota/CHR/chr1.png","Images/Sucursal/Marcas/Toyota/CHR/chr2.png","Images/Sucursal/Marcas/Toyota/CHR/chr3.png",2,5,9,2),
("zCH-252","Rav-4","Blanco",2016,104025,365436.50,"Con una imagen más moderna y dinámica, el Toyota RAV4 2016 aumenta su longitud 4 centímetros hasta los 4,6 metros para este SUV con más de 20 años de historia. Por su tamaño, características, altura libre al suelo de 18 cm y longitud de 4605 mm, clasificamos el Toyota RAV4 en la categoría de SUV medianos. El modelo híbrido recibe el nombre de RAV4 hybrid.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Toyota/RAV4/rav41.png","Images/Sucursal/Marcas/Toyota/RAV4/rav42.png","Images/Sucursal/Marcas/Toyota/RAV4/rav43.png",2,5,3,2);

-- SEAT
insert into Automovil values("zCI-y32","Leon","Azul",2017,123320,275236.50,"Con diseño compacto y aerodinámico, el 3 puertas SEAT León SC 2017 mantiene las medidas exteriores.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Seat/Leon/leon1.png","Images/Sucursal/Marcas/Seat/Leon/leon2.png","Images/Sucursal/Marcas/Seat/Leon/leon3.png",2,9,3,2),
("zCK-2y2","Ateca","Blanco",2016,104020,315436.50,"El SEAT Ateca 2016 se sitúa como un competidor en el segmento de los SUV para ofrecer a los conductores lo que necesitan tanto en ciudad como fuera de ella. Por su tamaño, características, altura libre al suelo de 18 cm y longitud de 4363 mm, clasificamos el Seat Ateca en la categoría de SUV compactos.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Seat/Ateca/ateca1.png","Images/Sucursal/Marcas/Seat/Ateca/ateca2.png","Images/Sucursal/Marcas/Seat/Ateca/ateca3.png",2,9,3,2);

-- Renault
insert into Automovil values("zCL-232","Clio","Rojo",2016,123320,275236.50,"Con 20 centímetros adicionales respecto al Clio y mayor capacidad de maletero, Renault actualiza en 2016 el Clio Sport Tourer manteniendo las medidas exteriores. Por su versatilidad, mayor espacio trasero y longitud de 4267 mm, clasificamos el Renault Clio Sport Tourer en la categoría de coches familiares.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Renault/Clio/clio1.png","Images/Sucursal/Marcas/Renault/Clio/clio2.png","Images/Sucursal/Marcas/Renault/Clio/clio3.png",2,6,3,2),
("zCM-252","koleos","Blanco",2017,104020,315436.50,"De mayor tamaño que el Kadjar, el Renault Koleos 2017 es un SUV de anchas espaldas, flancos atléticos y con un amplio interior. Por su tamaño, características, altura libre al suelo de 21 cm y longitud de 4673 mm, clasificamos el Renault Koleos en la categoría de SUV medianos.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Renault/Koleos/koleos1.png","Images/Sucursal/Marcas/Renault/Koleos/koleos2.png","Images/Sucursal/Marcas/Renault/Koleos/koleos3.png",2,6,3,2);

-- Volvo
insert into Automovil values("zCN-2c2","V40","Azul Marino",2016,123020,295236.50,"Con ligeros retoques, Volvo renueva en 2016 el compacto de la gama V40 manteniendo las medidas exteriores. Por su tamaño exterior y longitud de 4369 mm, clasificamos el Volvo V40 en la categoría de coches compactos.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Volvo/v40/v401.png","Images/Sucursal/Marcas/Volvo/v40/v402.png","Images/Sucursal/Marcas/Volvo/v40/v403.png",2,3,3,2),
("zCP-25c","XC90","Gris",2016,100020,315436.50,"El lujoso SUV sueco Volvo XC90 2015 dispone de una espaciosa y elegante cabina para hasta 7 plazas. Por su tamaño, características, altura libre al suelo de 23 cm y longitud de 4950 mm, clasificamos el Volvo XC90 en la categoría de SUV grandes y todoterrenos. El modelo híbrido enchufable recibe el nombre de XC90 Twin Engine.","Espacio interior de 7 plazas.","Images/Sucursal/Marcas/Volvo/xc90/xc901.png","Images/Sucursal/Marcas/Volvo/xc90/xc902.png","Images/Sucursal/Marcas/Volvo/xc90/xc903.png",2,3,3,2);


-- Sucursal SantaMonica

-- Autos KIA
insert into Automovil values("xBC-123","Rio","Rojo",2017,120000,125236.50,"Espacioso, práctico y polivalente, el Kia Rio 2017 ofrece una capacidad de maletero de 325 litros respecto a los 288 litros del modelo de 2015. Por su tamaño exterior y longitud de 4065 mm, clasificamos el Kia Rio en la categoría de coches utilitarios.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/KIA/Rio/rio1.png","Images/Sucursal/Marcas/KIA/Rio/rio2.png","Images/Sucursal/Marcas/KIA/Rio/rio3.png",3,8,1,2),
("xBF-234","Niro","Azul Petroleo",2017,120000,125236.50,"El nuevo Kia Niro 2017 es un crossover híbrido de exterior compacto y interior espacioso de 4,36 metros de longitud. Por su tamaño, características, altura libre al suelo de 16 cm y longitud de 4355 mm, clasificamos el Kia Niro en la categoría de SUV compactos. Compara el Kia Niro con otros híbridos de tamaño similar. El modelo híbrido enchufable recibe el nombre de Niro PHEV.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/KIA/Niro/niro1.png","Images/Sucursal/Marcas/KIA/Niro/niro2.png","Images/Sucursal/Marcas/KIA/Niro/niro3.png",3,8,1,2);

-- Nissan
insert into Automovil values("xBG-256","Micra","Naranja",2017,120020,135236.50,"La quinta generación del Nissan Micra tiene un diseño expresivo y dinámicas proporciones con una longitud 17 centímetros mayor. Por su tamaño exterior y longitud de 3995 mm, clasificamos el Nissan Micra en la categoría de coches utilitarios.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Nissan/Micra/micra1.png","Images/Sucursal/Marcas/Nissan/Micra/micra2.png","Images/Sucursal/Marcas/Nissan/Micra/micra3.png",3,4,2,2),
("xBJ-222","Qashqai","Azul Claro",2017,120020,215236.50,"El Nissan Qashqai se renueva en 2017 con un diseño exterior más contemporáneo, mayores niveles de calidad interior y más tecnología. Por su tamaño, características, altura libre al suelo de 18 cm y longitud de 4394 mm, clasificamos el Nissan Qashqai en la categoría de SUV compactos.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Nissan/Qashqai/qashqai1.png","Images/Sucursal/Marcas/Nissan/Qashqai/qashqai2.png","Images/Sucursal/Marcas/Nissan/Qashqai/qashqai3.png",3,4,8,2);

-- HYUNDAI
insert into Automovil values("xBN-222","Kona","Verde Pistache",2018,120320,275236.50,"Hyundai entra en el segmento B-SUV con el nuevo Hyundai Kona 2018 de diseño audaz y vanguardista para los conductores urbanos modernos. Por su tamaño, características, altura libre al suelo de 17 cm y longitud de 4165 mm, clasificamos el Hyundai Kona en la categoría de crossover pequeños. ","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Hyundai/Kona/kona1.png","Images/Sucursal/Marcas/Hyundai/Kona/kona2.png","Images/Sucursal/Marcas/Hyundai/Kona/kona3.png",3,7,3,2),
("xBO-222","I40","Azul Claro",2015,100020,315236.50,"Renovado y totalmente estilizado, el Hyundai i40 2015 tiene una longitud de 4,75 metros. Por su tamaño exterior y longitud de 4745 mm, clasificamos el Hyundai i40 en la categoría de berlinas grandes.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Hyundai/i40/i401.png","Images/Sucursal/Marcas/Hyundai/i40/i402.png","Images/Sucursal/Marcas/Hyundai/i40/i403.png",3,7,1,2);

-- Ford
insert into Automovil values("xBU-232","MONDEO","Azul Marino",2015,123320,275236.50,"Con nuevo frontal, diseño innovador y ingeniería de precisión, el Ford Mondeo 2015 mide 4,87 metros de longitud. Por su tamaño exterior y longitud de 4871 mm, clasificamos el Ford Mondeo en la categoría de berlinas grandes.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Ford/Mondeo/mondeo1.png","Images/Sucursal/Marcas/Ford/Mondeo/mondeo2.png","Images/Sucursal/Marcas/Ford/Mondeo/mondeo3.png",3,2,3,2),
("xBV-252","KA","Amarillo",2016,104020,315436.50,"El nuevo Ford Ka+ 2016 es 31 centímetros más largo que el Ka que sustituye (se acerca a la longitud del Fiesta) con cabina más amplia para 5 plazas y 5 puertas. Por su tamaño exterior y longitud de 3929 mm, clasificamos el Ford Ka+ en la categoría de coches utilitarios.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Ford/KA/ka1.png","Images/Sucursal/Marcas/Ford/KA/ka2.png","Images/Sucursal/Marcas/Ford/KA/ka3.png",3,2,3,2);

-- Volkswagen
insert into Automovil values("xBZ-232","Golf","Amarillo",2015,123320,275236.50,"Con tecnología de última generación, el Volkswagen Golf se renueva en 2017 manteniendo sus medidas exteriores. Por su tamaño exterior y longitud de 4258 mm, clasificamos el Volkswagen Golf en la categoría de coches compactos. El modelo híbrido enchufable recibe el nombre de Golf GTE. El modelo eléctrico recibe el nombre de e-Golf.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Volkswagen/Golf/golf1.png","Images/Sucursal/Marcas/Volkswagen/Golf/golf2.png","Images/Sucursal/Marcas/Volkswagen/Golf/golf3.png",3,1,3,2),
("xCA-212","Passat","Azul Petroleo",2016,122020,235236.50,"De aspecto impresionante y silueta larga con líneas limpias y elegantes, el Volkswagen Passat 2015 tiene una longitud de 4,77 metros. Por su tamaño exterior y longitud de 4767 mm, clasificamos el Volkswagen Passat en la categoría de berlinas grandes. El modelo híbrido enchufable recibe el nombre de Passat GTE.","Espacio interior de 4 plazas.","Images/Sucursal/Marcas/Volkswagen/Passat/passat1.png","Images/Sucursal/Marcas/Volkswagen/Passat/passat2.png","Images/Sucursal/Marcas/Volkswagen/Passat/passat3.png",3,1,9,2),
("xCC-252","Touran","Azul Cielo",2016,104020,315436.50,"El Volkswagen Touran 2016 combina las dimensiones compactas que requiere la conducción urbana con un habitáculo confortable y modulable para hasta 7 plazas. Por su flexibilidad interior, optimización del espacio y altura de 1659 mm, clasificamos el Volkswagen Touran en la categoría de monovolúmenes.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Volkswagen/Touran/touran1.png","Images/Sucursal/Marcas/Volkswagen/Touran/touran2.png","Images/Sucursal/Marcas/Volkswagen/Touran/touran3.png",3,1,3,2);

-- TOYOTA
insert into Automovil values("xCE-212","C-HR","Negro",2018,122025,252436.50,"De tecnología híbrida y diseño anguloso, el nuevo Toyota C-HR es un crossover de menor tamaño que el RAV4 con una longitud de 4,36 metros. Por su tamaño, características, altura libre al suelo de 15 cm y longitud de 4360 mm, clasificamos el Toyota C-HR en la categoría de SUV compactos. Compara el Toyota C-HR con otros híbridos de tamaño similar.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Toyota/CHR/chr1.png","Images/Sucursal/Marcas/Toyota/CHR/chr2.png","Images/Sucursal/Marcas/Toyota/CHR/chr3.png",3,5,9,2),
("xCH-252","Rav-4","Blanco",2016,104025,365436.50,"Con una imagen más moderna y dinámica, el Toyota RAV4 2016 aumenta su longitud 4 centímetros hasta los 4,6 metros para este SUV con más de 20 años de historia. Por su tamaño, características, altura libre al suelo de 18 cm y longitud de 4605 mm, clasificamos el Toyota RAV4 en la categoría de SUV medianos. El modelo híbrido recibe el nombre de RAV4 hybrid.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Toyota/RAV4/rav41.png","Images/Sucursal/Marcas/Toyota/RAV4/rav42.png","Images/Sucursal/Marcas/Toyota/RAV4/rav43.png",3,5,3,2);

-- SEAT
insert into Automovil values("xCI-y32","Leon","Azul",2017,123320,275236.50,"Con diseño compacto y aerodinámico, el 3 puertas SEAT León SC 2017 mantiene las medidas exteriores.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Seat/Leon/leon1.png","Images/Sucursal/Marcas/Seat/Leon/leon2.png","Images/Sucursal/Marcas/Seat/Leon/leon3.png",3,9,3,2),
("xCK-2y2","Ateca","Blanco",2016,104020,315436.50,"El SEAT Ateca 2016 se sitúa como un competidor en el segmento de los SUV para ofrecer a los conductores lo que necesitan tanto en ciudad como fuera de ella. Por su tamaño, características, altura libre al suelo de 18 cm y longitud de 4363 mm, clasificamos el Seat Ateca en la categoría de SUV compactos.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Seat/Ateca/ateca1.png","Images/Sucursal/Marcas/Seat/Ateca/ateca2.png","Images/Sucursal/Marcas/Seat/Ateca/ateca3.png",3,9,3,2);

-- Renault
insert into Automovil values("xCM-252","koleos","Blanco",2017,104020,315436.50,"De mayor tamaño que el Kadjar, el Renault Koleos 2017 es un SUV de anchas espaldas, flancos atléticos y con un amplio interior. Por su tamaño, características, altura libre al suelo de 21 cm y longitud de 4673 mm, clasificamos el Renault Koleos en la categoría de SUV medianos.","Espacio interior de 5 plazas.","Images/Sucursal/Marcas/Renault/Koleos/koleos1.png","Images/Sucursal/Marcas/Renault/Koleos/koleos2.png","Images/Sucursal/Marcas/Renault/Koleos/koleos3.png",3,6,3,2);

-- Volvo
insert into Automovil values("xCP-25c","XC90","Gris",2016,100020,315436.50,"El lujoso SUV sueco Volvo XC90 2015 dispone de una espaciosa y elegante cabina para hasta 7 plazas. Por su tamaño, características, altura libre al suelo de 23 cm y longitud de 4950 mm, clasificamos el Volvo XC90 en la categoría de SUV grandes y todoterrenos. El modelo híbrido enchufable recibe el nombre de XC90 Twin Engine.","Espacio interior de 7 plazas.","Images/Sucursal/Marcas/Volvo/xc90/xc901.png","Images/Sucursal/Marcas/Volvo/xc90/xc902.png","Images/Sucursal/Marcas/Volvo/xc90/xc903.png",3,3,3,2);


