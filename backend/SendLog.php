<?php

require 'connect.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type");

class SendLogModel {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }
    
    /* Get aggregated send log information by date.
    *
    * @param string $date_from Required. Start date in Y-m-d format.
    * @param string $date_to   Required. End date in Y-m-d format.
    * @param int    $cnt_id    Optional. Country ID filter.
    * @param int    $usr_id    Optional. User ID filter.
    *
    * @return array Associative array of date keys with values of successfully sent and failed messages.
    */
    public function getAggregatedInfo($dateFrom, $dateTo, $cntId = NULL, $usrId = NULL) {
        $sql = "SELECT DATE_FORMAT(log_created, '%Y-%m-%d') as log_date,
                SUM(log_success) as success_count,
                SUM(IF(log_success = 0, 1, 0)) as failed_count
                FROM send_log
                JOIN numbers ON send_log.num_id = numbers.num_id
                JOIN countries ON numbers.cnt_id = countries.cnt_id
                WHERE log_created BETWEEN '" . mysqli_real_escape_string($this->pdo,$dateFrom) . "'" . " AND '" . mysqli_real_escape_string($this->pdo,$dateTo) . "'";
        if ($cntId != NULL) {
            $sql .= " AND countries.cnt_id = " . mysqli_real_escape_string($this->pdo,$cntId);
        }
        if ($usrId != NULL) {
            $sql .= " AND send_log.usr_id = ".mysqli_real_escape_string($this->pdo,$usrId);
        }
        $sql .= " GROUP BY log_date ORDER BY log_date DESC";
        
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

if (isset($_GET['date_from']) && isset($_GET['date_to'])) {
    $response['status'] = 'ok';
    $model = new SendLogModel($con);
    if(!isset($_GET['cnt_id'])){
        $_GET['cnt_id'] = null;
    }
    if(!isset($_GET['usr_id'])){
        $_GET['usr_id'] = null;
    }
    $response['data'] = $model->getAggregatedInfo($_GET['date_from'],$_GET['date_to'],$_GET['cnt_id'],$_GET['usr_id']);
    // Optional parameters
    if (isset($_GET['cnt_id'])) {
        $response['cnt_id'] = $_GET['cnt_id'];
    }
    if (isset($_GET['usr_id'])) {
        $response['usr_id'] = $_GET['usr_id'];
    }
} else {
    $response['status'] = 'miss';
}
echo json_encode($response);
mysqli_close($con);
?>