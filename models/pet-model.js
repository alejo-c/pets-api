import { DataTypes } from "sequelize"
import { db } from "../database/config.db.js"
import { adoptionStatuses } from './adoption-request-model.js'

export const Pet = db.define('pet', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true
    },
    type: {
        type: DataTypes.CHAR,
        allowNull: false
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    age: {
        type: DataTypes.INTEGER
    },
    adoption_status: {
        type: DataTypes.CHAR,
        allowNull: false,
        defaultValue: '1'
    }
})

export const petTypes = { 'C': 'Cat', 'D': 'Dog' }

export const getPet = id => Pet.findByPk(id)

export const formatPet = pet => ({
    ...pet.dataValues,
    type: petTypes[pet.type],
    adoption_status: adoptionStatuses[pet.adoption_status]
})