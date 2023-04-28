import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'


// Connects to data-controller="drag"
export default class extends Controller {
  connect() {
    console.log("connected");
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  }
  end(event) {
    console.log(event)
  }
}