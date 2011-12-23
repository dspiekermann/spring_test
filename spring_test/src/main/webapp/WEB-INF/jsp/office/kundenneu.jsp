<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" 
%><%@taglib uri="http://www.springframework.org/tags/form" prefix="form"
%><%@taglib uri="http://www.springframework.org/tags" prefix="spring"
%><script type="text/javascript">
	$(document).ready(function(){				
		$("#ui-dialog-title-kunden_dialog").text("<c:out value="${dialogtitle}" />");		
	});
</script>
<form id="kunden_form">
<table width="100%">
	        	<tr>
		        	<td width="150px"><spring:message code="label.vorname"/>:</td>
		        	<td><input type="text" id="vorname" name="vorname" size="40" value="<c:out value="${kunde.vorname}" />" /></td>
		        </tr>	        
		        <tr>
		        	<td><spring:message code="label.nachname"/>:</td>
		        	<td><input type="text" id="nachname" name="nachname" size="40" value="<c:out value="${kunde.nachname}" />" /></td>
		        </tr>
		        <tr>
		        	<td><spring:message code="label.strasse"/>:</td>
		        	<td><input type="text" id="strasse" name="strasse" size="40" value="<c:out value="${kunde.strasse}" />" /></td>
		        </tr>
		        <tr>
		        	<td><spring:message code="label.plz"/>:</td>
		        	<td><input type="text" id="plz" name="plz" size="40" value="<c:out value="${kunde.plz}" />" /></td>
		        </tr>
		        <tr>
		        	<td><spring:message code="label.stadt"/>:</td>
		        	<td><input type="text" id="stadt" name="stadt" size="40" value="<c:out value="${kunde.stadt}" />" /></td>
		        </tr>		     	        	       
	        </table>
	        <input type="hidden" name="id" id="id" value="<c:out value="${kunde.id}" />" />
</form>