<?
include_once ROOT . '/models/ModelSlider.php';
include_once ROOT . '/models/ModelTestimonials.php';
include_once ROOT . '/controllers/Controller.php';

class MainController extends Controller {
  private $sliderModel;
  private $testimonialsModel;

  public function __construct() {
    parent::__construct();
    $this->sliderModel = new ModelSlider();
    $this->testimonialsModel = new ModelTestimonials();
  }

  public function actionIndex() {
    try {
      $this->view->slider = $this->sliderModel->getSlider();
      $this->view->testimonials = $this->testimonialsModel->getTestimonials();

      $this->view->generate('template_view.phtml', 'main/index.phtml');
    } catch (Exception $e) {
      echo $e->getMessage();
    }

    return true;
  }

  public function actionAlternate() {
    try {      
      $this->view->testimonials = $this->testimonialsModel->getTestimonials();
      
      $this->view->generate('template_view.phtml', 'main/alternate.phtml');
    } catch (Exception $e) {
      echo $e->getMessage();
    }

    return true;
  }
  
}