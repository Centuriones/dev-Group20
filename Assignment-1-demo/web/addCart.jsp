<%@page import="uts.isd.model.db.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Online Movie Store</title>
    </head>
    <body>
        <%
           int movieId = Integer.parseInt(request.getParameter("movieid"));
           int quantity = Integer.parseInt(request.getParameter("quantity"));
           CartItemDb cartItemDb =  (CartItemDb)session.getAttribute("CartItemDb");
           CartItem cartItem = cartItemDb.searchCartItemByMovieId(session,movieId);
           if(cartItem != null ){
        	   cartItemDb.editCart(session,cartItem.getMovieId(), quantity+cartItem.getQuantity());
           }else{
        	   cartItemDb.addCart(session,quantity, movieId);
           }
           response.sendRedirect("cart.jsp");
        %>

    </body>
</html>
