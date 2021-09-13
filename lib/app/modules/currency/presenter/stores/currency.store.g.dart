// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CurrencyStore on _CurrencyStore, Store {
  final _$currentTypeAtom = Atom(name: '_CurrencyStore.currentType');

  @override
  CurrencyType get currentType {
    _$currentTypeAtom.reportRead();
    return super.currentType;
  }

  @override
  set currentType(CurrencyType value) {
    _$currentTypeAtom.reportWrite(value, super.currentType, () {
      super.currentType = value;
    });
  }

  final _$currentPriceAtom = Atom(name: '_CurrencyStore.currentPrice');

  @override
  double? get currentPrice {
    _$currentPriceAtom.reportRead();
    return super.currentPrice;
  }

  @override
  set currentPrice(double? value) {
    _$currentPriceAtom.reportWrite(value, super.currentPrice, () {
      super.currentPrice = value;
    });
  }

  final _$getCurrencyByTypeAsyncAction =
      AsyncAction('_CurrencyStore.getCurrencyByType');

  @override
  Future<void> getCurrencyByType(CurrencyType type) {
    return _$getCurrencyByTypeAsyncAction
        .run(() => super.getCurrencyByType(type));
  }

  final _$_CurrencyStoreActionController =
      ActionController(name: '_CurrencyStore');

  @override
  void changeCurrency(CurrencyType type) {
    final _$actionInfo = _$_CurrencyStoreActionController.startAction(
        name: '_CurrencyStore.changeCurrency');
    try {
      return super.changeCurrency(type);
    } finally {
      _$_CurrencyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentType: ${currentType},
currentPrice: ${currentPrice}
    ''';
  }
}
