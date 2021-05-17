<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="content" />


<!DOCTYPE html>
<html lang="${language}">
<head>
    <meta name="viewport" content="width=device-width-200, initial-scale=1.0">
    <style>
        <%@include file="styleMain.css"%>
    </style>
</head>
<body>
<form>
    <select id="language" name="language" onchange="submit()">
        <option value="en" ${language == 'en' ? 'selected' : ''}>ENG</option>
        <option value="uk" ${language == 'uk' ? 'selected' : ''}>UA</option>
    </select>
</form>
<div id="Info" class="tabcontent">
    <h1><fmt:message key="info"/> </h1>
    <p><fmt:message key="info_message"/></p>
</div>

<div id="Coming" class="tabcontent">
    <h1><fmt:message key="coming"/> </h1>
    <p>ADDDD!!!!</p>
</div>

<div id="About" class="tabcontent">
    <h1><fmt:message key="about"/> </h1>
    <p><fmt:message key="about_message"/> </p>
</div>

<div id="Contacts" class="tabcontent">
    <h1><fmt:message key="contacts"/></h1>
    <p><fmt:message key="contacts_message1"/></p>
    <p><fmt:message key="contacts_message2"/> <a href="sanjarock4@gmail.com"></a></p>
</div>

<button class="tablink" onclick="openDescribe('Info', this, 'darkgoldenrod')" id="defaultOpen"><fmt:message key="info"/> </button>
<button class="tablink" onclick="openDescribe('Coming', this, 'forestgreen')"><fmt:message key="coming"/> </button>
<button class="tablink" onclick="openDescribe('About', this, 'purple')"><fmt:message key="about"/> </button>
<button class="tablink" onclick="openDescribe('Contacts', this, 'firebrick')"><fmt:message key="contacts"/> </button>

<script src="scriptMain.js"></script>

<div class="container" onclick="myFunction(this)">
    <div class="bar1"></div>
    <div class="bar2"></div>
    <div class="bar3"></div>
    <div id="myDropdown" class="dropdown-content">
        <a href="/exhibitions"><fmt:message key="home"/> </a>
        <a href="/login"><fmt:message key="login"/> </a>
        <a href="/signup"><fmt:message key="signup"/> </a>
    </div>
</div>


<script>
    function myFunction(x) {
        x.classList.toggle("change");
        myFunctionTwo();
    }

    /* When the user clicks on the button,
    toggle between hiding and showing the dropdown content */
    function myFunctionTwo() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

</script>



</body>
</html>

