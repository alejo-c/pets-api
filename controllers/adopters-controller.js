import { Adopter, getAdopterById } from '../models/adopter-model.js'

export const createAdopter = async (req, res) => {
    if (req.body.name === undefined) return res.status(400).jsonPretty({
        type: 'error',
        message: 'The adopter name is required'
    })
    if (req.body.contact === undefined) return res.status(400).jsonPretty({
        type: 'error',
        message: 'The adopter contact is required'
    })

    const adopter = await Adopter.create(req.body)

    res.status(201).jsonPretty({
        type: 'success',
        message: `Adopter ${adopter.name} (id: ${adopter.id}) created successfully`,
        created: adopter
    })
}

export const readAdopters = async (req, res) => {
    const adopters = await Adopter.findAll()
    const length = adopters.length

    if (length === 0) return res.status(500).jsonPretty({
        type: 'error',
        message: 'There is no adopters',
        length
    })
    res.status(200).jsonPretty({ collection: adopters, length })
}

export const readAdopter = async (req, res) => {
    const id = req.params.id
    const adopter = await getAdopterById(id)

    if (adopter === null) return res.status(404).jsonPretty({
        type: 'error',
        message: `Adopter with id ${id} not found`
    })
    res.status(200).jsonPretty({ object: adopter })
}

export const updateAdopter = async (req, res) => {
    const id = req.params.id
    const { name, address, contact } = req.body

    const adopter = await getAdopterById(id)
    if (adopter === null) return res.status(404).jsonPretty({
        type: 'error',
        message: `Adopter with id ${id} does not exists`
    })

    const isInvalidData = name === undefined
        && address === undefined
        && contact === undefined
    if (isInvalidData) return res.status(400).jsonPretty({
        type: 'error',
        message: 'There is not valid data for update'
    })

    adopter.update(req.body)
    res.status(200).jsonPretty({
        type: 'success',
        message: `Adopter ${adopter.name} (id: ${id}) updated successfully`,
        updated: adopter
    })
}

export const deleteAdopter = async (req, res) => {
    const id = req.params.id
    const adopter = await getAdopterById(id)

    if (adopter === null) return res.status(404).jsonPretty({
        type: 'error',
        message: `Adopter with id ${id} does not exists`
    })

    adopter.destroy()
    res.status(200).jsonPretty({
        type: 'success',
        message: `Adopter ${adopter.name} (id: ${id}) deleted successfully`,
        deleted: adopter
    })
}
