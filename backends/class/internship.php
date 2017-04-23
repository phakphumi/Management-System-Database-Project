<?php

    class Internship {
        
        private $conn;

        function __construct($conn) {

            $this->conn = $conn;

        }

        function addData() {



        }

        function getAllTableData() {

            $sql = "SELECT `s`.`studentID`,
                                concat(`ps`.`firstName`, ' ',`ps`.`lastName`) as studentName,
                                `o`.`name` as organizationName,
                                `s`.`start`,
                                `s`.`end`,
                                `s`.`year`,
                                `o`.`country`,
                                `o`.`phone`,
                                `o`.`location`,
                                `o`.`email`
                    FROM `db_mgt_sys_design`.`student` s
                    INNER JOIN personal ps
                        ON ps.nationalID = s.nationalID
                    INNER JOIN organization o
                        ON o.organID = s.organID";

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

            $sql = "SELECT `s`.`studentID`,
                                concat(`ps`.`firstName`, ' ',`ps`.`lastName`) as studentName,
                                `o`.`name` as organizationName,
                                `s`.`start`,
                                `s`.`end`,
                                `s`.`year`,
                                `o`.`country`,
                                `o`.`phone`,
                                `o`.`location`,
                                `o`.`email`
                    FROM `db_mgt_sys_design`.`student` s
                    INNER JOIN personal ps
                        ON ps.nationalID = s.nationalID
                    INNER JOIN organization o
                        ON o.organID = s.organID
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