<%-- 
    Document   : index
    Created on : 2019-4-2, 12:29:14
    Author     : CZC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Landing page</title>
        
        <style>
            
            body,html{
                margin: 0;
                padding: 0;
                font-family: sans-serif;
                width: 100%;
                height: 100%;
            }
            
            .section-top{
                width: 100%;
                height: 100%;
                padding-top: 220px;
                overflow: hidden;
                position: relative;
                background-image: url(Images/1.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                animation: slide 10s infinite;
                
            }
            
            .content{
                position: absolute;
                top: 50;
                left: 50%;
                transform: translate(-50%, -50%);
                text-transform: uppercase;
                text-align: center;
            }
            
            .content h1{
                color: white;
                font-size: 60px;
                letter-spacing: 16px;
            }
           
            
            .content a{
                background: #0984e3;
                padding: 10px 24px;
                margin: 10px;
                color: white;
                text-decoration: none;
                font-size: 18px;
                border-radius: 20px;
                
            }
            
              .content h3{
                color:antiquewhite;
               
                font-family:trajan;
                font-size: 25px;
                letter-spacing: 8px;
                margin-top: 60px;
            }
            
            @keyframes slide{
                0%{
                    background-image: url(Images/1.jpg);
                }
                40%{
                    background-image: url(Images/2.jpg);
                }
                60%{
                    background-image: url(Images/3.jpeg);
                }
            }
 
        </style>
    </head>
   
    <body>
        <div class="section-top">
        <div class="content">
            <h1>Movie Store</h1>
            <a href="#" >Register</a> <a href="#" > Login </a> <a href="#" >Login INFO</a>
            <h3>Bare-minimum Bandits Movie Emporium!</h3>
        </div>
        </div>
        
    </body>
</html>

