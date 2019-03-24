package com.oz.webPendu;

public class Mot  implements java.io.Serializable {
  public String secret;
  public StringBuffer essai;

  public Mot(String s) {
  	// s contient une liste de mots secrets déjà choisie séparés par des ;
  	String[] mots   = { "ALMANACH", "PROTOTYPE", "SMARTPHONE", "HORUS" , "ARCHIBALD"};
  	String[] secrets = new String[0]; // = s.split(";");
    /* 
    boolean encore = false;	
  	while (encore) {
      secret = mots[(int) (Math.random()* mots.length)];
      encore = false;
      for (int i=0; i < secrets.length; i++)
        if (secret.equals(secrets[i])) encore = true;
  	}*/
    secret = mots[(int) (Math.random()* mots.length)];
  	essai = new StringBuffer(secret);
    
  	for (int i=1; i < secret.length()-1; i++)
  	  essai.setCharAt(i, '-'); 
  }
  
  public boolean remplacer(char lettre)  {
    boolean remplacement = false;

  	for (int i=1; i < secret.length()-1; i++)
  	  if (secret.charAt(i) == lettre) {
  	  	essai.setCharAt(i, lettre);
  	  	remplacement = true;
  	  }

  	return remplacement;
  }
  
  public boolean trouve() { return secret.equals(essai.toString()); }
}

