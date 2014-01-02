String user = "un3x";
String apiKey = "134c768f69763e57683428872d3e144c";


void setup() {
  getTopArtists();
}



void getTopArtists() {
  File f = new File(dataPath(user+".xml"));
  // if xml file is not present in data folder, reload it from last.fm api
  if (!f.exists()) {
    XML xmlData = loadXML("http://ws.audioscrobbler.com:80/2.0/?method=user.gettopartists&user="+user+"&api_key="+apiKey);
    PrintWriter xmlFile = createWriter(dataPath(user+".xml"));
    xmlFile.print(xmlData);
    xmlFile.flush();
    xmlFile.close();
  }
}

