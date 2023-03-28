<?php

require 'connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type");
class CountriesModel {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }
    
    public function getCountries() {
        $sql = "SELECT cnt_id,cnt_title FROM countries";
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

$model = new CountriesModel($con);
echo json_encode($model->getCountries());
mysqli_close($con);
?>