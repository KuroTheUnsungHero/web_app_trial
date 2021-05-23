import 'dart:html';

import 'package:flutter/material.dart';
import 'package:web_app/views/home/home_viewmodel.dart';
import 'package:web_app/views/widgets/navigation_bar.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: model.isBusy ? CircularProgressIndicator(): Column (
            children: [
              NavigationBar(),
              _buildSearchBar(model),
              _buildGridView(model),
              SizedBox(height: 50),
              _buildAddCollectionButton(context, model),
            ] 
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget _buildSearchBar(HomeViewModel model) {
    return Container (
      width: 500,
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      padding: const EdgeInsets.all(3),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          hintText: 'Search Images'
        ),
        onSubmitted: (text) => model.setSearch(text),
      ),
    );
  }

  Widget _buildGridView(HomeViewModel model) => Container(
    width: 800,
    height: 350,
    child: GridView.count(
      crossAxisCount: 5,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      children: List.generate(model.image.length, (index) {
        return Center(
          child: GestureDetector(
            onTap: () => model.setSelected(index),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: model.image[index].isSelected() ? Colors.blue : Colors.transparent,
                  width: 5,
                )
              ),
              child: Image.network(model.image[index].getThumbUrl(), 
                fit: BoxFit.cover,
                height: 400,
              ),
            ),
          )
        );
      })
    ),
  );

  _buildAddCollectionButton(BuildContext context, HomeViewModel model) => SizedBox(
    height: 50,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      onPressed: () { 
        _textFieldController.text = '';
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Collection name'),
              content: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(hintText: "Collection name"),
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () {model.addToCollections(_textFieldController.text); Navigator.pop(context, true);},
                  child: Text('Save'),
                ),
              ],
            );
          }
        );
      },
      child: Text('Add to collections'),
    ),
  );
}