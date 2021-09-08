enum CurrencyType { usd, eur, btc }

extension ParseToString on CurrencyType {
  String toCodeString() {
    return '${toString().split('.').last.toUpperCase()}BRL';
  }

  String toShortString() {
    return '${toString().split('.').last.toUpperCase()}-BRL';
  }
}
