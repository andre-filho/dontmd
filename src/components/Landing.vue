<template>
  <section class="">
    <b-container class="text-center">
      <h1>
        Dontmd
      </h1>
      <h2>
        {{ randomGreeting }}
      </h2>
      <b-row>
        <b-col md='8' offset-md="2" class="my-5">
          <div @keydown.enter="createPage">
            <b-input-group prepend="dontmd.com/">
              <b-form-input
                v-model="pagename"
                placeholder="Type the name of the page you want to create"/>
              <b-input-group-append>
                <b-button
                  @click="createPage"
                  variant="secondary">
                  Create
                </b-button>
              </b-input-group-append>
            </b-input-group>
          </div>
        </b-col>
      </b-row>
    </b-container>
    <h5 class="small text-muted text-center">
      Powered by Vue.js, Express and tons of coffee
    </h5>
    <h5 class="small text-muted text-center">
      <a href="https://github.com/andre-filho/dontmd" class="text-muted">View on GitHub</a>
    </h5>
  </section>
</template>

<script>
import axios from 'axios'

export default {
  data () {
    return {
      pagename: '',

      listOfGreetings: [
        'So, you\'re in a hurry huh',
        'Markdown on a budget',
        'Making your day great again',
        'Fast documentation for your git repo\'s wiki coming right up!',
        '"You are special, you can make it in time!" - Mom',
        'Markdown on the way',
        'Easy and simple... I was talking about md',
        'It is rare but happens a lot. - Chiqui'
      ],

      attemptsOnBlankPage: 0
    }
  },

  computed: {
    randomGreeting: function () {
      return this.randomizeGreeting()
    }
  },

  methods: {
    randomizeGreeting () {
      let index = Math.floor(Math.random() * this.listOfGreetings.length)

      return this.listOfGreetings[index]
    },

    createPage () {
      if (this.pagename === '' || this.pagename === null) {
        if (this.attemptsOnBlankPage < 6) {
          this.attemptsOnBlankPage++
          alert('Please give your page a name')
        } else {
          this.attemptsOnBlankPage = 0
          alert('Goddamn dude! Can\'t you read?! Name that fucking page!!!')
        }
      }

      const page = {name: this.pagename, content: ''}

      axios
        .post('http://localhost/api/pages', page)
        .then((res) => {
          if (res.status === 201) {
            console.log('created')
          }
        })
        .catch((err) => {
          console.log(err)
        })
      this.$router.push({name: 'ShowPage', params: {name: this.pagename}})
    }
  }
}
</script>

<style scoped>
  section {
    padding: 5em 0;
  }

  .container {
    padding-top: 3em;
  }
</style>
