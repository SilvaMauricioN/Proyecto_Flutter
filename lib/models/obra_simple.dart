import 'dart:convert';

//De json a lista  objeto ObraSimple 
List<ObraSimple> obrasSimpleFromJson(String str) {
  List<dynamic> jsonList = json.decode(str);
  List<ObraSimple> obraSimpleLista = List<ObraSimple>.from(jsonList.map((x) => ObraSimple.fromJson(x)));
  return obraSimpleLista;
}
//De objeto ObraSimple a Json
String listaObraSimpleToJson(List<ObraSimple> data) {
  List<Map<String, dynamic>> obraSimpleMapLista = List<Map<String, dynamic>>.from(data.map((x) => x.toJson()));
  String jsonString = json.encode(obraSimpleMapLista);
  return jsonString;
}

String obraSimpleToJson(List<ObraSimple> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ObraSimple {
    String id;
    String objectNumber;
    String title;
    bool hasImage;
    String principalOrFirstMaker;
    String longTitle;
    bool showImage;
    bool permitDownload;
    Img webImage;
    List<String> productionPlaces;

    ObraSimple({
        required this.id,
        required this.objectNumber,
        required this.title,
        required this.hasImage,
        required this.principalOrFirstMaker,
        required this.longTitle,
        required this.showImage,
        required this.permitDownload,
        required this.webImage,
        required this.productionPlaces,
    });

    factory ObraSimple.fromJson(Map<String, dynamic> json) => ObraSimple(
        id: json["id"],
        objectNumber: json["objectNumber"],
        title: json["title"],
        hasImage: json["hasImage"],
        principalOrFirstMaker: json["principalOrFirstMaker"],
        longTitle: json["longTitle"],
        showImage: json["showImage"],
        permitDownload: json["permitDownload"],
        webImage: json["webImage"] != null ? Img.fromJson(json["webImage"]) : Img(guid: "", offsetPercentageX: 0, offsetPercentageY: 0, width: 0, height: 0, url: ""), 
        productionPlaces: List<String>.from(json["productionPlaces"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "objectNumber": objectNumber,
        "title": title,
        "hasImage": hasImage,
        "principalOrFirstMaker": principalOrFirstMaker,
        "longTitle": longTitle,
        "showImage": showImage,
        "permitDownload": permitDownload,
        "webImage": webImage.toJson(),
        "productionPlaces": List<dynamic>.from(productionPlaces.map((x) => x)),
    };
}

class Img {
    String guid;
    int offsetPercentageX;
    int offsetPercentageY;
    int width;
    int height;
    String url;

    Img({
        required this.guid,
        required this.offsetPercentageX,
        required this.offsetPercentageY,
        required this.width,
        required this.height,
        required this.url,
    });

    factory Img.fromJson(Map<String, dynamic> json) => Img(
        guid: json["guid"],
        offsetPercentageX: json["offsetPercentageX"],
        offsetPercentageY: json["offsetPercentageY"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "guid": guid,
        "offsetPercentageX": offsetPercentageX,
        "offsetPercentageY": offsetPercentageY,
        "width": width,
        "height": height,
        "url": url,
    };
}


