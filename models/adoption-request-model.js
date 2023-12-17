import { DataTypes } from 'sequelize'
import { db } from '../database/config.db.js'

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
        defaultValue: '2'
    }
})

export const adoptionStatuses = {
    '1': 'Avalilable',
    '2': 'In process',
    '3': 'Adopted',
    '4': 'Approved',
    '5': 'Rejected'
}

export const getAdoptionRequest = id => AdoptionRequest.findByPk(id)

export const formatAdoptionRequest = adoptionRequest => ({
    ...adoptionRequest.dataValues,
    status: adoptionStatuses[adoptionRequest.status]
})