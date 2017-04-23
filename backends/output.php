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

    if(isset($_SESSION["user_type"]) && isset($_SESSION["id"]) && isset($_GET["view"]) && isset($_GET["type"])) {
    // if(isset($_GET["view"]) && isset($_GET["type"])) {

        if($_SESSION["user_type"] === "principle") {
        // if(true) {

            if($_GET["view"] === "table") {

                switch ($_GET["type"]) {

                    case 'personal':

                        # code...for enrolled table view as principle
                        $personal->getAllTableData();

                        break;
                    
                    case 'enrolled':

                        # code...for enrolled table view as principle
                        $enrolled->getAllTableData();

                        break;

                    case 'internship':

                        # code...for enrolled table view as principle
                        $internship->getAllTableData();

                        break;

                    case 'activity':

                        # code...for activity table view as principle
                        $activity->getAllTableData();

                        break;

                    case 'achievement':

                        # code...for achievement table view as principle
                        $achievement->getAllTableData();

                        break;

                    case 'intermission':

                        # code...for intermission table view as principle
                        $intermission->getAllTableData();

                        break;

                    case 'discipline':

                        # code...for discipline table view as principle
                        $discipline->getAllTableData();

                        break;

                    case 'research':

                        # code...for discipline table view as principle
                        $research->getAllTableData();

                        break;

                }

            } else {

                switch ($_GET["type"]) {

                    case 'personal':

                        # code...for enrolled graph view as principle
                        $personal->getPrincipleGraphData();

                        break;
                    
                    case 'enrolled':

                        # code...for enrolled graph view as principle
                        $enrolled->getPrincipleGraphData();

                        break;

                    case 'internship':

                        # code...for internship graph view as principle
                        $internship->getPrincipleGraphData();

                        break;

                    case 'activity':

                        # code...for activity graph view as principle
                        $activity->getPrincipleGraphData();

                        break;

                    case 'achievement':

                        # code...for achievement graph view as principle
                        $achievement->getPrincipleGraphData();

                        break;

                    case 'intermission':

                        # code...for intermission graph view as principle
                        $intermission->getPrincipleGraphData();

                        break;

                    case 'discipline':

                        # code...for discipline graph view as principle
                        $discipline->getPrincipleGraphData();

                        break;

                    case 'research':

                        # code...for discipline graph view as principle
                        $research->getPrincipleGraphData();

                        break;

                }

            }

        } else if($_SESSION["user_type"] === "instructor") {

            if($_GET["view"] === "table") {

                switch ($_GET["type"]) {

                    case 'personal':

                        # code...for enrolled table view as instructor
                        $personal->getInstructorTableData($_SESSION["id"]);

                        break;
                    
                    case 'enrolled':

                        # code...for enrolled table view as instructor
                        $enrolled->getInstructorTableData($_SESSION["id"]);

                        break;

                    case 'internship':

                        # code...for enrolled table view as principle
                        $internship->getInstructorTableData($_SESSION["id"]);

                        break;

                    case 'activity':

                        # code...for activity table view as instructor
                        $activity->getInstructorTableData($_SESSION["id"]);

                        break;

                    case 'achievement':

                        # code...for achievement table view as instructor
                        $achievement->getInstructorTableData($_SESSION["id"]);

                        break;

                    case 'intermission':

                        # code...for intermission table view as instructor
                        $intermission->getInstructorTableData($_SESSION["id"]);

                        break;

                    case 'discipline':

                        # code...for discipline table view as instructor
                        $discipline->getInstructorTableData($_SESSION["id"]);

                        break;

                    case 'research':

                        # code...for discipline table view as instructor
                        $research->getInstructorTableData($_SESSION["id"]);

                        break;

                }

            } else {

                switch ($_GET["type"]) {

                    case 'personal':

                        # code...for enrolled graph view as instructor
                        $personal->getInstructorGraphData();

                        break;
                    
                    case 'enrolled':

                        # code...for enrolled graph view as instructor
                        $enrolled->getInstructorGraphData();

                        break;

                    case 'internship':

                        # code...for internship graph view as instructor
                        $internship->getInstructorGraphData();

                        break;

                    case 'activity':

                        # code...for activity graph view as instructor
                        $activity->getInstructorGraphData();

                        break;

                    case 'achievement':

                        # code...for achievement graph view as instructor
                        $achievement->getInstructorGraphData();

                        break;

                    case 'intermission':

                        # code...for intermission graph view as instructor
                        $intermission->getInstructorGraphData();

                        break;

                    case 'discipline':

                        # code...for discipline graph view as instructor
                        $discipline->getInstructorGraphData();

                        break;

                    case 'research':

                        # code...for discipline graph view as instructor
                        $research->getInstructorGraphData();

                        break;

                }

            }

        } else {

            switch ($_GET["type"]) {

                case 'personal':

                    # code...for enrolled table view as staff
                    $personal->getAllTableData();

                    break;
                
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