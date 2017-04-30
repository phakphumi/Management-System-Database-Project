<?php

    class Personal {

        private $conn;
        private $mappingTable;
        private $personalField;
        private $studentField;

        private $getGraphData = "SELECT `sp`.`nationalID`,
                        `s`.`studentID`,
                        `s`.`status`,
                        (SUBSTR(YEAR(NOW())+543,3,2) - SUBSTR(s.studentID,1,2)) as year,
                        (SELECT `type` FROM intermission
                            WHERE `s`.`studentID` = `studentID` AND DATE(NOW())<=DATE(`end`) AND DATE(NOW())>=DATE(`begin`)
                            ORDER BY DATE(`end`) ASC LIMIT 1 ) as intermission,
                        `s`.`programID`,
                        (SELECT ROUND(AVG(g.value),2) FROM enrolled as enr
                            LEFT JOIN grade_values g
                                ON enr.grade = g.grade
                            WHERE enr.studentID = s.studentID) as gpax,
                        COUNT(`acm`.`acmID`) as achievements,
                		(100 + IFNULL(SUM(`dp`.`score`),0)) as discipline
                FROM `db_mgt_sys_design`.`student` s
                INNER JOIN personal sp
                    ON sp.nationalID = s.nationalID
                LEFT JOIN obtain acm
                    ON acm.studentID = s.studentID
                LEFT JOIN discipline dp
                    ON dp.studentID = s.studentID
                WHERE s.status = 'on-studying' OR s.status = 'prohibition'
                GROUP BY `s`.`programID`,`s`.`studentID`,`s`.`status`,`intermission`,`sp`.`nationalID`";


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

            $sql = $this->getGraphData;

            $result = $this->conn->query($sql);

            if($result->num_rows > 0) {

                $api = array();
                $api['count'] = $result->num_rows;
                $api['prohibition'] = 0;
                $api['intms_sick_and_oreason'] = 0;
                $api['exchange'] = 0;
                $api['superSenior'] = 0;
                $api['numOfStudents'] = array();
                $api['studentGrade'] = array();
                $api['achievements'] = [1=>0,2=>0,3=>0,4=>0,5=>0,6=>0,7=>0,8=>0];
                $api['over4years'] = [5=>0,6=>0,7=>0,8=>0];
                $api['list'] = array();

                for ($i=0; $i < 9; $i++) { // Year
                    $api['numOfStudents'][$i] = array();
                    $api['numOfStudents'][$i]['data'] = array();
                    for ($j=0; $j < 10 ; $j++) { //Major
                        $api['numOfStudents'][$i]['data'][$j] = 0;
                    }
                }

                while($row = $result->fetch_assoc()) {

                    array_push($api['list'], $row);

                    $api['prohibition'] += ($row['status'] == 'prohibition') ? 1 : 0;
                    $api['intms_sick_and_oreason'] += ($row['intermission'] == 'sick' || $row['intermission'] == 'person reason') ? 1 : 0;
                    $api['exchange'] += ($row['intermission'] == 'study-aboard') ? 1 : 0;
                    $api['achievements'][$row['year']] += !empty($row['achievements']) ? $row['achievements'] : 0;
                    $api['numOfStudents'][$row['year'] -1 ]['data'][$row['programID'] - 1] += 1;
                    if($row['year'] > 4){
                        $api['superSenior'] += 1;
                        $api['over4years'][$row['year']] += 1;
                    }


                    if(!empty($row['gpax'])){
                        for ($i=0; $i <8 ; $i++) {
                            if($row['gpax'] <= (($i+1)*0.5) ){
                                if(empty($api['studentGrade'][$i])){
                                    $api['studentGrade'][$i]=0;
                                }
                                $api['studentGrade'][$i] += 1;
                                break;
                            }
                        }
                    }else{
                        if(empty($api['studentGrade'][0])){
                            $api['studentGrade'][0]=0;
                        }
                        $api['studentGrade'][0] += 1;
                    }

                }

                echo json_encode($api);

            }

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

        function getInstructorGraphData($id) {

            $sql = $this->getGraphData." WHERE s.instructorID = '$id'";

            $result = $this->conn->query($sql);

            if($result->num_rows > 0) {

                $api = array();

                while($row = $result->fetch_assoc()) {

                    array_push($api, $row);

                }

                echo json_encode($api);

            }

        }

    }


?>
