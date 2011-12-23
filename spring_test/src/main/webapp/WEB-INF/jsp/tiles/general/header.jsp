<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" 
%><%@taglib uri="http://www.springframework.org/tags" prefix="spring"
%><div id="header_top_menu">
	<a href="<c:url value='/j_spring_security_logout'/>" title="<spring:message code="label.logout"/>"><spring:message code="label.logout"/></a>
	<!-- Änderung der Sprache -->
	<a href="?lang=en"><img src="<c:url value='/media/images/flag_en.png'/>" alt="English"></a>     			
    <a href="?lang=de"><img src="<c:url value='/media/images/flag_de.png'/>" alt="German"></a>
</div>
<div id="header_logo">
	<div id="header_title_left">
		<h1><c:out value="${pageh1title}" /></h1>
	</div>
	<div id="header_logo_right">
		<img src="<c:url value='/media/images/logo-bottom.png'/>" />
	</div>
</div>