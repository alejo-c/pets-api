import { AdoptionRequest, getRequest, formatRequest } from '../models/adoption-request-model.js'
import { getPet } from '../models/pet-model.js'
import { getAdopter } from '../models/adopter-model.js'

export const createRequest = async (req, res) => {
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

    const request = await AdoptionRequest.create(req.body)
    pet.update({ adoption_status: '2' })

    res.status(201).jsonPretty({
        type: 'success',
        message: `Adoption request [${request.id}] created successfully`,
        adoptionRequest: formatRequest(request)
    })
}

export const readRequests = async (req, res) => {
    let requests = await AdoptionRequest.findAll()
    const length = requests.length
    requests = requests.map(request => formatRequest(request))

    if (length == 0)
        return res.status(500).jsonPretty({
            type: 'error', message: 'There is no adoption requests', length
        })
    res.status(200).jsonPretty({ adoptionRequests: requests, length })
}

export const readRequest = async (req, res) => {
    const id = req.params.id
    const request = await getRequest(id)

    if (request == null)
        return res.status(404).jsonPretty({
            type: 'error', message: `Adoption request [${id}] not found`
        })
    res.status(200).jsonPretty({ adoptionRequest: formatRequest(request) })
}

export const updateRequest = async (req, res) => {
    const id = req.params.id
    const { status, ...body } = req.body

    if (!body.pet_id && !body.adopter_id)
        return res.status(400).jsonPretty({
            type: 'error', message: 'There is not valid data for update'
        })

    const request = await getRequest(id)
    if (request == null)
        return res.status(404).jsonPretty({
            type: 'error', message: `Adoption request [${id}] does not exists`
        })

    request.update(body)
    res.status(200).jsonPretty({
        type: 'success',
        message: `Adoption request [${id}] updated successfully`,
        adoptionRequest: formatRequest(request)
    })
}

export const approveRequest = async (req, res) => {
    const id = req.params.id

    const request = await getRequest(id)
    if (request == null)
        return res.status(404).jsonPretty({
            type: 'error', message: `Adoption request [${id}] does not exists`
        })

    const pet = await getPet(request.pet_id)
    pet.update({ adoption_status: '3' })
    request.update({ status: '4' })

    res.status(200).jsonPretty({
        type: 'success',
        message: `Adoption request [${id}] approved successfully`,
        adoptionRequest: formatRequest(request)
    })
}

export const rejectRequest = async (req, res) => {
    const id = req.params.id

    const request = await getRequest(id)
    if (request == null)
        return res.status(404).jsonPretty({
            type: 'error', message: `Adoption request [${id}] does not exists`
        })

    const pet = await getPet(request.pet_id)
    pet.update({ adoption_status: '1' })
    request.update({ status: '5' })

    res.status(200).jsonPretty({
        type: 'success',
        message: `Adoption request [${id}] rejected successfully`,
        adoptionRequest: formatRequest(request)
    })
}

export const deleteRequest = async (req, res) => {
    const id = req.params.id
    const request = await getRequest(id)

    if (request == null)
        return res.status(404).jsonPretty({
            type: 'error', message: `Adoption request [${id}] does not exists`
        })

    request.destroy()
    res.status(200).jsonPretty({
        type: 'success',
        message: `Adoption request [${id}] deleted successfully`,
        adoptionRequest: formatRequest(request)
    })
}