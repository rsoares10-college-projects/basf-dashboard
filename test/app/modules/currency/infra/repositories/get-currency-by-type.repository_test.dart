import 'package:basf_dashboard/app/modules/currency/domain/entitties/currency.entity.dart';
import 'package:basf_dashboard/app/modules/currency/domain/enums/currency-type.enum.dart';
import 'package:basf_dashboard/app/modules/currency/infra/data/datasouce/get-currency-by-type.datasource.dart';
import 'package:basf_dashboard/app/modules/currency/infra/errors/currency-datasouce.error.dart';
import 'package:basf_dashboard/app/modules/currency/infra/models/currency.model.dart';
import 'package:basf_dashboard/app/modules/currency/infra/repositories/get-currency-by-type.repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get-currency-by-type.repository_test.mocks.dart';

@GenerateMocks([GetCurrencyByTypeDatasouce, CurrencyModel])
void main() {
  final datasource = MockGetCurrencyByTypeDatasouce();
  final repository = GetCurrencyByTypeRepositoryImpl(datasource);

  test('Should return a currency model', () async {
    when(datasource.getCurrency(any)).thenAnswer((_) async => MockCurrencyModel());

    final response = await repository.getCurrency(CurrencyType.usd);
    expect(response.fold(id, id), isA<Currency>());
  });

  test('Should return a CurrencyDatasourceError', () async {
    when(datasource.getCurrency(any)).thenThrow(CurrencyDatasouceError());

    final response = await repository.getCurrency(CurrencyType.usd);
    expect(response.fold(id, id), isA<CurrencyDatasouceError>());
  });
}
