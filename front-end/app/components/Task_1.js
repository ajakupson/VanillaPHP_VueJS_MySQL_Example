import TaskLayout from './../layouts/TaskLayout'

export default {
  template: `<task-layout :title="title" :description="description">
              <div class="col-4 themed-grid-col"><br/><strong>{{ binaryToHumanReadableString }}</strong><br/></div>
             </task-layout>`,
  components: {
    'task-layout': TaskLayout
  },
  data: function() {
    return {
      title: "TASK 1 - Name",
      description: '01110000 01110010 01101001 01101110 01110100 00100000 01101111 01110101 ' +
                   '01110100 00100000 01111001 01101111 01110101 01110010 00100000 01101110 ' +
                   '01100001 01101101 01100101 00100000 01110111 01101001 01110100 01101000 ' +
                   '00100000 01101111 01101110 01100101 00100000 01101111 01100110 00100000 ' +
                   '01110000 01101000 01110000 00100000 01101100 01101111 01101111 01110000 ' +
                   '01110011'
    }
  },
  computed: {
    binaryToHumanReadableString: function() {
      var binCodeArray = this.description.split(" ");
      var humanReadableCharsArray = [];

      for (var i = 0; i < binCodeArray.length; i++) {
        humanReadableCharsArray.push(String.fromCharCode(parseInt(binCodeArray[i], 2)));
      }
      humanReadableCharsArray[0] = humanReadableCharsArray[0].toUpperCase();
      return humanReadableCharsArray.join("");
    }
  }
};
