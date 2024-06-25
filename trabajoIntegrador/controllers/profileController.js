var datos = require("../db/dbUsuarios")
let prods = require("../db/dbProductos")
let express = require("express")

const db = require("../database/models");
const bcrypt = require("bcryptjs");
const { validationResult } = require("express-validator");
const { Op, Association } = require('sequelize');

const profileController = {
    login : function(req, res){
        return res.render('login',{})
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
    edit: function (req, res) {
        let id = req.session.user.id;
        db.User.findByPk(id)
            .then((data) => {
                res.render("profile-edit", { usuario: data });
            })
            .catch((e) => {
                console.log(e);
            });
    },
    edit_profile: function (req, res) {
        const editProfValidation = validationResult(req);
        if (editProfValidation.errors.length > 0) {
            return res.render("profile-edit", {
                errors: editProfValidation.mapped(),
                oldData: req.body,
                usuario: req.session.user
            });
        }
        const id = req.session.user.id;
        const perfil = req.body;
        if (perfil.fecha_nacimiento == "") {
            perfil.fecha_nacimiento = null;
        }
        if (perfil.dni == "") {
            perfil.dni = null;
        }
        if (perfil.foto_perfil == "") {
            perfil.foto_perfil = null;
        }

        perfilEditado = {
            email: perfil.email,
            clave: perfil.pass,
            fecha: perfil.fecha_nacimiento,
            dni: perfil.dni,
            foto_de_perfil: perfil.foto_perfil,
            user: perfil.user,
        };

        if (perfilEditado.clave == "") {
            perfilEditado.clave = req.session.user.clave
        }
        else {
            perfilEditado.clave = bcrypt.hashSync(perfilEditado.clave, 12)
        }
        db.User.update(perfilEditado, {
            where: {
                id: id,
            },
        })
            .then(function (result) {
                return res.redirect(`/bears/profile`);
            })
            .catch(function (err) {
                console.log(err);
            });
    },
   
    profile: function (req, res) {
        let id = req.params.idUsuario;
        db.User.findByPk(id, {
            include: [
                {
                    association: "user_product"
                },
                { association: "coment_user" }
            ]
        })
            .then(function (data) {
                db.Product.findAll({
                    where: { usuario_id: data.id },
                    order: [["created_at", "DESC"]],
                    include: [
                        { association: "coment_product" }
                    ]
                })
                    .then(producto => {
                        return res.render("profile", { info: data, producto: producto })
                    })
            })
            .catch(function (error) {
                console.log(error);
            });
    },
    register: function (req, res) {
        return res.render("register", {});
    },

    
}; 

module.exports = profileController