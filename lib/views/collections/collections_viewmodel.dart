import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:html';

class CollectionViewModel extends FutureViewModel<List<String>> {
  List<String> _collections = [];
  final Storage _localStorage = window.localStorage;

  List<String> get collections => _collections;

  Future<void> loadCollectionList() async {
    _collections = [];
    _localStorage.forEach((key, value) { 
      _collections.add(key);
    });
  }

  Future<void> updateName(String oldName, String newName) async {
    String temp = _localStorage[oldName].toString();
    _localStorage[newName] = temp;
    _localStorage.remove(oldName);
    await loadCollectionList();
    notifyListeners();
  }

  Future<void> delete(String collectionName) async {
    _localStorage.remove(collectionName);
    await loadCollectionList();
    notifyListeners();
  }

  Future<List<String>> getCollectionList() async {
    await loadCollectionList();
    return _collections;
  }

  @override
  Future<List<String>> futureToRun() => getCollectionList();
}


