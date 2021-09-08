import 'package:basf_dashboard/app/modules/currency/domain/entitties/currency.entity.dart';
import 'package:basf_dashboard/app/modules/currency/domain/enums/currency-type.enum.dart';
import 'package:basf_dashboard/app/modules/currency/domain/repositories/get-currency-by-type.repository.dart';
import 'package:basf_dashboard/app/modules/currency/domain/usecases/get-currency-by-type.usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get-currency-by-type.usecase_test.mocks.dart';

@GenerateMocks([GetCurrencyByTypeRepository, Currency])
void main() {
  final repository = MockGetCurrencyByTypeRepository();
  final usecase = GetCurrencyByTypeImpl(repository);

  test('Should return a currency', () async {
    when(repository.getCurrency(any)).thenAnswer((_) async => Right(MockCurrency()));

    final response = await usecase(CurrencyType.usd);
    expect(response.fold(id, id), isA<Currency>());
  });
}
