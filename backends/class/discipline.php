<?php

    class Discipline {
        
        private $conn;

        function __construct($conn) {

            $this->conn = $conn;

        }

        function addData() {



        }

        function getPrincipleTableData() {

            echo "discipline table";

        }

        function getPrincipleGraphData() {

            echo "discipline graph";

        }

        function getInstructorTableData() {

            

        }

        function getInstructorGraphData() {
        
            

        }

        function getStaffTableData() {

            

        }

    }
    

?>