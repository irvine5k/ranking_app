// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$tabIndexAtom = Atom(name: '_HomeBase.tabIndex');

  @override
  int get tabIndex {
    _$tabIndexAtom.context.enforceReadPolicy(_$tabIndexAtom);
    _$tabIndexAtom.reportObserved();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.context.conditionallyRunInAction(() {
      super.tabIndex = value;
      _$tabIndexAtom.reportChanged();
    }, _$tabIndexAtom, name: '${_$tabIndexAtom.name}_set');
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.changeIndex(index);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }
}
