// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardStore on _DashboardStore, Store {
  final _$currentRouteAtom = Atom(name: '_DashboardStore.currentRoute');

  @override
  String get currentRoute {
    _$currentRouteAtom.reportRead();
    return super.currentRoute;
  }

  @override
  set currentRoute(String value) {
    _$currentRouteAtom.reportWrite(value, super.currentRoute, () {
      super.currentRoute = value;
    });
  }

  final _$refreshDashboardAsyncAction =
      AsyncAction('_DashboardStore.refreshDashboard');

  @override
  Future<void> refreshDashboard() {
    return _$refreshDashboardAsyncAction.run(() => super.refreshDashboard());
  }

  final _$_DashboardStoreActionController =
      ActionController(name: '_DashboardStore');

  @override
  void setRoute(String route) {
    final _$actionInfo = _$_DashboardStoreActionController.startAction(
        name: '_DashboardStore.setRoute');
    try {
      return super.setRoute(route);
    } finally {
      _$_DashboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentRoute: ${currentRoute}
    ''';
  }
}
