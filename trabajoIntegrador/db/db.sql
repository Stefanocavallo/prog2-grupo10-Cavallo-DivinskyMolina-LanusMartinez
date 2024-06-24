CREATE SCHEMA my_database;

USE my_database;

CREATE TABLE users (
/* nombreColumna        tipoDato        Restricciones */
    id                  INT             UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email               VARCHAR(250)    NOT NULL,
    user            	VARCHAR(250)    NOT NULL,
    clave	         	VARCHAR(250)    NOT NULL,
    fecha			    DATE,
    dni				    INT,
    foto_de_perfil      VARCHAR(250),
    created_at          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ,
    updated_at          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE products (
/*  nombreColumna       tipoDato        Restricciones */
    id 					INT 			UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    usuario_id			INT				UNSIGNED, 
    foto_producto 		VARCHAR(250) 	NOT NULL,
    nombre_producto 	VARCHAR(250) 	NOT NULL,
    descripcion_producto VARCHAR(250) 	NOT NULL,
    created_at 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP,
	updated_at 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at			TIMESTAMP		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_id) REFERENCES users(id)
);

CREATE TABLE coments (
/*  nombreColumna       tipoDato        Restricciones */
    id                  INT             UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    producto_id         INT             UNSIGNED,
    usuario_id         	INT             UNSIGNED,
    comentario          VARCHAR(500)    NOT NULL,
    created_at          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_id) REFERENCES users(id),
    FOREIGN KEY (producto_id) REFERENCES products(id)
);

/*Tabla usuarios*/

INSERT INTO users (id, email, user, clave, fecha, dni, foto_de_perfil, created_at, updated_at, deleted_at)
VALUES
(DEFAULT,'schumacher@gmail.com','schumacher1','contrasenia1','2005-06-29 00-00-00',46982347, 'schumacher.png', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT,'senna@gmail.com','senna1','contrasenia2','2005-04-18 00-00-00',46678933, 'senna.png', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT,'hamilton@gmail.com','hamilton1','contrasenia3','2005-09-01 00-00-00',46786312,'hamilton.png', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT,'vettel@gmail.com','vettel1','contrasenia4','2005-12-05 00-00-00',45679768,'vettel.png', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT,'toretto@gmail.com','toretto1','contrasenia5','2005-10-19 00-00-00',46873423,'toretto.png', DEFAULT, DEFAULT, DEFAULT);

/*Tabla productos*/

INSERT INTO products (id, usuario_id, foto_producto, nombre_producto, descripcion_producto, created_at, updated_at, deleted_at) 
VALUES 			
(DEFAULT, 1, 'RMrs.png', 'Renault Megane RS', 'Color: Blanco, Combustible: Nafta, Motor: 2.0 turbo, Puertas: 3, Transmision: Manual', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 1, 'SanderoRS.jpeg', 'Renault Sandero RS', 'Color: Negro, Combustible: Nafta, Motor: 2.0, Puertas: 5, Transmision: Manual', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 2, '308GTI.jpeg', 'Peugeot 308 GTI', 'Color: Azul, Combustible: Nafta, Motor: 1.4, Puertas: 5, Sensor: Si, Transmision: automática', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 2, 'VwAmarok.jpeg', 'Volskwagen Amarok', 'Color: Gris, Combustible: Nafta, Motor: 3.0 , Puertas: 4, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 3, 'MGLC300.jpeg', 'Merces-Benz GLC 300', 'Color: Gris, Combustible: Nafta, Motor: 2.0 , Puertas: 5, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 3, 'MBA250.jpeg', 'Mercedes-Benz A250', 'Color: Gris oscuro, Combustible: Nafta, Motor: 2.0 , Puertas: 5, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 4, 'MicroScaloneta.webp', 'Micro Scaloneta', 'Color: Blanco, Combustible: Nafta, Motor: 2.0 , Puertas: 2, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 4, 'Fiat500.webp', 'Fiat 500', 'Color: Azul, Combustible: Nafta, Motor: 1.4 , Puertas: 3, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 5, 'GolfTSI.jpeg',  'Volkswagen Golf TSI Highline', 'Color: Azul, Combustible: Nafta, Motor: 1.6 , Puertas: 5, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT),    
(DEFAULT, 5, 'AudiA4.jpeg', 'Audi A4', 'Color: Gris, Combustible: Nafta, Motor: 2.0 turbo , Puertas: 5, Transmision: Automatica', DEFAULT, DEFAULT, DEFAULT);

/*Tabla comentarios*/

INSERT INTO coments (id, usuario_id, producto_id, comentario, created_at, updated_at, deleted_at)
VALUES 
(DEFAULT, 1, 9,   'Que mecha papaaaa!!! ', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 1, 10,   'Ufffff... hermoso! ', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 1, 5,   'Una bestia alemana :P ', DEFAULT, DEFAULT, DEFAULT), 
(DEFAULT, 1, 6,   'La bestia de nordelta le dicen a esa jajajaja', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 1, 7,   'Me subo y no me bajo maaaaas! ', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 1, 8,   'Muy picante', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 2, 1,   'Hermoso bicho ese! ', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 2, 2,   'Una locura!!!', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 2, 9,   'Demasiada nave para estas calles!', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 2, 10,  'Polvo ', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 2, 7,   'NAAAAAA ', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 2, 8,   'Nefasta es poco.... ', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 3, 1,   'Que frances más loco! ', DEFAULT, DEFAULT, DEFAULT),  
(DEFAULT, 3, 2,   'Una torta con ruedas... ', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 3, 3,   'El mítico THPummmm ', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 3, 4,   'La malcriada jajaja ', DEFAULT, DEFAULT, DEFAULT),  
(DEFAULT, 3, 7,   'JUJUUUUUUUU', DEFAULT, DEFAULT, DEFAULT),  
(DEFAULT, 3, 8,   'Qué m***** es esa no?', DEFAULT, DEFAULT, DEFAULT),  
(DEFAULT, 4, 9,   'Que preciosura maamaaaa', DEFAULT, DEFAULT, DEFAULT),  
(DEFAULT, 4, 10,   'LA nave', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 4, 3,   'El leoncito', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 4, 4,   'Que cosa fea por favor...', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 4, 5,   'El tanque alemán.', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 4, 6,   'En el mercho, escuchando fercho...', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 5, 1,   'QUE HERMOSO ', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 5, 2,   'LA real nave', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 5, 3,   'El rayo mcqueen le dicen a ese', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 5, 4,   'Alemana nefasta', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 5, 5,   'Bombonazo', DEFAULT, DEFAULT, DEFAULT),
(DEFAULT, 5, 6,   'Qué locuraaaaa', DEFAULT, DEFAULT, DEFAULT);

 