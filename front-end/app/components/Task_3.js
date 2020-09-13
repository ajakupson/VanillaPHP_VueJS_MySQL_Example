import TaskLayout from './../layouts/TaskLayout'

export default {
  template: `<task-layout :title="title" :description="description">
             </task-layout>`,
  components: {
    'task-layout': TaskLayout
  },
  data: function() {
    return {
      title: "TASK 3 - Store employee data",
      description: ''
    }
  }
};
