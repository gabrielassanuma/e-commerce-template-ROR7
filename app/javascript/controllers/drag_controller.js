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
    let id = event.item.dataset.id
    let data = new FormData()
    data.append("position", event.newIndex + 1)

    Rails.ajax({
      url: this.data.get('url').replace(":id", id),
      type: 'PATCH',
      data: data
    })
  }
}