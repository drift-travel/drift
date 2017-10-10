import Vue from 'vue';
import Vuex from 'vuex';

import mobile from './modules/mobile';
import current_user from './modules/current_user';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: [mobile, current_user],
  strict: true
});
