<?
include_once ROOT . '/models/ModelForms.php';
include_once ROOT . '/controllers/Controller.php';

class FormsController extends Controller {
  private $formsModel;

  public function __construct() {
    parent::__construct();
    $this->formsModel = new ModelForms();
  }

  public function actionSubscribe() {
    try {
      $this->formsModel->setFormSubscribe();
    } catch (Exception $e) {
      echo $e->getMessage();
    }

    return true;
  }

  public function actionSendmail() {
    try {
      $this->formsModel->setFormSendmail();
    } catch (Exception $e) {
      echo $e->getMessage();
    }

    return true;
  }
  
}