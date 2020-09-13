import TaskLayout from './../layouts/TaskLayout'
import CalculationResult from './CalculationResult'
import axios from "axios";
//import XCONSTANTS from './../../assets/js/xConstants'

export default {
  template: `<task-layout :title="title" :description="description">
              <form>
                <fieldset>
                  <div class="row">
                    <label for="estimated-value">Estimated value of the car (100 - 100 000 EUR)</label>
                    <input type="text" class="form-control" id="estimated-value" v-model="estimatedValue"/>
                  </div>
                  <div class="row">
                    <label for="tax-percentage">Tax percentage (0 - 100%)</label>
                    <input type="text" class="form-control" id="tax-percentage" v-model="taxPercentage"/>
                  </div>
                  <div class="row">
                    <label for="num-of-instalments">Number of instalments (count of payments in which client wants to pay for the policy (1 – 12))</label>
                    <input type="text" class="form-control" id="num-of-instalments" v-model="numOfInstalments"/>
                  </div>
                </fieldset>
              </form>
              <div class="row">
                <button class="btn btn-primary btn-lg" @click="calculate">Calculate</button>
              </div>
              <calculation-result :calculationResult="calculationResult" :taxPercentage="taxPercentage"></calculation-result>
             </task-layout>`,
  components: {
    'task-layout': TaskLayout,
    'calculation-result': CalculationResult
  },
  methods: {
    isNumberOrDot: function(evt) {},
    calculate: function() {
      var formData = {
        estimatedCarPrice: this.estimatedValue,
        taxPercentage: this.taxPercentage,
        numOfInstalments: this.numOfInstalments
      };

      var that = this;
      axios.post('./back-end/api/task-2-insurance-calculator.php', { formData: formData })
           .then(function (response) {
             console.log(response.data);
             that.calculationResult = response.data;
           })
           .catch(function (error) {
            console.log(error.message);
          });
    }
  },
  watch: {
    estimatedValue: function(newVal, oldVal) {
      if(!newVal.match(this.REG_EX_BETWEEN_100_100000_TWO_DECIMALS)) {
        newVal = newVal.slice(0, -1);
      }
      this.estimatedValue = newVal;
    },
    taxPercentage: function(newVal, oldVal) {
      if(!newVal.match(this.REG_EX_BETWEEN_0_100_TWO_DECIMALS)) {
        newVal = newVal.slice(0, -1);
      }
      this.taxPercentage = newVal;
    },
    numOfInstalments: function(newVal, oldVal) {
      if(!newVal.match(this.REG_EX_BETWEEN_1_12_INT)) {
        newVal = newVal.slice(0, -1);
      }
      this.numOfInstalments = newVal;
    }
  },
  data: function() {
    return {
      title: "TASK 2 - Calculator",
      estimatedValue: "100",
      taxPercentage: "0",
      numOfInstalments: 1,
      calculationResult: { carPrice: "", grandTotals: "", instalments: [],  totalBasePrice: "", totalCommision: "", totalTax: "" },
      REG_EX_BETWEEN_100_100000_TWO_DECIMALS: /^100000$|^[1-9]([0-9]{1,4})?(\.\d{0,2})?$/,
      REG_EX_BETWEEN_0_100_TWO_DECIMALS: /^100$|^\d{0,2}(\.\d{0,2})?$/,
      REG_EX_BETWEEN_1_12_INT: /^(1[0-2]|[1-9])$/,
      description: `Write a simple car insurance calculator which will output price of the policy using vanilla PHP and JavaScript
                    <ol>
                      <li>Create HTML form with fields:
                        <ul class="list-group mb-3">
                          <li>Estimated value of the car (100 - 100 000 EUR)</li>
                          <li>Tax percentage (0 - 100%)</li>
                          <li>Number of instalments (count of payments in which client wants to pay for the policy (1 – 12))</li>
                          <li>Calculate button</li>
                        </ul>
                      </li>
                      <li>Build calculator logic in PHP using OOP:
                        <ul class="list-group mb-3">
                          <li>Base price of policy is 11% from entered car value, except every Friday 15-20 o'clock (user time) when it is 13%</li>
                          <li>Commission is added to base price (17%)</li>
                          <li>Tax is added to base price (user entered)</li>
                          <li>Calculate different payments separately (if number of payments are larger than 1)</li>
                          <li>Installment sums must match total policy sum- pay attention to cases where sum does not divide equally</li>
                          <li>Output is rounded to two decimal places</li>
                        </ul>
                      </li>
                      <li>Final output (price matrix):
                        <ul class="list-group mb-3">
                          <li>Base price</li>
                          <li>Price with commission and tax (every instalment separately)</li>
                          <li>Tax amount (separately with every instalment)</li>
                          <li>Grand totals (sum of all instalments): Price with commission and tax, total tax sum</li>
                          <li>Installment sums must match total policy sum- pay attention to cases where sum does not divide equally</li>
                          <li>
                            Example with 2 instalments:</br>
                            <img src="./front-end/assets/imgs/task_2_example.png" class="img-fluid"/>
                          </li>
                        </ul>
                      </li>
                    </ol>`
    }
  }
};
