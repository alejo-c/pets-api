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
        type: DataTypes.TEXT,
        allowNull: false
    },
    address: {
        type: DataTypes.TEXT,
    },
    contact: {
        type: DataTypes.TEXT,
    }
})

export const getAdopter = id => Adopter.findByPk(id)