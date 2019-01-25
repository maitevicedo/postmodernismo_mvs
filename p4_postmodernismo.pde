import geomerative.*;
import processing.pdf.*;
PFont myfont;
PFont myfont1;
String bla="BlaBlaBlaBlaBlaBlaBlaBlaBla";
RFont f;
RShape grp;
RPoint[] points;
boolean record;

void setup(){
  size(1200,800);
  frameRate(1); 
    RG.init(this);
    grp = RG.getText("BLA BLA BLA", "Akzidenz Grotesk Black.ttf", 100, CENTER);
    smooth();
}
void draw(){
  background(255);
  if(record==true){
    beginRecord(PDF, "text-###.pdf");
    } 
    bla_vario(0,0);
    bla_geometric(0,0);
  for(int x=0;x<height;x=x+100){
    linea1(0,0);
    }
  for(int x=0;x<height;x=x+150){
    linea2(0,0);
    }
  for(int x=0;x<500;x=x+100){
    linea3(0,0);
    }
  if(record==true){
     endRecord();
    record=false;
    }  
}
void bla_vario(int px, int py){
  String[] fontlist=PFont.list();
  int num=int(random(fontlist.length));
  pushMatrix();
  myfont=createFont(fontlist[203],10); 
  textFont(myfont);
  fill(0);
  for(int i=0; i<bla.length(); i++){
    textSize(random(20,100));
    text(bla.charAt(i),random(100,1000),random(height));
    }
  popMatrix();
  pushMatrix();
  myfont=createFont(fontlist[48],20);
  textFont(myfont);
  fill(0);
  for(int i=0; i<bla.length(); i++){
    textSize(random(20,100));
    text(bla.charAt(i),random(250,1100),random(250,500));
  }
  popMatrix();
}
void bla_geometric(float px, float py){
  RG.setPolygonizer(RG.ADAPTATIVE);
  grp.draw();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  points = grp.getPoints();
    pushMatrix();/*geometrico_01*/
     RG.setPolygonizerLength(map(random(200), 0, random(200), 0, 100));
     px=random(700,900);
     py=random(100,200);
     scale(1);
     translate(px,py);
     scale(1.5);
     noFill();
     noStroke();
     if(points != null){
       fill(0);
       strokeWeight(8);
       stroke(255);
       beginShape();
       for(int i=0; i<points.length; i++){
         vertex(points[i].x, points[i].y);
       }
       endShape();
      }
    popMatrix();
    pushMatrix();/*geometrico_02*/
     RG.setPolygonizerLength(map(random(100),0,random(300),0,200));
     translate(800,300);
     noFill();
     noStroke();   
     if(points != null){
       fill(255);
       strokeWeight(random(1,5));
       stroke(0);
       beginShape();
       for(int i=0; i<points.length; i++){
         vertex(points[i].x, points[i].y);
       }
       endShape();
      }
    popMatrix();
    pushMatrix();/*geometrico_03*/
     RG.setPolygonizerLength(map(random(500), 0, random(500), 0, 100));
     px=random(800,1000);
     py=random(500,750);
     translate(px,py);
     scale(1.5);
     noFill();
     noStroke();
     if(points != null){
       fill(0);
       strokeWeight(3);
       stroke(255);
       beginShape();
       for(int i=0; i<points.length; i++){
         vertex(points[i].x, points[i].y);
       }
       endShape();
      }
     popMatrix();
}
void linea1(float ppx, float ppy) {
  pushMatrix();
  ppx=random(100,1100);
  ppy=random(150,800);
  strokeCap(SQUARE);
  strokeWeight(random(2,30));
  stroke(0,20);    
  translate(ppx, ppy);
    line(20, 0, random(50,500), 0);
  popMatrix();
}
void linea2(float ppx, float ppy) {
  pushMatrix();
  ppx=random(100,1000);
  ppy=random(50,800);
  strokeCap(SQUARE);
  strokeWeight(random(2,30));
  stroke(0);    
  translate(ppx, ppy);
    line(20, 0, random(100,500), 0);
  popMatrix();
}
void linea3(float ppx, float ppy) {
  pushMatrix();
  ppx=random(100,1000);
  ppy=random(20,500);
  strokeCap(SQUARE);
  strokeWeight(random(2,20));
  stroke(0,90);    
  translate(ppx, ppy);
    line(100,random(100,500),100,0);
  popMatrix();
}
void mousePressed(){
  record=true;
}
