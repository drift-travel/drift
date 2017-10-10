<template>
  <header class="header">
    <h1 class="header__logo">
      <a href="/">Carto</a>
      <span class="header__toggle" @click="handleToggle" v-if="mobile"><a>&plus;</a></span>
    </h1>
    <nav class="nav header__nav header__nav--primary" v-if="navShowing">
      <slot name="nav-primary"></slot>
    </nav>
    <nav class="nav header__nav header__nav--secondary" v-if="navShowing">
      <slot name="nav-secondary"></slot>
    </nav>
  </header>
</template>

<script>
  import { mapGetters } from 'vuex';

  export default {
    data () {
      return {
        navToggled: false
      };
    },

    computed: {
      ...mapGetters({
        mobile: 'mobile'
      }),

      navShowing () {
        let mobile = document.documentElement.clientWidth <= 960;

        return (mobile && this.navToggled) || !mobile;
      }
    },

    methods: {
      handleToggle () {
        this.navToggled = !this.navToggled;
      }
    }
  };
</script>
</script>

<style lang="sass" scoped>
  @import "~css/_base.sass"

  .header
    +container

    grid-template-areas: "logo nav--primary nav--secondary"
    line-height: $line-height-normal
    margin-bottom: rhythm(0.5)
    margin-top: rhythm(0.75)
    margin-left: rhythm(1)
    margin-right: rhythm(1)

    @media (max-width: $breakpoint)
      grid-template-areas: "logo" "nav--primary" "nav--secondary"

    &__logo
      display: flex
      flex-direction: row
      grid-area: logo
      grid-column: 1 / 3
      grid-row: 1
      font-weight: $font-weight-semibold
      font-size: $font-size-1

      @media (max-width: $breakpoint)
        grid-column: 1 / 13

      a
        border: none
        color: $color-text-dark

    &__nav
      font-size: $font-size-n1

      @media (max-width: $breakpoint)
        display: block
        text-align: left !important
        width: 100%

      a
        border: none
        color: $color-grey
        transition: color 0.1s linear

        &:hover
          color: $color-text

      &--primary
        grid-area: nav--primary
        grid-column: 3 / 7

        @media (max-width: $breakpoint)
          grid-column: 1 / 13

      &--secondary
        grid-area: nav--secondary
        grid-column: 7 / 13
        text-align: right

        @media (max-width: $breakpoint)
          grid-column: 1 / 13

    &__toggle
      display: block
      flex: 1
      text-align: right
      border: none
      cursor: pointer
      font-weight: $font-weight-semibold
      font-size: $font-size-2
</style>
