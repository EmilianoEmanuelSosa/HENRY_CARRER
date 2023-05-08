select count(*) from 
(select 	v.Fecha,
		c.Nombre_Y_Apellido,
        (v.Precio * v.Cantidad)	as Venta
from venta v left join cliente c
	on (v.IdCliente = c.IdCliente)) v;

select count(*) from 
(select 	v.Fecha,
		c.Nombre_Y_Apellido,
        (v.Precio * v.Cantidad)	as Venta
from venta v right join cliente c
	on (v.IdCliente = c.IdCliente)) v;
    
select 	v.Fecha,
		c.Nombre_Y_Apellido,
        (v.Precio * v.Cantidad)	as Venta
-- from venta v right join cliente c
from cliente c right join venta v
	on (v.IdCliente = c.IdCliente);
-- Where v.Fecha is null;

select * from tipo_producto;
insert into tipo_producto (TipoProducto)
values ('Tablets');

select 	tp.IdTipoProducto,
		tp.TipoProducto,
        p.IdProducto,
		p.Producto,
        p.Precio
from	tipo_producto tp full join producto p
			on (tp.IdTipoProducto = p.IdTipoProducto)
Order by 1 desc;

select 	tp.IdTipoProducto,
		tp.TipoProducto,
        p.IdProducto,
		p.Producto,
        p.Precio
from	tipo_producto tp left join producto p
			on (tp.IdTipoProducto = p.IdTipoProducto)
union
select 	tp.IdTipoProducto,
		tp.TipoProducto,
        p.IdProducto,
		p.Producto,
        p.Precio
from	tipo_producto tp right join producto p
			on (tp.IdTipoProducto = p.IdTipoProducto)
Order by 1 desc;

ALTER TABLE producto DROP CONSTRAINT `producto_fk_tipoproducto`;

Insert into producto (IdProducto, Producto, Precio, IdTipoProducto)
values (1, 'Producto de prueba', 1, 20);

DELETE from producto where IdProducto = 1;

ALTER TABLE producto ADD CONSTRAINT `producto_fk_tipoproducto` FOREIGN KEY (IdTipoProducto) REFERENCES tipo_producto (IdTipoProducto) ON DELETE RESTRICT ON UPDATE RESTRICT;