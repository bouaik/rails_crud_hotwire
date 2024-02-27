import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  connect() {
    console.log("hello controller")
  }

  async update(e) {
    const res = await get(`/apex_update/${e.target.value}`)
  }
}
