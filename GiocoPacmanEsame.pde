float raggio = 50;
float posizionePacman = raggio, posizionePacman2 = raggio;
float velocita = 5;
//Impostiamo gli angoli dell'arc come variabili, in modo da poterli modificare successivamente 
float angoloStart = QUARTER_PI;
float angoloEnd = TWO_PI-QUARTER_PI;
//Impostiamo la velocita' di apertura e chiusura della bocca
float velocitaAngolare = QUARTER_PI/10;
float angoloAggiuntivo = 0;

int x, y;
int lato1 = 550, lato2 = 550;
int R = 255, G = 255, B = 0;
int text = 0;
int rectx = 30, recty = 525;
int rectx2 = 525, recty2 = 30;
int velocitarect, velocitarect2;
boolean reset = false;



void setup() 
{
 
  size(600, 600);
  frameRate(30);

}

void draw() 
{
  
   if(reset == false)
   {
      background(0);

  
      //Questa la utilizzavamo per fare aprire e chiudere la bocca "attaccandola" alla posizione di Pacman
      //float angoloAggiuntivo = map(posizionePacman, raggio, width-raggio, 0, QUARTER_PI);
      fill(R, G, B);
      ellipse(lato1, lato2, 50, 50);
  
      fill(255, 0, 0);
      rect(rectx, recty, 50, 50);

      fill(255, 255, 0);
      arc(posizionePacman, posizionePacman2, 2*raggio, 2*raggio, angoloStart-angoloAggiuntivo, angoloEnd+angoloAggiuntivo);
      
      fill(0, 255, 0, 150);
      textSize(40);
      text("Score: ", 425, 45);
      text(text, 550, 45);
     
      textSize(20);
      fill(255, 255, 255);
      text(second(), 65, 15);
      text(minute(), 35, 15);
      text(hour(), 5, 15);
  
 
    //Faccio spostare Pacman
      if(keyCode == RIGHT)
      {
        posizionePacman += velocita;
        angoloStart = QUARTER_PI;
        angoloEnd = TWO_PI-QUARTER_PI;
        
        velocitarect = int (random(5, 10));
        rectx += velocitarect;
        recty += velocitarect;

        rectx2 -= velocitarect;
        recty2 -= velocitarect;
                
      }
      
      if(keyCode == LEFT)
      {
        posizionePacman -= velocita;
        angoloStart = PI+QUARTER_PI;
        angoloEnd = 3*PI-QUARTER_PI;
        
        velocitarect = int (random(5, 10));
        rectx += velocitarect;
        recty -= velocitarect;
        
        rectx2 -= velocitarect;
        recty2 += velocitarect;
        
      }
      
      if(keyCode == DOWN)
      {
        posizionePacman2 += velocita;
        angoloStart = 3*QUARTER_PI;
        angoloEnd = 9*QUARTER_PI;
        
        velocitarect = int (random(5, 10));
        rectx -= velocitarect;
        recty -= velocitarect;
        
        rectx2 += velocitarect;
        recty2 += velocitarect;
        
      }
      
      if(keyCode == UP)
      {
        posizionePacman2 -= velocita;
        angoloStart = TWO_PI-QUARTER_PI;
        angoloEnd = 13*QUARTER_PI;
        
        velocitarect = int (random(5, 10));
        rectx -= velocitarect;
        recty += velocitarect;
        
        rectx2 += velocitarect;
        recty2 -= velocitarect;
        

      }
      
      
      
      if(posizionePacman > width)
      {
        posizionePacman = 50;
        posizionePacman2 = 50;
      }
      
      if(posizionePacman < 0)
      {
        posizionePacman = 600;
        posizionePacman2 = 50;
      }  
      
      if(posizionePacman2 > height)
      {
        posizionePacman = 50;
        posizionePacman2 = 50;
      }  
      
      if(posizionePacman2 < 0)
      {
        posizionePacman = 600;
        posizionePacman2 = 600;
      }
      
      
      if(rectx > width)
      {
        rectx = 0;
        recty = 0;
        
        rectx += velocitarect;
        recty += velocitarect;
      }
      
      if(rectx < 0)
      {
        rectx = 550;
        recty = 550;
        
        rectx += velocitarect;
        recty += velocitarect;
      }  
      
      if(recty > height)
      {
        rectx = 300;
        recty = 50;
        
        rectx += velocitarect;
        recty += velocitarect;
      }  
      
      if(recty < 0)
      {
        rectx = 0;
        recty = 550;
        
        rectx -= velocitarect;
        recty += velocitarect;
      }
      
      
      if(rectx2 > width)
      {
        rectx2 = 550;
        recty2 = 550;
        
        rectx2 += velocitarect2;
        recty2 += velocitarect2;
      }
      
      if(rectx2 < 0)
      {
        rectx2 = 0;
        recty2 = 0;
        
        rectx2 += velocitarect2;
        recty2 += velocitarect2;
      }  
      
      if(recty2 > height)
      {
        rectx2 = 550;
        recty2 = 0;
        
        rectx2 += velocitarect2;
        recty2 += velocitarect2;
      }  
      
      if(recty2 < 0)
      {
        rectx2 = 50;
        recty2 = 300;
        
        rectx2 -= velocitarect2;
        recty2 += velocitarect2;
      }
      
      
      mangia();
      
      if((angoloAggiuntivo >= QUARTER_PI) || (angoloAggiuntivo <= 0))
      
          velocitaAngolare = -velocitaAngolare;
          angoloAggiuntivo -= velocitaAngolare;
          
   }
   doppio();
   dead();

}

void mangia()
{
  
    if(posizionePacman+angoloStart >= lato1 && posizionePacman+angoloStart <= lato1+50 && posizionePacman2+angoloEnd >= lato2 && posizionePacman2+angoloEnd <= lato2+50 || posizionePacman >= lato1 && posizionePacman <= lato1+50 && posizionePacman2 >= lato2 && posizionePacman2 <= lato2+50)
    {
        background(0);
        lato1 = int (random(50, 550));
        lato2 = int (random(50, 550));
        R = int (random(255));
        G = int (random(255));
        B = int (random(255));
        text = text + 1;
        
        
        rectx = int (random(50, 550));
        recty = int (random(50, 550));
        
        rectx2 = int (random(50, 550));
        recty2 = int (random(50, 550));
     }
    
}



void dead()
{
  
  if(posizionePacman >= rectx && posizionePacman <= rectx+50 && posizionePacman2 >= recty && posizionePacman2 <= recty+50 || posizionePacman+angoloStart >= rectx && posizionePacman+angoloStart <= rectx+50 && posizionePacman2+angoloEnd >= recty && posizionePacman2+angoloEnd <= recty+50)
  {
    background(0);
    fill(0, 255, 0);
    textSize(100);
    text("Game Over", 30, height/2);
    fill(255, 255, 255);
    textSize(25);
    text("Prees 'r' for restart!", 180, 350);
    reset = true;
   }
  
}

void doppio()
{
  if(text >= 5)
  {
    fill(255, 0, 255);
    rect(recty, rectx, 50, 50);
    
    if(posizionePacman >= recty && posizionePacman <= recty+50 && posizionePacman2 >= rectx && posizionePacman2 <= rectx+50 || posizionePacman+angoloStart >= recty && posizionePacman+angoloStart <= recty+50 && posizionePacman2+angoloEnd >= rectx && posizionePacman2+angoloEnd <= rectx+50)
  {
    background(0);
    fill(0, 255, 0);
    textSize(100);
    text("Game Over", 30, height/2);
    fill(255, 255, 255);
    textSize(25);
    text("Prees 'r' for restart!", 180, 350);
    reset = true;
   }
   
  }
  if(text >= 10)
  {    
    fill(125,125,125);
    rect(rectx2, recty2, 50, 50);
    
    
    fill(0,0,255);
    rect(recty2, rectx2, 50, 50);
  
if(posizionePacman+angoloStart >= rectx2 && posizionePacman+angoloStart <= rectx2+50 && posizionePacman2+angoloEnd >= recty2 && posizionePacman2+angoloEnd <= recty2+50 || posizionePacman >= rectx2 && posizionePacman <= rectx2+50 && posizionePacman2 >= recty2 && posizionePacman2 <= recty2+50)
  {
    background(0);
    fill(0, 255, 0);
    textSize(100);
    text("Game Over", 30, height/2);
    fill(255, 255, 255);
    textSize(25);
    text("Prees 'r' for restart!", 180, 350);
    reset = true;
   }
   
  if(posizionePacman+angoloStart >= recty2 && posizionePacman+angoloStart <= recty2+50 && posizionePacman2+angoloEnd >= rectx2 && posizionePacman2+angoloEnd <= rectx2+50 || posizionePacman >= recty2 && posizionePacman <= recty2+50 && posizionePacman2 >= rectx2 && posizionePacman2 <= rectx2+50)
  {
    background(0);
    fill(0, 255, 0);
    textSize(100);
    text("Game Over", 30, height/2);
    fill(255, 255, 255);
    textSize(25);
    text("Prees 'r' for restart!", 180, 350);
    reset = true;
   }
   }
}

void keyPressed()
{
  
  if(key == 'r')
  {
      raggio = 50;
      posizionePacman = raggio;
      posizionePacman2 = raggio;
      velocita = 5;
      angoloStart = QUARTER_PI;
      angoloEnd = TWO_PI-QUARTER_PI;
      velocitaAngolare = QUARTER_PI/10;
      angoloAggiuntivo = 0;
      lato1 = 550; lato2 = 550;
      R = 255; G = 255; B = 0;
      text = 0;
      rectx = 30; recty = 525;
      rectx2 = 525; recty2 = 30;
      reset = false;
  }
  
}



