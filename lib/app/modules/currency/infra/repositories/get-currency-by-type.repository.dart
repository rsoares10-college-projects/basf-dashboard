import 'package:dartz/dartz.dart';

import '../../domain/entitties/currency.entity.dart';
import '../../domain/enums/currency-type.enum.dart';
import '../../domain/errors/currency.erros.dart';
import '../../domain/repositories/get-currency-by-type.repository.dart';
import '../data/datasouce/get-currency-by-type.datasource.dart';
import '../errors/currency-datasouce.error.dart';

class GetCurrencyByTypeRepositoryImpl implements GetCurrencyByTypeRepository {
  final GetCurrencyByTypeDatasouce datasouce;

  GetCurrencyByTypeRepositoryImpl(this.datasouce);

  @override
  Future<Either<CurrencyError, Currency>> getCurrency(CurrencyType currencyType) async {
    try {
      final response = await datasouce.getCurrency(currencyType);
      return Right(response);
    } on CurrencyDatasouceError catch (e) {
      return Left(CurrencyDatasouceError(e.toString()));
    }
  }
}
