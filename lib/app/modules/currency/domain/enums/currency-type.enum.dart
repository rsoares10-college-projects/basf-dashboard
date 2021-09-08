enum CurrencyType { usd, eur, btc }

extension ParseToString on CurrencyType {
  String toShortString() {
    return '${toString().split('.').last.toUpperCase()}-BRL';
  }
}
