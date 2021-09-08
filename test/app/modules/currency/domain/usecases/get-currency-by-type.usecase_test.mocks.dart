// Mocks generated by Mockito 5.0.15 from annotations
// in basf_dashboard/test/app/modules/currency/domain/usecases/get-currency-by-type.usecase_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:basf_dashboard/app/modules/currency/domain/entitties/currency.entity.dart'
    as _i6;
import 'package:basf_dashboard/app/modules/currency/domain/enums/currency-type.enum.dart'
    as _i7;
import 'package:basf_dashboard/app/modules/currency/domain/errors/currency.erros.dart'
    as _i5;
import 'package:basf_dashboard/app/modules/currency/domain/repositories/get-currency-by-type.repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [GetCurrencyByTypeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCurrencyByTypeRepository extends _i1.Mock
    implements _i3.GetCurrencyByTypeRepository {
  MockGetCurrencyByTypeRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.CurrencyError, _i6.Currency>> getCurrency(
          _i7.CurrencyType? currencyType) =>
      (super.noSuchMethod(Invocation.method(#getCurrency, [currencyType]),
              returnValue:
                  Future<_i2.Either<_i5.CurrencyError, _i6.Currency>>.value(
                      _FakeEither_0<_i5.CurrencyError, _i6.Currency>()))
          as _i4.Future<_i2.Either<_i5.CurrencyError, _i6.Currency>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Currency].
///
/// See the documentation for Mockito's code generation for more information.
class MockCurrency extends _i1.Mock implements _i6.Currency {
  MockCurrency() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set code(String? _code) => super.noSuchMethod(Invocation.setter(#code, _code),
      returnValueForMissingStub: null);
  @override
  set codein(String? _codein) =>
      super.noSuchMethod(Invocation.setter(#codein, _codein),
          returnValueForMissingStub: null);
  @override
  set name(String? _name) => super.noSuchMethod(Invocation.setter(#name, _name),
      returnValueForMissingStub: null);
  @override
  set high(String? _high) => super.noSuchMethod(Invocation.setter(#high, _high),
      returnValueForMissingStub: null);
  @override
  set low(String? _low) => super.noSuchMethod(Invocation.setter(#low, _low),
      returnValueForMissingStub: null);
  @override
  set varBid(String? _varBid) =>
      super.noSuchMethod(Invocation.setter(#varBid, _varBid),
          returnValueForMissingStub: null);
  @override
  set pctChange(String? _pctChange) =>
      super.noSuchMethod(Invocation.setter(#pctChange, _pctChange),
          returnValueForMissingStub: null);
  @override
  set bid(String? _bid) => super.noSuchMethod(Invocation.setter(#bid, _bid),
      returnValueForMissingStub: null);
  @override
  set ask(String? _ask) => super.noSuchMethod(Invocation.setter(#ask, _ask),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
