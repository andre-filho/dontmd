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
      <div class="text-center my-3">
        <span v-b-tooltip.hover title="Your page is saved when 'Enter' key is pressed">
          <font-awesome-icon icon="question-circle"/>
        </span>
      </div>
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
    padding-bottom: 0;
    padding-top: 0;
  }
</style>
