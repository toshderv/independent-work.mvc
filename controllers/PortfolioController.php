<?
include_once ROOT . '/controllers/Controller.php';

class PortfolioController extends Controller {

  public function __construct() {
    parent::__construct();
  }

  public function actionIndex() {
    try {
      $this->view->generate('template_view.phtml', 'portfolio/index.phtml');
    } catch (Exception $e) {
      echo $e->getMessage();
    }

    return true;
  }

}