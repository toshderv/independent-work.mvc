<?
include_once ROOT . '/models/ModelPricing.php';
include_once ROOT . '/controllers/Controller.php';

class PricingController extends Controller {
  private $pricingModel;

  public function __construct() {
    parent::__construct();
    $this->pricingModel = new ModelPricing();
  }

  public function actionTables() {
    try {
      $this->view->sectionOne = $this->pricingModel->getSectionOne();
      $this->view->sectionTwo = $this->pricingModel->getSectionTwo();
      // var_dump($this->view);die;

      $this->view->generate('template_view.phtml', 'pricing/tables.phtml');
    } catch (Exception $e) {
      echo $e->getMessage();
    }

    return true;
  }

}