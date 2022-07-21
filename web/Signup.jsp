<%-- 
    Document   : Registration
    Created on : 15-Jul-2022, 2:52:31 pm
    Author     : pranjwal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>




<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Page</title>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </head>
    <body style="background:url(images/im.jpg);background-size: cover;background-attachment:fixed ">


        <div class="container">
            <div class="row" style="margin-top: 50px">
                <div class="col m6 offset-m3" >

                    <div class="card">
                        <div class="card-content">
                            <h6 id="m" style="text-align: center">Registration here</h6> 
                            <h6 id="msg" style="text-align: center"></h6>
                            <div class="form">
                                <form action="register" id="myform">
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input id="first_name" type="text" name="fname" class="validate">
                                            <label for="first_name">First Name</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <input id="last_name" name="lname" type="text" class="validate">
                                            <label for="last_name">Last Name</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input id="password" type="password" name="pass" class="validate">
                                            <label for="password">Password</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input id="email" type="email" name="email" class="validate">
                                            <label for="email">Email</label>
                                        </div>
                                    </div>






                                    <div class="file-field input-field">
                                        <div class="btn blue">
                                            <span>File</span>
                                            <input type="file" name="img">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>
                                    </div>






                                    <button class="btn waves-effect waves-light" type="submit">Submit

                                    </button>



                                </form>
                            </div>
                            <div class="loader"  style="display:none" >

                                <div class="preloader-wrapper small active">
                                    <div class="spinner-layer spinner-green-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>   

                            </div>       





                        </div>
                    </div>
                </div>
            </div>

        </div>


        <script
            src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
        <script>

            $(document).ready(function () {
                console.log("page is ready");
                $("#myform").on('submit', function (event) {
                    event.preventDefault();

                     //var f = $(this).serialize();
                   
                   
                   let f=new FormData(this);
                    console.log(f);

                    $(".loader").show();
                    $(".form").hide();
                    $("#m").hide();

                    $("#msg").html("please wait");
                    $.ajax(
                            {

                                url: "register",
                                data: f,
                                type: 'Post',
                                //for image
                                 processData:false,
                                contentType:false,

                                success: function (data, textStatus) {

                                    console.log(data);

                                    console.log("success..");
                                  

                                    if (data.trim()==="done") {
                                      
                                        $("#msg").html("SuccesFully Registered!!").delay(2000).fadeOut();
                                         $("#msg").addClass('green-text').delay(2000).fadeOut();
                                        
                                         

                                    } 
                                    
                                        else {
                                        $("#msg").html("something went wrong on server").delay(2000).fadeOut();
                                         $("#msg").addClass('red-text').delay(2000).fadeOut();
                                    }
                                    $(".form").show();
                                    $(".loader").hide();
                                    $("#m").show();
                                


                                },
                                error: function (data) {
                                   
                                    console.log(data);
                                    console.log("error...");
                                    $("#msg").html("something went wrong on server");
                                    $(".form").show();
                                    $(".loader").hide();
                                    $("#m").show();
                                    $("#msg").addClass('red-text');
                                   

                                }








               



                            });



      


                });

            });

        </script>



    </body>



</html>
