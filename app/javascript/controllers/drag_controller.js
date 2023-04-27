import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'

// Connects to data-controller="drag"
export default class extends Controller {
  connect() {
    console.log("connected");
    console.log(Sortable); 
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  }
  end(event) {
    const categoryId = event.item.dataset.id
    console.log(`Category ${categoryId} moved`)
  }
}