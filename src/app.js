import express from "express"
import cors from 'cors'

import { petsRouter } from "../routes/pets-router.js"
import { adopterRouter } from '../routes/adopter-router.js'
import { requestRouter } from '../routes/adoption-request-router.js'
import { db } from "../database/config.db.js"

const app = express()
const PORT = 8000

db.authenticate().then(() => {
    console.log('Database connected successfully')
}).catch(err => {
    console.error(`Error at database connection: ${err}`)
})

app.use(express.json())
app.use(cors())
app.use((req, res, next) => {
    res.jsonPretty = jsonObj => res.send(JSON.stringify(jsonObj, null, 2))
    next()
})
app.use('/pets', petsRouter)
app.use('/adopters', adopterRouter)
app.use('/requests', requestRouter)

app.get('/', (req, res) => res.status(301).redirect(
    'https://github.com/alejo-c/pets-api?tab=readme-ov-file#api-usage'
))

db.sync().then(() => {
    app.listen(PORT, () => console.log(`Server started at http://localhost:${PORT}`))
}).catch(err => {
    console.error(`Error at database sync: ${err}`);
})
