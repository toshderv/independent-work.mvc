<?
class ModelForms extends Db {

  public function __construct() {
    parent::__construct();
  }
  
  // Email address verification
  private function isEmail($email) {
    return(preg_match("/^[-_.[:alnum:]]+@((([[:alnum:]]|[[:alnum:]][[:alnum:]-]*[[:alnum:]])\.)+(ad|ae|aero|af|ag|ai|al|am|an|ao|aq|ar|arpa|as|at|au|aw|az|ba|bb|bd|be|bf|bg|bh|bi|biz|bj|bm|bn|bo|br|bs|bt|bv|bw|by|bz|ca|cc|cd|cf|cg|ch|ci|ck|cl|cm|cn|co|com|coop|cr|cs|cu|cv|cx|cy|cz|de|dj|dk|dm|do|dz|ec|edu|ee|eg|eh|er|es|et|eu|fi|fj|fk|fm|fo|fr|ga|gb|gd|ge|gf|gh|gi|gl|gm|gn|gov|gp|gq|gr|gs|gt|gu|gw|gy|hk|hm|hn|hr|ht|hu|id|ie|il|in|info|int|io|iq|ir|is|it|jm|jo|jp|ke|kg|kh|ki|km|kn|kp|kr|kw|ky|kz|la|lb|lc|li|lk|lr|ls|lt|lu|lv|ly|ma|mc|md|mg|mh|mil|mk|ml|mm|mn|mo|mp|mq|mr|ms|mt|mu|museum|mv|mw|mx|my|mz|na|name|nc|ne|net|nf|ng|ni|nl|no|np|nr|nt|nu|nz|om|org|pa|pe|pf|pg|ph|pk|pl|pm|pn|pr|pro|ps|pt|pw|py|qa|re|ro|ru|rw|sa|sb|sc|sd|se|sg|sh|si|sj|sk|sl|sm|sn|so|sr|st|su|sv|sy|sz|tc|td|tf|tg|th|tj|tk|tm|tn|to|tp|tr|tt|tv|tw|tz|ua|ug|uk|um|us|uy|uz|va|vc|ve|vg|vi|vn|vu|wf|ws|ye|yt|yu|za|zm|zw)$|(([0-9][0-9]?|[0-1][0-9][0-9]|[2][0-4][0-9]|[2][5][0-5])\.){3}([0-9][0-9]?|[0-1][0-9][0-9]|[2][0-4][0-9]|[2][5][0-5]))$/i", $email));
  }

  // Subscribe form
  public function setFormSubscribe() {
    if($_POST) {
      // Enter the email where you want to receive the notification when someone subscribes
      $emailTo = 'contact.azmind@gmail.com';

      $subscriber_email = addslashes(trim($_POST['email']));

      if(!$this->isEmail($subscriber_email)) {
        $array = array();
        $array['valid'] = 0;
        $array['message'] = 'Insert a valid email address!';
        echo json_encode($array);
      }
      else {
        $array = array();
        $array['valid'] = 1;
        $array['message'] = 'Thanks for your subscription!';
        echo json_encode($array);

        // Record the results of the "Subscribe" form to the database
        $sql = $this->connection->prepare(
          "INSERT INTO Subscribe (email) VALUES (:email)"
        );
        $sql->bindParam(':email', $subscriber_email, PDO::PARAM_STR);
        $sql->execute();

        // Send email
        $subject = 'New Subscriber (andia)!';
        $body = "You have a new subscriber!\n\nEmail: " . $subscriber_email;
        // uncomment this to set the From and Reply-To emails, then pass the $headers variable to the "mail" function below
        //$headers = "From: ".$subscriber_email." <" . $subscriber_email . ">" . "\r\n" . "Reply-To: " . $subscriber_email;
        mail($emailTo, $subject, $body);
      }
    }
  }

  // Sendmail form
  public function setFormSendmail() {
    if($_POST) {

      // Enter the email where you want to receive the message
      $emailTo = 'contact.azmind@gmail.com';
  
      $clientName = addslashes(trim($_POST['name']));
      $clientEmail = addslashes(trim($_POST['email']));
      $subject = addslashes(trim($_POST['subject']));
      $message = addslashes(trim($_POST['message']));
  
      $array = array();
      $array['nameMessage'] = '';
      $array['emailMessage'] = '';
      $array['messageMessage'] = '';
  
      if($clientName == '') {
          $array['nameMessage'] = 'Please enter your name.';
      }
      if(!$this->isEmail($clientEmail)) {
          $array['emailMessage'] = 'Please insert a valid email address.';
      }
      if($message == '') {
          $array['messageMessage'] = 'Please enter your message.';
      }
      if($clientName != '' && $this->isEmail($clientEmail) && $message != '') {
        // Record the results of the "Sendmail" form to the database
        $sql = $this->connection->prepare(
          "INSERT INTO Sendmail (name, email, subject, message) VALUES (:name, :email, :subject, :message)"
        );
        $sql->bindParam(':name', $clientName, PDO::PARAM_STR);
        $sql->bindParam(':email', $clientEmail, PDO::PARAM_STR);
        $sql->bindParam(':subject', $subject, PDO::PARAM_STR);
        $sql->bindParam(':message', $message, PDO::PARAM_STR);
        $sql->execute();

        // Send email
        $headers = "From: " . $clientName . " <" . $clientEmail . ">" . "\r\n" . "Reply-To: " . $clientEmail;
        mail($emailTo, $subject . ' (andia)', $message, $headers);
      }
  
      echo json_encode($array);  
    }
  }

}