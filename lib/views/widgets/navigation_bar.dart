import 'package:flutter/material.dart';
import 'package:web_app/views/collections/collections_view.dart';
import 'package:web_app/views/home/home_view.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 150,
            child: Icon(Icons.image),  
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _NavBarItems(title: 'Home',),
              SizedBox(width: 60),
              _NavBarItems(title: 'Collections',),
            ],
          )
        ],
      ),
    );
  }
}

class _NavBarItems extends StatelessWidget {
  final String title;

  const _NavBarItems({
    required this.title, 
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (title == 'Home') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomeView(),
            ),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CollectionView(),
            ),
          );
        }
      },
      child: Text(title,
        style: TextStyle(
          fontSize: 18
        ),
      ),
    );
  }
}