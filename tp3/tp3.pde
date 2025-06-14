
//Ramiro Pereyra
// Comisión 2
// 120353/2
// https://youtu.be/ufgeuW2b8KI

//Carga de imagen
PImage imagenR;

//Variables
color gris, blancocirculo, negro, coloractual, colorfondo, ultimocolor;
boolean cambiocolor = false;
int estado = 1;
int masalpha, menosalpha;


void setup(){
  size (800, 400);
  
//valores variables
gris = color(125, 125, 125);
blancocirculo = color(255, 255, 255);
negro = color(0, 0, 0);
  
imagenR = loadImage("referencia.jpeg");
imagenR.resize(400,400);

coloractual = blancocirculo;
colorfondo = negro;
ultimocolor = coloractual;
masalpha = 255;
menosalpha = 100;
}

void draw(){
 println(mouseX, mouseY);
 
 background(colorfondo);
 
 image (imagenR, 0, 0);

 stroke (gris);
 
  //funcion map grosor dinamico
  float grosor = map(mouseX, 0, width, 5, 29);
  strokeWeight(grosor);
 
 //ciclo for para cuadrilla de lineas
 //horizontal
for (int i=51; i<width; i+=61) {
  line(400, i, 800, i);
  }
//vertical
for (int i=409; i<width; i+=61) {
  line(i, 0, i, 400);
  }
 
  //fc map transparencia de circulos
 
 int alpha = int(map(mouseY, 200, width, menosalpha, masalpha));
 
 fill(coloractual, alpha); 

 noStroke();
 
 //ciclo for para cuadrilla de circulos
 
//circulos horizontales
  for (int a = 409; a < width; a += 61) { 
//circulos verticales
    for (int b = 51; b < height; b += 61) {
      ellipse(a, b, 22, 22); 
    }
  }
}

//keypresed color circulo y fondo
void keyPressed() {
  if (key == 'k' || key == 'K') {
  float r = random(255);
  float g = random(255);
  float b = random(255);
  coloractual = color(r, g, b);
 cambiocolor = true;
  estado = 2;
  
  float r1 = random(255);
  float g1 = random(255);
  float b1 = random(255);
  colorfondo = color(r1, g1, b1);
  } 
 //valores originales
  else if (key == 'j' || key == 'J') {
 estado = 1;
 colorfondo = negro;
 coloractual = blancocirculo;
  }
}
