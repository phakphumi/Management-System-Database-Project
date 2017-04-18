<?php
    session_start();
    require_once('config.php');

    if($_SESSION["user_type"] === "principle") {

        if($_GET["view"] === "table") {

            switch ($_GET["type"]) {

                case 'personal':

                    # code...for enrolled table view as principle
                    echo "personal table principle";

                    break;
                
                case 'enrolled':

                    # code...for enrolled table view as principle
                    echo "enrolled table principle";

                    break;

                case 'internship':

                    # code...for internship table view as principle
                    echo "enrolled table principle";

                    break;

                case 'activity':

                    # code...for activity table view as principle
                    echo "activity table principle";

                    break;

                case 'achievement':

                    # code...for achievement table view as principle
                    echo "achievement table principle";

                    break;

                case 'intermission':

                    # code...for intermission table view as principle
                    echo "intermission table principle";

                    break;

                case 'discipline':

                    # code...for discipline table view as principle
                    echo "discipline table principle";

                    break;

            }

        } else {

            switch ($_GET["type"]) {

                case 'personal':

                    # code...for enrolled graph view as principle
                    echo "personal graph principle";

                    break;
                
                case 'enrolled':

                    # code...for enrolled graph view as principle
                    echo "enrolled graph principle";

                    break;

                case 'internship':

                    # code...for internship graph view as principle
                    echo "enrolled graph principle";

                    break;

                case 'activity':

                    # code...for activity graph view as principle
                    echo "activity graph principle";

                    break;

                case 'achievement':

                    # code...for achievement graph view as principle
                    echo "achievement graph principle";

                    break;

                case 'intermission':

                    # code...for intermission graph view as principle
                    echo "intermission graph principle";

                    break;

                case 'discipline':

                    # code...for discipline graph view as principle
                    echo "discipline graph principle";

                    break;

            }

        }

    } else if($_SESSION["user_type"] === "instructor") {

        if($_GET["view"] === "table") {

            switch ($_GET["type"]) {

                case 'personal':

                    # code...for enrolled table view as instructor
                    echo "personal table instructor";

                    break;
                
                case 'enrolled':

                    # code...for enrolled table view as instructor
                    echo "enrolled table instructor";

                    break;

                case 'internship':

                    # code...for internship table view as instructor
                    echo "enrolled table instructor";

                    break;

                case 'activity':

                    # code...for activity table view as instructor
                    echo "activity table instructor";

                    break;

                case 'achievement':

                    # code...for achievement table view as instructor
                    echo "achievement table instructor";

                    break;

                case 'intermission':

                    # code...for intermission table view as instructor
                    echo "intermission table instructor";

                    break;

                case 'discipline':

                    # code...for discipline table view as instructor
                    echo "discipline table instructor";

                    break;

            }

        } else {

            switch ($_GET["type"]) {

                case 'personal':

                    # code...for enrolled graph view as instructor
                    echo "personal graph instructor";

                    break;
                
                case 'enrolled':

                    # code...for enrolled graph view as instructor
                    echo "enrolled graph instructor";

                    break;

                case 'internship':

                    # code...for internship graph view as instructor
                    echo "enrolled graph instructor";

                    break;

                case 'activity':

                    # code...for activity graph view as instructor
                    echo "activity graph instructor";

                    break;

                case 'achievement':

                    # code...for achievement graph view as instructor
                    echo "achievement graph instructor";

                    break;

                case 'intermission':

                    # code...for intermission graph view as instructor
                    echo "intermission graph instructor";

                    break;

                case 'discipline':

                    # code...for discipline graph view as instructor
                    echo "discipline graph instructor";

                    break;

            }

        }

    } else {

        switch ($_GET["type"]) {

            case 'personal':

                # code...for enrolled table view as staff
                echo "personal table staff";

                break;
            
            case 'enrolled':

                # code...for enrolled table view as staff
                echo "enrolled table staff";

                break;

            case 'internship':

                # code...for internship table view as staff
                echo "enrolled table staff";

                break;

            case 'activity':

                # code...for activity table view as staff
                echo "activity table staff";

                break;

            case 'achievement':

                # code...for achievement table view as staff
                echo "achievement table staff";

                break;

            case 'intermission':

                # code...for intermission table view as staff
                echo "intermission table staff";

                break;

            case 'discipline':

                # code...for discipline table view as staff
                echo "discipline table staff";

                break;

        }

    }

?>