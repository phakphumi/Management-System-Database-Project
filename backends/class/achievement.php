<?php

    class Achievement {
        
        private $conn;

        function __construct($conn) {

            $this->conn = $conn;

        }

        function addData() {



        }

        function getAllTableData() {

            $sql = "SELECT `o`.`studentID`,
                        concat(`ps`.`firstName`, ' ', `ps`.`lastName`) as studentName,
                        `a`.`name` as achievementName,
                        `a`.`year`,
                        `a`.`description`
                    FROM `db_mgt_sys_design`.`obtain` o
                    INNER JOIN student s
                        ON s.studentID = o.studentID
                    INNER JOIN personal ps
                        ON ps.nationalID = s.nationalID
                    INNER JOIN achievement a
                        ON a.acmID = o.acmID";

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

            $sql = "SELECT `o`.`studentID`,
                        concat(`ps`.`firstName`, ' ', `ps`.`lastName`) as studentName,
                        `a`.`name` as achievementName,
                        `a`.`year`,
                        `a`.`description`
                    FROM `db_mgt_sys_design`.`obtain` o
                    INNER JOIN student s
                        ON s.studentID = o.studentID
                    INNER JOIN personal ps
                        ON ps.nationalID = s.nationalID
                    INNER JOIN achievement a
                        ON a.acmID = o.acmID
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