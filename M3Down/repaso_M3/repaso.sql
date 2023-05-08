create database if not exists repaso;

use repaso;
drop table if exists financiero;

create table if not exists financiero (
impacto_presupuestario_anio varchar(200),
impacto_presupuestario_mes varchar(200),
jurisdiccion_id varchar(200),
jurisdiccion_desc varchar(200),
servicio_id varchar(200),
servicio_desc varchar(200),
programa_id varchar(200),
programa_desc varchar(200),
ejercicio_presupuestario varchar(200),
subprograma_desc varchar(200),
proyecto_id varchar(200),
proyecto_desc varchar(200),
actividad_id varchar(200),
actividad_desc varchar(200),
obra_id varchar(200),
obra_desc varchar(200),
fuente_financiamiento_id_desc varchar(200),
desconocido varchar(200),
clasificador_economico_8_digitos_id varchar(200),
clasificador_economico_8_digitos_desc varchar(200),
inciso_id varchar(200),
inciso_desc varchar(200),
principal_id varchar(200),
principal_desc varchar(200),
parcial_id varchar(200),
parcial_desc varchar(200),
subparcial_id varchar(200),
subparcial_desc varchar(200),
credito_presupuestado varchar(200),
credito_vigente varchar(200), 
credito_devengado varchar(200),
`1` varchar(200),
`2` varchar(200),
`3` varchar(200),
`4` varchar(200),
`5` varchar(200),
`6` varchar(200),
`7` varchar(200),
`8` varchar(200),
`9` varchar(200),
`10` varchar(200),
`11` varchar(200),
`12` varchar(200),
`13` varchar(200),
`14` varchar(200),
`15` varchar(200),
`16` varchar(200),
`17` varchar(200),
`18` varchar(200),
`19` varchar(200),
`20` varchar(200),
`21` varchar(200),
`22` varchar(200),
`23` varchar(200),
`24` varchar(200),
`25` varchar(200),
`26` varchar(200),
`27` varchar(200),
`28` varchar(200),
`29` varchar(200),
`30` varchar(200)
) engine = InnoDB, charset = utf8mb4, collate = utf8mb4_spanish_ci;

create table financiero_auxiliar (
impacto_presupuestario_anio varchar(200),
impacto_presupuestario_mes varchar(200),
jurisdiccion_id varchar(200),
jurisdiccion_desc varchar(200),
servicio_id varchar(200),
servicio_desc varchar(200),
programa_id varchar(200),
programa_desc varchar(200),
ejercicio_presupuestario varchar(200),
subprograma_desc varchar(200),
proyecto_id varchar(200),
proyecto_desc varchar(200),
actividad_id varchar(200),
actividad_desc varchar(200),
obra_id varchar(200),
obra_desc varchar(200),
fuente_financiamiento_id_desc varchar(200),
desconocido varchar(200),
clasificador_economico_8_digitos_id varchar(200),
clasificador_economico_8_digitos_desc varchar(200),
inciso_id varchar(200),
inciso_desc varchar(200),
principal_id varchar(200),
principal_desc varchar(200),
parcial_id varchar(200),
parcial_desc varchar(200),
subparcial_id varchar(200),
subparcial_desc varchar(200),
credito_presupuestado varchar(200),
credito_vigente varchar(200), 
credito_devengado varchar(200)
) engine = InnoDB, charset = utf8mb4, collate = utf8mb4_spanish_ci;


set global local_infile = ON;

load data local infile "/home/harold/Escritorio/repaso_M3/genero-financiero-semestral_2019_1.csv"
into table financiero
CHARACTER SET latin1
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

select `1`, `2`, `3`, `4`, `5`, `6`,  `7`, `8`, `9`, `10`, `11`, `12`,
		`13`, `14`, `15`, `16`, `17`, `18`,  `19`, `20`, `21`, `22`, `23`, `24`,
        `25`, `26`, `27`, `28`, `29`, `30`
        from financiero;


insert into financiero_auxiliar (impacto_presupuestario_mes,
jurisdiccion_id ,
jurisdiccion_desc ,
servicio_id ,
servicio_desc ,
programa_id ,
programa_desc ,
ejercicio_presupuestario, 
subprograma_desc ,
proyecto_id ,
proyecto_desc, 
actividad_id ,
actividad_desc, 
obra_id,
obra_desc ,
fuente_financiamiento_id_desc ,
desconocido ,
clasificador_economico_8_digitos_id ,
clasificador_economico_8_digitos_desc ,
inciso_id ,
inciso_desc ,
principal_id ,
principal_desc,
parcial_id ,
parcial_desc ,
subparcial_id ,
subparcial_desc ,
credito_presupuestado ,
credito_vigente , 
credito_devengado )
select `1`, `2`, `3`, `4`, `5`, `6`,  `7`, `8`, `9`, `10`, `11`, `12`,
		`13`, `14`, `15`, `16`, `17`, `18`,  `19`, `20`, `21`, `22`, `23`, `24`,
        `25`, `26`, `27`, `28`, `29`, `30`
        from financiero;


select * from financiero_auxiliar;

alter table financiero
drop column `1`,
drop column `2`,
drop column `3`,
drop column `4`,
drop column `5`,
drop column `6`,
drop column `7`,
drop column `8`,
drop column `9`,
drop column `10`,
drop column `11`,
drop column `12`,
drop column `13`,
drop column `14`,
drop column `15`,
drop column `16`,
drop column `17`,
drop column `18`,
drop column `19`,
drop column `20`,
drop column `21`,
drop column `22`,
drop column `23`,
drop column `24`,
drop column `25`,
drop column `26`,
drop column `27`,
drop column `28`,
drop column `29`,
drop column `30`;

select * from financiero;

insert into financiero ()
select * from financiero_auxiliar;
drop table if exists financiero_auxiliar;


select count(*) from financiero
where impacto_presupuestario_anio is null;

update financiero
set impacto_presupuestario_anio = "2019"
where impacto_presupuestario_anio is null;

alter table financiero
modify column impacto_presupuestario_anio int;

desc financiero;

select impacto_presupuestario_mes, count(*) from financiero
group by impacto_presupuestario_mes;

select * from financiero
where jurisdiccion_id is null;

select * from financiero
where jurisdiccion_desc is null;




create table jurisdiccion (
	IdJurisdiccion int,
	Jurisdiccion varchar(200)
) engine = InnoDB, charset = utf8mb4, collate = utf8mb4_spanish_ci;

insert into jurisdiccion ()
select  distinct jurisdiccion_id, jurisdiccion_desc from financiero;

alter table financiero
drop column jurisdiccion_desc;

alter table financiero
rename column jurisdiccion_id to IdJurisdiccion;

select * from jurisdiccion;

select * from financiero;

select  distinct servicio_id, servicio_desc from financiero
order by servicio_id;

create table servicio (
	IdServicio int,
	Servicio varchar(200)
) engine = InnoDB, charset = utf8mb4, collate = utf8mb4_spanish_ci;

insert into servicio () 
select  distinct servicio_id, servicio_desc from financiero
order by servicio_id;

alter table financiero
drop column servicio_desc;

alter table financiero
rename column servicio_id to Idservicio;

select * from financiero;

create table calendario_financiero (
	IdCalendario int,
	anio int,
    mes int
) engine = InnoDB, charset = utf8mb4, collate = utf8mb4_spanish_ci;

insert into calendario_financiero ()
select  distinct impacto_presupuestario_anio*100 + impacto_presupuestario_mes,  impacto_presupuestario_anio, impacto_presupuestario_mes from financiero;

select * from calendario_financiero;



alter table financiero
add column IdCalendario int after impacto_presupuestario_mes;


update financiero as fi
join calendario_financiero  as cf
on (fi.impacto_presupuestario_anio = cf.anio and fi.impacto_presupuestario_mes = cf.mes)
set fi.IdCalendario = cf.IdCalendario;

select * from financiero;


alter table financiero
drop column impacto_presupuestario_anio,
drop column impacto_presupuestario_mes;

alter table financiero
drop column subprograma_desc,
drop column proyecto_id,
drop column obra_id,
drop column subparcial_id;

alter table financiero
drop column ejercicio_presupuestario;

select * from;

create table if not exists fuente_financiamiento
(
 IdFuenteFinanciamiento int not null auto_increment,
 FuenteFinanciamento varchar(200),
 primary key (IdFuenteFinanciamiento)
)engine = InnoDB, charset = utf8mb4, collate = utf8mb4_spanish_ci;

select fuente_financiamiento_id_desc  from financiero;

update financiero
set fuente_financiamiento_id_desc = replace(fuente_financiamiento_id_desc, "4", "");

update financiero
set fuente_financiamiento_id_desc = trim(fuente_financiamiento_id_desc);

select distinct fuente_financiamiento_id_desc  from financiero
order by fuente_financiamiento_id_desc;

insert into fuente_financiamiento (FuenteFinanciamento)  
select distinct fuente_financiamiento_id_desc  from financiero
order by fuente_financiamiento_id_desc;

use repaso;
select * from fuente_financiamiento;


update financiero as fi
join fuente_financiamiento as ff
on (fi.fuente_financiamiento_id_desc = ff.FuenteFinanciamento)
set fi.IdFuenteFinanciamiento = ff.IdFuenteFinanciamiento; 


alter table financiero
add column IdFuenteFinanciamiento int after fuente_financiamiento_id_desc;


alter table financiero
drop column fuente_financiamiento_id_desc,
drop column desconocido;

select * from financiero;

alter table financiero
modify column credito_presupuestado int8;

alter table financiero
modify column credito_vigente int8;

select * from financiero;

update financiero
set credito_devengado =  replace(credito_devengado, '"', "");

select * from financiero;

select * from financiero
where credito_presupuestado = "4605716" and credito_vigente = "4605716";



insert into aux_financiero (IdCalendario,
IdJurisdiccion,
servicio_id,
programa_id,
programa_desc,
proyecto_desc, 
actividad_id ,
actividad_desc, 
obra_desc ,
IdFuenteFinanciamiento,
clasificador_economico_8_digitos_id,
clasificador_economico_8_digitos_desc,
inciso_id,
inciso_desc,
principal_id,
principal_desc,
parcial_id,
parcial_desc,
subparcial_desc,
credito_presupuestado,
credito_vigente, 
credito_devengado,
motivo)
select IdCalendario,
IdJurisdiccion,
servicio_id,
programa_id,
programa_desc,
proyecto_desc, 
actividad_id ,
actividad_desc, 
obra_desc ,
IdFuenteFinanciamiento,
clasificador_economico_8_digitos_id,
clasificador_economico_8_digitos_desc,
inciso_id,
inciso_desc,
principal_id,
principal_desc,
parcial_id,
parcial_desc,
subparcial_desc,
credito_presupuestado,
credito_vigente, 
credito_devengado,
"no tiene valor de credito devengado" from financiero
where credito_presupuestado = "4605716" and credito_vigente = "4605716";
-- financiero_aux- reporta elementos tienen datos raros
-- metatabla metadatos quien hizo el reporte
drop table if exists aux_financiero;
create table if not exists aux_financiero (
IdReporte int not null auto_increment,
IdCalendario int,
IdJurisdiccion varchar(200),
servicio_id varchar(200),
programa_id varchar(200),
programa_desc varchar(200),
subprograma_desc varchar(200),
proyecto_desc varchar(200), 
actividad_id varchar(200),
actividad_desc varchar(200), 
obra_desc varchar(200),
IdFuenteFinanciamiento int ,
clasificador_economico_8_digitos_id varchar(200),
clasificador_economico_8_digitos_desc varchar(200),
inciso_id varchar(200),
inciso_desc varchar(200),
principal_id varchar(200),
principal_desc varchar(200),
parcial_id varchar(200),
parcial_desc varchar(200),
subparcial_id varchar(200),
subparcial_desc varchar(200),
credito_presupuestado varchar(200),
credito_vigente varchar(200), 
credito_devengado varchar(200),
motivo varchar(200),
primary key (IdReporte)
) engine = InnoDB, charset = utf8mb4, collate = utf8mb4_spanish_ci;

select * from 


drop table auditoria_aux_financiero;
create table auditoria_aux_financiero (
	IdAuditoria int not null auto_increment,
    IdCalendario int,
    IdJurisdiccion varchar(200),
    IdFuenteFinanciamiento varchar(200),
    usuario varchar(200),
    fecha_reporte datetime,
	primary key (IdAuditoria)
) engine = InnoDB, charset = utf8mb4, collate = utf8mb4_spanish_ci;


delimiter //
create trigger insertar_reporte_metadatos after insert on aux_financiero
for each row
begin
	insert into auditoria_aux_financiero (IdCalendario, IdJurisdiccion, IdFuenteFinanciamiento, usuario, fecha_reporte)
    values (new.IdCalendario, new.IdJurisdiccion, new.IdFuenteFinanciamiento, current_user(), now());
end //  
delimiter ;

select now();

select * from aux_financiero;
select * from auditoria_aux_financiero;

select * from calendario_financiero;

alter table calendario_financiero
add primary key (IdCalendario);

insert into calendario_financiero ()
values (201906, 2019, 6);

truncate table calendario_financiero;

delete from calendario_financiero
where IdCalendario = 201906;

select * from financiero;

create index id_calendario on financiero(IdCalendario);

create index id_fuente on financiero(IdFuenteFinanciamiento);
create index id_jurisdiccion on financiero(IdJurisdiccion);
create index id_servicio on financiero(Idservicio);

alter table financiero
rename column servicio_id to IdServicio;

alter table financiero
add constraint fk_calendario foreign key (IdCalendario) references calendario_financiero(IdCalendario);

alter table financiero
add constraint fk_fuente foreign key (IdFuenteFinanciamiento) references fuente_financiamiento(IdFuenteFinanciamiento);

alter table financiero
add constraint foreign key (IdJurisdiccion) references jurisdiccion(IdJurisdiccion);

alter table financiero
add constraint fk_servicio foreign key (IdServicio) references servicio(IdServicio);

select fi.IdCalendario, fi.programa_desc as programa, ju.Jurisdiccion, fi.credito_vigente from financiero as fi
join jurisdiccion as ju
on (ju.IdJurisdiccion = fi.IdJurisdiccion);

select * from financiero;
create view acceso_credito_vigente as
select fi.IdCalendario, fi.programa_desc as programa, ju.Jurisdiccion, fi.credito_vigente from financiero as fi
join jurisdiccion as ju
on (ju.IdJurisdiccion = fi.IdJurisdiccion);

select * from acceso_credito_vigente;
drop procedure acceso_jurisdiccion;
delimiter //
create procedure acceso_jurisdiccion (in elemento varchar(200))
begin
		select * from acceso_credito_vigente
        where Jurisdiccion  collate utf8mb4_spanish_ci like concat("%",elemento,"%");
end //
delimiter ;

call acceso_jurisdiccion("Salud");