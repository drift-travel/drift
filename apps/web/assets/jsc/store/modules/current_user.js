const state = {
  current_user: {}
};

const getters = {
  current_user: state => state.current_user,
  authenticated: state => state.current_user != {}
};

const mutations = {
  setCurrentUser (state, user) {
    state.current_user = user;
  }
};

const actions = {
  setCurrentUser ({ dispatch }, user) {
    dispatch('SET_CURRENT_USER', user)
  }
};

export default {
  state,
  getters,
  mutations,
  actions
};
