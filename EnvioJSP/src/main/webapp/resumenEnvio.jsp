<%@page import="modelo.Envio"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cálculo del envío</title>
</head>
<body>
	<h1>Detalles del envío</h1>
	
	<%
		String origen = request.getParameter("origen");
		boolean origenNacional = true;
		if (request.getParameter("nacionalOri").equals("extranjero")) {
			origenNacional=false;
		}
		String destino = request.getParameter("destino");
		boolean destinoNacional = true;
		if (request.getParameter("nacionalDest").equals("extranjero")) {
			destinoNacional=false;
		}
		String tipoEnvio = request.getParameter("tipo");
		int peso=1;
		peso = Integer.parseInt(request.getParameter("peso"));
		Envio e = new Envio(origen, origenNacional, destino, 
				destinoNacional, tipoEnvio, peso);
		
	%>

			<ul>
		<li>Ciudad Origen: <%=e.getCiudadOrigen() %></li>
		<li>Tipo Origen: <%=request.getParameter("nacionalOri") %></li>
		<li>Ciudad destino: <%=request.getParameter("destino") %></li>
		<li>Tipo destino: <%=request.getParameter("nacionalDest") %></li>
		<li>Tipo de envío: <%=request.getParameter("tipo") %></li>
		<li>Peso: <%=request.getParameter("peso") %> Kg</li>
		<li>Importe: <%=e.calcularImporte() %></li>
	</ul>

</body>
</html>