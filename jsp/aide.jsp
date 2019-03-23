<%@ page import="java.lang.String" import="java.lang.Integer"%>

<%
       String[] t = { "chat", "chien", "souris" };
       String animal = t[(int)(Math.random() * 3)];
       
	   Integer etat = (Integer) session.getAttribute("etat");
	   if (etat == null) etat = new Integer(0);

       if (request.getParameter("suivant") != null && etat.intValue() < 7)
         etat = new Integer(etat.intValue()+1);
       if (request.getParameter("precedent") != null  && etat.intValue() > 0)
         etat = new Integer(etat.intValue()-1);;
       session.setAttribute("etat", etat);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>


<BODY>
	<H2>Aide sur le pendu</H2>
	Le pendu se deroule en plusieurs etapes :
	<BR>
	<UL>
		<LI>L'ordinateur choisit un mot secret. Ce mot secret est affiche
			avec, en clair, seulement la premiere et la derniere lettre.<BR>
			<IMG SRC='../aide/aide1.bmp'>
		</LI>
		<LI>Le joueur propose une lettre. Si la lettre appartient au mot
			secret, elle apparait elle aussi en clair.<BR> <IMG
			SRC='../aide/aide2.bmp'>
		</LI>
		<LI>Si la lettre n'appartient pas au mot secret, l'ordinateur
			dresse une potence jusqu'a pendre le joueur.<BR>
			<FORM METHOD='GET'>
				<INPUT TYPE='submit' NAME='precedent' VALUE='Precedent'
					<%=(etat.intValue() == 0)?"DISABLED":""%>> <INPUT
					TYPE='submit' NAME='suivant' VALUE='Suivant'
					<%=(etat.intValue() == 7)?"DISABLED":""%>>
			</FORM> <IMG SRC='../images/img<%=etat.intValue()%>.bmp'>
		</LI>
		</LI>
		<UL>
			<A href="../index.html">Quitter l'aide</A>
		</UL>
</BODY>
</HTML>

