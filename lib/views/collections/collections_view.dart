import 'package:flutter/material.dart';
import 'package:web_app/views/collections/collection_detail_view.dart';
import 'package:web_app/views/collections/collections_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:web_app/views/widgets/navigation_bar.dart';

class CollectionView extends StatelessWidget {
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CollectionViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: model.isBusy ? CircularProgressIndicator(): Column (
            children: [
              NavigationBar(),
              _buildCollectionList(model),
            ] 
          ),
        ),
      ),
      viewModelBuilder: () => CollectionViewModel(),
    );
  }

  Widget _buildCollectionList(CollectionViewModel model) => Container(
    width: 800,
    height: 350,
    child: ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Container(height: 2), 
      itemCount: model.collections.length,
      itemBuilder: (context, index) {
        final collection = model.collections[index];
        return _buildListWidget(context, collection, model);
      },
    ),
  );

  Widget _buildListWidget(BuildContext context, String collectionName, CollectionViewModel model) => Container(
    width: 20,
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        Expanded(
          child: ListTile(
            tileColor: Colors.grey,
            leading: Icon(Icons.image),
            title: Text(collectionName),
            trailing: _buildActionButtons(context, model, collectionName),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CollectionDetailView(collectionName: collectionName,),
                ),
              ),
            },
          ),
        ),
      ],
    ),
  );

  Widget _buildActionButtons(BuildContext context, CollectionViewModel model, String name) => Container(
    margin: const EdgeInsets.only(right: 20),
    padding: EdgeInsets.only(left: 5),
    child: SizedBox(
      height: 50,
      width: 90,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Rename',
            onPressed: () {
              _textFieldController.text = name;
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
                        onPressed: () {model.updateName(name, _textFieldController.text); Navigator.pop(context, true);},
                        child: Text('Save'),
                      ),
                    ],
                  );
                }
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete',
            onPressed: () => model.delete(name),
          ),
        ],
      ),
    ),
  );
}

  