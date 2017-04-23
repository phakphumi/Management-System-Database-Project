<?php

    class Enrolled {
        
        private $conn;

        function __construct($conn) {

            $this->conn = $conn;

        }

        function addData() {



        }

        function getAllTableData() {

            $sql = "SELECT `e`.`studentID`,
                                concat(`ps`.`firstName`, ' ',`ps`.`lastName`) as studentName,
                                `c`.`name` as courseName,
                                `e`.`grade`,
                                `e`.`attendance`,
                                `t`.`section`,
                                `t`.`year`,
                                `t`.`term`,
                                `c`.`credit`,
                                `c`.`type`,
                                concat(`pi`.`firstName`, ' ', `pi`.`lastName`) as instructorName
                    FROM `db_mgt_sys_design`.`enrolled` e
                    INNER JOIN teach t
                        ON t.TID = e.TID
                    INNER JOIN course c
                        ON c.CID = t.CID
                    INNER JOIN instructor i
                        ON i.instructorID = t.instructorID
                    INNER JOIN personal pi
                        ON pi.nationalID = i.nationalID
                    INNER JOIN student s
                        ON s.studentID = e.studentID
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

            $sql = "SELECT `e`.`studentID`,
                                concat(`ps`.`firstName`, ' ',`ps`.`lastName`) as studentName,
                                `c`.`name` as courseName,
                                `e`.`grade`,
                                `e`.`attendance`,
                                `t`.`section`,
                                `t`.`year`,
                                `t`.`term`,
                                `c`.`credit`,
                                `c`.`type`,
                                concat(`pi`.`firstName`, ' ', `pi`.`lastName`) as instructorName
                    FROM `db_mgt_sys_design`.`enrolled` e
                    INNER JOIN teach t
                        ON t.TID = e.TID
                    INNER JOIN course c
                        ON c.CID = t.CID
                    INNER JOIN instructor i
                        ON i.instructorID = t.instructorID
                    INNER JOIN personal pi
                        ON pi.nationalID = i.nationalID
                    INNER JOIN student s
                        ON s.studentID = e.studentID
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