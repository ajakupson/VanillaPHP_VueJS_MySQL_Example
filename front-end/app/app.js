import Task_1 from './components/Task_1'
import Task_2 from './components/Task_2'
import Task_3 from './components/Task_3'

var app = new Vue({
    el: '#app',
    components: {
      'task-1-name': Task_1,
      'task-2-calculator': Task_2,
      'task-3-mysql': Task_3,
    },
    created: function () {
      console.log("app launched");
    },
    data: {
    }
});
