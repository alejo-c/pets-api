import express from 'express'
import cors from 'cors'

import { db } from '../database/config.db.js'
import { petsRouter } from '../routes/pets-router.js'
import { adoptersRouter } from '../routes/adopters-router.js'
import { requestsRouter } from '../routes/adoption-requests-router.js'

const app = express()
const PORT = 8000

app.use(express.json())
app.use(cors())

app.use((req, res, next) => {
    res.jsonPretty = jsonObj => res.send(JSON.stringify(jsonObj, null, 2))
    next()
})

app.get('/', (req, res) => res.status(301).redirect(
    'https://github.com/alejo-c/pets-api#api-usage'
))
app.use('/pets', petsRouter)
app.use('/adopters', adoptersRouter)
app.use('/adoption-requests', requestsRouter)

db.authenticate()
    .then(() => console.log('Database connected successfully'))
    .catch(err => console.error(`Error at database connection: ${err}`))

db.sync().then(() =>
    app.listen(PORT, () =>
        console.log(`Server started at http://localhost:${PORT}`)
    )
).catch(err => console.error(`Error at database sync: ${err}`))

export default app