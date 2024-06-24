var datos = require("../db/dbUsuarios")
let prods = require("../db/dbProductos")
let express = require("express")

const db = require("../database/models");
const bcrypt = require("bcryptjs");
const { validationResult } = require("express-validator");
const { Op, Association } = require('sequelize');

const profileController = {
    profile: function(req,res) {
        let usuario = req.params.usuario
        let infoUsuario;
        for (let i = 0; i < datos.usuarios.length; i++) {
            if (usuario.toLowerCase()===datos.usuarios[i].usuario.toLowerCase()){
                infoUsuario=datos.usuarios[i]
            }
        }
        res.render("profile", {info: infoUsuario, productos:prods.productos}
        )
    },

    login : function(req, res){
        return res.render('login',{})
    },

    register: function(req, res){
        return res.render('register',{})
    },
    
    edit: function(req, res){
        return res.render('profileEdit',{})
    },
    createProfile: function (req, res) {
        const registerValidation = validationResult(req);
        if (registerValidation.isEmpty()) {
            let datos = req.body;

            let encriptada = bcrypt.hashSync(datos.pass, 12);

            if (datos.fecha_nacimiento == "") {
                datos.fecha_nacimiento = null;
            }
            if (datos.dni == "") {
                datos.dni = null;
            }
            if (datos.foto_perfil == "") {
                datos.foto_perfil = null;
            }

            let usuarioNuevo = {
                email: datos.email,
                clave: encriptada,
                fecha: datos.fecha_nacimiento,
                dni: datos.dni,
                foto_de_perfil: datos.foto_perfil,
                user: datos.user,
            };

            db.User.create(usuarioNuevo)
                .then(function (data) {
                    res.redirect("login");
                })
                .catch(function (error) {
                    console.log(error);
                });
        } else {
            return res.render("register", {
                errors: registerValidation.mapped(),
                oldData: req.body,
            });
        }
    },
    loginProfile: function (req, res) {
        const loginValidation = validationResult(req)
        if (!loginValidation.isEmpty()) {
            return res.render("login", {
                errors: loginValidation.mapped(),
                oldData: req.body
            })
        } else {
            db.User.findOne({
                where: [{ email: req.body.email }]
            })
                .then(function (user) {
                    req.session.user = user;
                    if (req.body.recordarme != undefined) {
                        res.cookie('userId', user.id, { maxAge: 1000 * 60 * 5 })
                    }
                    return res.redirect('/cartastic');
                })
                .catch(function (e) {
                    console.log(e)
                })
        }
    },

    logout: function (req, res) {
        req.session.destroy();

        res.clearCookie("userId");

        return res.redirect("/cartastic");
    },

    
}; 

module.exports = profileController