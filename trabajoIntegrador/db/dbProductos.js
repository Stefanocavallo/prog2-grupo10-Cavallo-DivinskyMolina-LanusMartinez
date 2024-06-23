let express = require('express');

let dataP = {
    productos:[
        {
            clase: 1,
            idProducto: 1,
            vendedor: 'Tefa123',
            fotoProducto: '/images/products/RMrs.png',
            nombreProducto: 'Renault Megane RS',
            descripcion: 'Color: Blanco, Combustible: Nafta, Motor: 2.0 turbo, Puertas: 5, Transmision: Manual',
            comentariosProd2: [
                {
                    fotoUsuario: '/images/users/pepo.jpg',
                    user: 'Pepo123',
                    texto: 'Cuantos CV? Aceptas permuta? Te ofrezco un Peugeot 308 Gti + diferencia.',
                },
                {
                    fotoUsuario: '/images/users/messi1.jpg',
                    user: 'Messi123',
                    texto: 'Hay posibilidades de mandarlo a Miami? Anto anda necesitando un nuevo auto, avisame y arreglamos pa.',
                },
                {
                    fotoUsuario: '/images/users/ivan.jpg',
                    user: 'Ivan123',
                    texto: 'Que mecha! Cuantos burros? Permutas por Golf TSI?',
                }
            ]
        },
        {
            clase: 2,
            idProducto: 2,
            vendedor: 'Tefa123',
            fotoProducto: '/images/products/SanderoRS.jpeg',
            nombreProducto: 'Renault Sandero RS',
            descripcion: 'Color: Negro, Combustible: Nafta, Motor: 2.0, Puertas: 5, Transmision: Manual',
            comentariosProd2: [
                {
                    fotoUsuario: '/images/users/scaloni.jpg',
                    user: 'Scaloni123',
                    texto: 'Nunca más me compro uno de estos, no se lo recomiendo a nadie...',
                },
                {
                    fotoUsuario: '/images/users/messi1.jpg',
                    user: 'Messi123',
                    texto: 'Linda nave para ir por Paris, potente, ruidosa y furiosa.',
                },
                {
                    fotoUsuario: '/images/users/pepo.jpg',
                    user: 'Pepo123',
                    texto: 'La verdad que nunca me subiria a uno de estos, no me gustan nada...',
                }
            ]
        },
        {
            clase: 1,
            idProducto: 3,
            vendedor: 'Pepo123',
            fotoProducto: '/images/products/308GTI.jpeg',
            nombreProducto: 'Peugeot 308 Gti',
            descripcion: 'Color: Azul, Combustible: Nafta, Motor: 1.6, Puertas: 5, Transmision: Manual',
            comentariosProd2: [
                {
                    fotoUsuario: '/images/users/tefa.jpg',
                    user: 'Tefa123',
                    texto: 'Divino, lastima el motor THPum... Pero de todas formas, humilla a la competencia',
                },
                {
                    fotoUsuario: '/images/users/messi1.jpg',
                    user: 'Messi123',
                    texto: 'Linda nave para ir por Paris, potente, ruidosa y furiosa.',
                },
                {
                    fotoUsuario: '/images/users/pepo.jpg',
                    user: 'Pepo123',
                    texto: 'La verdad que nunca me subiria a uno de estos, no me gustan nada...',
                }
            ] 
        },
        {
            clase: 2,
            idProducto: 4,
            vendedor: 'Pepo123',
            fotoProducto: '/images/products/VwAmarok.jpeg',
            nombreProducto: 'Volskwagen Amarok',
            descripcion: 'Color: Gris, Combustible: Nafta, Motor: 3.0 , Puertas: 4, Transmision: Automatica',
            comentariosProd2: [
                {
                    fotoUsuario: '/images/users/tefa.jpg',
                    user: 'Tefa123',
                    texto: 'Hermoso el andar, pero visualmente nefasta...',
                },
                {
                    fotoUsuario: '/images/users/messi1.jpg',
                    user: 'Messi123',
                    texto: 'Muy linda nave, tenía una en Rosario, volveria a tener una.',
                },
                {
                    fotoUsuario: '/images/users/ivan.jpg',
                    user: 'Ivan123',
                    texto: 'Ufff, muy linda y ademas hermoso andar, nunca te va a dejar a pata, daría lo que sea por una.',
                }
            ] 
        },
        {
            clase: 1,
            idProducto: 5,
            vendedor: 'Messi123',
            fotoProducto: '/images/products/MGLC300.jpeg',
            nombreProducto: 'Merces-Benz GLC 300',
            descripcion: 'Color: Gris, Combustible: Nafta, Motor: 2.0 , Puertas: 5, Transmision: Automatica',
            comentariosProd2: [
                {
                    fotoUsuario: '/images/users/pepo.jpg',
                    user: 'Pepo123',
                    texto: 'Na pero como vas a publicar esto?? Estas loco, hay chicos en esta pagina, jajajaja! Hermosa!',
                },
                {
                    fotoUsuario: '/images/users/scaloni.jpg',
                    user: 'Scaloni123',
                    texto: 'Para Lio, como vas a vender esa hermosura?? Regalasela a alguno del plantel jajaja.',
                },
                {
                    fotoUsuario: '/images/users/ivan.jpg',
                    user: 'Ivan123',
                    texto: 'Bellisima, un tanque igual, pero siendo tuya la compraria hoy mismo.',
                }
            ] 
        },
        {
            clase: 2,
            idProducto: 6,
            vendedor: 'Messi123',
            fotoProducto: '/images/products/MBA250.jpeg',
            nombreProducto: 'Merces-Benz A250',
            descripcion: 'Color: Gris oscuro, Combustible: Nafta, Motor: 2.0 , Puertas: 5, Transmision: Automatica',
            comentariosProd2: [
                {
                    fotoUsuario: '/images/users/tefa.jpg',
                    user: 'Tefa123',
                    texto: 'Muy lindo auto, no me decido igual entre este o un serie 1...',
                },
                {
                    fotoUsuario: '/images/users/scaloni.jpg',
                    user: 'Scaloni123',
                    texto: 'En el mercho, escuchando Fercho, jajajaja. Vendeselo a De Paul a ver si recupera a Tini!',
                },
                {
                    fotoUsuario: '/images/users/pepo.jpg',
                    user: 'Pepo123',
                    texto: 'Andaba buscando uno de estos hace tiempo, y viendo que es tuyo Lio, no dudo en comprarlo!',
                }
            ] 
        },
        {
            clase: 1,
            idProducto: 7,
            vendedor: 'Scaloni123',
            fotoProducto: '/images/products/MicroScaloneta.webp',
            nombreProducto: 'Micro Scaloneta',
            descripcion: 'Color: Blanco, Combustible: Nafta, Motor: 2.0 , Puertas: 2, Transmision: Automatica',
            comentariosProd2: [
                {
                    fotoUsuario: '/images/users/tefa.jpg',
                    user: 'Tefa123',
                    texto: 'Jajajajaj, ya mismo la compro!.',
                },
                {
                    fotoUsuario: '/images/users/messi1.jpg',
                    user: 'Messi123',
                    texto: 'Estas loco!',
                },
                {
                    fotoUsuario: '/images/users/pepo.jpg',
                    user: 'Pepo123',
                    texto: 'Jujuuuuuu una locura!!!',
                }
            ] 
        },
        {
            clase: 2,
            idProducto: 8,
            vendedor: 'Scaloni123',
            fotoProducto: '/images/products/Fiat500.webp',
            nombreProducto: 'Fiat 500',
            descripcion: 'Color: Azul, Combustible: Nafta, Motor: 1.4 , Puertas: 3, Transmision: Automatica',
            comentariosProd2: [
                {
                    fotoUsuario: '/images/users/tefa.jpg',
                    user: 'Tefa123',
                    texto: 'Una c4g4d4 con ruedas....',
                },
                {
                    fotoUsuario: '/images/users/ivan.jpg',
                    user: 'Ivan123',
                    texto: 'Como vas a vender esta cosa... Guardala y nunca más la saques del garage.',
                },
                {
                    fotoUsuario: '/images/users/pepo.jpg',
                    user: 'Pepo123',
                    texto: 'Horrible es poco...',
                }
            ] 
        },
        {
            clase: 1,
            idProducto: 9,
            vendedor: 'Ivan123',
            fotoProducto: '/images/products/GolfTSI.jpeg',
            nombreProducto: 'Golf TSI Highline',
            descripcion: 'Color: Azul, Combustible: Nafta, Motor: 1.6 , Puertas: 5, Transmision: Automatica',
            comentariosProd2: [
                {
                    fotoUsuario: '/images/users/tefa.jpg',
                    user: 'Tefa123',
                    texto: 'Como vas a vender LA mecha??',
                },
                {
                    fotoUsuario: '/images/users/messi1.jpg',
                    user: 'Messi123',
                    texto: 'Buen primer auto, se lo pienso comprar a Ciro.',
                },
                {
                    fotoUsuario: '/images/users/pepo.jpg',
                    user: 'Pepo123',
                    texto: 'Ni loco te compro este auto sabiendo como lo trataste... jajajaja',
                }
            ]  
        },
        {
            clase: 2,
            idProducto: 10,
            vendedor: 'Ivan123',
            fotoProducto: '/images/products/AudiA4.jpeg',
            nombreProducto: 'Audi A4',
            descripcion: 'Color: Gris, Combustible: Nafta, Motor: 2.0 turbo , Puertas: 5, Transmision: Automatica',
            comentariosProd2: [
                {
                    fotoUsuario: '/images/users/scaloni.jpg',
                    user: 'Scaloni123',
                    texto: 'mmmm dudosa venta, tanto tiempo tiene este auto que es un fosil...',
                },
                {
                    fotoUsuario: '/images/users/messi1.jpg',
                    user: 'Messi123',
                    texto: 'Hermosa bestia, aunque los respuestos... Mamita.',
                },
                {
                    fotoUsuario: '/images/users/pepo.jpg',
                    user: 'Pepo123',
                    texto: 'Esa perdida de aceite... No lo vendes mas!',
                }
            ]
        },
    ]
}


module.exports = dataP