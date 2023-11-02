<%-- 
    Document   : myorder
    Created on : Nov 1, 2023, 8:58:41 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <%@include file="include/javascripts.jsp" %>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script src="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"></script>
        <style>
            .mtop {
                margin-top: 6%;
            }
            .title-order {
                display: flex;
                justify-content: center;
                color: red;
            }
        </style>
    </head>
    <body>
        <%@include file="include/header.jsp" %>
        <h2 class="mtop title-order" >Danh sách các đơn hàng</h2>
        <div class="container mtop" style="width:80%">
            <table class="table table-striped table-bordered" id="sortTable">
                <thead>
                    <tr>
                        <th>OrderID</th>
                        <th>Ngày&nbspmua&nbsphàng</th>
                        <th>Sản&nbspphẩm</th>
                        <th>Tổng&nbspchi&nbspphí</th>
                        <th>Tình&nbsptrạng</th>
                            
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items ="${listMyOrder}" var="c">
                        <tr>
                            <td><a href="order-detail?orderId=${c.orderID}">
                                    ${c.orderID}</a></td>
                            <td>${c.date}</td>
                            <c:if test="${c.countProduct != 0}">
                                <td>${c.fullNameFirstProduct} và ${c.countProduct} sản phẩm khác</td>
                            </c:if>
                            <c:if test="${c.countProduct == 0}">
                                <td>${c.fullNameFirstProduct}</td>
                            </c:if>
                            <td>${c.total_cost}</td>
                            <c:if test="${c.status_order == 1}">
                                <td>Ðang g?i</td>
                            </c:if>
                            <c:if test="${c.status_order == 2}">
                                <td>Thành công</td>
                            </c:if>
                        </tr>

                    </c:forEach>

                </tbody>
            </table>
        </div>
        <div class="mtop"></div>
        <%--<%@include file="include/footer.jsp" %>--%>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        
    </body>
</html>
