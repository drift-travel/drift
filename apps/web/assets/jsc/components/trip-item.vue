<template>
  <div class="trip">
    <a :href="`/trips/${trip.permalink}`">
      <h3>{{ trip.name }}</h3>
      <p>{{ trip.start_date | formatDate }} &ndash; {{ trip.end_date | formatDate }}</p>
    </a>
  </div>
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
    }
  }
</script>

<style lang="sass" scoped>
  @import "~css/_base.sass"

  .trip
    background-image: url(https://images.unsplash.com/45/Vo7YbYQQ8iyOo4J9bOoj_ggb24.jpg?dpr=1&auto=compress,format&fit=crop&w=1352&h=&q=80&cs=tinysrgb&crop=), radial-gradient(rgba(65, 65, 65, 0.65), rgba(65, 65, 65, 0.5))
    background-size: cover
    background-position: center center
    background-blend-mode: multiply
    border-radius: $border-radius

    &:hover
      background-color: rgba(65, 65, 65, 0.55)

    a
      align-items: center
      border: none
      height: rhythm(8)
      padding-bottom: rhythm(0.5)
      flex-direction: column
      display: flex
      color: white
      justify-content: flex-end

    h3
      font-weight: $font-weight-semibold

</style>
