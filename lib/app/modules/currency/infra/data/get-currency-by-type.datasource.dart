import '../../domain/enums/currency-type.enum.dart';
import '../models/currency.model.dart';

abstract class GetCurrencyByTypeDatasouce {
  Future<CurrencyModel> getCurrency(CurrencyType currencyType);
}
