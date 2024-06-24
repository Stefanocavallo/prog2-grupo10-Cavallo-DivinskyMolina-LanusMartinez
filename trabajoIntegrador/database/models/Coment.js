module.exports = function (sequelize, dataTypes ) {
    let alias = "Coment"
    let cols = {
        id: {
        autoIncrement : true,
        primaryKey : true,
        type : dataTypes.INTEGER
    },
        producto_id: {
            type: dataTypes.INTEGER
        },
        usuario_id: {
            type: dataTypes.INTEGER
        },
        comentario: {
            type: dataTypes.STRING(400)
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
        }
    }
    let config = {
        tableName: "coments",
        timestamps: false,
        underscored: true
    }

    let Coment = sequelize.define(alias, cols, config);

    Coment.associate = function(models){
        Coment.belongsTo(models.Product, {
            as: "coment_product",
            foreignKey: "producto_id"
        });

        Coment.belongsTo(models.User, {
            as: "coment_user",
            foreignKey: "usuario_id"
        })

    }
    return Coment;
}