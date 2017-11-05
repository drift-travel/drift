<template>
  <div class="day">
    <header>
      <h3>{{ date | formatDate }}</h3>
    </header>
    <section>
      <plan v-for="plan in plans" v-bind:plan="plan"></plan>
    </section>
    <a class="button button--small button--icon ss-plus" :href="this.newPlanPath">Add Plans</a>
  </div>
</template>

<script>
  import Vue from 'vue';

  import moment from 'moment';

  import Plan from './plan.vue';

  Vue.component('plan');

  export default {
    components: { Plan },

    props: {
      trip: Object,
      date: Object,
      plans: Array
    },

    computed: {
      newPlanPath () {
        return `/trips/${this.trip.permalink}/plans/new?date=${this.date.format('YYYY-MM-DD')}`;
      }
    },

    filters: {
      formatDate (date) {
        return date.format('dddd, MMMM Do YYYY')
      }
    }
  }
</script>

<style lang="sass" scoped>
  @import "~css/_base.sass"

  .day
    border-bottom: 1px solid $color-grey-light
    margin: rhythm(1) rhythm(1) 0
    padding-bottom: rhythm(1)

    &:last-child
      border: none
      padding: 0

    header
      margin-bottom: rhythm(0.5)

    h3
      font-size: $font-size-1
      font-weight: $font-weight-semibold

    section
      display: grid
      grid-template-columns: repeat(4, 1fr)
      grid-gap: rhythm(0.5)
      margin-bottom: rhythm(0.5)
</style>
