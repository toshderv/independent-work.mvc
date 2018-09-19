<?
include_once ROOT . '/models/ModelTestimonials.php';
include_once ROOT . '/controllers/Controller.php';

class AboutController extends Controller {
  private $testimonialsModel;

  public function __construct() {
    parent::__construct();
    $this->testimonialsModel = new ModelTestimonials();
  }

  public function actionIndex() {
    try {
      $this->view->testimonials = $this->testimonialsModel->getTestimonials();
      
      $this->view->generate('template_view.phtml', 'about/index.phtml');
    } catch (Exception $e) {
      echo $e->getMessage();
    }

    return true;
  }

}