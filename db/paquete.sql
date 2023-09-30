
CREATE OR REPLACE PACKAGE PAQUETE1 AS 

    PROCEDURE agregar_factura       (p_clienteId in INTEGER,
                                      p_productoId in INTEGER,
                                      p_cantidadProducto in INTEGER,
                                      p_salida OUT VARCHAR2);
                                      
                                      
    PROCEDURE obtener_productos  (p_proveedorId in INTEGER, p_cursor out sys_refcursor);
    
    PROCEDURE obtener_categorias  (p_cursor out sys_refcursor );
                                      
    PROCEDURE obtener_clientes  (p_productoId in INTEGER, p_cursor out sys_refcursor);
    
END PAQUETE1;


CREATE OR REPLACE PACKAGE BODY PAQUETE1 AS

    PROCEDURE agregar_factura        (p_clienteId in INTEGER,
                                      p_productoId in INTEGER,
                                      p_cantidadProducto in INTEGER,
                                      p_salida OUT VARCHAR2
    ) IS
    

    BEGIN
    
       
       INSERT INTO Facturas VALUES ((SELECT MAX(FacturaId)+1 FROM Facturas),SYSDATE,p_clienteId);
       COMMIT;
       
       INSERT INTO Ventas VALUES ((SELECT MAX(VentaId)+1 FROM Ventas),(SELECT MAX(FacturaId) FROM Facturas), p_productoId, p_cantidadProducto);
        p_salida:='Nueva Factura creada con exito';  
       COMMIT;
       
       EXCEPTION
       WHEN OTHERS THEN
        p_salida:='No se pudo ingresar la nueva factura';
       ROLLBACK;
       
       
    END agregar_factura;
    
    
    PROCEDURE obtener_productos (p_proveedorId in INTEGER, p_cursor out sys_refcursor
    ) IS
    
    BEGIN
    
        OPEN p_cursor FOR 
        SELECT p.ProductoId, p.Descripcion, p.Precio, c.Descripcion AS Categoria, pr.Nombre AS Proveedor
        FROM Productos p
        INNER JOIN Proveedores pr ON pr.ProveedorId = p.ProveedorId
        INNER JOIN Categorias c ON c.CategoriaId = p.CategoriaId
        WHERE p.ProveedorId = p_proveedorId;

    END obtener_productos;
    
    PROCEDURE obtener_categorias (p_cursor out sys_refcursor 
    ) IS
    
    BEGIN
    
        OPEN p_cursor FOR 
        SELECT c.Descripcion AS Categoria, p.Descripcion AS Producto, p.Precio
        FROM Productos p
        INNER JOIN Categorias c ON c.CategoriaId = p.CategoriaId
        ORDER BY 1;
       
    END obtener_categorias;
    
    
    PROCEDURE obtener_clientes (p_productoId in INTEGER, p_cursor out sys_refcursor
    ) IS
    
    BEGIN
    
               
        OPEN p_cursor FOR 
        SELECT c.Nombre, p.Descripcion AS Producto
        FROM Clientes c
        INNER JOIN Facturas f ON f.ClienteId = c.ClienteId
        INNER JOIN Ventas v ON v.FacturaId = f.FacturaId
        INNER JOIN Productos p ON p.ProductoId = v.ProductoId
        WHERE p.ProductoId = p_productoId;

    END obtener_clientes;
    
    
END PAQUETE1;


