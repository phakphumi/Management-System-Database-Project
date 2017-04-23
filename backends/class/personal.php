<?php

    class Personal {
        
        private $conn;

        function __construct($conn) {

            $this->conn = $conn;

        }

        function addData() {



        }

        function getAllTableData() {

            $sql = "SELECT `sp`.`nationalID`,
                            `s`.`studentID`,
                            `sp`.`firstName`,
                            `sp`.`lastName`,
                            `program`.`name` as programName,
                            `s`.`status`,
                            concat(`ip`.`firstName`, ' ',`ip`.`lastName`) as advisor,
                            `sp`.`gender`,
                            `sp`.`birthDate`,
                            `sp`.`religion`,
                            `sp`.`nationality`,
                            `sp`.`email`,
                            `sp`.`facebook`,
                            `sp`.`currentAddress`,
                            `sp`.`phone`
                    FROM `db_mgt_sys_design`.`student` s
                    INNER JOIN personal sp
                        ON sp.nationalID = s.nationalID
                    INNER JOIN program
                        ON s.programID = program.programID
                    INNER JOIN instructor si
                        ON s.instructorID = si.instructorID
                    INNER JOIN personal ip
                        ON si.nationalID = ip.nationalID";

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

            $sql = "SELECT `sp`.`nationalID`,
                            `s`.`studentID`,
                            `sp`.`firstName`,
                            `sp`.`lastName`,
                            `program`.`name` as programName,
                            `s`.`status`,
                            concat(`ip`.`firstName`, ' ',`ip`.`lastName`) as advisor,
                            `sp`.`gender`,
                            `sp`.`birthDate`,
                            `sp`.`religion`,
                            `sp`.`nationality`,
                            `sp`.`email`,
                            `sp`.`facebook`,
                            `sp`.`currentAddress`,
                            `sp`.`phone`
                    FROM `db_mgt_sys_design`.`student` s
                    INNER JOIN personal sp
                        ON sp.nationalID = s.nationalID
                    INNER JOIN program
                        ON s.programID = program.programID
                    INNER JOIN instructor si
                        ON s.instructorID = si.instructorID
                    INNER JOIN personal ip
                        ON si.nationalID = ip.nationalID
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