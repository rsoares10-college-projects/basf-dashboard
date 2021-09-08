import 'dart:convert';

import 'package:basf_dashboard/app/modules/currency/data/datasouce/awesome-apis-get-currency-by-type.datasouce.dart';
import 'package:basf_dashboard/app/modules/currency/domain/enums/currency-type.enum.dart';
import 'package:basf_dashboard/app/modules/currency/infra/errors/currency-datasouce.error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../utils/awesome-apis-get-currencies.util.dart';
import 'awesome-apis-get-currency-by-type.datasouce_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final dio = MockDio();
  final datasouce = AwesomeAPIsGetCurrencyByTypeDatasouce(dio);

  test('Should complete request nromaly', () async {
    when(dio.get(any)).thenAnswer(
      (realInvocation) async => Response(
        data: jsonDecode(awesomeAPIsGetCurrencySuccess),
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final future = datasouce.getCurrency(CurrencyType.usd);
    expect(future, completes);
  });

  test('Should return a CurrencyDatasourceError', () async {
    when(dio.get(any)).thenAnswer(
      (realInvocation) async => Response(
        data: jsonDecode(awesomeAPIsGetCurrency404),
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final response = datasouce.getCurrency(CurrencyType.usd);
    expect(response, throwsA(isA<CurrencyDatasouceError>()));
  });
}
