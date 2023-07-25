<?php
session_start();
if(isset($_SESSION['user_id']) && isset($_SESSION['user_email']))
{
    /*Database Connection*/
    include "../connection.php";

    //checks if course name is submitted
    if(isset($_POST['course_name']))
    {
        //Get data from POST request and store it in variable
        $cname=$_POST['course_name'];
        if(preg_match('/^([^0-9]*)$/',$cname))
        {
            //Inserting into Database
            $sql="insert into courses(course_name,admin_id) values (?,?)";
            $stmt=$conn->prepare($sql);
            $res=$stmt->execute([$cname,$_SESSION['user_id']]);

            //If there is no error while inserting the data
            if($res)
            {
                $_SESSION['success']="Added New Course Successfully.....";
                header("Location: ../admin/admindashboard.php");
                exit;
            }
            else
            {
                $_SESSION['failed']="Unknown Error occured!!!";
                header("Location: ../admin/admindashboard.php");
                exit;
            }
        }
        else
        {
            $_SESSION['failed']="Please Enter Valid Course name!!!";
            header("Location: ../admin/admindashboard.php");
            exit;
        } 
    }
    else
    {
        header("Location: ../admin/admindashboard.php");
        exit;
    }
}
?>
