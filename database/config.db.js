import { Sequelize } from "sequelize"
import 'dotenv/config.js'

const db = new Sequelize({
    host: process.env.DB_HOST,
    username: process.env.DB_USER,
    password: process.env.DB_PASSWD,
    database: process.env.DB_NAME,
    dialect: 'mysql',
    dialectModule: mysql2,
})

export { db }