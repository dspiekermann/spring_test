<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" 
%><%@taglib uri="http://www.springframework.org/tags/form" prefix="form"
%><%@taglib uri="http://www.springframework.org/tags" prefix="spring"
%><script type="text/javascript">
$(document).ready(function(){
	$("button").button();

	// Lädt die Tabelle per JQuery neu
	$("#btnRefresh").bind("click", loadKunden);

	// Öffnet den Neuen Kunden Dialog	
	$("#btnNeuKunde").click(function () {
		$( "#kunden_dialog" ).dialog("open");
	});

	$("#btnDeleteKunde").click(function () {
		$( "#dialog_delete" ).dialog("open");
	});

	/* hover */
	
	$(".tr_tf, .tr_tf_even").hover(function(){
		$(this).toggleClass("tr_tf_hover");
	});
	// Dialog Popup - Löschen
	
	$( "#dialog_delete" ).dialog({
		autoOpen: false,
		resizable: false,
		height:140,
		modal: true,
		buttons: {
			"<spring:message code="btn.delete"/>": function() {
				$("#kunden_table input:checkbox:checked").each(function(){					
					// Kunde löschen, Quick - alert($(this).val());
					$('#status_messages').load("<c:url value='/office/kundendelete.html'/>?id=" 
							+ $(this).val(), function(){ loadKunden(); });
				});					
				
				loadKunden();
				$( this ).dialog( "close" );
			},
			"<spring:message code="btn.cancel"/>": function() {
				$( this ).dialog( "close" );
			}
		}
	});
});

// Läd die Kundentabelle per JQuery neu
function loadKunden() 
{
	$('#kunden_table_holder').load("<c:url value='/office/kundentable.html'/>");
}

// Lad den ausgewählten Kunden und zeigt dann den Dialog an.
function showKundenDialog(id) {
	$('#kunden_dialog').load("<c:url value='/office/kundenneu.html'/>?kid=" + id, function() {
		$( "#kunden_dialog" ).dialog("open");
	});
}
</script>
<div id="kunden_menu">
	<div id="kunden_control_menu" class="ui-widget-header ui-corner-all">
		<span id="toolbar">
			<button id="btnNeuKunde"><spring:message code="text.neu"/></button> | 
			<button id="btnDeleteKunde"><spring:message code="text.delete"/></button> | 
			<button id="btnRefresh"><spring:message code="text.refresh"/></button>
		</span>
	</div>
</div>
<div id="kunden_table">
	<table class="table_full" cellspacing="0" cellpadding="0">
	<tr>
		<th></th>
		<th><spring:message code="label.vorname"/></th>
		<th><spring:message code="label.nachname"/></th>
		<th><spring:message code="label.strasse"/></th>
		<th><spring:message code="label.plz"/></th>
		<th><spring:message code="label.stadt"/></th>
	</tr>
	<c:forEach items="${kunden}" var="kunde" varStatus="stat">
	<tr class="tr_tf<c:if test="${stat.count % 2 == 0}">_even</c:if>"
			onDblclick="showKundenDialog(${kunde.id})">
		<td><input type="checkbox" name="check_${kunde.id}" name="check_${kunde.id}" value="${kunde.id}"></td>
		<td>${kunde.vorname}</td>
		<td>${kunde.nachname}</td>
		<td>${kunde.strasse}</td>
		<td>${kunde.plz}</td>
		<td>${kunde.stadt}</td>
	</tr>
	</c:forEach>
	</table>
</div>

<div id="dialog_delete" title="<spring:message code="dialog.delete_title"/>">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;">
	</span><spring:message code="dialog.delete_text"/></p>
</div>