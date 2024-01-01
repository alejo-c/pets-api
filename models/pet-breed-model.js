import { DataTypes } from 'sequelize'
import { db } from '../database/config.db.js'

export const PetBreed = db.define('pet_breed', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true
    },
    name: {
        type: DataTypes.STRING,
        unique: true,
        allowNull: false
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: false
    }
})

export const getPetBreedById = id => PetBreed.findByPk(id)