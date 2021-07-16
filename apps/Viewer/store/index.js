// import createLogger from 'vuex/dist/logger'
// export const debug = true
// export const strict = debug
// export const plugins = debug ? [createLogger()] : []

export const state = () => ({
  isInitialize: false,
  queryError: null
})

export const mutations = {
  updateInitialize (state, data) {
    state.isInitialize = data
  },
  updateQueryError (state, data) {
    state.queryError = data
  }
}

export const actions = {
  updateInitialize (context, data) {
    return new Promise((resolve) => {
      context.commit('updateInitialize', data)
      resolve()
    })
  },
  updateQueryError (context, data) {
    return new Promise((resolve) => {
      context.commit('updateQueryError', data)
      resolve()
    })
  }
}
