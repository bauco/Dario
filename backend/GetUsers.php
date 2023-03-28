<?php

require 'connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Headers: Content-Type");
class UsersModel {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }
    
    function getUsers() {
        $sql = "SELECT usr_id,usr_name FROM users";
        $return = [];
        if($result = mysqli_query($this->pdo,$sql)){
            $indx = 0;
            while($row = mysqli_fetch_assoc($result)){
                $return[$indx] = $row;
                $indx ++;
            }
        }
        return $return;
    }
}
$model = new UsersModel($con);
echo json_encode($model->getUsers());
mysqli_close($con);
?>