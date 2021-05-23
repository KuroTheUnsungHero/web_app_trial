// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../views/collections/collection_detail_view.dart' as _i5;
import '../views/collections/collections_view.dart' as _i4;
import '../views/home/home_view.dart' as _i3;

class Router extends _i1.RootStackRouter {
  Router([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.HomeView();
        }),
    CollectionViewRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.CollectionView();
        }),
    CollectionDetailViewRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.CollectionDetailView(collectionName: '',);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeViewRoute.name, path: '/'),
        _i1.RouteConfig(CollectionViewRoute.name, path: '/collection-view'),
        _i1.RouteConfig(CollectionDetailViewRoute.name,
            path: '/collection-detail-view')
      ];
}

class HomeViewRoute extends _i1.PageRouteInfo {
  const HomeViewRoute() : super(name, path: '/');

  static const String name = 'HomeViewRoute';
}

class CollectionViewRoute extends _i1.PageRouteInfo {
  const CollectionViewRoute() : super(name, path: '/collection-view');

  static const String name = 'CollectionViewRoute';
}

class CollectionDetailViewRoute extends _i1.PageRouteInfo {
  const CollectionDetailViewRoute()
      : super(name, path: '/collection-detail-view');

  static const String name = 'CollectionDetailViewRoute';
}
