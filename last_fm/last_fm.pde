//Dependencies: mesh library by Lee Byron
// the mesh library is available here: http://leebyron.com/else/mesh/

import treemap.*;

String user = "un3x";
String apiKey = "134c768f69763e57683428872d3e144c";

CustomTreemap map;


void setup() {
  size(1280, 720);
  getTopArtists();
}



void getTopArtists() {

  WordMap mapData = new WordMap();

  File f = new File(dataPath(user+".xml"));
  // if xml file is not present in data folder, reload it from last.fm api
  if (!f.exists()) {
    XML xmlData = loadXML("http://ws.audioscrobbler.com:80/2.0/?method=user.gettopartists&user="+user+"&api_key="+apiKey);
    PrintWriter xmlFile = createWriter(dataPath(user+".xml"));
    xmlFile.print(xmlData);
    xmlFile.flush();
    xmlFile.close();
  }

  XML xml = loadXML (user+".xml");
  XML xmlTopArtists = xml.getChild("topartists");
  XML[] xmlChildren = xmlTopArtists.getChildren("artist");
  for (int i = 0; i < xmlChildren.length; i++) {
    String artist = xmlChildren[i].getChild("name").getContent();
    int playcount = int(xmlChildren[i].getChild("playcount").getContent());
    for (int j = 0; j < playcount; j++) {
      mapData.addWord(artist);
    }
  }

  mapData.finishAdd();
  map = new CustomTreemap(mapData, new SquarifiedLayout(), 0, 0, width, height);
}

void draw()
{
  background(255);
  map.draw();
}

