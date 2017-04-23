<?php

    class Discipline {
        
        private $conn;

        function __construct($conn) {

            $this->conn = $conn;

        }

        function addData() {



        }

        function getAllTableData() {

            $sql = "SELECT `d`.`studentID`,
                        concat(`ps`.`firstName`, ' ', `ps`.`lastName`) as studentName,
                        `d`.`cause`,
                        `d`.`score`,
                        `d`.`date`
                    FROM `db_mgt_sys_design`.`discipline` d
                    INNER JOIN student s
                        ON s.studentID = d.studentID
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

            $sql = "SELECT `d`.`studentID`,
                        concat(`ps`.`firstName`, ' ', `ps`.`lastName`) as studentName,
                        `d`.`cause`,
                        `d`.`score`,
                        `d`.`date`
                    FROM `db_mgt_sys_design`.`discipline` d
                    INNER JOIN student s
                        ON s.studentID = d.studentID
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