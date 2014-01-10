import megamu.mesh.*;

Voronoi myVoronoi;
MPolygon[] myRegions;

void setup() {

  size(800, 600);

  float[][] points = new float[20][2];

  for (int i = 0; i < points.length; i++) {
    points[i][0] = width/2 + 20 * i * sin(PI - 2.35 * TWO_PI * i/points.length); // ith point, x
    points[i][1] = height/2 + 20 * i * cos(PI - 2.35 * TWO_PI * i/points.length); // ith point, y
  }

  myVoronoi = new Voronoi( points );



  myRegions = myVoronoi.getRegions();
}

void draw() {
  fill(200);
  stroke(255);

  for (int i=0; i<myRegions.length; i++)
  {
    // an array of points
    float[][] regionCoordinates = myRegions[i].getCoords();

    myRegions[i].draw(this); // draw this shape
  }
}

