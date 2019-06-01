<%-- 
    Document   : index
    Created on : 2019-4-2, 12:29:14
    Author     : CZC
--%>
<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/ConnServlet" flush="true" />
<%
    User user = (User) session.getAttribute("user");
    String loggedInMessage = (String) session.getAttribute("loggedInMessage");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Main Page</title>
        
        <style>
            .mySlides {display:none;
                margin-top: 60px;
            }
            .w3-left, .w3-right, .w3-badge {cursor:pointer}
            .w3-badge {height:13px;width:13px;padding:0}
        </style>
    </head>
   
    <body class="w3-light-grey">
<!--  <div class="w3-container w3-content  w3-mobile" style="max-width:1400px;">!-->
    <% if(user!=null){%>

    <!-- top navigation bar   !-->
     <div class="w3-bar w3-top w3-black w3-card w3-border w3-mobile">

      <span class=" branding w3-bar-item w3-mobile">  <a href="#" class="w3-bar-item w3-button w3-green w3-mobile">OMS-Project</a></span>
        <span class="w3-bar-item  w3-text-white w3-mobile">  
            <span class="w3-center">${loggedInMessage}</span>
        </span>
       <span class="w3-right w3-mobile">
         <a href="movieView.jsp" class="w3-bar-item w3-button w3-hover-none w3-text-white w3-hover-text-orange w3-mobile">Browse Movies</a>
         <a href="#" class="w3-bar-item w3-button w3-hover-none w3-text-white w3-hover-text-green w3-mobile">Home</a>
         <a href="register.jsp" class="w3-bar-item w3-button w3-hover-none w3-text-white w3-hover-text-blue w3-mobile">Register</a>
         <a href="viewUserProfile.jsp" class="w3-bar-item w3-button w3-hover-none w3-text-white w3-hover-text-red w3-mobile">My Account</a>
         <a href="logout.jsp" class="w3-bar-item w3-button w3-hover-none w3-text-white w3-hover-text-orange w3-mobile">Logout</a>
       </span>

    </div>
    <%}else{%>
    <div class="w3-bar w3-top w3-black w3-card w3-border w3-mobile">

      <span class=" branding w3-bar-item w3-mobile">  <a href="#" class="w3-bar-item w3-button w3-green w3-mobile">OMS-Project</a></span>
        <span class="w3-bar-item  w3-text-white w3-mobile">  
            <span class="w3-center">${loggedInMessage}</span>
        </span>
        <span class="w3-right w3-mobile">
          <a href="#" class="w3-bar-item w3-button w3-hover-none w3-text-white w3-hover-text-green w3-mobile">Home</a>
          <a href="movieView.jsp" class="w3-bar-item w3-button w3-hover-none w3-text-white w3-hover-text-orange w3-mobile">Browse Movies</a>
          <a href="register.jsp" class="w3-bar-item w3-button w3-hover-none w3-text-white w3-hover-text-blue w3-mobile">Register</a>
          <a href="viewUserProfile.jsp" class="w3-bar-item w3-button w3-hover-none w3-text-white w3-hover-text-red w3-mobile">My Account</a>
          <a href="login.jsp" class="w3-bar-item w3-button w3-hover-none w3-text-white w3-hover-text-orange w3-mobile">Login</a>
        </span>

    </div>
    <%}%>

    <!-- animated slideshow!-->
    <div class="w3-content w3-card w3-display-container w3-section w3-mobile" style="max-width:1300px">
      <img class="mySlides" src="Images/banner3.png" style="width:100%">
      <img class="mySlides" src="Images/banner4.png" style="width:100%">
      <img class="mySlides" src="Images/banner5.png" style="width:100%">
      <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
        <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
        <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
        <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
        <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
        <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
      </div>
    </div>

    <script>
    var slideIndex = 1;
    showDivs(slideIndex);

    function plusDivs(n) {
      showDivs(slideIndex += n);
    }

    function currentDiv(n) {
      showDivs(slideIndex = n);
    }

    function showDivs(n) {
      var i;
      var x = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("demo");
      if (n > x.length) {slideIndex = 1;}
      if (n < 1) {slideIndex = x.length;}
      for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
      }
      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" w3-white", "");
      }
      x[slideIndex-1].style.display = "block";
      dots[slideIndex-1].className += " w3-white";
    }
    </script>

    <!-- page content  !-->
    <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
      <div class="w3-container w3-text-orange w3-large" >
        <h1>New Releases ></h1>
      </div>

        <div class="w3-row-padding w3-padding-16 w3-center" id="food">
             <div class="w3-quarter ">
               <img src="Images/7.jpg" alt="movie" class="w3-card" style="width:100%">
               <h2>Josie</h2>
               <p>A Captivating Viewing Experience</p>
             </div>
             <div class="w3-quarter">
               <img src="Images/8.jpg" alt="movie" class="w3-card" style="width:100%">
               <h2>The CrucFiction</h2>
               <p>Inspired By True Events</p>
             </div>
             <div class="w3-quarter">
               <img src="Images/9.jpg" alt="movie" class="w3-card" style="width:100%">
               <h2>FANTASTICA</h2>
               <p>Time Is Running Out</p>
             </div>
             <div class="w3-quarter">
               <img src="Images/10.jpg" alt="movie"  class="w3-card" style="width:100%">
               <h2>Voxlux</h2>
               <p>Lorem ipsum text praesent</p>
             </div>
        </div>
    </div>

    <!-- second content !-->
       <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:10px">

       <div class="w3-container w3-text-orange w3-large" >
         <h1>Coming soon></h1>
       </div>

         <div class="w3-row-padding w3-padding-16 w3-center" id="films">
            <div class="w3-quarter ">
              <img src="Images/11.jpg" alt="movie" class="w3-card" style="width:100%">
              <h2>Green Book</h2>
              <p>Inspired By A True Friendship</p>
            </div>
            <div class="w3-quarter">
              <img src="Images/12.jpg" alt="movie" class="w3-card" style="width:100%">
              <h2>Damsel</h2>
              <p>Not All Damsels Needs Savings</p>
            </div>
            <div class="w3-quarter">
              <img src="Images/13.jpg" alt="movie" class="w3-card" style="width:100%">
              <h2>The Vanishing</h2>
              <p>Based On True Events</p>

            </div>
            <div class="w3-quarter">
              <img src="Images/14.jpg" alt="movie"  class="w3-card" style="width:100%">
              <h2>Happy Death Day 2U</h2>
              <p>GET OUT and THE PURGE</p>
            </div>
          </div>

       <!-- Pagination -->
      <div class="w3-center w3-padding" style="margin-top:20px">
        <div class="w3-bar">
          <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
          <a href="#" class="w3-bar-item w3-black w3-button">1</a>
          <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
          <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
        </div>
      </div>

    </div>

    <!--footer !-->
    <footer class=" w3-container w3-mobile w3-dark-grey  w3-text-orange" style="max-width:1500px">

      <p style="text-align:center;">Contact us | FAQ | Privacy | T&C's | About us</p>

    </footer>

    </body>
</html>