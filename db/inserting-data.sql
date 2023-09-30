

SELECT *
FROM Clientes

INSERT INTO Clientes VALUES (1, 'Juan Perez', 'Main St 123', '86868989')
INSERT INTO Clientes VALUES ((SELECT MAX(ClienteId)+1 FROM Clientes), 'Pedro Perez', 'Main St 124', '848482828')
INSERT INTO Clientes VALUES ((SELECT MAX(ClienteId)+1 FROM Clientes), 'Julio Doe', 'Main St 321', '81016542')


-------------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM Facturas

INSERT INTO Facturas VALUES (1, SYSDATE, 1)
INSERT INTO Facturas VALUES ((SELECT MAX(ClienteId)+1 FROM Facturas), SYSDATE, 2)
INSERT INTO Facturas VALUES ((SELECT MAX(ClienteId)+1 FROM Facturas), SYSDATE, 3)


-------------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM Categorias

INSERT INTO Categorias VALUES (1, 'Limpieza')
INSERT INTO Categorias VALUES ((SELECT MAX(CategoriaId)+1 FROM Categorias), 'Snacks')
INSERT INTO Categorias VALUES ((SELECT MAX(CategoriaId)+1 FROM Categorias), 'Bebidas')


-------------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM Proveedores

INSERT INTO Proveedores VALUES (1, 'Proveedor 1', 'Edificio Naranja Torre 1', '85254145')
INSERT INTO Proveedores VALUES ((SELECT MAX(ProveedorId)+1 FROM Proveedores), 'Proveedor 2', 'Edificio Verde Torre 2', '52636987')
INSERT INTO Proveedores VALUES ((SELECT MAX(ProveedorId)+1 FROM Proveedores), 'Proveedor 3', 'Edificio Azul Torre 3', '11155658')


-------------------------------------------------------------------------------------------------------------------------------

SELECT p.*, c.descripcion
FROM Productos p
INNER JOIN categorias c ON c.categoriaId = p.CategoriaId
WHERE p.CategoriaId IS NOT NULL

--Productos de limpieza
INSERT INTO Productos VALUES (1, 'Jabon', 10, 1, 1)
INSERT INTO Productos VALUES ((SELECT MAX(ProductoId)+1 FROM Productos), 'Shampoo', 10, 1, 1)
--Snacks
INSERT INTO Productos VALUES ((SELECT MAX(ProductoId)+1 FROM Productos), 'Pringles', 20, 2, 2)
INSERT INTO Productos VALUES ((SELECT MAX(ProductoId)+1 FROM Productos), 'Jalapeños', 15, 2, 2)
--Bebidas
INSERT INTO Productos VALUES ((SELECT MAX(ProductoId)+1 FROM Productos), 'Pepsi', 10, 3, 3)
INSERT INTO Productos VALUES ((SELECT MAX(ProductoId)+1 FROM Productos), 'Coca Cola', 10, 3, 3)

-------------------------------------------------------------------------------------------------------------------------------

SELECT v.ventaid, f.facturaid, p.descripcion AS Producto, v.Cantidad, c.Nombre AS Cliente, p.Precio, (p.Precio * v.Cantidad) AS Total
FROM Ventas v
INNER JOIN Facturas f ON f.FacturaId = v.FacturaId
INNER JOIN Clientes c ON f.ClienteId = c.ClienteId
INNER JOIN Productos p ON p.ProductoId = v.ProductoId
WHERE v.Cantidad <> 0

SELECT *
FROM Ventas

--2 items al cliente 1
INSERT INTO Ventas VALUES (1, 1, 1, 2)
INSERT INTO Ventas VALUES ((SELECT MAX(VentaId)+1 FROM Ventas), 1, 2, 3)


--2 items al cliente 2
INSERT INTO Ventas VALUES ((SELECT MAX(VentaId)+1 FROM Ventas), 2, 3, 1)
INSERT INTO Ventas VALUES ((SELECT MAX(VentaId)+1 FROM Ventas), 2, 4, 2)


--2 items al cliente 3
INSERT INTO Ventas VALUES ((SELECT MAX(VentaId)+1 FROM Ventas), 3, 5, 1)
INSERT INTO Ventas VALUES ((SELECT MAX(VentaId)+1 FROM Ventas), 3, 6, 2)

-------------------------------------------------------------------------------------------------------------------------------
