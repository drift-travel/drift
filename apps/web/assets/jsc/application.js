import Vue from 'vue';

import ApolloClient, { createBatchingNetworkInterface } from 'apollo-client';

import VueApollo from 'vue-apollo';

import store from './store';

import App from './components/app.vue';

import Trip from './components/trip.vue';
import TripItem from './components/trip-item.vue';

Vue.component('app');
Vue.component('trip');
Vue.component('trip-item');

const apolloClient = new ApolloClient({
  networkInterface: createBatchingNetworkInterface({
    uri: 'http://carto.dev/graphql',
  }),
  connectToDevTools: true,
});

const apolloProvider = new VueApollo({
  defaultClient: apolloClient
});

Vue.use(VueApollo)

const root = new Vue({
  el: '#app',
  store,
  apolloProvider,
  components: { App, Trip, TripItem }
});

root.$mount('#app');
