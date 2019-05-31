<%@page import="uts.isd.model.*"%>
<%@page import="uts.isd.model..*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Movie Store</title>
        <script type="text/javascript">
        $(function() {
			showTotal();
			$("#selectAll").click(function() {
        var bool = $("#selectAll").attr("checked");
				setItemCheckBox(bool);
				setPayment(bool);
				showTotal();
			});

			$(":checkbox[name=checkboxBtn]").click(function() {
				var all = $(":checkbox[name=checkboxBtn]").length;
				var select = $(":checkbox[name=checkboxBtn][checked=true]").length;

				if(all == select) {
					$("#selectAll").attr("checked", true);
					setPayment(true);
				} else if(select == 0) {
					$("#selectAll").attr("checked", false);
					setPayment(false);
				} else {
					$("#selectAll").attr("checked", false);
					setPayment(true);
				}
				showTotal();
			});

			$(".amount").click(function() {
				debugger ;
				var id = $(this).attr("id").substring(0, 32).replace("amount","");
				var quantity = $("#" + id + "Quantity").val();
				if(quantity == 1) {
					if(confirm("Do you want to delete this entry?")) {
						location = "cart_delete.jsp?movieIds=" + id;
					}
				} else {
					sendUpdateQuantity(id, quantity-1);
				}
			});

			$(".jia").click(function() {
				debugger ;
				var id = $(this).attr("id").substring(0, 32).replace("Jia","");;

				var quantity = $("#" + id + "Quantity").val();
				sendUpdateQuantity(id, Number(quantity)+1);
			});
		});

		function sendUpdateQuantity(id, quantity) {
			location = "cart_update.jsp?movieId="+id+"&quantity="+quantity;
		}

		function showTotal() {
			var total = 0;

			$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
				debugger ;
				var id = $(this).val();
				var text = $("#" + id + "Subtotal").text();
				total += Number(text);
			});
			$("#total").text(round(total, 2));
		}
		function setItemCheckBox(bool) {
			$(":checkbox[name=checkboxBtn]").attr("checked", bool);
		}

		function setPayment(bool) {
			if(bool) {
				$("#Payment").removeClass("kill").addClass("Payment");
				$("#Payment").unbind("click");
			} else {
				$("#Payment").removeClass("Payment").addClass("kill");
				$("#Payment").click(function() {return false;});
      }
		}


    function batchDelete() {
			var cartItemIdArray = new Array();
			$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
				cartItemIdArray.push($(this).val());
			});
			location = "cart_delete.jsp?movieIds=" + cartItemIdArray.join(',');
		}

		function Payment() {
			var cartItemIdArray = new Array();
			$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
				cartItemIdArray.push($(this).val());
			});
			$("#cartItemIds").val(cartItemIdArray.toString());
			$("#hiddenTotal").val($("#total").text());
			$("#PaymentForm").submit();
		}
</script>
    </head>

    <body>
        <%
            CartItemDb cartItemDb =  (CartItemDb)session.getAttribute("CartItemDb");
            MovieDb manager = (MovieDb)session.getAttribute("manager");
            List<CartItem> cartItemList = (List<CartItem>)session.getAttribute("cartItemList");
            if(cartItemList != null ){
            	for(CartItem cartItem : cartItemList ){
                	Movie movie = manager.searchMovie(cartItem.getMovieId());
                	cartItem.setMovie(movie);
                }
            }
            request.setAttribute("cartItemList", cartItemList);
        %>

        <div class="main" role="main" style="margin-top:100px;">
            <div class="container">
	            <c:choose>
	               <c:when test="${empty cartItemList }">
					<table width="95%" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td align="right">
								<img align="top" src=""/>
							</td>
							<td>
								<span class="spanEmpty">your shop cart has no product</span>
							</td>
						</tr>
					</table>
					</c:when>
					<c:otherwise>
					   <table width="95%" align="center" cellpadding="0" cellspacing="0">
							<tr align="center" bgcolor="#efeae5">
								<td align="left" width="50px">
									<input type="checkbox" id="selectAll" checked="checked"/><label for="selectAll">select all</label>
								</td>
								<td colspan="2">productName</td>
								<td>price</td>
								<td>number</td>
								<td>total</td>
								<td>action</td>
							</tr>
							<c:forEach items="${cartItemList }" var="cartItem">
							<tr align="center">
								<td align="left">
									<input value="${cartItem.movieId }" type="checkbox" name="checkboxBtn" checked="checked"/>
								</td>
								<td align="left" width="70px">
								    <a href="moviedetails.jsp?id=${cartItem.movieId}" class="linkImage">
								     <img border="0" width="54" align="top" src="<c:url value='${cartItem.movie.coverArt }'/>"/>
								    </a>
								</td>
								<td align="left" width="400px">
								    <a href="moviedetails.jsp?id=${cartItem.movieId}" class="linkImage">
								       <span>${cartItem.movie.title }</span>
								    </a>
								</td>
								<td><span>$<span class="currPrice">${cartItem.movie.price }</span></span></td>
								<td>
									<a class="amount" id="${cartItem.movieId }amount"></a><input class="quantity"  id="${cartItem.movieId }Quantity" type="text" readonly="readonly" value="${cartItem.quantity }"/><a class="jia" id="${cartItem.movieId }Jia"></a>
								</td>
								<td width="100px">
									<span class="price_n">$<span class="subTotal" id="${cartItem.movieId }Subtotal">${cartItem.subtotal }</span></span>
								</td>
								<td>
									<a href="cart_delete.jsp?movieIds=${cartItem.movieId}">delete</a>
								</td>
							</tr>
						</c:forEach>
						<tr>
						<td colspan="4" class="tdBatchDelete">
							<a href="javascript:batchDelete();">batch delete</a>
						</td>
						<td colspan="3" align="right" class="tdTotal">
							<span>total account：</span><span class="price_t">$<span id="total"></span></span>
						</td>
					</tr>
					<tr>
						<td colspan="7" align="right">
							<a href="javascript:Payment();" id="Payment" class="Payment"></a>
						</td>
					</tr>
					</table>
					<form id="PaymentForm" action="ordertopayment.jsp" method="post">
						<input type="hidden" name="cartItemIds" id="cartItemIds"/>
						<input type="hidden" name="total" id="hiddenTotal"/>
						<input type="hidden" name="method" value="loadCartItems"/>
					</form>
		           </c:otherwise>
				</c:choose>
            </div>
         </div>
       </html>
    </body>
