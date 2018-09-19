<?
class ModelTestimonials extends Db {

  public function __construct() {
    parent::__construct();
  }

  public function getTestimonials() {
    $sql = $this->connection->prepare(
      "SELECT * FROM `Testimonials`"
    );
    $sql->execute();

    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

}