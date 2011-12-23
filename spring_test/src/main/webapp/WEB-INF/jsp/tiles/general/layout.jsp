<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" 
%><%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"
%><%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" 
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de-de" lang="de-de" dir="ltr" >
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Spring3Example" />
	<meta name="generator" content="Spring3Example" />
	<meta name="author" content="Yves Hoppe - www.yves-hoppe.de" />
 
	<title><tiles:insertAttribute name="title" ignore="true" /></title>
 
	<link rel="stylesheet" href="<c:url value='/media/css/default.css'/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/media/css/menu.css'/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value='/media/css/jquery.css'/>" type="text/css" />
	<link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz|Droid+Sans' type='text/css' />
 
	<script type="text/javascript" src="<c:url value='/media/js/jquery-1.4.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/media/js/jquery-ui.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/media/js/jquery.ui.datepicker-de.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/media/js/basic.js'/>"></script> 
</head>
<body>
	<div id="bg">
		<div align="center">
			<div id="header">
				<div id="header_top">
				<tiles:insertAttribute name="header" />			
				</div>
				<div id="header_menu"><tiles:insertAttribute name="menu" /></div>
			</div>
			<div id="container" class="clearfix">
				<div id="content">
					<div id="content_in">
						<div id="status_messages"></div>			
						<tiles:insertAttribute name="content" />
					</div>
				</div>		
			</div>
			<div id="footer">
				<div id="footer_cont">
					<tiles:insertAttribute name="footer" />
				</div>
			</div>			
		</div>
	</div>
</body>
</html>