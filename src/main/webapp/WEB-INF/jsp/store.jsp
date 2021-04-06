<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
<!doctype html>
<html lang="en" xmlns:th="http://www.w3.org./1999/xhtml">

<body class="d-flex flex-column">

<form id="filter-form" action="/store" method="get">
    <div class="container page-content">
        <div class="row gutters-3">

            <!-- Shop Filters -->
            <div class="col-lg-3 col-md-4">
                <div class="accordion accordion-caret accordion-sidebar d-none d-md-block">
                    <div class="card">
                        <div class="card-header">
                            <a href="#filter-categories" data-toggle="collapse" aria-expanded="true" aria-controls="filter-categories" role="button" class="h6">
                                CATEGORIES
                            </a>
                        </div>
                        <div id="filter-categories" class="collapse show">
                            <div class="card-body">
                                <c:forEach items="${allCategories}" var="item">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="${item}" name="category" value="${item}"
                                           checked="${((param.category != null) and (#lists.contains(param.category, item )))} ? checked">
                                    <label class="custom-control-label" for="${item}" >${item}</label>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <a href="#filter-price" data-toggle="collapse" aria-expanded="true" aria-controls="filter-price" role="button" class="h6">
                                PRICE
                            </a>
                        </div>
                        <div id="filter-price" class="collapse show">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <input type="text" class="form-control form-control-sm rounded-pill text-center font-weight-bold bg-light mr-2 minw-0"
                                           name="pricelow" value="${param.pricelow}">
                                    <input type="text" class="form-control form-control-sm rounded-pill text-center font-weight-bold bg-light ml-2 minw-0"
                                           name="pricehigh" value="${param.pricehigh}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <a href="#filter-size" data-toggle="collapse" aria-expanded="true" aria-controls="filter-size" role="button" class="h6">
                                SIZE
                            </a>
                        </div>
                        <div id="filter-size" class="collapse show">
                            <div class="card-body">
                                <c:forEach items="${#lists.sort(allSizes)}" var="item">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="${item}" name="size" value="${item}"
                                           checked="${((param.size != null) and (#lists.contains(param.size, item )))} ? checked">
                                    <label class="custom-control-label" for="${item}" text="${item}"></label>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <a href="#filter-brands" data-toggle="collapse" aria-expanded="true" aria-controls="filter-brands" role="button" class="h6">
                                BRANDS
                            </a>
                        </div>
                        <div id="filter-brands" class="collapse show">
                            <div class="card-body">
                                <c:forEach items="${allBrands}" var="item">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="${item}" name="brand" value="${item}"
                                           checked="${((param.brand != null) and (#lists.contains(param.brand, item )))} ? checked">
                                    <label class="custom-control-label" for="${item}">${item}</label>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header px-5 py-2 text-center">
                            <button type="submit" form="filter-form" class="btn btn-primary rounded-pill btn-block btn-sm">APPLY</button>
                        </div>
                    </div>
                </div>   <!-- end of accordion sidebar -->

            </div>
            <!-- /Shop Filters -->

            <div class="col-lg-9 col-md-8">
                <!-- /Shop Toolbar -->
                <div class="card mb-3">
                    <div class="row card-body d-flex justify-content-between align-items-start py-2">

                        <div class="col-8 col-md-7 col-lg-6">
                            <button type="button" class="btn btn-sm btn-outline-primary rounded-pill d-block d-md-none mb-2" data-toggle="modal" data-target="#filterModal">
                                <i data-feather="filter"></i> Filter</button>
                            <div class="input-group input-group-search input-group-sm mb-2">

                                <input type="text" class="form-control border-0 bg-light input-search" placeholder="Search..."
                                       name="search" value="${filters.search}">
                                <div class="input-group-append">
                                    <button class="btn btn-light" type="submit"><i data-feather="search"></i></button>
                                </div>
                            </div>
                        </div>

                        <div class="btn-group ml-3">
                            <button type="button" class="btn btn-light btn-sm border rounded-pill" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                <c:choose>
                                    <c:when test="${filters.sort} == 'priceasc'">
                                        <span>Low - High Price</span>
                                    </c:when>
                                    <c:when test="${filters.sort} == 'pricedesc'">
                                        <span>High - Low Price</span>
                                    </c:when>
                                    <c:when test="${filters.sort} == 'alphasc'">
                                        <span>A - Z Order</span>
                                    </c:when>
                                    <c:when test="${filters.sort} == 'alphdesc'">
                                        <span>Z - A Order</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span>Newest</span>
                                    </c:otherwise>
                                </c:choose>
                                <i data-feather="chevron-down"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right shadow-sm">
                                <button class="dropdown-item button-sort" type="button" value="newest">Newest</button>
                                <button class="dropdown-item button-sort" type="button" value="priceasc">Low - High Price</button>
                                <button class="dropdown-item button-sort" type="button" value="pricedesc">High - Low Price</button>
                                <button class="dropdown-item button-sort" type="button" value="alphasc">A - Z Order</button>
                                <button class="dropdown-item button-sort" type="button" value="alphdesc">Z - A Order</button>
                            </div>
                        </div>
                        <input id="input-sort" hidden="hidden" type="text" name="sort" value="${filters.sort}">
                    </div>
                </div>
                <!-- Shop toolbar -->

                <!-- Shop Grid -->
                <div class="grid grid-gap-3 grid-col-2 grid-col-lg-3 mb-3">
                    <c:forEach items="${articles}" var="article">
                    <div class="card card-product">
                        <div class="card-body">
                            <a href="/article-detail?id=${article.id}"><img class="card-img-top" src="${article.picture} ? ${article.picture} : '/image/article/itemexample.jpg'" alt="Card image cap"></a>
                            <a href="/article-detail?id=${article.id}" class="card-title">${article.title}</a>
                            <div class="price"><span class="h5" >$ ${article.price} </span></div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                <!-- /Shop Grid -->

                <!-- Pagination -->
                <div class="card" >
                    <div class="card-body d-flex justify-content-center">
                        <div id="light-pagination"></div>
                    </div>
                </div>
                <!-- /Pagination -->

            </div>
        </div>
    </div> <!-- end container -->

    <!-- Filter Modal -->
    <div class="modal fade" id="filterModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header border-bottom-0">
                    <h5 class="modal-title">Shop Filters</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body p-0">
                </div>
            </div>
        </div>
    </div>
    <!-- /Filter Modal -->

    <input id="page" hidden="hidden" type="text" name="page" value="${filters.page}">

    <input id="totalitems" hidden="hidden" type="text" value="${totalitems}">
    <input id="itemsperpage" hidden="hidden" type="text" value="${itemsperpage}">

</form>
<jsp:include page="footer.jsp"/>
<script>
    var sidebarContent = $('.accordion-sidebar').html()
    $('#filterModal').on('show.bs.modal', function () {
        // move filter contents to modal body
        $(this).find('.modal-body').html('<div class="accordion accordion-caret accordion-sidebar accordion-modal">'+sidebarContent+'</div>')
        // empty the sidebar filter contents
        $('.accordion-sidebar:not(.accordion-modal)').html('')
    })
    $('#filterModal').on('hidden.bs.modal', function () {
        $('.accordion-modal').remove() // remove modal filter contents
        $('.accordion-sidebar').html(sidebarContent) // move filter contents back to the sidebar
    })
    $('.button-sort').click(function () {
        var value = $(this).val()
        var text = $(this).text()
        $('#input-sort').val(value)
        $('#dropdown-sort-text').text(text)
        $('#filter-form').submit()
    })

    $(function() {
        $('#light-pagination').pagination({
            items: $('#totalitems').val(),
            itemsOnPage: $('#itemsperpage').val(),
            currentPage: $('#page').val(),
            cssStyle: 'light-theme',
            useAnchors: false,
            prevText: "<",
            nextText: ">",
            displayedPages: 1,
            edges: 1,
            onPageClick: function(pageNumber) {
                $('#page').val(pageNumber)
                $('#filter-form').submit()
            }
        });
    });
</script>
</body>
</html>