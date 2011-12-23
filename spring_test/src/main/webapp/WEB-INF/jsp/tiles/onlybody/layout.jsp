<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" 
%><%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" 
%><%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"
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
	<tiles:insertAttribute name="body" />
</body>
</html>