import { Controller } from "@hotwired/stimulus"
import Highcharts from "highcharts"

// Connects to data-controller="high-chart"
export default class extends Controller {
  static targets = ["chart"]

  static values = {
    name: String,
    data: Array
  }

  connect() {
    Highcharts.chart(this.chartTarget, {
      accessibility: {
        enabled: false
      },
      chart: {
        type: "bar",
        width: 400
      },
      title: {
        text: "Historic World Population by Region",
        align: "left"
      },
      subtitle: {
        text:
          "Source: <a " +
          'href="https://en.wikipedia.org/wiki/List_of_continents_and_continental_subregions_by_population"' +
          'target="_blank">Wikipedia.org</a>',
        align: "left"
      },
      xAxis: {
        categories: ["Africa", "America", "Asia", "Europe"],
        title: {
          text: null
        },
        gridLineWidth: 1,
        lineWidth: 0
      },
      yAxis: {
        min: 0,
        title: {
          text: "Population (millions)",
          align: "high"
        },
        labels: {
          overflow: "justify"
        },
        gridLineWidth: 0
      },
      tooltip: {
        valueSuffix: " millions"
      },
      plotOptions: {
        bar: {
          borderRadius: "50%",
          dataLabels: {
            enabled: true
          },
          groupPadding: 0.1
        }
      },
      // legend: {
      //   layout: "vertical",
      //   align: "right",
      //   verticalAlign: "top",
      //   x: -40,
      //   y: 80,
      //   floating: true,
      //   borderWidth: 1,
      //   backgroundColor:
      //     Highcharts.defaultOptions.legend.backgroundColor || "#FFFFFF",
      //   shadow: true
      // },
      credits: {
        enabled: false
      },
      series: [
        {
          name: this.nameValue,
          data: this.dataValue
        }
        // {
        //   name: "Year 2000",
        //   data: [814, 841, 3714, 726]
        // },
        // {
        //   name: "Year 2018",
        //   data: [1276, 1007, 4561, 746]
        // }
      ]
    })
  }
}
