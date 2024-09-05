import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"

export default class extends Controller {

  static targets = ["start", "end"]

  connect() {
   this.startPicker = flatpickr(this.startTarget, {
      minDate: new Date()
    })

    this.endPicker = flatpickr(this.endTarget, {
      minDate: new Date()
    })
  }

  setDate() {
    this.endPicker.set("minDate", this.startPicker.selectedDates[0])
  }
}
