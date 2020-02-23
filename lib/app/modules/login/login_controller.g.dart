// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading)).value;
  Computed<dynamic> _$errorComputed;

  @override
  dynamic get error =>
      (_$errorComputed ??= Computed<dynamic>(() => super.error)).value;

  final _$userAtom = Atom(name: '_LoginBase.user');

  @override
  String get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$passAtom = Atom(name: '_LoginBase.pass');

  @override
  String get pass {
    _$passAtom.context.enforceReadPolicy(_$passAtom);
    _$passAtom.reportObserved();
    return super.pass;
  }

  @override
  set pass(String value) {
    _$passAtom.context.conditionallyRunInAction(() {
      super.pass = value;
      _$passAtom.reportChanged();
    }, _$passAtom, name: '${_$passAtom.name}_set');
  }

  final _$authFutureAtom = Atom(name: '_LoginBase.authFuture');

  @override
  ObservableFuture<AuthenticationStore> get authFuture {
    _$authFutureAtom.context.enforceReadPolicy(_$authFutureAtom);
    _$authFutureAtom.reportObserved();
    return super.authFuture;
  }

  @override
  set authFuture(ObservableFuture<AuthenticationStore> value) {
    _$authFutureAtom.context.conditionallyRunInAction(() {
      super.authFuture = value;
      _$authFutureAtom.reportChanged();
    }, _$authFutureAtom, name: '${_$authFutureAtom.name}_set');
  }

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

  @override
  void setUser(String val) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setUser(val);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass(String val) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setPass(val);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void login() {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.login();
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }
}
