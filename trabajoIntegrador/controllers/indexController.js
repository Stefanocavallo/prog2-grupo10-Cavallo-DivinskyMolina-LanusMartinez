var datos = require("../db/dataBase.sql")
const indexController = {
    index: function(req,res) {
        res.render("homepage", {info: db}
        )
    },
};

module.export = indexController