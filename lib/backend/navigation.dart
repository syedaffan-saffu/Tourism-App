import 'package:flutter/material.dart';
import 'package:trekkers_pk/backend/provider/providers.dart';

class NavigationTracker extends NavigatorObserver {
  int routeCount = 0;
  final LinkCountProvider linkCountProvider;
  final int index;
  NavigationTracker(this.linkCountProvider, this.index);

  @override
  void didPush(Route route, Route? previousRoute) {
    routeCount++;
    linkCountProvider.increment(index);
    print('Route Pushed: , Total Routes: $routeCount, $index');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    routeCount--;
    linkCountProvider.decrement(index);
    print('Route Popped:, Total Routes: $routeCount, $index');
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    routeCount--;
    print('Route Removed: $route, Total Routes: $routeCount');
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    // No change in route count as one route is replaced by another
    print(
        'Route Replaced: $oldRoute with $newRoute, Total Routes: $routeCount');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
