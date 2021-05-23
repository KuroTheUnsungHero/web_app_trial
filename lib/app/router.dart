import 'package:web_app/views/collections/collection_detail_view.dart';
import 'package:web_app/views/collections/collections_view.dart';
import 'package:web_app/views/home/home_view.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: CollectionView),
    MaterialRoute(page: CollectionDetailView),
  ],
)
class $Router {}