import treemap.*;


Table table;


CustomTreemap map;

void setup() {

  size(1280, 960);

  // print all the column headers
  /*
  String [] lines = loadStrings("JCC2.csv");
   String firstLine = lines[0];
   String[] titles = split(firstLine, '\t');
   for(int i = 0; i < titles.length; i++) println(titles[i]);
   */

  WordMap mapData = new WordMap();


  table = loadTable("JCC2.csv", "header, tsv");

  println(table.getRowCount() + " total rows in table"); 




  for (TableRow row : table.rows()) {

    String name = row.getString("Prénom");
    String position = row.getString("Numéro de l'appareil");
    String date = row.getString("Type de billet");

    println(name + " (" + position + ") subscriped on " + date);

    mapData.addWord(name);
  }

  mapData.finishAdd();
  map = new CustomTreemap(mapData, new SquarifiedLayout(), 0, 0, width, height);

  map.draw();
}

