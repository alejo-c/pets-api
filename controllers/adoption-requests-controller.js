import { AdoptionRequest, getAdoptionRequest, formatAdoptionRequest } from '../models/adoption-request-model.js'
import { formatPet, getPet } from '../models/pet-model.js'
import { getAdopter } from '../models/adopter-model.js'

export const createAdoptionRequest = async (req, res) => {
    const petId = req.body.pet_id
    const adopterId = req.body.adopter_id
    const pet = await getPet(petId)
    const adopter = await getAdopter(adopterId)

    if (petId == undefined)
        return res.status(400).jsonPretty({ type: 'error', message: 'The pet id is required' })
    if (adopterId == undefined)
        return res.status(400).jsonPretty({ type: 'error', message: 'The adopter id is required' })
    if (pet == null)
        return res.status(404).jsonPretty({ type: 'error', message: `Pet [${id}] not found` })
    if (adopter == null)
        return res.status(404).jsonPretty({ type: 'error', message: `Adopter [${id}] not found` })

    const adoptionRequest = await AdoptionRequest.create(req.body)
    pet.update({ adoption_status: '2' })

    res.status(201).jsonPretty({
        type: 'success',
        message: `Adoption request [${adoptionRequest.id}] created successfully`,
        adoptionRequest: formatAdoptionRequest(adoptionRequest)
    })
}

export const readAdoptionRequests = async (req, res) => {
    const adoptionRequests = await AdoptionRequest.findAll()
    const length = adoptionRequests.length

    if (length == 0)
        return res.status(500).jsonPretty({
            type: 'error',
            message: 'There is no adoption requests',
            length
        })
    res.status(200).jsonPretty({ adoptionRequests, length })
}

export const readAdoptionRequest = async (req, res) => {
    const id = req.params.id
    const adoptionRequest = await getAdoptionRequest(id)

    if (adoptionRequest == null)
        return res.status(404).jsonPretty({
            type: 'error',
            message: `Adoption request [${id}] not found`
        })
    res.status(200).jsonPretty({ adoptionRequest: formatAdoptionRequest(adoptionRequest) })
}

export const updateAdoptionRequest = async (req, res) => {
    const id = req.params.id
    const { status, ...body } = req.body

    if (!body.pet_id && !body.adopter_id)
        return res.status(400).jsonPretty({
            type: 'error',
            message: 'There is not valid data for update'
        })

    const adoptionRequest = await getAdoptionRequest(id)
    if (adoptionRequest == null)
        return res.status(404).jsonPretty({
            type: 'error',
            message: `Adoption request [${id}] does not exists`
        })

    adoptionRequest.update(body)
    res.status(200).jsonPretty({
        type: 'success',
        message: `Adoption request [${id}] updated successfully`,
        adoptionRequest: formatAdoptionRequest(adoptionRequest)
    })
}

export const approveAdoptionRequest = async (req, res) => {
    const id = req.params.id

    const adoptionRequest = await getAdoptionRequest(id)
    if (adoptionRequest == null)
        return res.status(404).jsonPretty({
            type: 'error',
            message: `Adoption request [${id}] does not exists`
        })

    const pet = await getPet(adoptionRequest.pet_id)
    pet.update({ adoption_status: '3' })
    adoptionRequest.update({ status: '4' })

    res.status(200).jsonPretty({
        type: 'success',
        message: `Adoption request [${id}] approved successfully`,
        adoptionRequest: formatAdoptionRequest(adoptionRequest)
    })
}

export const rejectAdoptionRequest = async (req, res) => {
    const id = req.params.id

    const adoptionRequest = await getAdoptionRequest(id)
    if (adoptionRequest == null)
        return res.status(404).jsonPretty({
            type: 'error',
            message: `Adoption request [${id}] does not exists`
        })

    const pet = await getPet(adoptionRequest.pet_id)
    pet.update({ adoption_status: '1' })
    adoptionRequest.update({ status: '5' })

    res.status(200).jsonPretty({
        type: 'success',
        message: `Adoption request [${id}] rejected successfully`,
        adoptionRequest: formatAdoptionRequest(adoptionRequest)
    })
}

export const deleteAdoptionRequest = async (req, res) => {
    const id = req.params.id
    const adoptionRequest = await getAdoptionRequest(id)

    if (adoptionRequest == null)
        return res.status(404).jsonPretty({
            type: 'error',
            message: `Adoption request [${id}] does not exists`
        })

    adoptionRequest.destroy()
    res.status(200).jsonPretty({
        type: 'success',
        message: `Adoption request [${id}] deleted successfully`,
        adoptionRequest: formatAdoptionRequest(adoptionRequest)
    })
}