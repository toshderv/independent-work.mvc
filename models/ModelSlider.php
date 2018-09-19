<?
class ModelSlider extends Db {

  public function __construct() {
    parent::__construct();
  }

  public function getSlider() {
    $sql = $this->connection->prepare(
      "SELECT * FROM `Slider`"
    );
    $sql->execute();

    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

}