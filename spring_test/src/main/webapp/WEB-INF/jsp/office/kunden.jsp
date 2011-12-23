<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" 
%><%@taglib uri="http://www.springframework.org/tags/form" prefix="form"
%><%@taglib uri="http://www.springframework.org/tags" prefix="spring"
%>
<script type="text/javascript">
	$(document).ready(function(){
		// Lade die Kundentabelle in das div Element mit der id kunden_table-holder
		$('#kunden_table_holder').load("<c:url value='/office/kundentable.html'/>");

		// Lade den Kunden Dialog (Neu)
		$('#kunden_dialog').load("<c:url value='/office/kundenneu.html'/>?kid=-1");

		// Dialog für das berarbeiten / neu erstellen eines Kunden		
		$( "#kunden_dialog" ).dialog({
			autoOpen: false,
			height: 260,
			width: 500,
			modal: true,
			buttons: {
				"<spring:message code="btn.save"/>": function() {
					// Ajax Post Funktion			
					$.ajax({
						url: "<c:url value='/office/kundenadd.html' />",
						type: "POST",
						data: $("form#kunden_form").serialize(), // Das Formular übermitteln
						async: false, 
						success: function(result){							
							// Kundendialog neu laden (leer)
							$('#kunden_dialog').load("<c:url value='/office/kundenneu.html'/>?kid=-1");
							// Kundentabelle neuladen
							$('#kunden_table_holder').load("<c:url value='/office/kundentable.html'/>");
						}
					});
					$('#kunden_table_holder').load("<c:url value='/office/kundentable.html'/>");
					$( this ).dialog( "close" ); // Dialog schließen
				},
				"<spring:message code="btn.cancel"/>": function() {
					// Kundendialog neu laden (reset)
					$('#kunden_dialog').load("<c:url value='/office/kundenneu.html'/>?kid=-1"); 
					$( this ).dialog( "close" );
				}
			}		
		});
	});	
</script>
<div id="kunden_table_holder"></div>
<div id="kunden_dialog" title="<spring:message code="text.neuerkunde"/>"></div>
<div id="status_messages"></div>