import 'dart:developer';

import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';

import '../../../../core/api-list.core.dart';
import '../../domain/enums/currency-type.enum.dart';
import '../../infra/data/datasouce/get-currency-by-type.datasource.dart';
import '../../infra/errors/currency-datasouce.error.dart';
import '../../infra/models/currency.model.dart';

class AwesomeAPIsGetCurrencyByTypeDatasouce implements GetCurrencyByTypeDatasouce {
  final Dio dio;

  AwesomeAPIsGetCurrencyByTypeDatasouce(this.dio);

  @override
  Future<CurrencyModel> getCurrency(CurrencyType currencyType) async {
    dio.httpClientAdapter = BrowserHttpClientAdapter();

    try {
      final response = await dio.get(
        '${APIList.awesomeAPIsGetCurrencies}${currencyType.toShortString()}',
      );

      switch (response.statusCode) {
        case 200:
          return CurrencyModel.fromMap(response.data['${currencyType.toCodeString()}']);
        case 404:
          throw CurrencyDatasouceError(response.data['message']);
        default:
          throw CurrencyDatasouceError(response.data['message']);
      }
    } on DioError catch (e) {
      log('[${e.type}] ${e.error.toString()}');

      throw CurrencyDatasouceError(e.error.toString());
    }
  }
}
