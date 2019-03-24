package com.oz.webPendu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @version 	1.0
 * @author
 */
public class ServletAide extends HttpServlet {

	/**
	* @see javax.servlet.http.HttpServlet#void (javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	*/
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
			
 	   PrintWriter     out = resp.getWriter();
	   HttpSession session = req.getSession();  // M�me m�thode pour cr�er une nouvelle session ou 
	   
	   Integer etat = (Integer) session.getAttribute("etat");
	   if (etat == null)  {
	   	  etat = new Integer(0);
     	  //session.setAttribute("aide", aide);
	   }
       if (req.getParameter("suivant") != null && etat.intValue() < 7)
         etat = new Integer(etat.intValue()+1);
       if (req.getParameter("precedent") != null  && etat.intValue() > 0)
         etat = new Integer(etat.intValue()-1);;
       session.setAttribute("etat", etat);
	   
	   
			
       out.println("<HTML><BODY>");
       out.println("<H2>Aide sur le pendu</H2>");
       out.println("Le pendu se d�roule en plusieurs �tapes :<BR>");
       out.println("<UL>");
       out.println("<LI>L'ordinateur choisit un mot secret. Ce mot secret est");
       out.println("affich� avec, en clair, seulement la premi�re et la derni�re lettre.<BR>");
       out.println("<IMG SRC='aide/aide1.bmp'></LI>");
       out.println("<LI>Le joueur propose une lettre. Si la lettre appartient");
       out.println("au mot secret, elle apparait elle aussi en clair.<BR>");
       out.println("<IMG SRC='aide/aide2.bmp'></LI>");
       out.println("<LI>Si la lettre n'appartient pas au mot secret, l'ordinateur");
       out.println("dresse une potence jusqu'� pendre le joueur.<BR>"); // ACTION='/Pendu/ServletAide'
       out.println("<FORM METHOD='GET' >");
       out.println("<INPUT TYPE='submit' NAME='precedent' VALUE='Precedent' ");
       if (etat.intValue() == 0) out.println("DISABLED");
       out.println(">");
       out.println("<INPUT TYPE='submit' NAME='suivant' VALUE='Suivant' ");
       if (etat.intValue() == 7) out.println("DISABLED");
       out.println("></FORM>");
       out.println("<IMG SRC='images/img" + etat.intValue() + ".bmp'></LI>");
       out.println("</LI></UL>");
       out.println("<P ALIGN='center'><A href='index.htm'>Retour � l'index</A></P>");
       out.println("</BODY></HTML>");
	}
		
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {

	}

}
