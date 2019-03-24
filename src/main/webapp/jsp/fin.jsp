<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="../theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>aurevoir.jsp</TITLE>
</HEAD>

<BODY>
	<H3>
		<%
			if (request.getParameter("msg").equals("Bravo")) {
		%>
		Bravo ! Vous avez gagne !<BR> <IMG SRC="../images/img6.bmp">
		<%
			} else {
		%>
		Dommage! Vous avez perdu !<BR> <IMG SRC="../images/img7.bmp">
		<%
			}
		%>

	</H3>
	<P>Nous esperons bientot vous revoir sur notre site.</P>
	<A href="../index.html">Rejouer</A>
</BODY>
</HTML>
