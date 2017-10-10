<template>
  <div class="trip">
    <header>
      <h2>{{ trip.name }}</h2>
      <p>{{ trip.start_date | formatDate }} &ndash; {{ trip.end_date | formatDate }}</p>
    </header>
    <section>
      <day v-for="date in dates" v-bind:date="date" v-bind:plans="plansForDate(date)"></day>
    </section>
  </div>
</template>

<script>
  import Vue from 'vue';

  import Moment from 'moment';
  import { extendMoment } from 'moment-range';

  const moment = extendMoment(Moment);

  import Day from './day.vue';

  Vue.component('day');

  export default {
    components: { Day },

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
  @import "~css/_base.sass"

  header
    background-image: url(/assets/img/trip-banner-example.jpg), radial-gradient(rgba(65, 65, 65, 0.35), rgba(65, 65, 65, 0.4))
    background-size: cover
    background-position: center center
    background-blend-mode: multiply
    color: $color-white
    text-align: center
    padding: rhythm(3) 0
</style>
