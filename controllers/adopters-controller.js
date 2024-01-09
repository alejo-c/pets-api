// import bcrypt from 'bcrypt'
import { Adopter, getAdopterById } from '../models/adopter-model.js'

// const hashPassword = async password => {
//     const salt = await bcrypt.genSalt()
//     return await bcrypt.hash(password, salt)
// }

export const createAdopter = async (req, res) => {
    if (req.body.name === undefined) return res.status(400).jsonPretty({
        type: 'error',
        message: 'The adopter name is required'
    })
    if (req.body.contact === undefined) return res.status(400).jsonPretty({
        type: 'error',
        message: 'The adopter contact is required'
    })

    // req.body.password = await hashPassword(req.body.password)
    const adopter = await Adopter.create(req.body)

    res.status(201).jsonPretty({
        type: 'success',
        message: `Adopter ${adopter.name} (id: ${adopter.id}) created successfully`,
        created: adopter
    })
}

// export const loginAdopter = async (req, res) => {
//     if (req.body.email === undefined)
//         return res.status(400).jsonPretty({ type: 'error', message: 'The adopter email is required' })
//     if (req.body.password === undefined)
//         return res.status(400).jsonPretty({ type: 'error', message: 'The adopter password is required' })

//     const adopter = await Adopter.findOne({ where: { email: req.body.email } })
//     if (adopter === null) return res.status(404).jsonPretty({
//         type: 'error',
//         message: `Adopter with email ${req.body.email} not found`
//     })

//     const isPasswordValid = await bcrypt.compare(req.body.password, adopter.password)
//     if (!isPasswordValid)
//         return res.status(401).jsonPretty({ type: 'error', message: 'Invalid password' })

//     res.status(200).jsonPretty({
//         type: 'success',
//         message: `Adopter ${adopter.name} logged in successfully`,
//         adopter
//     })
// }

// export const logoutAdopter = (req, res) => {
//     req.session.destroy()
//     res.status(200).jsonPretty({ type: 'success', message: 'Adopter logged out successfully' })
// }

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
    // const { name, role, email, password, address } = req.body
    const { name, address, contact } = req.body

    const adopter = await getAdopterById(id)
    if (adopter === null) return res.status(404).jsonPretty({
        type: 'error',
        message: `Adopter with id ${id} does not exists`
    })

    // if (!name && !role && !email && !password && !address)
    const isInvalidData = name === undefined
        && address === undefined
        && contact === undefined
    if (isInvalidData) return res.status(400).jsonPretty({
        type: 'error',
        message: 'There is not valid data for update'
    })

    // if (password !== undefined)
    //     req.body.password = await hashPassword(password)
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
