var express = require('express');
var router = express.Router();
let productosController = require('../controllers/productosController');
let profileController = require('../controllers/profileController');

const db = require('../database/models');
const { body } = require('express-validator');
const bcrypt = require("bcryptjs");



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
const comentValidation = [
    body("text")
    .notEmpty()
    .withMessage("Agrega un comentario!")
    .isLength({min:5})
    .withMessage("El comentario debe tener como mínimo 5 caracteres"),
];
const addValidation = [
    body("imagen")
    .notEmpty()
    .withMessage("Para publicar un vehículo necesitas cargar una foto del mismo."),

    body("nombre")
    .notEmpty().withMessage("Para agregar un vehículo necesitas aclarar marca y modelo del mismo."),

    body("descripcion")
    .notEmpty()
    .withMessage("Para agregar un vehículo necesitas agrear una breve descripción o mismo la ficha técnica.")
];
const editProfValidation = [
    body("email")
        .notEmpty().withMessage('Por favor, ingrese un nuevo mail.')
        .isEmail().withMessage('Debes ingresar un email valido.')
        .custom(function (value, { req }) {
            if (value != req.session.user.email) {
                return db.User.findOne({
                    where: [{ email: value }]
                })
                    .then(function (data) {
                        if (data) {
                            throw new Error('Este email ya se encuentra registrado.')
                        }
                    })
            }
            return true
        }),
    body('user')
        .notEmpty().withMessage('Por favor, ingrese un nuevo usuario.'),
    body('pass')
        .custom(function (value) {
            if (value == "") {
                return true
            }
            else if (value.length < 4) {
                throw new Error('La contraseña debe tener como mínimo 4 caracteres')
            }
            else {
                return true
            }
        })
];


//Rutas profile get

router.get('/login', profileController.login);
router.get('/register', profileController.register);
router.get('/profileEdit', profileController.edit);
router.get('/profile/:idUsuario', profileController.profile);

//Rutas profile post

router.post('/createprofile', registerValidation, profileController.createProfile);
router.post('/loginprofile', loginValidation, profileController.loginProfile);
router.post('/logout', profileController.logout);
router.post('/editProfile', editProfValidation, profileController.edit_profile)

//Rutas productos get

router.get('/', productosController.index)
router.get('/product/:idProducto', productosController.product);
router.get('/productAdd', productosController.add);
router.get('/search', productosController.search);
router.get('/product/:idProducto', productosController.product);
router.get('/deleteProduct/:id', productosController.deleteProduct);
router.get('/productEdit/:id', productosController.productEdit)

//Rutas productos post

router.post('/addProduct', addValidation, productosController.store)
router.post('/coment/:id', comentValidation, productosController.coment);
router.post('/editar/:id', addValidation, productosController.editProduct)



module.exports = router