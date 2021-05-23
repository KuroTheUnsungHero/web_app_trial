import 'dart:io';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:html';

class HomeViewModel extends FutureViewModel<List<UnsplashImage>> {
  String searchString = '';
  List<UnsplashImage> _images = [];

  List<UnsplashImage> get image => _images;

  void setSearch(String searchString) async {
    this.searchString = searchString;
    await fetchPhotos();
    notifyListeners();
  }

  void setSelected(int index) {
    _images[index].setSelected(!_images[index].isSelected());
    notifyListeners();
  }

  void addToCollections(String collectionName) {
    final Storage _localStorage = window.localStorage;
    List<String> urls = [];
    for (int i = 0; i < _images.length; i++) {
      if (_images[i].isSelected()) {
        urls.add(_images[i].getThumbUrl());
        String jsonUrl = json.encode(urls);
        
        _localStorage[collectionName] = jsonUrl;
        _images[i].setSelected(!_images[i].isSelected());
        notifyListeners();
      }
    }
  }

  Future<List<UnsplashImage>> initialRun() async {
    await fetchPhotos();
    return _images;
  }

  Future<void> fetchPhotos() async {
    
    if (searchString == '') {
      searchString = 'random';
    }

    var response = await http.get(Uri.parse('https://api.unsplash.com/search/photos?&client_id=Y5AVc5Du13wW0IdXgMPxBxqE3GwltciGCrlVwhingg0&page=1&query=$searchString'));

    if (response.statusCode == HttpStatus.ok) {
      var jsonResponse = json.decode(response.body);
      Iterable jsona = jsonResponse["results"];
      
      _images = [];
      jsona.forEach((element) {
        UnsplashImage image = new UnsplashImage(element);
        _images.add(image);
      });
    }
  }

  @override
  Future<List<UnsplashImage>> futureToRun() => initialRun();
}

class UnsplashImage {
  var data;
  var selected = false;

  UnsplashImage(
    this.data
  );

  // Getter

  String getId() {
    return data['id'];
  }

  getUrls() {
    return data['urls'];
  }

  String getRawUrl() {
    return getUrls()['raw'];
  }

  String getFullUrl() {
    return getUrls()['full'];
  }

  String getRegularUrl() {
    return getUrls()['regular'];
  }

  String getSmallUrl() {
    return getUrls()['small'];
  }

  String getThumbUrl() {
    return getUrls()['thumb'];
  }

  bool isSelected() {
    return this.selected;
  }

  //Setter
  void setSelected(bool selected) {
    this.selected = selected;
  }

}


