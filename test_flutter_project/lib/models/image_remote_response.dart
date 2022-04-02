import 'dart:convert';

/// total_results : 10000
/// page : 1
/// per_page : 1
/// photos : [{"id":3573351,"width":3066,"height":3968,"url":"https://www.pexels.com/photo/trees-during-day-3573351/","photographer":"Lukas Rodriguez","photographer_url":"https://www.pexels.com/@lukas-rodriguez-1845331","photographer_id":1845331,"avg_color":"#374824","src":{"original":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png","large2x":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940","large":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=650&w=940","medium":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=350","small":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=130","portrait":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800","landscape":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200","tiny":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"},"liked":false,"alt":"Brown Rocks During Golden Hour"}]
/// next_page : "https://api.pexels.com/v1/search/?page=2&per_page=1&query=nature"
ImageRemoteResponse imageRemoteResponseFromJson(String str) =>
    ImageRemoteResponse.fromJson(json.decode(str));

String imageRemoteResponseToJson(ImageRemoteResponse data) =>
    json.encode(data.toJson());

class ImageRemoteResponse {
  ImageRemoteResponse({
    int? totalResults,
    int? page,
    int? perPage,
    List<Photos>? photos,
    String? nextPage,
  }) {
    _totalResults = totalResults;
    _page = page;
    _perPage = perPage;
    _photos = photos;
    _nextPage = nextPage;
  }

  ImageRemoteResponse.fromJson(dynamic json) {
    _totalResults = json['total_results'];
    _page = json['page'];
    _perPage = json['per_page'];
    if (json['photos'] != null) {
      _photos = [];
      json['photos'].forEach((v) {
        _photos?.add(Photos.fromJson(v));
      });
    }
    _nextPage = json['next_page'];
  }

  int? _totalResults;
  int? _page;
  int? _perPage;
  List<Photos>? _photos;
  String? _nextPage;

  ImageRemoteResponse copyWith({
    int? totalResults,
    int? page,
    int? perPage,
    List<Photos>? photos,
    String? nextPage,
  }) =>
      ImageRemoteResponse(
        totalResults: totalResults ?? _totalResults,
        page: page ?? _page,
        perPage: perPage ?? _perPage,
        photos: photos ?? _photos,
        nextPage: nextPage ?? _nextPage,
      );

  int? get totalResults => _totalResults;

  int? get page => _page;

  int? get perPage => _perPage;

  List<Photos>? get photos => _photos;

  String? get nextPage => _nextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_results'] = _totalResults;
    map['page'] = _page;
    map['per_page'] = _perPage;
    if (_photos != null) {
      map['photos'] = _photos?.map((v) => v.toJson()).toList();
    }
    map['next_page'] = _nextPage;
    return map;
  }
}

/// id : 3573351
/// width : 3066
/// height : 3968
/// url : "https://www.pexels.com/photo/trees-during-day-3573351/"
/// photographer : "Lukas Rodriguez"
/// photographer_url : "https://www.pexels.com/@lukas-rodriguez-1845331"
/// photographer_id : 1845331
/// avg_color : "#374824"
/// src : {"original":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png","large2x":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940","large":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=650&w=940","medium":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=350","small":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=130","portrait":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800","landscape":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200","tiny":"https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"}
/// liked : false
/// alt : "Brown Rocks During Golden Hour"

Photos photosFromJson(String str) => Photos.fromJson(json.decode(str));

String photosToJson(Photos data) => json.encode(data.toJson());

class Photos {
  Photos({
    int? id,
    int? width,
    int? height,
    String? url,
    String? photographer,
    String? photographerUrl,
    int? photographerId,
    String? avgColor,
    Src? src,
    bool? liked,
    String? alt,
  }) {
    _id = id;
    _width = width;
    _height = height;
    _url = url;
    _photographer = photographer;
    _photographerUrl = photographerUrl;
    _photographerId = photographerId;
    _avgColor = avgColor;
    _src = src;
    _liked = liked;
    _alt = alt;
  }

  Photos.fromJson(dynamic json) {
    _id = json['id'];
    _width = json['width'];
    _height = json['height'];
    _url = json['url'];
    _photographer = json['photographer'];
    _photographerUrl = json['photographer_url'];
    _photographerId = json['photographer_id'];
    _avgColor = json['avg_color'];
    _src = json['src'] != null ? Src.fromJson(json['src']) : null;
    _liked = json['liked'];
    _alt = json['alt'];
  }

  int? _id;
  int? _width;
  int? _height;
  String? _url;
  String? _photographer;
  String? _photographerUrl;
  int? _photographerId;
  String? _avgColor;
  Src? _src;
  bool? _liked;
  String? _alt;

  Photos copyWith({
    int? id,
    int? width,
    int? height,
    String? url,
    String? photographer,
    String? photographerUrl,
    int? photographerId,
    String? avgColor,
    Src? src,
    bool? liked,
    String? alt,
  }) =>
      Photos(
        id: id ?? _id,
        width: width ?? _width,
        height: height ?? _height,
        url: url ?? _url,
        photographer: photographer ?? _photographer,
        photographerUrl: photographerUrl ?? _photographerUrl,
        photographerId: photographerId ?? _photographerId,
        avgColor: avgColor ?? _avgColor,
        src: src ?? _src,
        liked: liked ?? _liked,
        alt: alt ?? _alt,
      );

  int? get id => _id;

  int? get width => _width;

  int? get height => _height;

  String? get url => _url;

  String? get photographer => _photographer;

  String? get photographerUrl => _photographerUrl;

  int? get photographerId => _photographerId;

  String? get avgColor => _avgColor;

  Src? get src => _src;

  bool? get liked => _liked;

  String? get alt => _alt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['width'] = _width;
    map['height'] = _height;
    map['url'] = _url;
    map['photographer'] = _photographer;
    map['photographer_url'] = _photographerUrl;
    map['photographer_id'] = _photographerId;
    map['avg_color'] = _avgColor;
    if (_src != null) {
      map['src'] = _src?.toJson();
    }
    map['liked'] = _liked;
    map['alt'] = _alt;
    return map;
  }
}

/// original : "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png"
/// large2x : "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
/// large : "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=650&w=940"
/// medium : "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=350"
/// small : "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=130"
/// portrait : "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800"
/// landscape : "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"
/// tiny : "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"

Src srcFromJson(String str) => Src.fromJson(json.decode(str));

String srcToJson(Src data) => json.encode(data.toJson());

class Src {
  Src({
    String? original,
    String? large2x,
    String? large,
    String? medium,
    String? small,
    String? portrait,
    String? landscape,
    String? tiny,
  }) {
    _original = original;
    _large2x = large2x;
    _large = large;
    _medium = medium;
    _small = small;
    _portrait = portrait;
    _landscape = landscape;
    _tiny = tiny;
  }

  Src.fromJson(dynamic json) {
    _original = json['original'];
    _large2x = json['large2x'];
    _large = json['large'];
    _medium = json['medium'];
    _small = json['small'];
    _portrait = json['portrait'];
    _landscape = json['landscape'];
    _tiny = json['tiny'];
  }

  String? _original;
  String? _large2x;
  String? _large;
  String? _medium;
  String? _small;
  String? _portrait;
  String? _landscape;
  String? _tiny;

  Src copyWith({
    String? original,
    String? large2x,
    String? large,
    String? medium,
    String? small,
    String? portrait,
    String? landscape,
    String? tiny,
  }) =>
      Src(
        original: original ?? _original,
        large2x: large2x ?? _large2x,
        large: large ?? _large,
        medium: medium ?? _medium,
        small: small ?? _small,
        portrait: portrait ?? _portrait,
        landscape: landscape ?? _landscape,
        tiny: tiny ?? _tiny,
      );

  String? get original => _original;

  String? get large2x => _large2x;

  String? get large => _large;

  String? get medium => _medium;

  String? get small => _small;

  String? get portrait => _portrait;

  String? get landscape => _landscape;

  String? get tiny => _tiny;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['original'] = _original;
    map['large2x'] = _large2x;
    map['large'] = _large;
    map['medium'] = _medium;
    map['small'] = _small;
    map['portrait'] = _portrait;
    map['landscape'] = _landscape;
    map['tiny'] = _tiny;
    return map;
  }
}
