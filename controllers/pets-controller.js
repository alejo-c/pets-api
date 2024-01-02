import { PetBreed } from '../models/pet-breed-model.js'
import { Pet, petTypes, getPetById } from '../models/pet-model.js'

export const createPet = async (req, res) => {
    const { adoption_status, body } = req.body

    if (body.type === undefined) return res.status(400).jsonPretty({
        type: 'error',
        message: 'The pet type is required'
    })
    if (body.name === undefined) return res.status(400).jsonPretty({
        type: 'error',
        message: 'The pet name is required'
    })
    if (body.photo_url === undefined) return res.status(400).jsonPretty({
        type: 'error',
        message: 'The pet photo is required'
    })
    if (body.description === undefined) return res.status(400).jsonPretty({
        type: 'error',
        message: 'The pet description is required'
    })

    if (petTypes[body.type] === undefined) return res.status(400).jsonPretty({
        type: 'error',
        message: 'The pet type is not valid'
    })

    const pet = await Pet.create(body)
    res.status(201).jsonPretty({
        type: 'success',
        message: `${petTypes[pet.type]} ${pet.name} (id: ${pet.id}) created successfully`,
        created: pet
    })
}

export const readPets = async (req, res) => {
    const pets = await Pet.findAll()
    const length = pets.length

    if (length === 0) return res.status(500).jsonPretty({
        type: 'error',
        message: 'There is no pets',
        length
    })
    res.status(200).jsonPretty({ collection: pets, length })
}

export const readPet = async (req, res) => {
    const id = req.params.id
    const pet = await getPetById(id)

    if (pet === null) return res.status(404).jsonPretty({
        type: 'error',
        message: `Pet with id ${id} not found`
    })
    res.status(200).jsonPretty({ object: pet })
}

export const readPetBreed = async (req, res) => {
    const id = req.params.id
    const pet = await getPetById(id)

    if (pet === null) return res.status(404).jsonPretty({
        type: 'error',
        message: `Pet with id ${id} not found`
    })

    const breed = PetBreed.findByPk(pet.breed)
    if (breed === null)
        breed = PetBreed.findByPk(1)

    res.status(200).jsonPretty({ object: breed })
}

export const updatePet = async (req, res) => {
    const id = req.params.id
    const { adoption_status, ...body } = req.body

    let pet = await getPetById(id)
    if (pet === null) return res.status(404).jsonPretty({
        type: 'error',
        message: `Pet with id ${id} does not exists`
    })

    const isInvalidData = body.type === undefined
        && body.name === undefined
        && body.age === undefined
        && body.photo === undefined
        && body.description === undefined
    if (isInvalidData) return res.status(400).jsonPretty({
        type: 'error',
        message: 'There is not valid data for update'
    })

    const isInvalidType = body.type !== undefined && petTypes[body.type] === undefined
    if (isInvalidType) return res.status(400).jsonPretty({
        type: 'error',
        message: 'The pet type is not valid'
    })

    pet.update(body, { where: { id } })
    res.status(200).jsonPretty({
        type: 'success',
        message: `${petTypes[pet.type]} ${pet.name} (id: ${id}) updated successfully`,
        updated: pet
    })
}

export const removePet = async (req, res) => {
    const id = req.params.id
    let pet = await getPetById(id)

    if (pet === null) return res.status(404).jsonPretty({
        type: 'error',
        message: `Pet with id ${id} does not exists`
    })

    pet.destroy()
    res.status(200).jsonPretty({
        type: 'success',
        message: `${petTypes[pet.type]} ${pet.name} (id: ${id}) deleted successfully`,
        deleted: pet
    })
}
