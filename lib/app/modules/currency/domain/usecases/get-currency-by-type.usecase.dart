import 'package:dartz/dartz.dart';

import '../entitties/currency.entity.dart';
import '../enums/currency-type.enum.dart';
import '../errors/currency.erros.dart';
import '../repositories/get-currency-by-type.repository.dart';

abstract class GetCurrencyByType {
  Future<Either<CurrencyError, Currency>> call(CurrencyType currencyType);
}

class GetCurrencyByTypeImpl implements GetCurrencyByType {
  final GetCurrencyByTypeRepository repository;

  GetCurrencyByTypeImpl(this.repository);

  @override
  Future<Either<CurrencyError, Currency>> call(CurrencyType currencyType) async {
    return await repository.getCurrency(currencyType);
  }
}
