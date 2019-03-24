package com.oz.webPendu;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JeuPenduServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
               throws ServletException,IOException{
        PrintWriter out = response.getWriter();
         response.setContentType("text/html");
        out.println("<a href='jsp/pendu.jsp'><br>Play</a>");
        
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }
}
