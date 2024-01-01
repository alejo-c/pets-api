import { DataTypes } from 'sequelize'
import { db } from '../database/config.db.js'

export const Adopter = db.define('adopter', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    address: {
        type: DataTypes.STRING
    },
    contact: {
        type: DataTypes.STRING,
        allowNull: false
    }
})

export const getAdopterById = id => Adopter.findByPk(id)