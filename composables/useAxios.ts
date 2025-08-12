import axios from 'axios'

export const useAxios = () => {

    const api = axios.create({
        baseURL: 'https://palveserver.hstplanet.com/api/',
        headers: {
            'Content-Type': 'application/json'
        }
    })

    return api;
}