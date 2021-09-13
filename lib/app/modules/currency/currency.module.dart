import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasouce/awesome-apis-get-currency-by-type.datasouce.dart';
import 'domain/usecases/get-currency-by-type.usecase.dart';
import 'infra/repositories/get-currency-by-type.repository.dart';
import 'presenter/stores/currency.store.dart';
import 'presenter/views/currency.view.dart';

class CurrencyModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => CurrencyStore(), export: true),
        Bind((i) => AwesomeAPIsGetCurrencyByTypeDatasouce(i()), export: true),
        Bind((i) => GetCurrencyByTypeRepositoryImpl(i()), export: true),
        Bind((i) => GetCurrencyByTypeImpl(i()), export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (__, _) => Currencyview(), transition: TransitionType.fadeIn),
      ];
}
