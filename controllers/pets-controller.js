import { Pet, petTypes, getPet, formatPet } from '../models/pet-model.js'

export const readPets = async (req, res) => {
    let pets = await Pet.findAll()
    pets = pets.map(pet => formatPet(pet))

    const length = pets.length
    if (length == 0)
        return res.status(500).jsonPretty({ type: 'error', message: 'There is no pets', length })

    res.status(200).jsonPretty({ pets, length })
}

export const readPet = async (req, res) => {
    const id = req.params.id
    const pet = await getPet(id)

    if (pet == null)
        return res.status(404).jsonPretty({ type: 'error', message: `Pet [${id}] not found` })
    res.status(200).jsonPretty({ pet: formatPet(pet) })
}

export const createPet = async (req, res) => {
    if (req.body.type == undefined)
        return res.status(400).jsonPretty({ type: 'error', message: 'The pet type is required' })
    if (req.body.name == undefined)
        return res.status(400).jsonPretty({ type: 'error', message: 'The pet name is required' })
    if (petTypes[req.body.type] == undefined)
        return res.status(400).jsonPretty({ type: 'error', message: 'The pet type is not valid' })

    const pet = formatPet(await Pet.create(req.body))
    res.status(201).jsonPretty({
        type: 'success',
        message: `${pet.type} [${pet.id}] created successfully`,
        pet
    })
}

export const updatePet = async (req, res) => {
    const id = req.params.id
    const { adoption_status, ...body } = req.body

    if (!body.type && !body.name && !body.age)
        return res.status(400).jsonPretty({ type: 'error', message: 'There is not valid data for update' })
    if (body.type && petTypes[body.type] == undefined)
        return res.status(400).jsonPretty({ type: 'error', message: 'The pet type is not valid' })

    let pet = await getPet(id)
    if (pet == null)
        return res.status(404).jsonPretty({ type: 'error', message: `Pet [${id}] does not exists` })

    pet.update(body, { where: { id } })
    res.status(200).jsonPretty({
        type: 'success',
        message: `${petTypes[pet.type]} [${id}] updated successfully`,
        pet: formatPet(pet)
    })
}

export const removePet = async (req, res) => {
    const id = req.params.id
    let pet = await getPet(id)

    if (pet == null)
        return res.status(404).jsonPretty({ type: 'error', message: `Pet [${id}] does not exists` })

    pet.destroy()
    res.status(200).jsonPretty({
        type: 'success',
        message: `${petTypes[pet.type]} [${id}] deleted successfully`,
        pet: formatPet(pet)
    })
}