import java.util.Map;


void readCSV() {
  String [] lines = loadStrings("2012_07.csv");
  int emptyLineCounter = 0;


  Arrondissement[] arrt = new Arrondissement[numArrondissements];
  for (int i = 0; i < arrt.length; i++) {
    arrt[i] = new Arrondissement();
  }

  String firstLine = lines[0];
  String[] titles = split(firstLine, ';');

  for (String line : lines) { // go through the file line by line
    String[] pieces = split(line, ';');
    int emptyPieceCounter = 0;
    for (int i = 0; i < pieces.length; i++) { // go through the line piece by piece
      String piece = pieces[i];

      piece = trim(piece); // remove white spaces
      if (piece.length() == 0) emptyPieceCounter++; // count up empty pieces so we can detect empty lines
      else if (emptyLineCounter == 1) {
        //println(piece);
        int pieceInt = int( piece.replace(".", "") );
        int arrondissementNumber = int(pieces[0])-1; // number of the current arrondissement
        if (i > 2 && arrondissementNumber >= 0 && arrondissementNumber < numArrondissements) arrt[arrondissementNumber].addData(titles[i], pieceInt);
      }
    }

    if (emptyPieceCounter == pieces.length) {
      println("line is empty!");
      emptyLineCounter++;
      if (emptyLineCounter == 2) return; // end of data if second empty line is reached!
    }
  }
}


class Arrondissement {
  HashMap<String, Integer> datamap = new HashMap<String, Integer>();

  Arrondissement() {
    // default constructor for a new class
  }

  void addData(String s, int i) {
    // if key doesn't already exist, add it
    if (datamap.get(s) == null) datamap.put(s, i);
    // if key exists add the new value to the existing one
    else {
      int val = datamap.get(s);
      datamap.put(s, val+i);
    }
    println(s + " has now value: " + datamap.get(s) );
  }

  int getData(String s) {
    return datamap.get(s);
  }
}

