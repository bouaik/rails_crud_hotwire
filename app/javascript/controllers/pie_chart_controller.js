import { Controller } from "@hotwired/stimulus"
import ApexCharts from "apexcharts"
import { get } from "@rails/request.js"

// Connects to data-controller="pie-chart"
export default class extends Controller {
  static targets = ["chart"]

  static values = {
    data: Array,
    categories: Array
  }

  connect() {
    this.chart = new ApexCharts(this.chartTarget, this.chartOptions)
    this.chart.render()
  }

  get chartOptions() {
    return {
      chart: {
        type: "line",
        height: 400,
        width: 800
      },
      series: [
        {
          name: "sales",
          data: this.dataValue
        }
      ],
      xaxis: {
        categories: this.categoriesValue
      }
    }
  }

  async update(e) {
    const res = await get(`/apex_update/${e.target.value}`)
  }
}
