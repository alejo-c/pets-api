import express from "express"
import { router } from "../routes/pets-router.js"
import { db } from "../database/config.db.js"

const app = express()
const PORT = 8000

db.authenticate().then(() => {
    console.log('Database connected successfully')
}).catch(err => {
    console.error(`Error at database connection: ${err}`);
})

app.use((req, res, next) => {
    res.jsonPretty = jsonObj => res.send(JSON.stringify(jsonObj, null, 2))
    next()
})
app.use(express.json())
app.use('/pets', router)

db.sync().then(() => {
    app.listen(PORT, () => console.log(`Server started at http://localhost:${PORT}`))
}).catch(err => {
    console.error(`Error at database sync: ${err}`);
})
