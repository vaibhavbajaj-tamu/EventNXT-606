import IndexController from "controllers/index_controller";

export default class GuestController extends IndexController {
  static targets = [ 'tooltip' ];

  query() {
    super.query();
    // this.adjust();
    globalThis.a = this;
    console.log(this);
    console.log(this.hasTooltipTarget);
    console.log(this.tooltipTargets);
    console.log(super.templateTarget);
  }

  postProcess() {
    this.genTooltips();
    this.handleBookStatus();
  }

  genTooltips() {
    for (const dom of this.tooltipTargets) {
      if (dom.childNodes.length === 0) {
        dom.remove();
        continue;
      }

      //let tooltip = new bootstrap.Tooltip(dom, {boundary: document.body});
      dom.setAttribute('data-bs-toggle', 'tooltip');
      dom.setAttribute('data-bs-placement', 'top');
      dom.title = dom.textContent;
      dom.textContent = '';
    }
  }

  handleBookStatus() {
    for (const dom of this.element.querySelectorAll('.booked')) {
      console.log(dom)
      if (dom.textContent === 'false')
        dom.remove();
      else {
        dom.textContent = '';
        dom.title = 'booked';
      }
    }
  }

  handleAddedBy() {
    for (const dom of this.element.querySelectorAll('.booked'));
  }

  get indexController() {
    return this.application.getControllerForElementAndIdentifier(this.element, "index")
  }
}