<template>
  <footer class="footer">
      <aside class="footer__copyright">
        <p>&copy; {{ currentYear }} Carto</p>
      </aside>
      <nav class="nav footer__nav">
        <ul class="nav__list">
          <li class="nav__item"><a class="nav__link" href="#">Blog</a></li>
          <li class="nav__item"><a class="nav__link" href="#">Support</a></li>
          <li class="nav__item"><a class="nav__link" href="#">Terms</a></li>
          <li class="nav__item"><a class="nav__link" href="#">Privacy</a></li>
          <li class="nav__item"><a class="nav__link" href="#">API</a></li>
          <li class="nav__item"><a class="nav__link" href="#">Contact</a></li>
        </ul>
      </nav>
    </footer>
</template>

<script>
  import { mapGetters } from 'vuex';

  export default {
    computed: {
      currentYear () {
        return (new Date()).getFullYear();
      }
    }
  };
</script>
</script>

<style lang="sass" scoped>
  @import "~css/_base.sass"

  .footer
    +container

    grid-template-areas: "copyright nav"
    font-size: $font-size-n1
    margin-bottom: rhythm(0.5)
    margin-top: rhythm(2)

    @media (max-width: $breakpoint)
      grid-template-areas: "nav" "copyright"

    a
      border: none
      color: $color-grey
      transition: color 0.1s linear

      &:hover
        color: $color-text

    &__copyright
      grid-area: copyright
      grid-column: 1 / 3

      @media (max-width: $breakpoint)
        grid-column: 1 / 13

    &__nav
      grid-area: nav
      grid-column: 3 / 13
      text-align: right

      @media (max-width: $breakpoint)
        grid-column: 1 / 13
        text-align: left
</style>
