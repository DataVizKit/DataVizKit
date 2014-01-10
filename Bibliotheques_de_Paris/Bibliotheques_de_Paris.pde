import megamu.mesh.*;

Voronoi parisVoronoi;
MPolygon[] arrondissements;
int numArrondissements = 20;

void setup() {

  size(1280, 720);

  float[][] points = new float[numArrondissements+10][2];

  for (int i = 0; i < points.length; i++) {
    points[i][0] = width/2 + width/50.0 * i * sin(PI - 3.4 * TWO_PI * i/points.length); // ith point, x
    points[i][1] = height/2 + height/50.0 * i * cos(PI - 3.4 * TWO_PI * i/points.length); // ith point, y
  }

  parisVoronoi = new Voronoi( points );

  arrondissements = parisVoronoi.getRegions();
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
    for(int j = 0; j < regionCoordinates.length; j++) {
      center[0] += regionCoordinates[j][0];
      center[1] += regionCoordinates[j][1];
    }
    center[0] /= regionCoordinates.length;
    center[1] /= regionCoordinates.length;

    text(i+1, center[0], center[1]);
  }
}

