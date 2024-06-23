CREATE SCHEMA my_database;

USE my_database;

CREATE TABLE usuarios (
/* nombreColumna        tipoDato        Restricciones */
    id                  INT             UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    mail                VARCHAR(250)    NOT NULL,
    usuario            	VARCHAR(250)    NOT NULL,
    contrasenia         VARCHAR(250)    NOT NULL,
    fecha_nacimiento    DATE,
    numero_documento    INT,
    foto                VARCHAR(250),
    created_at          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ,
    updated_at          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE productos (
/* 	nombreColumna 		tipoDato 		Restricciones */
    id 					INT 			UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_usuario			INT				UNSIGNED, 
    foto_producto 		VARCHAR(250) 	NOT NULL,
    nombre_producto 	VARCHAR(250) 	NOT NULL,
    descripcion 		VARCHAR(250) 	NOT NULL,
    created_at 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP,
	updated_at 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at			TIMESTAMP		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE comentarios (
/*  nombreColumna       tipoDato        Restricciones */
    id                  INT             UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_usuario          INT             UNSIGNED,
    id_producto         INT             UNSIGNED,
    comentario          VARCHAR(500)    NOT NULL,
    created_at          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

/*Tabla usuarios*/

INSERT INTO usuarios (id, mail, usuario, contrasenia, fecha_nacimiento, numero_documento, foto, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 'cavallos@udesa.edu.ar','Tefa123', 'tefa123', '2003-07-21', 44895188, 'tefa.jpg', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO usuarios (id, mail, usuario, contrasenia, fecha_nacimiento, numero_documento, foto, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 'planusmartinez@udesa.edu.ar','Pepo123', 'pepo123', '2004-12-08', 46293905, 'pepo.jpg', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO usuarios (id, mail, usuario, contrasenia, fecha_nacimiento, numero_documento, foto, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 'lionelmessi@gmail.com', 'Messi123','messi123', '1987-06-24', 18122022, 'messi1.jpg', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO usuarios (id, mail, usuario, contrasenia, fecha_nacimiento, numero_documento, foto, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 'scaloni@gmail.com', 'Scaloni123','scaloni123', '1978-05-16', 20122022, 'Scaloni.jpg', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO usuarios (id, mail, usuario, contrasenia, fecha_nacimiento, numero_documento, foto, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 'idivinskimolina@udesa.edu.ar', 'Ivan123','ivan123', '2004-12-21', 46437670, 'ivan.jpg', DEFAULT, DEFAULT, DEFAULT);

/*Tabla productos*/

INSERT INTO productos (id, id_usuario, foto_producto, nombre_producto, descripcion, created_at, updated_at, deleted_at) 
VALUES 			(DEFAULT, 1, 'RMrs.png', 'Renault Megane RS', 'Color: Blanco, Combustible: Nafta, Motor: 2.0 turbo, Puertas: 5, Transmision: Manual', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO productos (id, id_usuario, foto_producto, nombre_producto, descripcion, created_at, updated_at, deleted_at) 
VALUES 			(DEFAULT, 1, 'SanderoRS.jpeg', 'Renault Sandero RS', 'Color: Negro, Combustible: Nafta, Motor: 2.0, Puertas: 5, Transmision: Manual', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO productos (id, id_usuario, foto_producto, nombre_producto, descripcion, created_at, updated_at, deleted_at) 
VALUES 			(DEFAULT, 2, '308GTI.jpeg', 'Peugeot 308 GTI', 'Color: Azul, Combustible: Nafta, Motor: 1.4, Puertas: 5, Sensor: Si, Transmision: automática', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO productos (id, id_usuario, foto_producto, nombre_producto, descripcion, created_at, updated_at, deleted_at) 
VALUES 			(DEFAULT, 2, 'VwAmarok.jpeg', 'Volskwagen Amarok', 'Color: Gris, Combustible: Nafta, Motor: 3.0 , Puertas: 4, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO productos (id, id_usuario, foto_producto, nombre_producto, descripcion, created_at, updated_at, deleted_at) 
VALUES 			(DEFAULT, 3, 'MGLC300.jpeg', 'Merces-Benz GLC 300', 'Color: Gris, Combustible: Nafta, Motor: 2.0 , Puertas: 5, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO productos (id, id_usuario, foto_producto, nombre_producto, descripcion, created_at, updated_at, deleted_at) 
VALUES 			(DEFAULT, 3, 'MBA250.jpeg', 'Mercedes-Benz A250', 'Color: Gris oscuro, Combustible: Nafta, Motor: 2.0 , Puertas: 5, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO productos (id, id_usuario, foto_producto, nombre_producto, descripcion, created_at, updated_at, deleted_at) 
VALUES			(DEFAULT, 4, 'MicroScaloneta.webp', 'Micro Scaloneta', 'Color: Blanco, Combustible: Nafta, Motor: 2.0 , Puertas: 2, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO productos (id, id_usuario, foto_producto, nombre_producto, descripcion, created_at, updated_at, deleted_at) 
VALUES 			(DEFAULT, 4, 'Fiat500.webp', 'Fiat 500', 'Color: Azul, Combustible: Nafta, Motor: 1.4 , Puertas: 3, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT);  

INSERT INTO productos (id, id_usuario, foto_producto, nombre_producto, descripcion, created_at, updated_at, deleted_at) 
VALUES 			(DEFAULT, 5, 'GolfTSI.jpeg',  'Golf TSI Highline', 'Color: Azul, Combustible: Nafta, Motor: 1.6 , Puertas: 5, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT);    

INSERT INTO productos (id, id_usuario, foto_producto, nombre_producto, descripcion, created_at, updated_at, deleted_at) 
VALUES 			(DEFAULT, 5, 'AudiA4.jpeg', 'Audi A4', 'Color: Gris, Combustible: Nafta, Motor: 2.0 turbo , Puertas: 5, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT);

/*Tabla comentarios*/

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 1, 1,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 1, 2,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 1, 3,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 2, 1,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 2, 2,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 2, 3,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 3, 1,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 3, 2,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 3, 3,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 4, 4,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 4, 5,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 4, 6,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 5, 4,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);  

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 5, 5,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 5, 6,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 1, 4,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);  

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 2, 5,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);  

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 2, 6,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);  

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 3, 7,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);  

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 3, 8,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 3, 9,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 3, 10,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 4, 7,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 4, 8,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 4, 9,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 4, 10,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 5, 7,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 5, 8,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 5, 9,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO comentarios (id, id_usuario, id_producto, comentario, created_at, updated_at, deleted_at)
VALUES (DEFAULT, 5, 10,   'Lorem ipsum dolor sit amet consectetur adipiscing elit felis, eros odio sapien mi sociosqu habitasse curae non, nibh dui turpis suscipit malesuada sodales hac. Turpis odio massa lacus penatibus ante velit varius posuere, ullamcorper lectus sollicitudin platea morbi pharetra blandit tincidunt vel, et molestie non interdum arcu cursus est. Vivamus feugiat aliquam facilisis nisi primis consequat lectus phasellus fusce ultricies accumsan, proin quam fringilla bibendum posuere habitasse aptent. ', DEFAULT, DEFAULT, DEFAULT); 