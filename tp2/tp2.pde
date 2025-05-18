// Ramiro Pereyra
// Comisión 2
// 120353/2

//Variables
String agevo, text1, text1b, text1c, text2, text2b, text2c, text3, text3b, text3c, reinicio;
int variableF, variableT, alpha, tamatitulo, alphabl, alphat;
float estado, posY, posYY, posYYY, posY2, postext2, postext2b, postext2c, postext3, postext3b, postext3c;
color relleno, blanco;

//Carga de Imagenes - pantallas
PImage imagen1, imagen2, imagen3, imagen4; 



void setup(){
   size(640, 480);
   
     textAlign(CENTER, CENTER);
background(1);
imagen1 = loadImage("menu.png");
imagen2 = loadImage("age1.jpg");
imagen3 = loadImage("age2.jpg");
imagen4 = loadImage("age3.jpg");

//resize
imagen1.resize(640, 480);
imagen2.resize(640, 480);
imagen3.resize(640, 480);
imagen4.resize(640, 480);


//valores variables
agevo = "Evolución del AGE OF EMPIRES";
text1 = "Age of Empires I se lanzó en 1997";
text1b ="fue el inicio de una de las sagas de estrategia más importantes";
text1c ="reviviendo las primeras civilizaciones de la historia";
text2 = "Age of Empires II fue lanzado en 1999";
text2b = " mejoró la jugabilidad y gráficos";
text2c = "que lo convirtió en un clásico atemporal";
text3 = "Age of Empires III fue lanzado en 2005";
text3b = "Introdujo gráficos en 3D y";
text3c = "una evolución técnica y visual";
reinicio = "REINICIAR..";
tamatitulo = 45;
alpha = 255;
estado = 0;
relleno = color(246, 252, 80);
blanco = color(255, 255, 255);
alphabl = 255;
postext2 = 0;
postext2b = 0;
postext2c = 0;
postext3 = 480;
postext3b = 480;
postext3c = 480;
alphat = 0;
posY2 = frameCount;
}

void draw(){

   variableT = frameCount/60;
    variableF = frameCount;
      println( variableT );
  
  //estado
  if (variableT >= 31) {
    estado = 1;
  }
  background(0);
 
  if (variableF/60 >= 7){
    relleno = color(246, 252, 80, alpha);
    alpha = alpha - 2;
  }
   if (variableF/60 >= 7){
   blanco = color(255, 255, 255, alpha);
    alpha = alpha - 2;
  }
   if (variableF >= 180){
    variableF = 180;
  }
  fill(relleno);
  textSize(tamatitulo);
  text(agevo , width/2, variableF);
  
  //pantalla2
   blanco = color(255, 255, 255);
     if( variableT >= 8 ) {
image (imagen2, 0, 0);
     }
      if (variableT >= 16) {
     blanco = color(255, 255, 255, alphabl);
     alphabl = alphabl - 2;
   }
if (posY >= 175){
  posY = 175;
}
if (variableT >= 8) {
  posY += 1;
  if (posY >= 175) posY = 175;
  fill(blanco);
  textSize(tamatitulo - 20);
  text(text1, posY, 100);

  posYY += 1;
  if (posYY >= 320) posYY = 30;
  text(text1b, posYY, 150);

  posYYY += 1;
  if (posYYY >= 300) posYYY = 300;
  text(text1c, posYYY, 200);
}

  //pantalla3

if (variableT >= 17) {
  image(imagen3, 0, 0);  
 
  if (alphat < 255) alphat += 3;
 
  if (postext2 < 350) postext2 += 2;
  
  if (postext2b < 370) postext2b += 2;
  
  if (postext2c < 390) postext2c += 2;

  fill(255, 255, 255, alphat); 
  textSize(tamatitulo - 20);
  text(text2, postext2, 100);
  text(text2b, postext2b, 150);
  text(text2c, postext2c, 200);
}
 //pantalla4

if (variableT >= 25) {
  image(imagen4, 0, 0);  
 
  if (alphat < 255) alphat += 3;
 
  if (postext3 > width/2) postext3 -= 2;
  
  if (postext3b > width/2) postext3b -= 2;
  
  if (postext3c > width/2) postext3c -= 2;

  fill(255, 255, 255, alphat); 
  textSize(tamatitulo - 20);
  text(text3, postext3, 100);
  text(text3b, postext3b, 150);
  text(text3c, postext3c, 200);
}
if (variableT >= 31) {
background (0);
fill (255, 0, 0);
ellipse (404, 235, 100, 100);
}
if (posY2 >= 230) {
posY2 = 230;
}

 if (variableT >= 31) {
   fill (255);
   text (reinicio, 250, posY2+= 4);
   textSize (tamatitulo + 20);   
 }
}
//BOTON reinicio
void mousePressed(){
  if( estado == 1 && mouseX>=235 && mouseX<=404 && mouseY>=235 && mouseY<=404){
    frameCount = 0;
    estado = 0;
    }   
}
