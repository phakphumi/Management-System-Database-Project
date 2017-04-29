<?php

    class Personal {
        
        private $conn;
        private $mappingTable;
        private $personalField;
        private $studentField;

        function __construct($conn) {

            $this->conn = $conn;
            $personalField = array("nationalID", "firstName", "lastName", "gender", "birthDate", "religion", "nationality", "email", "facebook", "currentAddress", "phone");
            $studentField = array("studentID", "instructorID", "programID", "status");
            
            foreach ($personalField as &$field) {
                
                $this->mappingTable[$field] = "personal";

            }

            foreach ($studentField as &$field) {
                
                $this->mappingTable[$field] = "student";

            }

        }

        function editData($id, $field, $value) {

            $tableName = $this->mappingTable[$field];
            
            $sql = "UPDATE `db_mgt_sys_design`.`$tableName`
                    SET
                    `$field` = '$value'
                    WHERE `nationalID` = '$id'";
            
            if($this->conn->query($sql) === TRUE) {

                echo "Edit records successfully";

            } else {

                echo "Error: " . $sql . "<br>" . $conn->error;
                        
            }

        }

        function addData($nationalID,
                        $firstName,
                        $lastName,
                        $gender,
                        $birthDate,
                        $religion,
                        $nationality,
                        $email,
                        $facebook,
                        $currentAddress,
                        $phone,
                        $studentID,
                        $instructorID,
                        $programID,
                        $status) 
        {

            $sql = "INSERT INTO `db_mgt_sys_design`.`personal`
                                (`nationalID`,
                                `firstName`,
                                `lastName`,
                                `gender`,
                                `birthDate`,
                                `religion`,
                                `nationality`,
                                `email`,
                                `facebook`,
                                `currentAddress`,
                                `phone`)
                                VALUES
                                ('$nationalID',
                                '$firstName',
                                '$lastName',
                                '$gender',
                                '$birthDate',
                                '$religion',
                                '$nationality',
                                '$email',
                                '$facebook',
                                '$currentAddress',
                                '$phone');";

            $sql .= "INSERT INTO `db_mgt_sys_design`.`student`
                                (`nationalID`,
                                `studentID`,
                                `instructorID`,
                                `organID`,
                                `programID`,
                                `start`,
                                `end`,
                                `year`,
                                `status`)
                                VALUES
                                ('$nationalID',
                                '$studentID',
                                '$instructorID',
                                '2',
                                '$programID',
                                '2016-01-01',
                                '2016-02-01',
                                '2017',
                                '$status')";

            if($this->conn->multi_query($sql) === TRUE) {

                echo "New records created successfully";

            } else {

                echo "Error: " . $sql . "<br>" . $conn->error;
                        
            }

        }

        function deleteData($nationalID) {

            $sql = "DELETE FROM `db_mgt_sys_design`.`personal`
                    WHERE nationalID = '$nationalID'";

            if($this->conn->query($sql) === TRUE) {

                echo "Delete records successfully";

            } else {

                echo "Error: " . $sql . "<br>" . $conn->error;
                        
            }

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