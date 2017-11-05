<template>
  <header>
    <h2>{{ trip.name }}</h2>
    <p>{{ trip.start_date | formatDate }} &ndash; {{ trip.end_date | formatDate }}</p>
  </header>
</template>

<script>
  import moment from 'moment';

  export default {
    props: {
      trip: Object
    },

    filters: {
      formatDate (date) {
        return moment(date).format('D MMM')
      }
    },
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
