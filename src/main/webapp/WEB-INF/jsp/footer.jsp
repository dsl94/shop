<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<div >
    <div class="footer mt-5">
        <div class="container mt-4">
            <div class="row">
                <div class="col-sm-6 col-lg-3 text-center pr-5">
                    <h5 class="font-weight-bold">SUBSCRIBE</h5>
                    <p>to our Newsletter to receive the latest news, sales and promos</p>
                    <form>
                        <div class="form-group">
                            <input type="email" class="form-control rounded-pill text-center footer-input" placeholder="Enter your email">
                        </div>
                        <button type="button" class="btn btn-primary btn-block rounded-pill">SUBSCRIBE</button>
                    </form>
                </div>
                <div class="col-6 col-lg-3 pl-3">
                    <h6 class="font-weight-bold">Customer Service</h6>
                    <div class="list-group list-group-flush list-group-no-border list-group-sm">
                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">Help Center</a>
                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">How to buy</a>
                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">Delivery</a>
                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">How to return</a>
                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">Payment Method</a>
                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">Shipping Method</a>
                    </div>
                </div>
                <div class="col-6 col-lg-3 pl-3">
                    <h6 class="font-weight-bold">Met Shop</h6>
                    <div class="list-group list-group-flush list-group-no-border list-group-sm">
                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">About Us</a>
                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">Terms and Conditions</a>
                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">Privacy Policy</a>
                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">FAQs</a>
                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">Our Story</a>
                        <a href="javascript:void(0)" class="list-group-item list-group-item-action">Services</a>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3 pl-3">
                    <h6 class="font-weight-bold ">Contact us</h6>
                    <div class="list-group list-group-flush list-group-no-border list-group-sm">
                        <span class="list-group-item"><strong>Phone:</strong> 00 55 124 8000</span>
                        <span class="list-group-item"><strong>Email:</strong> contact@metshop.com</span>
                        <span class="list-group-item"><strong>Mon-Fri:</strong> 9.00 am - 8.00 pm</span>
                        <span class="list-group-item"><strong>Saturday:</strong> 10.00 am - 6.00 pm</span>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">Copyright © 2019 Met Shop All rights reserved</div>
</div>


<div fragment="body-scripts">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>
        window.jQuery
        || document
            .write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')
    </script>
    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/datatables.min.js"></script>
    <script src="/js/tagsinput.js"></script>
    <script>feather.replace()</script>
    <script type="text/javascript" src="/js/jquery.simplePagination.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script>
        //prevent multiple form submission
        $(function() {
            $('form').submit(function(){
                $("button[type='submit']", this)
                    .text("Please Wait...")
                    .attr('disabled', 'disabled');
                return true;
            });
        });
    </script>

</div>

</body>

</html>