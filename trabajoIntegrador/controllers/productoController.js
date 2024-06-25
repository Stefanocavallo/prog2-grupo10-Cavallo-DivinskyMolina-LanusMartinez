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

    add: function(req, res){
        return res.render('productAdd',{})
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
