let express = require("express");
let products = require("../db/dbProductos");
let users = require("../db/dbUsuarios");

const db = require("../database/models");
const bcrypt = require("bcryptjs");
const { validationResult } = require("express-validator");
const { Op, Association } = require('sequelize');
const Product = require("../database/models/Product");


let productosController = {
    index: function (req, res) {
        db.Product.findAll({
            include: [{ association: "coment_product" },
            { association: "user_product" }
            ],
            order: [["created_at", "DESC"]]
        })
            .then(function (data) {
                //console.log(data)
                return res.render("home", { info: data })
            })
            .catch(function (error) {
                console.log(error)
            });
    },
    product: function (req, res) {
        let id = req.params.idProducto;
        db.Product.findByPk(id, {
            include: [{ association: "coment_product" },
            { association: "user_product" }
            ]
        })
            .then(data => {
                console.log(data)
                db.Coment.findAll({
                    where: { producto_id: data.id },
                    order: [["created_at", "DESC"]],
                    include: [
                        { association: "coment_user" }
                    ]
                })
                    .then(comentarios => {
                        return res.render("product", { product: data, coment: comentarios })
                    })
            })
            .catch(error => {
                console.log(error);
            })
    },
    add: function (req, res) {
        if (req.session.user == undefined) {
            return res.redirect("/cartastic/register");
        } else {
            return res.render("product-add");
        }
    },
    store: function (req, res) {
        const addValidation = validationResult(req);
        if (addValidation.errors.length > 0) {
            return res.render("product-add", {
                errors: addValidation.mapped(),
                oldData: req.body,
            });
        }
        let id = req.session.user.id
        data = req.body;

        let producto = {
            foto_producto: data.imagen,
            nombre_producto: data.nombre,
            descripcion_producto: data.descripcion,
            usuario_id: id
        };
        db.Product.create(producto)
            .then((productoCreado) => {
                return res.redirect('/cartastic')
            })
            .catch(error => {
                console.log(error)
            
            })

    },
    search: function (req, res) {
        let buscado = req.query.search;
        db.Product.findAll({
            where: {
                [Op.or]: [
                    { nombre_producto: { [Op.like]: "%" + buscado + "%" } },
                    { descripcion_producto: { [Op.like]: "%" + buscado + "%" } }
                ]
            },
            include: [{ association: "coment_product" },
            { association: "user_product" }
            ],
            order: [["created_at", "DESC"]]
        })
            .then((data) => {
                return res.render("search-results", { productos: data });
            })

            .catch(function (e) {
                console.log(e);
            });
    },
    deleteProduct: function (req, res) {
        let id = req.params.id
        console.log(id)
        if (req.session.user) {
            db.Product.destroy({
                where: { id: id }
            })
                .then(function (data) {
                    res.redirect("/cartastic")
                })
                .catch(function (error) {
                    console.log(error)
                })
        }
    },
    productEdit: function (req, res) {
        let id = req.params.id

        db.Product.findByPk(id)
            .then(function (data) {
                return res.render("product-edit", { data: data })
            })
            .catch(function (error) {
                console.log(error)
            })
    },
    editProduct: function (req, res) {
        const addValidation = validationResult(req);
        if (addValidation.errors.length > 0) {
            return res.render("product-edit", {
                errors: addValidation.mapped(),
                oldData: req.body,
                data: { id: req.params.id }
            });
        }
        let id = req.session.user.id;
        data = req.body;

        let producto = {
            foto_producto: data.imagen,
            nombre_producto: data.nombre,
            descripcion_producto: data.descripcion,
            usuario_id: id,
        };
        db.Product.update(producto, {
            where: { id: req.params.id }
        })
            .then((productoCreado) => {
                return res.redirect(`/cartastic/product/${req.params.id}`);
            })
            .catch((error) => {
                console.log(error);
            });
    },
    coment: function (req, res){
            const comentValidation = validationResult(req);
            if(req.session.user !=undefined){
                if(comentValidation.isEmpty()){
                    let id = req.params.id;
                    db.Coment.create({
                        comentario: req.body.text,
                        producto_id: id,
                        usuario_id: req.session.user.id
                    })
                    .then(function(data){
                        return res.redirect(`/cartastic/product/${id}`)
                    })
                    .catch(function(error){
                        console.log(error);
                    })
                } else {
                    let id = req.params.id
                    db.Product.findByPk(id, {
                        include: [{association: "coment_product"},
                            {association: "user_product"}
                        ]
                    })
                    .then(data => {
                        db.Coment.findAll({
                            where: {producto_id: data.id},
                            include: [
                                {association: "coment_user"}
                            ]
                        })
                        .then(comentarios => {
                            console.log(comentarios)
                            return res.render("product",{
                                errors: comentValidation.mapped(),
                                product: data,
                                coment: comentarios
                            })
                        })
                })
                .catch(error =>{
                    console.log(error);
                }) 
            }
        }
    },
}

module.exports = productosController;