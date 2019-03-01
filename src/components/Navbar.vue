<template>
  <b-navbar
    toggleable="lg"
    type="light">
    <b-container fluid>
      <b-navbar-brand

        class="mx-auto"
        :to="{name: 'Landing'}">
        Dontmd
      </b-navbar-brand>
    </b-container>
  </b-navbar>
</template>

<script>
export default {

}
</script>

<style>
  .navbar {
    border-bottom: solid 1px #d5d5d5;
  }
</style>
