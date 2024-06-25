const dbProductos = require('../db/dbProductos')
const express = require("express")

const productosController = {
    index: function (req, res) {
        db.Product.findAll({
            include: [ { association: "coment_product"}, 
              {association: "user_product"}
            ],
            order: [["created_at", "DESC"]]
          })
            .then(function(data){
              console.log(data)
              return res.render("home", { info: data })
            })
            .catch(function(error){
              console.log(error)
            });
    },

    product: function(req, res){
        let id = req.params.idProduct;
        let respuesta;
        for (let i = 0; i < dbProductos.productos.length; i++) {
            if (id.toLowerCase() === dbProductos.productos[i].nombreProducto.toLowerCase()) {
                respuesta = dbProductos.productos[i]
            }
        }
        if (!respuesta) {
            return res.send("El producto seleccionado no está disponible")
        }
        else {
            return res.render("product", {info: respuesta})
        }
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
}


module.exports = productosController
