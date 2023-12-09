import express from "express"
import { readPets, readPet, createPet, updatePet, removePet } from "../controllers/pets-controller.js"

const router = express.Router()

router.get('/', readPets)
router.get('/:id', readPet)
router.post('/create', createPet)
router.put('/update/:id', updatePet)
router.delete('/delete/:id', removePet)

export { router }