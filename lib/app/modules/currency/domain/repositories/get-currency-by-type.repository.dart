import 'package:dartz/dartz.dart';

import '../entitties/currency.entity.dart';
import '../enums/currency-type.enum.dart';
import '../errors/currency.erros.dart';

abstract class GetCurrencyByTypeRepository {
  Future<Either<CurrencyError, Currency>> getCurrency(CurrencyType currencyType);
}
