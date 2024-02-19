--@Autor(es):       Alonso Lopez y Marcelino Cisneros
--@Fecha creación:  08/01/2021
--@Descripción:     Creacion de Tablas en F4

-- 
-- TABLE: SUCURSAL_F4_DAL_S2
--

CREATE TABLE SUCURSAL_F4_DAL_S2
(
    SUCURSAL_ID    NUMBER(10,0)     CONSTRAINT SUCURSAL_F4_DAL_S2_PK PRIMARY KEY ,
    CLAVE          VARCHAR2(10)     NOT NULL,
    ES_TALLER      NUMBER(1, 0)     NOT NULL,
    ES_VENTA       NUMBER(1, 0)     NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    LATITUD        FLOAT            NULL,
    LONGITUD       FLOAT            NULL,
    URL            VARCHAR2(200)    NOT NULL
);



-- 
-- TABLE: SUCURSAL_VENTA_F4_DAL_S2
--

CREATE TABLE SUCURSAL_VENTA_F4_DAL_S2
(
    SUCURSAL_ID      NUMBER(10,0)    CONSTRAINT SUCURSAL_VENTA_F4_DAL_S2_PK PRIMARY KEY,
    HORA_APERTURA    DATE             NOT NULL,
    HORA_CIERRE      DATE             NOT NULL,
    CONSTRAINT SUCURSAL_VENTA_ID_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F4_DAL_S2(SUCURSAL_ID)
);


-- 
-- TABLE: SUCURSAL_TALLER_F4_DAL_S2
--

CREATE TABLE SUCURSAL_TALLER_F4_DAL_S2
(
    SUCURSAL_ID          NUMBER(10,0)   CONSTRAINT SUCURSAL_TALLER_F4_DAL_S2_PK PRIMARY KEY,
    DIA_DESCANSO         NUMBER(1,0)    NOT NULL,
    TELEFONO_ATENCION    VARCHAR2(20)   NOT NULL,
    CONSTRAINT SUCURSAL_TALLER_ID_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F4_DAL_S2(SUCURSAL_ID)
);




-- 
-- TABLE: TIPO_ALMACENAMIENTO_R_DAL_S4
--

CREATE TABLE TIPO_ALMACENAMIENTO_R_DAL_S2
(
    TIPO_ALMACENAMIENTO_ID    NUMBER(10,0)      CONSTRAINT TIPO_ALMACENAMIENTO_R_DAL_S4_PK PRIMARY KEY,
    CLAVE                     VARCHAR2(40)      NOT NULL,
    DESCRIPCION               VARCHAR2(400)     NOT NULL
);



-- 
-- TABLE: TIPO_MONITOR_R_DAL_S4
--

CREATE TABLE TIPO_MONITOR_R_DAL_S2
(
    TIPO_MONITOR_ID    NUMBER(10,0)     CONSTRAINT TIPO_MONITOR_R_DAL_S4_PK PRIMARY KEY,
    CLAVE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION        VARCHAR2(400)    NOT NULL
);



-- 
-- TABLE: TIPO_PROCESADOR_R_DAL_S4
--

CREATE TABLE TIPO_PROCESADOR_R_DAL_S2
(
    TIPO_PROCESADOR_ID    NUMBER(10,0)      CONSTRAINT TIPO_PROCESADOR_R_DAL_S4_PK PRIMARY KEY,
    CLAVE                 VARCHAR2(40)      NOT NULL,
    DESCRIPCION           VARCHAR2(400)     NOT NULL
);



-- 
-- TABLE: TIPO_TARJETA_VIDEO_R_DAL_S4
--

CREATE TABLE TIPO_TARJETA_VIDEO_R_DAL_S2
(
    TIPO_TARJETA_VIDEO_ID    NUMBER(10,0)   CONSTRAINT TIPO_TARJETA_VIDEO_R_DAL_S4_PK PRIMARY KEY,
    CLAVE                    VARCHAR2(40)   NOT NULL,
    DESCRIPCION              VARCHAR2(400)  NOT NULL
)
;


-- 
-- TABLE: LAPTOP_F5_DAL_S2
--

CREATE TABLE LAPTOP_F5_DAL_S2
(
    LAPTOP_ID                 NUMBER(10,0)      CONSTRAINT LAPTOP_F5_DAL_S2_PK PRIMARY KEY,
    NUM_SERIE                 VARCHAR2(19)      NOT NULL,
    CANTIDAD_RAM              NUMBER(6,0)       NOT NULL,
    CARACTERISTICAS_EXTRA     VARCHAR2(2000)    NOT NULL,
    TIPO_PROCESADOR_ID        NUMBER(10,0)      NOT NULL,
    TIPO_TARJETA_VIDEO_ID     NUMBER(10,0)      NOT NULL,
    TIPO_ALMACENAMIENTO_ID    NUMBER(10,0)      NOT NULL,
    TIPO_MONITOR_ID           NUMBER(10,0)      NOT NULL,
    LAPTOP_REMPLAZO_ID        NUMBER(10,0)      NULL,
    CONSTRAINT LAPTOP_PROCESADOR_ID_FK FOREIGN KEY (TIPO_PROCESADOR_ID)
    REFERENCES TIPO_PROCESADOR_R_DAL_S2(TIPO_PROCESADOR_ID),
    CONSTRAINT LAPTOP_VIDEO_ID_FK FOREIGN KEY (TIPO_TARJETA_VIDEO_ID)
    REFERENCES TIPO_TARJETA_VIDEO_R_DAL_S2(TIPO_TARJETA_VIDEO_ID),
    CONSTRAINT LAPTOP_ALMACENAMIENTO_ID_FK FOREIGN KEY (TIPO_ALMACENAMIENTO_ID)
    REFERENCES TIPO_ALMACENAMIENTO_R_DAL_S2(TIPO_ALMACENAMIENTO_ID),
    CONSTRAINT LAPTOP_MONITOR_ID_FK FOREIGN KEY (TIPO_MONITOR_ID)
    REFERENCES TIPO_MONITOR_R_DAL_S2(TIPO_MONITOR_ID)
);

CREATE TABLE LAPTOP_F1_DAL_S2
(
    LAPTOP_ID                 NUMBER(10,0)      CONSTRAINT LAPTOP_F1_DAL_S2_PK PRIMARY KEY,
    FOTO                      BLOB              NOT NULL
);


-- 
-- TABLE: SERVICIO_LAPTOP_F4_DAL_S2
--

CREATE TABLE SERVICIO_LAPTOP_F4_DAL_S2
(
    NUM_SERVICIO    NUMBER(10,0)     NOT NULL,
    LAPTOP_ID       NUMBER(10,0)     NOT NULL,
    IMPORTE         NUMBER(8,2)      NOT NULL,
    DIAGNOSTICO     VARCHAR2(2000)   NOT NULL,
    FACTURA         BLOB             NULL,
    SUCURSAL_ID     NUMBER(10,0)     NOT NULL,
    CONSTRAINT SERVICIO_LAPTOP_F4_DAL_S2_PK PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID),
    CONSTRAINT SUCURSAL_LAPTOP_ID_FK FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_TALLER_F4_DAL_S2(SUCURSAL_ID)
);



-- 
-- TABLE: STATUS_LAPTOP
--

CREATE TABLE STATUS_LAPTOP
(
    STATUS_LAPTOP_ID    NUMBER(5,0)     CONSTRAINT STATUS_LAPTOP_4_PK PRIMARY KEY,
    CLAVE               VARCHAR2(40)    NOT NULL,
    DESCRIPCION         VARCHAR2(400)   NOT NULL
);
