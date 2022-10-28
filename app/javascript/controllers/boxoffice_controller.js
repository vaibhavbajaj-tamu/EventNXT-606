import IndexController from "controllers/index_controller";

export default class BoxofficeController extends IndexController {
    static targets = [ 'add', 'seat', 'tooltip' ];
    static values = { seaturl: String };
  
    query() {
      super.query();
    }

    loadData(){
        sss
    }
}