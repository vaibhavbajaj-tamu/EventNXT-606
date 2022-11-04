import IndexController from "controllers/index_controller";

export default class BoxofficeController extends IndexController {
    static values = { eventid: Number};
  
    query() {
      super.query();
    }

    loadHeader() {
      let row = document.querySelector("input#header-line").value
      fetch(`/api/v1/events/${this.eventidValue}/headers/${row}`, {
        headers: {
          "Authorization": "Bearer " + localStorage.getItem("access_token"),
          method: "GET",
        }
      }).then(response => response.json())
      .then(templates => {
        this.createDropdown(document.getElementById("boxoffice-firstName"), 
        document.getElementById("boxoffice-container-firstName"),
        templates.row);
        this.createDropdown(document.getElementById("boxoffice-lastName"), 
        document.getElementById("boxoffice-container-lastName"),
        templates.row);
        this.createDropdown(document.getElementById("boxoffice-email"), 
        document.getElementById("boxoffice-container-email"),
        templates.row);
        this.createDropdown(document.getElementById("boxoffice-seatLevel"), 
        document.getElementById("boxoffice-container-seatLevel"),
        templates.row);
        this.createDropdown(document.getElementById("boxoffice-seats"), 
        document.getElementById("boxoffice-container-seats"),
        templates.row);
      });
  }

  createDropdown(selectElement, divElement, rows) {
    let i = 0;
    selectElement.innerHTML = '';
    for (const val of rows) {
      var option = document.createElement("option");
      option.value = i;
      option.text = val;
      selectElement.appendChild(option);
      i++;
    }
    divElement.appendChild(selectElement);
  }

  loadData(e) {
    var header = document.querySelector("input#header-line").value
  
    var firstName = this.getSelectedID(document.getElementById("boxoffice-firstName"));
    var lastName = this.getSelectedID(document.getElementById("boxoffice-lastName"));
    var email = this.getSelectedID(document.getElementById("boxoffice-email"));
    var seatLevel = this.getSelectedID(document.getElementById("boxoffice-seatLevel"));
    var seats = this.getSelectedID(document.getElementById("boxoffice-seats"));
    
    fetch(`/api/v1/events/${this.eventidValue}/dataload/${header}/${firstName}/${lastName}/${email}/${seatLevel}/${seats}`, {
      headers: {
        "Authorization": "Bearer " + localStorage.getItem("access_token"),
      },
      method: "GET",
    }).then(response => {super.query(); 
    this.dispatch('dataLoaded')});
    
    
  }

  getSelectedID(element){
    var options = element.options;
    return options.selectedIndex;
  }
    
}