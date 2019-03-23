
<%
	// sont disponibles en local :
	//    request
	//    response
	//    out
	//    session

	StringBuffer essais;
	// On récupère le cookie qui contient les mots secrets déjà choisis
	String secrets = "";

    //Normalement disponible
    session = request.getSession();
	Cookie[] cookies = request.getCookies();
	if (cookies.length > 0)
		if (cookies[0].getName().equals("csct"))
			secrets = cookies[0].getValue();

	Mot mot;
	Integer nbre;
	
	
	
	if ((session.getAttribute("mot") != null)
			&& (request.getParameter("nouvelle") == null)
			&& (session.getAttribute("essai")  != null)) {
		mot = (Mot) session.getAttribute("mot");
		nbre = (Integer) session.getAttribute("nbre");
		essais=(StringBuffer)session.getAttribute("essai");
		
	} else {
		// Il faut choisir un nouveau mot secret
		mot = new Mot(secrets);
		nbre = new Integer(0);
		essais= new StringBuffer(mot.essai.toString());

		session.setAttribute("essai", essais);
		session.setAttribute("mot", mot);
		session.setAttribute("nbre", nbre); // On met dans la session seulement des objets

		// Le cookie contient un nouveau mot secret
		secrets += (secrets.equals("")?"":";") + mot.secret;
		Cookie cookie = new Cookie("secrets", secrets);
		cookie.setMaxAge(36000); // Durée de validité en secondes
		response.addCookie(cookie);
	}

	String lettre = request.getParameter("lettre");
	// Soit :
	//   1) Le script s'exécute pour la première fois : il n'existe aucun paramètre dans la requête HTTP :
	//        lettre = null;
	//   2) Le script s'exécute parce que le client lui a envoyé une requête HTTP en cliquant sur le
	//      bouton submit :
	//        lettre != null mais lettre est vide
	//   3) Le script s'exécute parce que le client a cliqué sur une lettre.
	if (lettre != null)
		if (lettre.length() > 0)
			if (!mot.remplacer(lettre.charAt(0))) {
				nbre = new Integer(nbre.intValue() + 1);//On ne peut pas recuperer le champ etat dans la session car pas objet
				session.setAttribute("nbre", nbre);

				if ((nbre.intValue() == 7)||(mot.termine())) {
					session.setAttribute("essai", null);
					session.setAttribute("mot", null);
					session.setAttribute("nbre", null); // On met dans la session seulement des objets
					response.sendRedirect("../jsp/fin.jsp?msg=Perdu");
				}
			} else {
				essais=new StringBuffer(mot.essai.toString());
				session.setAttribute("essai", essais);
				
				if (mot.trouve()) {
				session.setAttribute("essai", null);
				session.setAttribute("mot", null);
				session.setAttribute("nbre", null); // On met dans la session seulement des objets
				response.sendRedirect("../jsp/fin.jsp?msg=Bravo");
			}
		}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="java.lang.String"
	import="java.lang.Integer"
	import="java.lang.StringBuffer"
	import="java.io.PrintWriter"
	import="javax.servlet.http.HttpSession"
	import="javax.servlet.http.Cookie"
	import="javax.servlet.http.HttpServlet"
    import="javax.servlet.http.HttpServletRequest"
    import="javax.servlet.http.HttpServletResponse" 
    import="java.io.Serializable"
	import="com.oz.webPendu.Mot"%>
</HEAD>

<BODY>
	<SCRIPT LANGUAGE="JAVASCRIPT">
		function clic(c) {
			document.getElementById("lettre").value = c;
			document.getElementById("form_pendu").submit();
		}
	</SCRIPT>

	<FORM NAME="form_pendu" ID="form_pendu" METHOD="GET">
		<INPUT TYPE="hidden" ID="lettre" NAME="lettre">
		
		<TABLE BORDER="">

			<TR>
				<TD>
					<%
						// Remplissage de la case haut/gauche de la table (boutons de lettres)
						//out.println(((Mot)session.getAttribute("mot")).secret);

						String lettres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
						for (int i = 0; i < 26; i++) {
							if (i % 10 == 0)
								out.println("<BR>");
					%> <INPUT TYPE="button" VALUE="<%=lettres.charAt(i)%>"
					onClick="clic('<%=lettres.charAt(i)%>')"> <%
 	}
 %>
				</TD>
				<TD ROWSPAN="2">
					<%
						// Remplissage de la case droite de la table (potence)
					%> <IMG SRC="../images/img<%=nbre.toString()%>.bmp">
				</TD>
			</TR>

			<TR>
				<TD ALIGN="center" STYLE="color: red"><H3>
						<%
							// Remplissage de la case bas/gauche de la table (lettres trouvées du mot)
						%>
						<%=essais.toString()%>
					</H3></TD>
			</TR>
		</TABLE>
		<P ALIGN="center">
			<INPUT TYPE="submit" NAME="nouvelle" VALUE="Nouvelle partie">
		</P>
	</FORM>
</BODY>
</HTML>
