<?php
    session_start();
    require_once('config.php');
    require('./class/achievement.php');
    require('./class/activity.php');
    require('./class/discipline.php');
    require('./class/enrolled.php');
    require('./class/intermission.php');
    require('./class/internship.php');
    require('./class/personal.php');
    require('./class/research.php');

    $achievement = new Achievement($conn);
    $activity = new Activity($conn);
    $discipline = new Discipline($conn);
    $enrolled = new Enrolled($conn);
    $intermission = new Intermission($conn);
    $internship = new Internship($conn);
    $personal = new Personal($conn);
    $research = new Research($conn);

    if(isset($_SESSION["user_type"]) && isset($_SESSION["id"]) && isset($_POST["type"]) ) {

        if($_SESSION["user_type"] === "staff") {

            switch ($_POST["type"]) {

                case 'addPersonal':

                    # code...for enrolled table view as staff
                    $personal->addData($_POST["nationalID"],
                                        $_POST["firstName"],
                                        $_POST["lastName"],
                                        $_POST["gender"],
                                        $_POST["birthDate"],
                                        $_POST["religion"],
                                        $_POST["nationality"],
                                        $_POST["email"],
                                        $_POST["facebook"],
                                        $_POST["currentAddress"],
                                        $_POST["phone"],
                                        $_POST["studentID"],
                                        $_POST["instructorID"],
                                        $_POST["programID"],
                                        $_POST["status"]);

                    break;

                case 'deletePersonal':

                    $personal->deleteData($_POST["nationalID"]);
                
                case 'enrolled':

                    # code...for enrolled table view as staff
                    $enrolled->getAllTableData();

                    break;

                case 'internship':

                    # code...for enrolled table view as staff
                    $internship->getAllTableData();

                    break;

                case 'activity':

                    # code...for activity table view as staff
                    $activity->getAllTableData();

                    break;

                case 'achievement':

                    # code...for achievement table view as staff
                    $achievement->getAllTableData();

                    break;

                case 'intermission':

                    # code...for intermission table view as staff
                    $intermission->getAllTableData();

                    break;

                case 'discipline':

                    # code...for discipline table view as staff
                    $discipline->getAllTableData();

                    break;

                case 'research':

                    # code...for discipline table view as staff
                    $research->getAllTableData();

                    break;

            }

        }
        
    }

?>