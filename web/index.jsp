<%-- 
    Document   : index
    Created on : Oct 31, 2023, 2:35:27 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
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


                <div class="content-Category-section background-product"><!--

                    <!-- Product list -->
                    <h2 class="section-heading">Những sản phẩm đa dạng</h2>
                    <div class="category-list">
                        <a href="list?&categoryId=3&gender="><div class="category-item category-img" style="background: url('./assets/img/categoryImg/categoryImg1.jpg')
                                                          top center / cover no-repeat">
                                <div class="category-content">Đồ mặc trong</div>
                            </div></a>

                        <a href="list?&categoryId=1&gender="><div class="category-item category-img" style="background: url('./assets/img/categoryImg/categoryImg2.jpg')
                                                          top center / cover no-repeat">
                                <div class="category-content">Đồ mặc ngoài</div>
                            </div></a>

                        <a href="list?&categoryId=4&gender="><div class="category-item category-img" style="background: url('./assets/img/categoryImg/categoryImg3.jpg')
                                                          top center / cover no-repeat">
                                <div class="category-content">Phụ kiện</div>
                            </div></a>


                        <a href="list?&categoryId=2&gender="><div class="category-item category-img" style="background: url('./assets/img/categoryImg/categoryImg4.jpg')
                                                          top center / cover no-repeat">
                                <div class="category-content">Quần</div>
                            </div></a>

                        <div class="clear"></div>
                    </div> 
                </div>
                <!-- Blog -->
                <div class="blog-section">
                    <div class="content-section">
                        <h2 class="section-heading text-white">Chúng tôi luôn mang đến những công nghệ hiện đại nhất</h2>
                        <p class="section-sub-heading text-white">Công nghệ Việt cho người Việt</p>

                        <!-- blog list hot -->
                        <div class="blog-list">

                            <c:forEach items="${sessionScope.listBlog_HomePage}" var="c">
                                <div class="blog-item">
                                    <img src="${c.thumbnail}" alt="" class="blog-img" style="width: 592px; height: 450px">
                                    <div class="blog-body" style="min-height: 340px">
                                        <h3 class="blog-heading" style="font-size: 40px">${c.title}</h3>
                                        <p class="blog-desc">${c.brief_infor}</p>
                                        <a href="blogDetail?blog_id=${c.blog_id}&categoryBlog_id=${c.categoryBlog_id}" class="place-buy-btn">Tìm hiểu thêm</a>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="clear"></div>
                        </div> 
                    </div>

                </div>
        <%@include file="include/footer.jsp" %>       
    </body>
</html>
