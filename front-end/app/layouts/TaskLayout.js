export default {
  template: `<div class="container">
              <h1 v-bind:title="title">{{ title }}</h1>
              <div class="container" v-html:description="description">{{ description }}</div>
              <slot></slot>
             </div>`,
  props: {
    title: {
      type: String,
      required: true
    },
    description: {
      type: String,
      required: false
    }
  }
};
