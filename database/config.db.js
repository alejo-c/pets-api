import { Sequelize } from "sequelize"
import mysql2 from 'mysql2'
import 'dotenv/config.js'

const db = new Sequelize({
    dialect: 'mysql',
    dialectModule: mysql2,
    host: process.env.DB_HOST,
    username: process.env.DB_USER,
    password: process.env.DB_PASSWD,
    database: process.env.DB_NAME,
})

export { db }