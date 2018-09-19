<?
class ModelPricing extends Db {

  public function __construct() {
    parent::__construct();
  }

  public function getSectionOne() {
    $sectionNumber = 1;
    
    $sql = $this->connection->prepare(
      "SELECT * FROM `Pricing` WHERE section = :number"
    );
    $sql->bindParam(':number', $sectionNumber, PDO::PARAM_INT);
    $sql->execute();

    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function getSectionTwo() {
    $sectionNumber = 2;

    $sql = $this->connection->prepare(
      "SELECT * FROM `Pricing` WHERE section = :number"
    );
    $sql->bindParam(':number', $sectionNumber, PDO::PARAM_INT);
    $sql->execute();

    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

}