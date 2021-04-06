<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="d-flex flex-column" >

<jsp:include page="header.jsp" />

<div class="jumbotron jumbotron-fluid mt-0" style="background-image: url(/image/background/adidas-background.jpg);">
    <div class="container">
        <div class="row text-left py-5">
            <div class="col-sm-12 col-md-10 offset-md-1 col-lg-8 offset-lg-3 col-xl-6 offset-xl-6 my-auto">
                <h2 class="bg-warning text-dark d-inline-block p-1">Brand New</h2>
                <h1 class="font-weight-bold">High Quality Shoes</h1>
                <a href="/store}" class="btn btn-primary rounded-pill" data-addclass-on-xs="btn-sm">SHOP NOW</a>
            </div>
        </div>
    </div>
</div>


<section class="section py-5 ">
    <div class="container text-center">
        <h4 class="font-weight-bold ">Featured products</h4>
        <div class="featured-items mt-4">
            <c:forEach items="${articles}" var="article">
            <div class="card card-product card-featured">
                <div class="card-body">
                    <a href="/article-detail?id=${article.id}"><img class="card-img-top" src="${article.picture} ? ${article.picture} : /image/article/itemexample.jpg" alt="Card image cap"></a>
                    <a href="/article-detail?id=${article.id}" class="card-title" >${article.title}</a>
                    <div class="price"><span >$ ${article.price}</span></div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</section>


<!-- start section -->
<section class="section py-5 bg-white">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 mb-2">
                <div class="text-center features-card">
                    <i data-feather="truck" class="text-info"></i>
                    <h5>Free Shipping</h5>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                        elit. Dolorum, eius, quae, aliquam.</p>
                </div>
            </div>
            <div class="col-sm-6 col-md-4 mb-2">
                <div class="text-center features-card">
                    <i data-feather="user" class="text-info"></i>
                    <h5>Support 24/7</h5>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                        elit. Dolorum, eius, quae, aliquam.</p>
                </div>
            </div>
            <div class="col-sm-6 col-md-4 mb-2">
                <div class="text-center features-card">
                    <i data-feather="gift" class="text-info"></i>
                    <h5>Gift cards</h5>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                        elit. Dolorum, eius, quae, aliquam.</p>
                </div>
            </div>
        </div>
    </div> <!-- end container -->
</section> <!-- end section -->



<section class="section pt-5">
    <div class="container text-center">
        <h4 class="font-weight-bold">Popular brands</h4>
        <div class="featured-brands mt-3">
            <img class="img-fluid py-5 px-5" src="/image/brands/01.png">
            <img class="img-fluid py-5 px-5" src="/image/brands/02.png">
            <img class="img-fluid py-5 px-5" src="/image/brands/03.png">
            <img class="img-fluid py-5 px-5" src="/image/brands/04.png">
            <img class="img-fluid py-5 px-5" src="/image/brands/05.png">
            <img class="img-fluid py-5 px-5" src="/image/brands/06.png">
            <img class="img-fluid py-5 px-5" src="/image/brands/07.png">
        </div>

    </div>
</section>

<jsp:include page="footer.jsp" />

<script type="text/javascript">
    $(document).ready(function(){
        $('.featured-items').slick({
            infinite: true,
            slidesToShow: 4,
            slidesToScroll: 4,
            responsive: [
                {
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3,
                    }
                },
                {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1
                    }
                }
            ]
        })
            .on('setPosition', function (event, slick) {
                slick.$slides.css('height', slick.$slideTrack.height() + 'px');
            });
        $('.featured-brands').slick({
            slidesToShow: 6,
            slidesToScroll: 1,
            responsive: [
                {
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 5,
                        slidesToScroll: 1,
                    }
                },
                {
                    breakpoint: 992,
                    settings: {
                        slidesToShow: 4,
                        slidesToScroll: 4
                    }
                },
                {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 550,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2
                    }
                },
                {
                    breakpoint: 380,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1
                    }
                },
            ]
        });
    });
</script>
</body>
</html>