import { DataTypes } from 'sequelize'
import { db } from '../database/config.db.js'
import { getPetById } from './pet-model.js'
import { getAdopterById } from './adopter-model.js'

export const AdoptionRequest = db.define('adoption_request', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true
    },
    pet_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    adopter_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    status: {
        type: DataTypes.CHAR,
        defaultValue: '2',
        allowNull: false
    }
})

export const adoptionStatuses = {
    '1': 'Available',
    '2': 'In process',
    '3': 'Adopted',
    '4': 'Approved',
    '5': 'Rejected'
}

export const getRequestById = id => AdoptionRequest.findByPk(id) 