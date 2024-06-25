var express = require('express');
var router = express.Router();
let productosController = require('../controllers/productosController');
let profileController = require('../controllers/profileController');

const db = require('../database/models');
const { body } = require('express-validator');


const registerValidation = [
    body("email")
        .notEmpty().withMessage('Por favor ingrese su email.')
        .isEmail().withMessage('Por favor ingrese un mail valido.')
        .custom(function (value) {
            return db.User.findOne({
                where: [{ email: value }]
            })
                .then(function (data) {
                    if (data) {
                        throw new Error('El mail ingresado ya se encuentra registrado.')
                    }
                })
        }),
    body('user')
        .notEmpty().withMessage('Este campo es obligatorio.'),
    body('pass')
        .notEmpty().withMessage('Debe crear una contraseña.')
        .isLength({ min: 4 }).withMessage('La contraseña debe poseer como mínimo 4 caracteres.')
];
const loginValidation = [
    body("email")
        .notEmpty().withMessage('Por favor, ingrese su mail.')
        .isEmail()
        .withMessage("Debe escribir su correo en un formato valido.")
        .custom(function (value, { req }) {
            return db.User.findOne({
                where: { email: value },
            }).then(function (userToLogin) {
                if (!userToLogin) {
                    throw new Error("El mail ingresado no está registrado.");
                }
            });
        }),
    body("password")
        .notEmpty()
        .withMessage("Debe ingresar una contraseña.")
        .custom(function (value, { req }) {
            return db.User.findOne({
                where: { email: req.body.email },
            })
                .then(function (user) {
                    console.log(user)
                    if (user) {
                        const clave = user.clave;
                        const passwordOk = bcrypt.compareSync(value, clave);
                        if (!passwordOk) {
                            throw new Error("¡Contraseña incorrecta!");
                        }
                    }
                });
        }),
];

//Rutas profile get

router.get('/login', profileController.login);
router.get('/register', profileController.register);
router.get('/usuario/:usuario', profileController.profile);
router.get('/profileEdit', profileController.edit);
router.get('/profile/:idUsuario', profileController.profile);

//Rutas profile post

router.post('/createprofile', registerValidation, profileController.createProfile);
router.post('/loginprofile', loginValidation, profileController.loginProfile);
router.post('/logout', profileController.logout); 

//Rutas productos get

router.get('/', productosController.index)
router.get('/product/:idProduct', productosController.product);
router.get('/productAdd', productosController.add);
router.get('/search', productosController.search);

//Rutas productos post

