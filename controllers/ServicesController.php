<?
include_once ROOT . '/controllers/Controller.php';

class ServicesController extends Controller {

  public function __construct() {
    parent::__construct();
  }

  public function actionIndex() {
    try {
      $this->view->generate('template_view.phtml', 'services/index.phtml');
    } catch (Exception $e) {
      echo $e->getMessage();
    }

    return true;
  }

}