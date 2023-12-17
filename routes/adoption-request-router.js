import express from 'express'
import * as controller from "../controllers/adoption-requests-controller.js"

const router = express.Router()

router.get('/', controller.readAdoptionRequests)
router.get('/:id', controller.readAdoptionRequest)
router.post('/create', controller.createAdoptionRequest)
router.put('/update/:id', controller.updateAdoptionRequest)
router.put('/approve/:id', controller.approveAdoptionRequest)
router.put('/reject/:id', controller.rejectAdoptionRequest)
router.delete('/delete/:id', controller.deleteAdoptionRequest)

export { router as adoptionRequestRouter }