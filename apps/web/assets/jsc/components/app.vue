<template>
  <div id="carto">
    <app-header>
      <ul class="nav__list" slot="nav-primary">
        <li class="nav__item"><a class="nav__link" href="/trips">Trips</a></li>
        <li class="nav__item"><a class="nav__link" href="/destinations">Destinations</a></li>
      </ul>
      <ul class="nav__list" slot="nav-secondary">
        <li class="nav__item"><a class="nav__link" href="/account">Account</a></li>
        <li class="nav__item"><a class="nav__link" href="/logout">Logout</a></li>
      </ul>
    </app-header>
    <slot name="content"></slot>
    <app-footer></app-footer>
  </div>
</template>

<script>
  import Vue from 'vue';

  import { mapMutations, mapGetters } from 'vuex';

  import AppHeader from './app/header.vue';
  import AppFooter from './app/footer.vue';

  Vue.component('app-header');
  Vue.component('app-footer');

  export default {
    components: { AppHeader, AppFooter },

    props: {
      user: {
        type: Object,
        default: new Object
      }
    },

    computed: {
      ...mapGetters({
        mobile: 'mobile',
        current_user: 'current_user',
        authenticated: 'authenticated'
      })
    },

    mounted () {
      window.addEventListener('resize', this.handleResize);

      this.handleResize();

      this.setCurrentUser(this.current_user);
    },

    beforeDestroy () {
      window.removeEventListener('resize', this.handleResize);
    },

    methods: {
      ...mapMutations([
        'handleResize',
        'setCurrentUser'
      ]),
    }
  };
</script>

<style lang="sass">
  @import "~css/_base.sass"

  body
    border-top: rhythm(0.25) solid $color-grey-lightest

  #carto
    +font-smoothing

    display: flex
    flex-direction: column
    font-family: $font-family-sans-serif
    font-size: $font-size-base
    line-height: $line-height-base
    min-height: 100vh

  a
    border-bottom: 2px solid $color-grey
    color: $color-text
    text-decoration: none

    &:hover
      border: none

  main
    flex: 1

  h2
    font-size: $font-size-4
    font-weight: $font-weight-semibold
</style>
