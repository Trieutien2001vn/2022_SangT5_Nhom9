<%@ page import="utils.UtilsPath" %>
<%@ page import="model.Accounts" %>
<%@ page import="com.restfb.types.User" %>
<%@ page import="model.GooglePojo" %>
<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <title>Trang chủ - Coffee Blend</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">


    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/signin_signup.css">
    <link rel="stylesheet" href="css/userStyle.css">
    <link rel="stylesheet" href="css/search.css">

    <style>
        .product-description-1 {
            min-height: 130px !important;
        }

        .product-description-2 {
            min-height: 190px !important;
        }

        .product-description-3 {
            min-height: 290px !important;
        }
    </style>

</head>
<%
    Accounts account = (Accounts) session.getAttribute("account");
    User userFB = (User) session.getAttribute("userFB");
    GooglePojo googlePojo = (GooglePojo) session.getAttribute("userGG");
%>
<body>
<!--Header-->
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Coffee<small>Blend</small></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>
        <div class="collapse navbar-collapse menu" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="search_and_icon">
                    <input type="text" class="form-control search align-left-search" placeholder="Tìm kiếm......">
                    <a class="icon-search align-left-search"></a>
                </li>
                <li class="nav-item active"><a href="index.jsp" class="nav-link">Trang chủ</a></li>
                <%--                <li class="nav-item"><a href="menu.html" class="nav-link">Thực đơn</a></li>--%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">Cửa hàng</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="about.html">Về chúng tôi</a>
                        <a class="dropdown-item" href="menu.html">Thực đơn</a>
                        <a class="dropdown-item" href="shop.html">Cửa hàng</a>
                        <a class="dropdown-item" href="product-details.html">Chi tiết sản phẩm</a>
                        <a class="dropdown-item" href="cart.html">Giỏ hàng</a>
                        <a class="dropdown-item" href="checkout.html">Thanh toán</a>
                    </div>
                </li>
                <li class="nav-item"><a href="contact.html" class="nav-link">Liên hệ</a></li>

                <li class="nav-item dropdown">
                    <%
                        if (session.getAttribute("userGG") == null && session.getAttribute("userFB") == null && session.getAttribute("account") == null) {
                    %>
                    <a class="nav-link dropdown-toggle" href="shop.html" id="dropdown05" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false"><i class="icon-user"></i>&nbsp;Tài
                        Khoản</a>
                    <%
                    } else if (session.getAttribute("userFB") != null) {
                    %>
                    <a class="nav-link dropdown-toggle" href="shop.html" id="dropdown05" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false" style="text-transform: none"><i class="icon-user"></i>&nbsp;<%=userFB.getName()%>
                    </a>
                    <%
                    } else if (session.getAttribute("userGG") != null) {
                    %>
                    <a class="nav-link dropdown-toggle" href="shop.html" id="dropdown05" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false"
                       style="text-transform: none"><i class="icon-user"></i>&nbsp;<%=googlePojo.getEmail()%>
                    </a>
                    <%
                    } else if (session.getAttribute("account") != null) {
                    %>
                    <a class="nav-link dropdown-toggle" href="shop.html" id="dropdown05" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false" style="text-transform: none"><i
                            class="icon-user"></i>&nbsp;<%=account.getUserName()%>
                    </a>
                    <%
                        }
                    %>
                    <div class="dropdown-menu" aria-labelledby="dropdown05">

                        <%
                            if (session.getAttribute("account") == null && session.getAttribute("userFB") == null && session.getAttribute("userGG") == null) {

                        %>
                        <a class="dropdown-item" href="login.jsp">Đăng nhập</a>
                        <a class="dropdown-item" href="register.jsp">Đăng ký</a>
                        <%
                        } else {

                        %>
                        <a class="dropdown-item" href="<%=UtilsPath.getPath("LoginController")%>">Đăng
                            xuất</a>
                        <%
                            }
                        %>
                        <%
                            if (session.getAttribute("userFB") == null && session.getAttribute("userGG") == null) {

                        %>

                        <a class="dropdown-item" href="infoUser.jsp">Thông tin cá nhân</a>
                        <%
                            }

                        %>

                    </div>
                </li>

                <li class="nav-item cart"><a href="cart.html" class="nav-link"><span
                        class="icon icon-shopping_cart"></span><span
                        class="bag d-flex justify-content-center align-items-center"><small>1</small></span></a></li>
            </ul>
        </div>
    </div>
</nav>


<!--Content-->
<section class="home-slider owl-carousel">
    <div class="slider-item" style="background-image: url(images/bg_1.jpg);">
        <div class="overlay"></div>
        <div class="container">
            <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                <div class="col-md-8 col-sm-12 text-center ftco-animate">
                    <span class="subheading">Welcome</span>
                    <h1 class="mb-4">The Best Coffee Testing Experience</h1>
                    <p class="mb-4 mb-md-5">A small river named Duden flows by their place and supplies it with the
                        necessary regelialia.</p>
                    <p><a href="shop.html" class="btn btn-primary p-3 px-xl-4 py-xl-3">Đặt mua</a> <a href="menu.html"
                                                                                                      class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">
                        Thực đơn</a></p>
                </div>

            </div>
        </div>
    </div>

    <div class="slider-item" style="background-image: url(images/bg_2.jpg);">
        <div class="overlay"></div>
        <div class="container">
            <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                <div class="col-md-8 col-sm-12 text-center ftco-animate">
                    <span class="subheading">Welcome</span>
                    <h1 class="mb-4">Amazing Taste &amp; Beautiful Place</h1>
                    <p class="mb-4 mb-md-5">A small river named Duden flows by their place and supplies it with the
                        necessary regelialia.</p>
                    <p><a href="#" class="btn btn-primary p-3 px-xl-4 py-xl-3">Đặt mua</a> <a href="#"
                                                                                              class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">
                        Thực đơn</a></p>
                </div>

            </div>
        </div>
    </div>

    <div class="slider-item" style="background-image: url(images/bg_3.jpg);">
        <div class="overlay"></div>
        <div class="container">
            <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                <div class="col-md-8 col-sm-12 text-center ftco-animate">
                    <span class="subheading">Welcome</span>
                    <h1 class="mb-4">Creamy Hot and Ready to Serve</h1>
                    <p class="mb-4 mb-md-5">A small river named Duden flows by their place and supplies it with the
                        necessary regelialia.</p>
                    <p><a href="shop.html" class="btn btn-primary p-3 px-xl-4 py-xl-3">Đặt mua</a> <a href="#"
                                                                                                      class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">
                        Thực đơn</a></p>
                </div>

            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section ftco-animate text-center">
                <span class="subheading">Khám phá</span><br>
                <h2 class="mb-4">Sản phẩm bán chạy nhất</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="menu-entry">
                    <a href="#" class="img" style="background-image: url(images/ca_phe_may/latte.jpg);"></a>
                    <div class="text text-center pt-4">
                        <h3><a href="#">Latte</a></h3>
                        <p>A small river named Duden flows by their place and supplies</p>
                        <p class="price"><span>$5.90</span></p>
                        <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ hàng</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="menu-entry">
                    <a href="#" class="img" style="background-image: url(images/ca_phe_may/cappuccino.jpg);"></a>
                    <div class="text text-center pt-4">
                        <h3><a href="#">Cappuccino</a></h3>
                        <p>A small river named Duden flows by their place and supplies</p>
                        <p class="price"><span>$5.90</span></p>
                        <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ hàng</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="menu-entry">
                    <a href="#" class="img" style="background-image: url(images/ca_phe_may/mocha.jpg);"></a>
                    <div class="text text-center pt-4">
                        <h3><a href="#">Mocha</a></h3>
                        <p>A small river named Duden flows by their place and supplies</p>
                        <p class="price"><span>$5.90</span></p>
                        <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ hàng</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="menu-entry">
                    <a href="#" class="img"
                       style="background-image: url(images/tra_sua_macchiato/tra_den_macchiato.jpg);"></a>
                    <div class="text text-center pt-4">
                        <h3><a href="#">Trà Đen Macchiato</a></h3>
                        <p>A small river named Duden flows by their place and supplies</p>
                        <p class="price"><span>$5.90</span></p>
                        <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ hàng</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-menu">
    <div class="container">
        <div class="row justify-content-center mb-5">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <span class="subheading">Khám phá</span><br>
                <h2 class="mb-4">Sản phẩm của chúng tôi</h2>
            </div>
        </div>
        <div class="row d-md-flex">
            <div class="col-lg-12 ftco-animate p-md-5">
                <div class="row">
                    <div class="col-md-12 nav-link-wrap mb-5">
                        <div class="nav ftco-animate nav-pills justify-content-center" id="v-pills-tab" role="tablist"
                             aria-orientation="vertical">
                            <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1"
                               role="tab" aria-controls="v-pills-1" aria-selected="true">CÀ PHÊ MÁY</a>

                            <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab"
                               aria-controls="v-pills-2" aria-selected="false">COLD BREW</a>

                            <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab"
                               aria-controls="v-pills-3" aria-selected="false">MATCHA - SOCOLA</a>

                            <a class="nav-link" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab"
                               aria-controls="v-pills-4" aria-selected="false">THỨC UỐNG TRÁI CÂY</a>

                            <a class="nav-link" id="v-pills-5-tab" data-toggle="pill" href="#v-pills-5" role="tab"
                               aria-controls="v-pills-5" aria-selected="false">TRÀ SỮA MACCHIATO</a>
                        </div>
                    </div>
                    <div class="col-md-12 d-flex align-items-center">

                        <div class="tab-content ftco-animate" id="v-pills-tabContent">

                            <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel"
                                 aria-labelledby="v-pills-1-tab">
                                <div class="row">
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/ca_phe_may/cappuccino.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Cappuccino</a></h3>
                                                <p class="product-description-1">Cappuccino được gọi vui là thức uống
                                                    "một-phần-ba" - 1/3 Espresso,
                                                    1/3 Sữa nóng, 1/3 Foam.
                                                </p>
                                                <div class="custom-1">
                                                    <p class="price"><span>$2.90</span></p>
                                                    <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào
                                                        giỏ hàng</a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/ca_phe_may/latte.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Latte</a></h3>
                                                <p class="product-description-1">Khi chuẩn bị Latte, cà phê Espresso và
                                                    sữa nóng được trộn lẫn vào
                                                    nhau, bên trên vẫn là lớp foam nhưng mỏng và nhẹ hơn Cappucinno.
                                                </p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/ca_phe_may/mocha.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Mocha</a></h3>
                                                <p class="product-description-1">Cà phê Mocha được ví von đơn giản là
                                                    Sốt Sô cô la được pha cùng một
                                                    tách Espresso.
                                                </p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">
                                <div class="row">
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/cold_brew/coldbrew_phucbontu.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Cold Brew Phúc bồn tử</a></h3>
                                                <p class="product-description-3">Một sự kết hợp đầy thuyết phục cho
                                                    những người thích cà phê nhưng lại
                                                    muốn thay đổi vị.
                                                    Vị chua ngọt của trái phúc bồn tử, làm dậy lên hương vị trái cây tự
                                                    nhiên vốn sẵn có trong hạt cà phê,
                                                    hòa quyện thêm vị đăng đắng, ngọt dịu nhẹ nhàng của Cold Brew để
                                                    mang đến một cách thưởng thức cà phê hoàn toàn mới,
                                                    vừa thơm lừng hương cà phê quen thuộc, vừa nhẹ nhàng và thanh mát
                                                    bởi hương trái cây đầy thú vị.</p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/cold_brew/coldbrew_suatuoimacchiato.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Cold Brew Sữa tươi Macchiato</a></h3>
                                                <p class="product-description-3">Cold Brew Sữa Tươi Macchiato - hương vị
                                                    cà phê vừa quen vừa lạ. Quen
                                                    bởi vị đăng đắng và ngọt dịu của Cold Brew, thức uống "Signature"
                                                    của Nhà. Lạ bởi phong vị ngọt ngào của lớp sữa tươi và lớp foam
                                                    macchiato beo béo được đánh lên sánh mịn.</p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/cold_brew/coldbrew_camvang.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Cold brew cam vàng</a></h3>
                                                <p class="product-description-3">Sự kết hợp vừa quen vừa lạ giữa cà phê
                                                    ngâm lạnh (100% Arabica Cầu
                                                    Đất) với nước ép cam tươi và sả ngâm cho vị cân bằng,
                                                    tươi mát quyện trong hương vị cà phê tròn đầy. Cam sả - cái tên quen
                                                    thuộc đưa bạn đến gần với Nhà ngày nào,
                                                    giờ được khoác lên mình dáng vẻ mới lạ cùng Cold Brew, 1 hương vị
                                                    bạn khó lòng bỏ qua khi ghé Nhà trong mùa hè này.</p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab">
                                <div class="row">
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/matcha_socola/socola_daxay.jpg   );"></a>
                                            <div class="text">
                                                <h3><a href="#">Sô-cô-la đá xay</a></h3>
                                                <p class="product-description-1">Vị đắng của cà phê kết hợp cùng vị
                                                    cacao ngọt ngào của sô-cô-la, vị
                                                    sữa tươi ngọt béo, đem đến trải nghiệm vị giác cực kỳ thú vị.</p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/matcha_socola/matcha_latte.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Matcha latte</a></h3>
                                                <p class="product-description-1">Với màu xanh mát mắt của bột trà
                                                    Matcha, vị ngọt nhẹ nhàng, pha trộn
                                                    cùng sữa tươi và lớp foam mềm mịn, Matcha Latte là thức uống yêu
                                                    thích của tất cả mọi người.</p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/matcha_socola/matcha_daxay.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Matcha đá xay</a></h3>
                                                <p class="product-description-1">Matcha thanh, nhẫn, và đắng nhẹ được
                                                    nhân đôi sảng khoái khi uống
                                                    lạnh. Nhấn nhá thêm những nét bùi béo của kem và sữa. Gây thương nhớ
                                                    vô cùng!</p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-4-tab">
                                <div class="row">
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/thuc_uong_trai_cay/pbt_cam_daxay.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Phúc bồn tử cam đá xay</a></h3>
                                                <p class="product-description-2">Tê tái ngay đầu lưỡi bởi sự mát lạnh
                                                    của đá xay.
                                                    Hòa quyện thêm hương vị chua chua, ngọt ngọt từ trái cam tươi và
                                                    trái phúc bồn tử 100% tự nhiên, để cho ra một hương vị thanh mát,
                                                    kích thích vị giác đầy thú vị ngay từ lần đầu thưởng thức.</p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/thuc_uong_trai_cay/chanh_sa_daxay.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Chanh sả đá xay</a></h3>
                                                <p class="product-description-2">Sự kết hợp hài hoà giữa những nguyên
                                                    liệu mộc mạc rất đỗi quen thuộc
                                                    đối với người Việt cho một thức uống thanh mát, giải nhiệt lại tốt
                                                    cho sức khoẻ.</p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/thuc_uong_trai_cay/sinhto_vietquat.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Sinh tố việt quất</a></h3>
                                                <p class="product-description-2">Mứt Việt Quất chua thanh, ngòn ngọt,
                                                    phối hợp nhịp nhàng với dòng sữa
                                                    chua bổ dưỡng. Là món sinh tố thơm ngon mà cả đầu lưỡi và làn da đều
                                                    thích.</p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="v-pills-5" role="tabpanel" aria-labelledby="v-pills-5-tab">
                                <div class="row">
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/tra_sua_macchiato/cherry_macchiato.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Trà cherry macchiato</a></h3>
                                                <p class="product-description-2">Khoác lên mình một ngoại hình tràn đầy
                                                    năng lượng với sắc đỏ rực rỡ
                                                    của Cherry chín mọng, kết hợp với nền trà oolong hảo hạng và lớp
                                                    foam sánh mịn, để mang đến cho bạn một thức uống khoan khoái và dậy
                                                    lên từng phong vị chua, béo, ngọt đầy ấn tượng.</p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/tra_sua_macchiato/matcha_macchiato.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Trà matcha macchiato</a></h3>
                                                <p class="product-description-2">Bột trà xanh Matcha thơm lừng hảo hạng
                                                    cùng lớp Macchiato béo ngậy là
                                                    một sự kết hợp tuyệt vời.</p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-center">
                                        <div class="menu-wrap">
                                            <a href="#" class="menu-img img mb-4"
                                               style="background-image: url(images/tra_sua_macchiato/tra_den_macchiato.jpg);"></a>
                                            <div class="text">
                                                <h3><a href="#">Trà đen macchiato</a></h3>
                                                <p class="product-description-2">Trà đen được ủ mới mỗi ngày, giữ nguyên
                                                    được vị chát mạnh mẽ đặc
                                                    trưng của lá trà, phủ bên trên là lớp Macchiato "homemade" bồng bềnh
                                                    quyến rũ vị phô mai mặn mặn mà béo béo.</p>
                                                <p class="price"><span>$2.90</span></p>
                                                <p><a href="#" class="btn btn-primary btn-outline-primary">Thêm vào giỏ
                                                    hàng</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-counter ftco-bg-dark img" id="section-counter" style="background-image: url(images/bg_2.jpg);"
         data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
                        <div class="block-18 text-center">
                            <div class="text">
                                <div class="icon"><span class="flaticon-coffee-cup"></span></div>
                                <strong class="number" data-number="3">0</strong>
                                <span>Chi nhánh</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
                        <div class="block-18 text-center">
                            <div class="text">
                                <div class="icon"><span class="flaticon-coffee-cup"></span></div>
                                <strong class="number" data-number="5">0</strong>
                                <span>Giải thưởng</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
                        <div class="block-18 text-center">
                            <div class="text">
                                <div class="icon"><span class="flaticon-coffee-cup"></span></div>
                                <strong class="number" data-number="999">0</strong>
                                <span>Khách hàng hài lòng</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
                        <div class="block-18 text-center">
                            <div class="text">
                                <div class="icon"><span class="flaticon-coffee-cup"></span></div>
                                <strong class="number" data-number="3">0</strong>
                                <span>Nhân viên</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section ftco-services">
    <div class="container">
        <div class="row">
            <div class="col-md-4 ftco-animate">
                <div class="media d-block text-center block-6 services">
                    <div class="icon d-flex justify-content-center align-items-center mb-5">
                        <span class="flaticon-choices"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Đặt mua dễ dàng</h3>
                        <p>Even the all-powerful Pointing has no control about the blind texts it is an almost
                            unorthographic.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ftco-animate">
                <div class="media d-block text-center block-6 services">
                    <div class="icon d-flex justify-content-center align-items-center mb-5">
                        <span class="flaticon-delivery-truck"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Giao hàng nhanh</h3>
                        <p>Even the all-powerful Pointing has no control about the blind texts it is an almost
                            unorthographic.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ftco-animate">
                <div class="media d-block text-center block-6 services">
                    <div class="icon d-flex justify-content-center align-items-center mb-5">
                        <span class="flaticon-coffee-bean"></span></div>
                    <div class="media-body">
                        <h3 class="heading">Chất lượng cà phê</h3>
                        <p>Even the all-powerful Pointing has no control about the blind texts it is an almost
                            unorthographic.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!--Footer-->
<footer class="ftco-footer ftco-section img">
    <div class="overlay"></div>
    <div class="container">
        <div class="row mb-5">
            <div class="col-lg-4 col-md-6 mb-5 mb-md-5">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Về chúng tôi</h2>
                    <p>Chúng tôi là đơn vị chuyên cung cấp Cafe nguyên chất, chất lượng cao, giá rẻ, uy tín hàng đầu Việt Nam!</p>
                    <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                        <li class="ftco-animate"><a href="#"><span class="icon-google"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-map"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-linkedin"></span></a></li>

                    </ul>
                </div>

            </div>
            <div class="col-lg-4 col-md-6 mb-5 mb-md-5">
                <div class="ftco-footer-widget mb-4 ml-md-4">
                    <h2 class="ftco-heading-2">Các thành viên</h2>
                    <ul class="list-unstyled">
                        <li><a href="https://www.facebook.com/hoan1305" target="_blank" class="py-2 d-block"><i class="icon-user"></i>&nbsp;&nbsp;Hồ Như Hoan</a>
                        </li>
                        <li><a href="https://www.facebook.com/trieutien.nguyen.566" target="_blank" class="py-2 d-block"><i class="icon-user"></i>&nbsp;&nbsp;Nguyễn Triều Tiên</a>
                        <li><a href="https://www.facebook.com/pham.nhi.7121" target="_blank" class="py-2 d-block"><i class="icon-user"></i>&nbsp;&nbsp;Phạm Lê Minh Đạt</a></li>
                        </li>
                        <!--                        <li><a href="#" class="py-2 d-block">Mixed</a></li>-->
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-5 mb-md-5">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Địa chỉ cửa hàng</h2>
                    <div class="block-23 mb-3">
                        <ul>
                            <li><span class="icon icon-map-marker"></span><span class="text">Trường Đại học Nông Lâm Thành phố Hồ Chí Minh, Quận Thủ Đức, Phường Linh Trung.</span>
                            </li>

                            <li><a href="#"><span class="icon icon-envelope"></span><span class="text">Nhom9@gmail.com</span></a>
                            </li>
                            <li><a href="#"><span class="icon icon-phone"></span><span
                                    class="text">0339.7777.7777</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3917.4079845565907!2d108.10253121475031!3d10.932522342215707!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3176830fbdee7559%3A0x609ed4fe60be595!2zQ8O0bmcgVHkgVE5ISCBWaeG7hW4gVGjDtG5nLVRpbiBI4buNYyBMw6ogVGhhbmg!5e0!3m2!1svi!2s!4v1540900378092"
                    width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">

                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Được thiết kế bởi Nhóm 9 - <script>document.write(new Date().getFullYear());</script>
                    </br>   Nghiêm cấm ăn cắp (sao chép) dưới mọi hình thức!
                    <!--                    This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a-->
                    <!--                            href="https://colorlib.com" target="_blank">Colorlib</a>-->
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
            </div>
        </div>
    </div>
</footer>


<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"/>
    </svg>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>
<script src="js/user.js"></script>


</body>
</html>
