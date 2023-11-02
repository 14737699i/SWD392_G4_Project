<%-- 
    Document   : index
    Created on : Oct 31, 2023, 2:35:27 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <%@include file="include/javascripts.jsp" %>
    </head>
    <body>
        <%@include file="include/header.jsp" %>
        <%@include file="include/account.jsp" %>
            <!-- Content -->
            <div id="content">
                <div class="content-section background-product" style="width: 1500px">


                    <!-- Base Product -->
                    <h2 class="section-heading">Trang phục cơ bản</h2>
                    <div  class="container-fluid">
                        <div class="row">
                            <c:forEach items="${sessionScope.list4product}" var="p">
                                <div class="col-md-2 product-down">
                                    <div class="row">
                                        <div class="product-item">
                                            <div class="product-top">
                                                <div class="reviews-rating">

                                                    <c:forEach var="i" begin="0" end="4">
                                                        <c:if test="${(p.rated_star - i) >= 1}">
                                                            <div class="reviews-rating__star is-active"></div> 
                                                        </c:if>
                                                        <c:if test="${(p.rated_star - i) < 1 && (p.rated_star - i) > 0}">
                                                            <div class="reviews-rating__star is-active is-half"></div> 
                                                        </c:if>
                                                        <c:if test="${(p.rated_star - i) <= 0}">
                                                            <div class="reviews-rating__star"></div> 
                                                        </c:if>

                                                    </c:forEach>

                                                </div>
                                                <a href="" class="product-thumb">
                                                    <a href="list-detail?productId=${p.id}&categoryId=${p.category_id}">
                                                        <img src="${p.image}" height="365px" width="230px" alt="">
                                                    </a>


                                                </a>
                                                <c:if test="${sessionScope.us == null}" >
                                                    <a class="buy-now" data-toggle="modal"  data-target="#loginModal" style="color: white">Mua ngay</a>
                                                </c:if>
                                                <c:if test="${sessionScope.us != null}" >
                                                    <a href="addcart?productId=${p.id}" class="buy-now" >Mua ngay</a>
                                                </c:if>
                                            </div>
                                            <div class="product-infor">
                                                <a href="" class="product-name">${p.name}</a>
                                                <div class="product-price">
                                                    <c:if test="${p.sale_price != 0}">
                                                        <fmt:formatNumber value="${p.sale_price}" type="currency" pattern="#,##0.00;-VND#,##0.00VN" maxFractionDigits="0" /> VND
                                                        <fmt:formatNumber value="${p.original_price}" type="currency" pattern="#,##0.00;-VND#,##0.00VN" maxFractionDigits="0" var="formattedPrice" /> 
                                                        <del>${formattedPrice} VND</del>
                                                    </c:if>
                                                    <c:if test="${p.sale_price == 0}">
                                                        <fmt:formatNumber value="${p.sale_price}" type="currency" pattern="#,##0.00;-VND#,##0.00VN" maxFractionDigits="0" var="formattedDiscount" /> 
                                                        <span><fmt:formatNumber value="${p.original_price}" type="currency" pattern="#,##0.00;-VND#,##0.00VN" maxFractionDigits="0" />VND</span>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!-- Blog -->
                <div class="blog-section">
                    <div class="content-section">
                        <h2 class="section-heading text-white">Chúng tôi lắng nghe bạn!</h2>
                        <p class="section-sub-heading text-white">Chúng tôi luôn trân trọng và mong đợi nhận được mọi ý kiến đóng góp từ khách hàng để có thể nâng cấp trải nghiệm dịch vụ và sản phẩm tốt hơn nữa.</p>
 
                    </div>

                </div>
                
    </body>
</html>
