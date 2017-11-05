<template>
  <div class="trip">
    <trip-header v-bind:trip="trip"></trip-header>
    <section>
      <day v-for="date in dates" v-bind:trip="trip" v-bind:date="date" v-bind:plans="plansForDate(date)"></day>
    </section>
  </div>
</template>

<script>
  import Vue from 'vue';

  import Moment from 'moment';
  import { extendMoment } from 'moment-range';

  const moment = extendMoment(Moment);

  import TripHeader from './trip/header.vue';

  import Day from './day.vue';

  Vue.component('trip-header');
  Vue.component('day');

  export default {
    components: { TripHeader, Day },

    props: {
      trip: Object,
      plans: Object
    },

    computed: {
      dates () {
        return Array.from(moment.range(this.trip.start_date, this.trip.end_date).by('days'));
      }
    },

    filters: {
      formatDate (date) {
        return moment(date).format('D MMM')
      }
    },

    methods: {
      plansForDate (date) {
        return this.plans[moment(date).format('YYYY-MM-DD')];
      }
    }
  }
</script>

<style lang="sass" scoped>
  
</style>
