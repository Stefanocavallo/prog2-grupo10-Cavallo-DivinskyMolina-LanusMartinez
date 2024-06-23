var datos = require("../db/dbUsuarios")
let prods = require("../db/dbProductos")
let express = require("express")

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
}; 

module.exports = profileController