import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:html';

class CollectionDetailViewModel extends FutureViewModel<List<String>> {

  final String collectionName;

  CollectionDetailViewModel({
    required this.collectionName, 
  });

  List<String> _urls = [];
  List<String> get urls => _urls;
  final Storage _localStorage = window.localStorage;

  Future<void> loadCollectionDisplayList(collectionName) async {
    _urls = [];
    String? images =_localStorage[collectionName];
    Iterable urls = json.decode(images!);
    urls.forEach((element) { 
      _urls.add(element);
    });
  }

  Future<List<String>> getImageUrls(String collectionName) async {
    await loadCollectionDisplayList(collectionName);
    return _urls;
  }

  @override
  Future<List<String>> futureToRun() => getImageUrls(collectionName);
}


