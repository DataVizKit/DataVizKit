//Dependencies: treemap library by Ben Fry
// the treemap library is available here: http://benfry.com/writing/treemap/

import megamu.mesh.*;

Voronoi parisVoronoi;
MPolygon[] arrondissements;
int numArrondissements = 20; // the 20 arrondissements of paris
int numExtraPoints = 15; // for adding some outer extra points for correcting the oval shape of central paris

void setup() {
  size(1280, 720);
  float[][] points = new float[numArrondissements + numExtraPoints][2];
  // add the arrondissements centers in a spiral, counter-clockwise order
  for (int i = 0; i < numArrondissements; i++) {
    points[i][0] = width/2 + width/50.0 * i * sin(PI - 2.3 * TWO_PI * i/numArrondissements); // ith point, x
    points[i][1] = height/2 + height/50.0 * i * cos(PI - 2.3 * TWO_PI * i/numArrondissements); // ith point, y
  }
  for (int i = numArrondissements; i < numArrondissements+numExtraPoints; i++) {
    points[i][0] = width/2 + width * 0.6 * sin(- TWO_PI * i/numExtraPoints); // ith point, x
    points[i][1] = height/2 + height * 0.6 * cos(- TWO_PI * i/numExtraPoints); // ith point, y
  }
  parisVoronoi = new Voronoi( points );
  arrondissements = parisVoronoi.getRegions();
  
  
  
  readCSV();
}

void draw() {

  for (int i = 0; i < numArrondissements; i++)
  {
    fill(200);
    stroke(255);
    arrondissements[i].draw(this); // draw this shape
    fill(0);
    stroke(0);
    // an array of points
    float[][] regionCoordinates = arrondissements[i].getCoords();
    float[] center = new float[2];
    for (int j = 0; j < regionCoordinates.length; j++) {
      center[0] += regionCoordinates[j][0];
      center[1] += regionCoordinates[j][1];
    }
    center[0] /= regionCoordinates.length;
    center[1] /= regionCoordinates.length;
    

    text(i+1, center[0], center[1]);
  }
}

