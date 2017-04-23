<?php

    class Activity {
        
        private $conn;

        function __construct($conn) {

            $this->conn = $conn;

        }

        function addData() {



        }

        function getAllTableData() {

            $sql = "SELECT `aa`.`studentID`,
                        concat(`ps`.`firstName`, ' ', `ps`.`lastName`) as studentName,
                        `a`.`name` as activityName,
                        `a`.`belongTo`
                    FROM `db_mgt_sys_design`.`admission_activity` aa
                    INNER JOIN student s
                        ON s.studentID = aa.studentID
                    INNER JOIN personal ps
                        ON ps.nationalID = s.nationalID
                    INNER JOIN activity a
                        ON a.activityID = aa.activityID";

            $result = $this->conn->query($sql);

            if($result->num_rows > 0) {

                $api = array();

                while($row = $result->fetch_assoc()) {

                    array_push($api, $row);

                }

                echo json_encode($api);

            }

        }

        function getPrincipleGraphData() {

            

        }

        function getInstructorTableData($id) {

            $sql = "SELECT `aa`.`studentID`,
                        concat(`ps`.`firstName`, ' ', `ps`.`lastName`) as studentName,
                        `a`.`name` as activityName,
                        `a`.`belongTo`
                    FROM `db_mgt_sys_design`.`admission_activity` aa
                    INNER JOIN student s
                        ON s.studentID = aa.studentID
                    INNER JOIN personal ps
                        ON ps.nationalID = s.nationalID
                    INNER JOIN activity a
                        ON a.activityID = aa.activityID
                    WHERE s.instructorID = '$id'";

            $result = $this->conn->query($sql);

            if($result->num_rows > 0) {

                $api = array();

                while($row = $result->fetch_assoc()) {

                    array_push($api, $row);

                }

                echo json_encode($api);

            }

        }

        function getInstructorGraphData() {
        
            

        }

    }
    

?>