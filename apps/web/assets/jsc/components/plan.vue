<template>
  <div class="plan">
    <header>
      <i class="ss-icon" v-if="plan.type === 'activity'">map</i>
      <i class="ss-icon" v-if="plan.type === 'flight'">&#9992;</i>
      <h4>
        <span>{{ plan.canonical_start | formatTime }}</span>
        <template v-if="plan.canonical_end">
          &ndash;
          <span>
            {{ plan.canonical_end | formatTime }}
            <sup v-if="zoneOffset != 0">
              {{ zoneOffset }}
            </sup>
          </span>
        </template>
      </h4>
    </header>
    <section>
      {{ plan.description }}
    </section>
  </div>
</template>

<script>
  import moment from 'moment-timezone/builds/moment-timezone-with-data-2012-2022.min.js';

  export default {
    props: {
      plan: Object
    },

    filters: {
      formatTime (time) {
        return moment(time.time).tz(time.zone).format('h:mma')
      }
    },

    computed: {
      zoneOffset () {
        if (this.plan.canonical_start === undefined || this.plan.canonical_end === undefined) {
          return 0;
        }

        const now = moment.utc();

        const start_offset = moment.tz.zone(this.plan.canonical_start.zone).offset(now);
        const end_offset = moment.tz.zone(this.plan.canonical_end.zone).offset(now);

        return ((start_offset - end_offset) / 60);
      }
    }
  }
</script>

<style lang="sass" scoped>
  @import "~css/_base.sass"

  .plan
    header
      background: $color-grey-light
      border-radius: $border-radius $border-radius 0 0
      color: $color-grey-dark
      font-size: $font-size-n1
      font-weight: $font-weight-semibold
      padding: rhythm(0.25) rhythm(0.5)
      text-transform: uppercase

      i, h4
        display: inline-block

      i
        margin-right: 3px
        vertical-align: middle

    section
      background: $color-grey-lightest
      border-radius: 0 0 $border-radius $border-radius
      padding: rhythm(0.5)
</style>
