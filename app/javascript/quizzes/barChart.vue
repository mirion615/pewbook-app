<script>
import { Bar } from "vue-chartjs";

export default {
  extends: Bar,
  props: {
    chartData: {
      type: Object,
      default: null
    }
  },
  methods: {
    renderBarChart() {this.renderChart(this.chartData,{scales: {yAxes: [{ticks: {beginAtZero: true,min: 0,max: 10 }}]}});},
  }
}
</script>