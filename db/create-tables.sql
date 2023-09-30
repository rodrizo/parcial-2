

CREATE TABLE Clientes (
    ClienteId NUMBER(4) NOT NULL,
    Nombre        VARCHAR2(250 CHAR),
    Direccion     VARCHAR2(250 CHAR),
    Telefono VARCHAR2 (75 CHAR)
);
ALTER TABLE Clientes ADD CONSTRAINT cliente_pk PRIMARY KEY ( ClienteId );
------------------------------------------------------------------------------------------------

DROP TABLE Facturas CASCADE CONSTRAINTS;
CREATE TABLE Facturas (
    FacturaId NUMBER(4) NOT NULL,
    Fecha        DATETIME,
    ClienteId     NUMBER(4) NOT NULL
);

ALTER TABLE Facturas ADD CONSTRAINT factura_pk PRIMARY KEY ( FacturaId );

------------------------------------------------------------------------------------------------
CREATE TABLE Ventas (
    VentaId NUMBER(4) NOT NULL,
    FacturaId NUMBER(4) NOT NULL,
    ProductoId NUMBER(4) NOT NULL,
    Cantidad INTEGER
);

ALTER TABLE Ventas ADD CONSTRAINT venta_pk PRIMARY KEY ( VentaId );

------------------------------------------------------------------------------------------------

CREATE TABLE Productos (
    ProductoId NUMBER(4) NOT NULL,
    Descripcion        VARCHAR2(250 CHAR),
    Precio NUMBER(4),
    CategoriaId NUMBER(4) NOT NULL,
    ProveedorId NUMBER(4) NOT NULL
);

ALTER TABLE Productos ADD CONSTRAINT producto_pk PRIMARY KEY ( ProductoId );

------------------------------------------------------------------------------------------------
CREATE TABLE Proveedores (
    ProveedorId NUMBER(4) NOT NULL,
    Nombre        VARCHAR2(250 CHAR),   
    Direccion     VARCHAR2(250 CHAR),
    Telefono     VARCHAR2(75 CHAR)
);

ALTER TABLE Proveedores ADD CONSTRAINT proveedor_pk PRIMARY KEY ( ProveedorId );
------------------------------------------------------------------------------------------------
CREATE TABLE Categorias (
    CategoriaId NUMBER(4) NOT NULL,
    Descripcion        VARCHAR2(250 CHAR)
);

ALTER TABLE Categorias ADD CONSTRAINT categoria_pk PRIMARY KEY ( CategoriaId );


------------------------------------------------------------------------------------------------

ALTER TABLE Facturas
    ADD CONSTRAINT cliente_fk FOREIGN KEY ( ClienteId )
        REFERENCES Clientes ( ClienteId );

------------------------------------------------------------------------------------------------

ALTER TABLE Ventas
    ADD CONSTRAINT factura_fk FOREIGN KEY ( FacturaId )
        REFERENCES Facturas ( FacturaId );
        
        
ALTER TABLE Ventas
    ADD CONSTRAINT producto_fk FOREIGN KEY ( ProductoId )
        REFERENCES Productos ( ProductoId );
        
        
------------------------------------------------------------------------------------------------

ALTER TABLE Productos
    ADD CONSTRAINT categoria_fk FOREIGN KEY ( CategoriaId )
        REFERENCES Categorias ( CategoriaId );
        
        
ALTER TABLE Productos
    ADD CONSTRAINT proveedor_fk FOREIGN KEY ( ProveedorId )
        REFERENCES Proveedores ( ProveedorId );
