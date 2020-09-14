import TaskLayout from './../layouts/TaskLayout'

export default {
  template: `<task-layout :title="title" :description="description">
             <div class="row"><img src="./front-end/assets/imgs/database.png" class="db-image"></div>
             <slot><slot>
             </task-layout>`,
  components: {
    'task-layout': TaskLayout
  },
  data: function() {
    return {
      title: "TASK 3 - Store employee data",
      description: `<ol>
                      <li>Create a database structure to store employee information. The information stored is as follows:
                        <ul class="list-group mb-3">
                          <li>Name</li>
                          <li>Birthdate</li>
                          <li>ID code / SSN</li>
                          <li>Is a current employee (yes/no)</li>
                          <li>Contact information (e-mail, phone, address)</li>
                          <h4>The following information in English, Spanish and French:</h4>
                          <li>Introduction</li>
                          <li>Previous work experience</li>
                          <li>Education information</li>
                          <h4>Log info:</h4>
                          <li>Who and when created the entry</li>
                          <li>Who and when last modified the data</li>
                        </ul>
                      </li>
                      <li>The information should be presented as an .sql file which can be imported into a MySQL database without errors.</li>
                      <li>Write example query to get 1-person data in all languages</li>
                      <li>Add test data for one customer into database</li>
                    </ol>`
    }
  }
};
