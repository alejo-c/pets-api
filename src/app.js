import express from "express"
import cors from 'cors'

import { petsRouter } from "../routes/pets-router.js"
import { adopterRouter } from '../routes/adopter-router.js'
import { adoptionRequestRouter } from '../routes/adoption-request-router.js'
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
app.use('/adoptionrequests', adoptionRequestRouter)

db.sync().then(() => {
    app.listen(PORT, () => console.log(`Server started at http://localhost:${PORT}`))
}).catch(err => {
    console.error(`Error at database sync: ${err}`);
})

export default app