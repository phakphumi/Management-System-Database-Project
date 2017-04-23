<?php

    class Research {
        
        private $conn;

        function __construct($conn) {

            $this->conn = $conn;

        }

        function addData() {



        }

        function getAllTableData() {

            $sql = "SELECT `r`.`studentID`,
                        concat(`ps`.`firstName`, ' ', `ps`.`lastName`) as studentName,
                        `r`.`name` as researchTopic,
                        `r`.`type`,
                        `r`.`field`
                    FROM `db_mgt_sys_design`.`research` r
                    INNER JOIN student s
                        ON s.studentID = r.studentID
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

            $sql = "SELECT `r`.`studentID`,
                        concat(`ps`.`firstName`, ' ', `ps`.`lastName`) as studentName,
                        `r`.`name` as researchTopic,
                        `r`.`type`,
                        `r`.`field`
                    FROM `db_mgt_sys_design`.`research` r
                    INNER JOIN student s
                        ON s.studentID = r.studentID
                    INNER JOIN personal ps
                        ON ps.nationalID = s.nationalID
                    WHERE r.instructorID = '$id'";

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