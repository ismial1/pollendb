import { defineStore } from 'pinia'
import { useAxios } from '~/composables/useAxios'

// You can name the return value of `defineStore()` anything you want,
// but it's best to use the name of the store and surround it with `use`
// and `Store` (e.g. `useUserStore`, `useCartStore`, `useProductStore`)
// the first argument is a unique id of the store across your application
export const usePolenStore = defineStore('polen', {
    state: () => ({ 
        polen: [],
        properties: {} as PolenProperty,
        loading: false,
    }),
    getters: {
      getPolenProperties : (state) => state.properties,
    },
    actions: {
      async findAllProperties() {
        this.loading = true;
        useAxios().get('/polen/Properties').then((response) => {
            this.properties = response.data;
            this.loading = false;
        }).catch((error) => {
            console.log(error);
            this.loading = false;
        });
      },
    },
})