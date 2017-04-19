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

    $achievement = new Achievement($conn);
    $activity = new Activity($conn);
    $discipline = new Discipline($conn);
    $enrolled = new Enrolled($conn);
    $intermission = new Intermission($conn);
    $internship = new Internship($conn);
    $personal = new Personal($conn);

    if(isset($_SESSION["user_type"]) && isset($_GET["view"]) && isset($_GET["type"])) {

        if($_SESSION["user_type"] === "principle") {

            if($_GET["view"] === "table") {

                switch ($_GET["type"]) {

                    case 'personal':

                        # code...for enrolled table view as principle
                        $personal->getPrincipleTableData();

                        break;
                    
                    case 'enrolled':

                        # code...for enrolled table view as principle
                        $enrolled->getPrincipleTableData();

                        break;

                    case 'internship':

                        # code...for internship table view as principle
                        $internship->getPrincipleTableData();

                        break;

                    case 'activity':

                        # code...for activity table view as principle
                        $activity->getPrincipleTableData();

                        break;

                    case 'achievement':

                        # code...for achievement table view as principle
                        $achievement->getPrincipleTableData();

                        break;

                    case 'intermission':

                        # code...for intermission table view as principle
                        $intermission->getPrincipleTableData();

                        break;

                    case 'discipline':

                        # code...for discipline table view as principle
                        $discipline->getPrincipleTableData();

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

                }

            }

        } else if($_SESSION["user_type"] === "instructor") {

            if($_GET["view"] === "table") {

                switch ($_GET["type"]) {

                    case 'personal':

                        # code...for enrolled table view as instructor
                        $personal->getInstructorTableData();

                        break;
                    
                    case 'enrolled':

                        # code...for enrolled table view as instructor
                        $enrolled->getInstructorTableData();

                        break;

                    case 'internship':

                        # code...for internship table view as instructor
                        $internship->getInstructorTableData();

                        break;

                    case 'activity':

                        # code...for activity table view as instructor
                        $internship->getInstructorTableData();

                        break;

                    case 'achievement':

                        # code...for achievement table view as instructor
                        $achievement->getInstructorTableData();

                        break;

                    case 'intermission':

                        # code...for intermission table view as instructor
                        $intermission->getInstructorTableData();

                        break;

                    case 'discipline':

                        # code...for discipline table view as instructor
                        $discipline->getInstructorTableData();

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

                }

            }

        } else {

            switch ($_GET["type"]) {

                case 'personal':

                    # code...for enrolled table view as staff
                    $personal->getStaffTableData();

                    break;
                
                case 'enrolled':

                    # code...for enrolled table view as staff
                    $enrolled->getStaffTableData();

                    break;

                case 'internship':

                    # code...for internship table view as staff
                    $internship->getStaffTableData();

                    break;

                case 'activity':

                    # code...for activity table view as staff
                    $activity->getStaffTableData();

                    break;

                case 'achievement':

                    # code...for achievement table view as staff
                    $achievement->getStaffTableData();

                    break;

                case 'intermission':

                    # code...for intermission table view as staff
                    $intermission->getStaffTableData();

                    break;

                case 'discipline':

                    # code...for discipline table view as staff
                    $discipline->getStaffTableData();

                    break;

            }

        }
        
    }

?>