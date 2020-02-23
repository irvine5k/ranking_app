// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticationStore on _AuthenticationStoreBase, Store {
  final _$uidAtom = Atom(name: '_AuthenticationStoreBase.uid');

  @override
  String get uid {
    _$uidAtom.context.enforceReadPolicy(_$uidAtom);
    _$uidAtom.reportObserved();
    return super.uid;
  }

  @override
  set uid(String value) {
    _$uidAtom.context.conditionallyRunInAction(() {
      super.uid = value;
      _$uidAtom.reportChanged();
    }, _$uidAtom, name: '${_$uidAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_AuthenticationStoreBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_AuthenticationStoreBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$_AuthenticationStoreBaseActionController =
      ActionController(name: '_AuthenticationStoreBase');

  @override
  void setUid(String val) {
    final _$actionInfo =
        _$_AuthenticationStoreBaseActionController.startAction();
    try {
      return super.setUid(val);
    } finally {
      _$_AuthenticationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String val) {
    final _$actionInfo =
        _$_AuthenticationStoreBaseActionController.startAction();
    try {
      return super.setEmail(val);
    } finally {
      _$_AuthenticationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String val) {
    final _$actionInfo =
        _$_AuthenticationStoreBaseActionController.startAction();
    try {
      return super.setName(val);
    } finally {
      _$_AuthenticationStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
