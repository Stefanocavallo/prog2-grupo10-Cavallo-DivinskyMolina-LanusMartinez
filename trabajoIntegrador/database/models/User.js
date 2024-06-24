module.exports = function(sequelize, dataTypes){
    let alias = "User";
    let cols = {
        id: {
            autoIncrement : true,
            primaryKey : true,
            type : dataTypes.INTEGER
        },
        email: {
            type: dataTypes.STRING
        },
        clave: {
            type: dataTypes.STRING
        },
        fecha: {
            type: dataTypes.DATE,
            allowNull: true

        },
        dni: {
            type : dataTypes.INTEGER,
            allowNull: true
        },
        foto_de_perfil: {
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
        user: {
            type: dataTypes.STRING(20),
            allowNull: false
        }
    }
    let config = {
        tableName: "users",
        timestamps: false,
        underscored: true
    }
    let User = sequelize.define(alias, cols, config);

    User.associate = function(models){
        User.hasMany(models.Coment, {
            as: "coment_user",
            foreignKey: "usuario_id"
        })

        User.hasMany(models.Product, {
            as: "user_product",
            foreignKey: "usuario_id"
        });
    }
    return User;
}
