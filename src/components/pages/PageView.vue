<template>
  <section>
    <Navbar/>
    <b-container fluid="" class="mt-4">
      <b-row>
        <b-col md='6'>
          <!-- editor -->
          <b-form-textarea
            type="text"
            placeholder="Enter markdown"
            v-model="content"
            rows="23"
            @keypress="save"
            />
        </b-col>
        <b-col md='6'>
          <!-- preview -->
          <pre class="markdown" v-html="renderedMd"></pre>
        </b-col>
      </b-row>
    </b-container>
  </section>
</template>

<script>
import marked from 'marked'
import axios from 'axios'

import Navbar from '@/components/Navbar'

export default {
  components: {
    Navbar
  },

  data () {
    return {
      name: '',
      content: '',
      placeholder: '### Your md will be rendered here'
    }
  },

  computed: {
    renderedMd () {
      if (this.content === '') {
        return marked(this.placeholder)
      }
      return marked(this.content)
    }
  },

  beforeMount () {
    this.name = this.$route.params.name
    this.getPage()
  },

  methods: {
    save (event) {
      const updated = {name: this.name, content: this.content}
      if (event.key === 'Enter') {
        axios
          .patch(`http://localhost/api/pages/edit/${this.name}`, updated)
          .then((res) => {
            console.log("Page saved successfully!")
          })
          .catch((err) => (console.log(err)))
      }
    },
    getPage () {
      axios
        .get(`http://localhost/api/pages/${this.name}`)
        .then((res) => (this.content = res.data.content))
        .catch((err) => console.log(err))
    }
  }

}
</script>

<style scoped>
  .markdown {
    word-wrap: break-word !important;
  }

  .container-fluid {
    min-height: 80vh;
  }

  textarea.form-control, pre.markdown {
    height: 100% !important;
  }

  pre.markdown {
    font-size: .9em;
  }
</style>
