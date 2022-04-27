import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'destroy' ];
  static values = { url: String };

  destroy() {
    if (this.destroyTargets.length > 0) {
      this.destroyTargets.forEach( elem => {
        if (elem.checked)
          fetch(`${this.urlValue}/${elem.value}`, {
            method: 'DELETE'
          }).then(response => this.indexController.query())
      })
    }
  }

  destroyByValue(e) {
    let elem = e.currentTarget;
    if (elem.value === '')
      return;
    fetch(`${this.urlValue}/${elem.value}`, {
      method: 'DELETE'
    }).then(response => this.indexController.query())
  }

  get indexController() {
    return this.application.getControllerForElementAndIdentifier(this.element, "index")
  }
}