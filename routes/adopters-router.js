import express from 'express'
import * as controller from '../controllers/adopters-controller.js'

const router = express.Router()

router.get('/', controller.readAdopters)
router.get('/:id', controller.readAdopter)
router.post('/register', controller.createAdopter)
router.put('/update/:id', controller.updateAdopter)
router.delete('/delete/:id', controller.deleteAdopter)

export { router as adopterRouter }