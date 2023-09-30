

SELECT *
FROM Facturas


SELECT *
FROM Ventas

SELECT *
FROM Productos p
INNER JOIN Proveedores pr ON pr.ProveedorId = p.ProveedorId
WHERE p.ProveedorId = 1


SELECT c.Descripcion AS Categoria, p.Descripcion AS Producto, p.Precio
FROM Productos p
INNER JOIN Categorias c ON c.CategoriaId = p.CategoriaId
ORDER BY 1


SELECT p.ProductoId, p.Descripcion, p.Precio, c.Descripcion AS Categoria, pr.Nombre AS Proveedor
        FROM Productos p
        INNER JOIN Proveedores pr ON pr.ProveedorId = p.ProveedorId
        INNER JOIN Categorias c ON c.CategoriaId = p.CategoriaId
        WHERE p.ProveedorId = 2


SELECT c.Nombre, p.Descripcion AS Producto
FROM Clientes c
INNER JOIN Facturas f ON f.ClienteId = c.ClienteId
INNER JOIN Ventas v ON v.FacturaId = f.FacturaId
INNER JOIN Productos p ON p.ProductoId = v.ProductoId
WHERE p.ProductoId = 1

