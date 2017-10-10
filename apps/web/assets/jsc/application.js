import Vue from 'vue';

import store from './store';

import App from './components/app.vue';

import Trip from './components/trip.vue';
import TripItem from './components/trip-item.vue';

Vue.component('app');
Vue.component('trip');
Vue.component('trip-item');

const root = new Vue({
  el: '#app',
  store,
  components: { App, Trip, TripItem }
});

root.$mount('#app');
