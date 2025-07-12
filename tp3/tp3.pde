
//Ramiro Pereyra
// Comisión 2
// 120353/2
// https://youtu.be/RAz-Gyzq8xs

//Carga de imagen
PImage imagenR;

// Variables
color gris, blancocirculo, negro, coloractual, colorfondo, ultimocolor;
boolean cambiocolor = false;
int estado = 1;
int masalpha, menosalpha;

void setup() {
  size(800, 400);

  // Valores variables
  gris = color(125, 125, 125);
  blancocirculo = color(255, 255, 255);
  negro = color(0, 0, 0);

  imagenR = loadImage("referencia.jpeg");
  imagenR.resize(400, 400);

  coloractual = blancocirculo;
  colorfondo = negro;
  ultimocolor = coloractual;
  masalpha = 255;
  menosalpha = 100;
}

void draw() {
  println(mouseX, mouseY);

  background(colorfondo);
  image(imagenR, 0, 0);

  // Grosor dinamico basado en mouseX
  float grosor = calcularGrosorDesdeMouse();
  dibujarGrillaLineas(grosor); // fc tipo void

  // Alpha dinamico basado en mouseY
  int alpha = calcularAlphaDesdeMouse();
  fill(coloractual, alpha);

  noStroke();

  // Cuadrícula de círculos
  for (int a = 409; a < width; a += 61) {
    for (int b = 51; b < height; b += 61) {
      ellipse(a, b, 22, 22);
    }
  }
}

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
  else if (key == 'j' || key == 'J') {
    estado = 1;
    colorfondo = negro;
    coloractual = blancocirculo;
  }
}

// fc propia con retorno-grosor basado en mouseX
float calcularGrosorDesdeMouse() {
  float grosorBase = 20;           // Grosor original 
  float factorCambio = 0.05;       // Velocidad a la que cambia el grosor
  float diferencia = mouseX - 400; // Dist desde el centro

  float grosor = grosorBase - (diferencia * factorCambio);
  grosor = constrain(grosor, 5, 40); // Limita el grosor
  return grosor;
}

// fc propia con retorno-alpha basado en mouseY
int calcularAlphaDesdeMouse() {
  int resultado = 255 - mouseY;
  if (resultado < 100) {
    resultado = 100; // Limita el valor mínimo
  }
  return resultado;
}

// fc void para la grilla de lineas 
void dibujarGrillaLineas(float grosor) {
  stroke(gris);
  strokeWeight(grosor);

  // Líneas horizontales
  for (int i = 51; i < width; i += 61) {
    line(400, i, 800, i);
  }

  // Líneas verticales
  for (int i = 409; i < width; i += 61) {
    line(i, 0, i, 400);
  }
}
