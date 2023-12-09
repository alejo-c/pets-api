import { pet as Pet } from "../models/pet-model.js"

const readPets = async (req, res) => {
    const pets = await Pet.findAll()
    const length = pets.length

    if (length == 0)
        return res.status(500).jsonPretty({ error: 'There is no pets', length })
    res.status(200).jsonPretty({ pets, length })
}

const readPet = async (req, res) => {
    const id = req.params.id
    const pet = await Pet.findByPk(id)

    if (pet == null)
        return res.status(500).jsonPretty({ error: `Pet [${id}] not found` })
    res.status(200).jsonPretty({ pet })
}

const createPet = async (req, res) => {
    if (!req.body.name)
        return res.status(400).jsonPretty({ error: 'The name is required' })

    const pet = await Pet.create(req.body)
    res.status(200).jsonPretty({
        msj: `Pet [${pet.id}] created successfully`,
        pet
    })
}

const updatePet = async (req, res) => {
    const id = req.params.id
    const updated = await Pet.update(req.body, { where: { id } })

    if (!req.body.name && !req.body.age)
        return res.status(400).jsonPretty({ error: 'There is not valid data for update' })

    if (!updated[0])
        return res.status(500).jsonPretty({ error: `Pet [${id}] does not exists` })
    res.status(200).jsonPretty({ msj: `Pet [${id}] updated successfully` })
}

const removePet = async (req, res) => {
    const id = req.params.id
    const deleted = await Pet.destroy({ where: { id } })

    if (!deleted)
        return re.status(500).jsonPretty({ error: `Pet [${id}] does not exists` })
    res.status(200).jsonPretty({ msj: `Pet [${id}] deleted successfully` })
}

export { readPets, readPet, createPet, updatePet, removePet }