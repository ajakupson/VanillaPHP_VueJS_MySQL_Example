export default {
  template: `<div class="table-responsive row calculation-table-container">
              <table class="table table-striped table-sm" v-bind:calculationResult="calculationResult">
                <thead>
                  <tr>
                    <th></th>
                    <th class="bold text-right">Policy</th>
                    <th v-for="(instalment, instalmentIndx) in calculationResult.instalments" class="bold text-right">
                      {{ instalmentIndx + 1}} instalment
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-left">Value</td><td>{{ calculationResult.carPrice }}</td>
                    <td v-for="(instalment, instalmentIndx) in calculationResult.instalments"></td>
                  </tr>
                  <tr>
                    <th v-bind:basePricePrcntg="basePricePrcntg">Base premium ({{ basePricePrcntg * 100 }}%)</th><td>{{ calculationResult.totalBasePrice }}</td>
                    <td v-for="(instalment, instalmentIndx) in calculationResult.instalments">
                      {{ instalment.basePremium }}
                    </td>
                  </tr>
                  <tr>
                    <th>Commission (17%)</th><td>{{ calculationResult.totalCommision }}</td>
                    <td v-for="(instalment, instalmentIndx) in calculationResult.instalments">
                      {{ instalment.commission }}
                    </td>
                  </tr>
                  <tr>
                    <th v-bind:taxPercentage="taxPercentage">Tax ({{ taxPercentage }}%)</th><td>{{ calculationResult.totalTax }}</td>
                    <td v-for="(instalment, instalmentIndx) in calculationResult.instalments">
                      {{ instalment.tax }}
                    </td>
                  </tr>
                  <tr>
                    <th class="bold">Total cost</th><td><b>{{ calculationResult.grandTotals }}</b></td>
                    <td v-for="(instalment, instalmentIndx) in calculationResult.instalments">
                      {{ instalment.grandTotals }}
                    </td>
                  </tr>
                </tbody>
              </table>
              <div class="free-space"></div>
             </div>`,
  props: {
    calculationResult: {
      type: Object,
      required: true
    },
    taxPercentage: {
      type: String,
      required: true
    },
    basePricePrcntg: {
      type: Number,
      required: true
    }
  },
};
