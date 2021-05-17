
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
    <%@include file="styleMain.css"%>
</style>
<body>

<h2 style="text-align:center">Slideshow Gallery</h2>

<div class="container">
    <div class="mySlides">
        <div class="numbertext">1 / 6</div>
        <img src="img/exhibition1.jpg" style="width:100%">
    </div>

    <div class="mySlides">
        <div class="numbertext">2 / 6</div>
        <img src="img/exhibition2.jpg" style="width:100%">
    </div>

    <div class="mySlides">
        <div class="numbertext">3 / 6</div>
        <img src="img/exhibition3.jpg" style="width:100%">
    </div>

    <div class="mySlides">
        <div class="numbertext">4 / 6</div>
        <img src="img/exhibition4.jpg" style="width:100%">
    </div>

    <div class="mySlides">
        <div class="numbertext">5 / 6</div>
        <img src="img/exhibition5.jpg" style="width:100%">
    </div>

    <div class="mySlides">
        <div class="numbertext">6 / 6</div>
        <img src="img/exhibition6.jpg" style="width:100%">
    </div>

    <a class="prev" onclick="plusSlides(-1)">❮</a>
    <a class="next" onclick="plusSlides(1)">❯</a>

    <div class="caption-container">
        <p id="caption"></p>
    </div>

    <div class="row">
        <div class="column">
            <img class="demo cursor" src="img/exhibition1.jpg" style="width:100%" onclick="currentSlide(1)" alt="The Woods">
        </div>
        <div class="column">
            <img class="demo cursor" src="img/exhibition2.jpg" style="width:100%" onclick="currentSlide(2)" alt="Cinque Terre">
        </div>
        <div class="column">
            <img class="demo cursor" src="img/exhibition3.jpg" style="width:100%" onclick="currentSlide(3)" alt="Mountains and fjords">
        </div>
        <div class="column">
            <img class="demo cursor" src="img/exhibition4.jpg" style="width:100%" onclick="currentSlide(4)" alt="Northern Lights">
        </div>
        <div class="column">
            <img class="demo cursor" src="img/exhibition5.jpg" style="width:100%" onclick="currentSlide(5)" alt="Nature and sunrise">
        </div>
        <div class="column">
            <img class="demo cursor" src="img/exhibition6.jpg" style="width:100%" onclick="currentSlide(6)" alt="Snowy Mountains">
        </div>
    </div>
</div>

<script>
    <%@include file="scriptMain.js"%>
</script>

</body>
</html>

<%@include file="footer.jsp"%>>