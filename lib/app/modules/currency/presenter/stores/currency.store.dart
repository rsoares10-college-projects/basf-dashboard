import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/enums/currency-type.enum.dart';
import '../../domain/usecases/get-currency-by-type.usecase.dart';

part 'currency.store.g.dart';

class CurrencyStore = _CurrencyStore with _$CurrencyStore;

abstract class _CurrencyStore with Store {
  final _getCurrencyByType = Modular.get<GetCurrencyByType>();

  @observable
  CurrencyType currentType = CurrencyType.usd;

  @observable
  double? currentPrice;

  @action
  Future<void> getCurrencyByType(CurrencyType type) async {
    final response = await _getCurrencyByType(type);

    response.fold(
      (l) => log(l.toString()),
      (r) {
        currentType = type;
        currentPrice = double.parse(r.high);
      },
    );
  }

  @action
  void changeCurrency(CurrencyType type) {
    getCurrencyByType(type);
  }

  @action
  Future<void> refresh() async {
    await getCurrencyByType(currentType);
  }
}
