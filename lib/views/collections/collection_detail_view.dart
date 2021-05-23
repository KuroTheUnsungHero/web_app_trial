import 'package:flutter/material.dart';
import 'package:web_app/views/collections/collection_detail_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:web_app/views/widgets/navigation_bar.dart';

class CollectionDetailView extends StatelessWidget {
  final String collectionName;

  const CollectionDetailView({
    required this.collectionName, 
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CollectionDetailViewModel>.reactive(
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
      viewModelBuilder: () => CollectionDetailViewModel(collectionName: collectionName),
    );
  }

  Widget _buildCollectionList(CollectionDetailViewModel model) => Container(
    width: 800,
    height: 350,
    child: GridView.count(
      crossAxisCount: 5,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      children: List.generate(model.urls.length, (index) {
        return Center(
          child: Image.network(model.urls[index], 
            fit: BoxFit.cover,
            height: 400,
          ),
        );
      })
    ),
  );
}