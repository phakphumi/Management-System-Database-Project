<?php

    class Intermission {
        
        private $conn;

        function __construct($conn) {

            $this->conn = $conn;

        }

        function addData() {



        }

        function getAllTableData() {

            $sql = "SELECT `i`.`studentID`,
                        concat(`ps`.`firstName`, ' ', `ps`.`lastName`) as studentName,
                        `i`.`type`,
                        `i`.`note`,
                        `i`.`begin`,
                        `i`.`end`
                    FROM `db_mgt_sys_design`.`intermission` i
                    INNER JOIN student s
                        ON s.studentID = i.studentID
                    INNER JOIN personal ps
                        ON ps.nationalID = s.nationalID";

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

            $sql = "SELECT `i`.`studentID`,
                        concat(`ps`.`firstName`, ' ', `ps`.`lastName`) as studentName,
                        `i`.`type`,
                        `i`.`note`,
                        `i`.`begin`,
                        `i`.`end`
                    FROM `db_mgt_sys_design`.`intermission` i
                    INNER JOIN student s
                        ON s.studentID = i.studentID
                    INNER JOIN personal ps
                        ON ps.nationalID = s.nationalID
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