module.exports = function (sequelize, dataTypes ) {
    let alias = "Product"
    let cols = {
        id: {
        autoIncrement : true,
        primaryKey : true,
        type : dataTypes.INTEGER
        },
        usuario_id:{
            type: dataTypes.INTEGER
        },
        foto_producto: {
            type: dataTypes.STRING
        },
        nombre_producto: {
            type: dataTypes.STRING
        },
        descripcion_producto: {
            type: dataTypes.STRING
        },
        created_at: {
            type: dataTypes.DATE,
            allowNull: true
        },
        updated_at: {
            type: dataTypes.DATE,
            allowNull: true
        },
        deleted_at: {
            type: dataTypes.DATE,
            allowNull: true
        },
        
    }
    let config = {
        tableName: "products",
        timestamps: false,
        underscored: true
    }

    let Product = sequelize.define(alias, cols, config);

    Product.associate = function(models){
        Product.hasMany(models.Coment, {
            as: "coment_product",
            foreignKey: "producto_id"
        })

        Product.belongsTo(models.User, {
            as: "user_product",
            foreignKey: "usuario_id"
        });
    }
    return Product;
}