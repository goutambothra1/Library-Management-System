<?php
session_start();

if(isset($_SESSION['user_id']) && isset($_SESSION['user_email']))
{
    /*Database Connection*/
    include "../connection.php";

    if(isset($_POST['updateauthordata']))
    {
        $aid=$_POST['update_aid'];
        $aname=$_POST['updateauthor'];

        //Updating into Database
        $sql="update author set author_name=?,admin_id=?,faculty_id=NULL where author_id=?";
        $stmt=$conn->prepare($sql);
        $res=$stmt->execute([$aname,$_SESSION['user_id'],$aid]);

        //If there is no error while updating the data
        if($res)
        {
            $_SESSION['success']="Author Name Updated Successfully.....";
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
        header("Location: ../admin/admindashboard.php");
        exit;
    }
}
?>