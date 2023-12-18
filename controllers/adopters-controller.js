import { Adopter, getAdopter } from '../models/adopter-model.js'

export const createAdopter = async (req, res) => {
    if (req.body.name == undefined)
        return res.status(400).jsonPretty({ type: 'error', message: 'The adopter name is required' })

    const adopter = await Adopter.create(req.body)
    res.status(201).jsonPretty({
        type: 'success',
        message: `Adopter [${adopter.id}] created successfully`,
        adopter
    })
}

export const readAdopters = async (req, res) => {
    const adopters = await Adopter.findAll()
    const length = adopters.length

    if (length == 0)
        return res.status(500).jsonPretty({ type: 'error', message: 'There is no adopters', length })
    res.status(200).jsonPretty({ adopters, length })
}

export const readAdopter = async (req, res) => {
    const id = req.params.id
    const adopter = await getAdopter(id)

    if (adopter == null)
        return res.status(404).jsonPretty({ type: 'error', message: `Adopter [${id}] not found` })
    res.status(200).jsonPretty({ adopter })
}

export const updateAdopter = async (req, res) => {
    const id = req.params.id

    if (!req.body.name && !req.body.address && !req.body.contact)
        return res.status(400).jsonPretty({ error: 'There is not valid data for update' })

    const adopter = await getAdopter(id)
    if (adopter == null)
        return res.status(404).jsonPretty({ type: 'error', message: `Adopter [${id}] does not exists` })

    adopter.update(req.body)
    res.status(200).jsonPretty({
        type: 'success',
        message: `Adopter [${id}] updated successfully`,
        adopter
    })
}

export const deleteAdopter = async (req, res) => {
    const id = req.params.id
    const adopter = await getAdopter(id)

    if (adopter == null)
        return res.status(404).jsonPretty({ type: 'error', message: `Adopter [${id}] does not exists` })

    adopter.destroy()
    res.status(200).jsonPretty({
        type: 'success',
        message: `Adopter [${id}] deleted successfully`,
        adopter
    })
}
