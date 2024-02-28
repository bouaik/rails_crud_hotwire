import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  connect() {}

  async updateApex(e) {
    const res = await get(`/apex_update/${e.target.value}`)
  }

  async updateHigh(e) {
    const res = await get(`/highcharts_update/${e.target.value}`)
  }
}
