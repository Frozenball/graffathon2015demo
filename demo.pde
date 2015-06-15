PShape obu;
PShader plasma;
float aika;
float alkup;
float add;
import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context


void setup() {
  size(1280, 720, P3D);
  obu = loadShape("optimized.obj"); 
  plasma = loadShader("plasma.glsl");
  plasma.set("iResolution", float(1280), float(720));
  add = 0;
  minim = new Minim(this);
  player = minim.loadFile(dataPath("music.mp3"), 512);
  player.play();
}

void draw() {
  alkup = millis() + add;
  if (keyPressed) {
    if (key == 'n') { 
      add += 1000;
    }
    if (key == 'b') {
      add -= 1000;
    }
    if (key == 'q') {
     exit(); 
    }
  }
  aika = alkup;
  
  if (alkup >= 10000) {
    aika += 5000; 
  }
  if (alkup >= 60000) {
    aika += 41000; 
  }
  if (alkup >= 80000) {
    aika += 20000; 
  }
  if (alkup >= 90000) {
    aika += 20000; 
  }
  if (alkup >= 100000) {
    aika += 20000; 
  }
  if (alkup >= 110000) {
    aika += 20000; 
  }
  
  
  
  
  plasma.set("realTime", alkup);
  plasma.set("iGlobalTime", aika*0.001);
  
  background(0);
  pushMatrix();
  
  //lights();
  ambientLight(182, 142, 232);
  pointLight(51 + cos(aika * 0.0064), 102 + 20*sin(aika * 0.0001), 126, 235 + 90*cos(aika * 0.001), 240 + 60*sin(aika * 0.001), 336 + 40*sin(aika * 0.001));
 
  float start = 0;
  translate(1000 * sin(aika * 0.00001 * 13), 577, 0);
  scale(20);
  //rotateY(100 * cos(aika * 0.00001));
  rotateX(PI * cos(start + aika * 0.00001 * 7 + 30*sin(aika * 0.0000001)));
  rotateY(PI * sin(start + aika * 0.00001 * 5));
  rotateZ(PI * sin(start + aika * 0.00001 * 3));
 
  shape(obu, 0, 0);
  shape(obu, 60, 0); 
  shape(obu, 0, 140); 
  shape(obu, -240, 0);
  shape(obu, -240, -200); 
  
  
  filter(plasma);
  /*
  translate(0, 0, 0);
  rotateX(0);
  rotateY(0);
  rotateZ(0);
  scale(20);*/
  //fill(0, 102, 153);
  fill(255, 255, 255);
  if (alkup >= 15000) {
    scale(0.1);
    translate(200, 200, 400);
    textSize(20);
    text("This text is upside down. Who knows?", -40 + 100*sin(aika*0.0001), 30);
    
  }
  
  
  popMatrix();
  
  if (alkup <= 10000) {
    textSize(20);
    text("Bansku ^-^", 1280/2-70, 200);
  }
  if (alkup >= 40000 && alkup <= 46000) {
    textSize(20);
    text("Greetings to...everyone :-)", 1280/2-70, 200);
  }
  /*
  textSize(20);
  text(alkup, 0, 60);
  */
  if (alkup >= 120000) {
   exit(); 
  }
}
