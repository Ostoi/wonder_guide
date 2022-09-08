import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ['bar']
  connect() {
    console.log('hello')
  }

  expand(event) {
    event.preventDefault()
    this.barTarget.classList.toggle('opacity-0')
  }
}
