use taller2;
describe compañia;
insert into compañia values(1,'Avianca','Cra. 14 ## 6-02, Armenia,Quindío',7314937,'86054235-9');
insert into compañia values(2,'Kayak','7 Market Street, Stamford, CT 06902, USA.',1978451077,'75059235-8');
insert into compañia values(3,'Despegar','CARRERA 106 15 A 25 15 BG 101, Bogota',6461590,'64052534-5');
insert into compañia values(4,'Satena','Cra. 5 #8-12, Cali, Valle del Cauca',8857709,'9R8646');
insert into compañia values(5,'Jetcost','Blue SAS 14, rue d’Uzès 75002 Paris,Francia',15789456,'64052534-1');
select * from compañia;

describe origen;
insert into origen values (1,'El eden','Armenia','6300');
insert into origen values (2,'Ernesto cortissoz','Barranquilla','08001');
insert into origen values (3,'Alfonso Bonilla Aragón ','Cali','76001');
insert into origen values (4,'Camilo Daza','Cúcuta','54001');
insert into origen values (5,'José María Córdova ','Medellín','05001');
select * from origen;

describe destino;
insert into destino values (1,'El dorado','bogota','11001');
insert into destino values (2,'Palonegro','Bucaramanga','68001');
insert into destino values (3,'Matecaña','Pereira','66001');
insert into destino values (4,'Gustavo Rojas Pinilla ','San Andrés','68669');
insert into destino values (5,'Pérez Quiroz','Arauca','81001');
select * from destino;

describe cliente;
insert into cliente values (1,'Stephen carvajal',20,12345,'124587-4','dante@hotmail.com');
insert into cliente values (2,'Viviana Grimaldo',80,32157897,'924587-8','viviana@hotmail.com');
insert into cliente values (3,'Cristian buritica',50,31857897,'792587-5','cristian@hotmail.com');
insert into cliente values (4,'Dante Hernandez',28,31165797,'4587963-4','danteh@hotmail.com');
insert into cliente values (5,'Toby alejandro',42,31254878,'6548-1','toby@hotmail.com');
 select * from cliente;
 
 describe itinerario;
 insert into itinerario values (1,'3:30',20211220,1,1);
 insert into itinerario values (2,'12:00',20220114,2,2);
 insert into itinerario values (3,'1:20',20220607,3,3);
 insert into itinerario values (4,'12:00',20221120,4,4);
 insert into itinerario values (5,'08:00',20220214,5,5);
 select * from itinerario;
 
 describe vuelo;
 insert into vuelo values (1,420,'Boeing 767','LA336',1,1),(2,500,'Boeing 797','LA338',2,2);
 insert into vuelo values (3,700,'Airbus 330','SE445',3,3),(4,200,'Boeing 747','YY454',4,4),(5,800,'Airbus 321','DA654',5,5);
 select * from vuelo;
 
 describe pasaje;
 insert into pasaje values (1,'A','20L',500000,1,1);
 insert into pasaje values (2,'A','5A',750000,2,2);
 insert into pasaje values (3,'A','40X',400000,3,3);
 insert into pasaje values (4,'A','5A',800000,4,4);
 insert into pasaje values (5,'A','51A',1200000,5,5);
 select * from pasaje;
 
 select 
 cliente.nombre as  Nombre_Pasajero,
 pasaje.asiento as asiento,
 pasaje.clase as Clase,
 vuelo.numeroVuelo,
 Itinerario.fecha,
 Itinerario.Hora,
 origen.Ciudad as Origen,
 origen.codCiudad as codOrigen,
 origen.naeropuerto as aeropuerto,
 Destino.Ciudad as Destino,
 destino.codCiudad as codDestino,
 destino.naeropuerto as aeropuerto
 from pasaje 
 
 inner join 
 cliente on pasaje.cliente_idCliente = idCliente
 inner join
 vuelo on pasaje.vuelo_idVuelo = idVuelo
 inner join
 itinerario on vuelo.itinerario_idItinerario = idItinerario
 inner join
 Origen on itinerario.origen_idOrigen = idOrigen
 inner join
 Destino on itinerario.destino_idDestino = idDestino;
