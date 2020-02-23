import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ranking_challenge/app/modules/register/register_controller.dart';
import 'package:ranking_challenge/app/modules/register/register_module.dart';

void main() {
  initModule(RegisterModule());
  RegisterController register;

  setUp(() {
    register = RegisterModule.to.get<RegisterController>();
  });

  group('RegisterController Test', () {
    test("First Test", () {
      expect(register, isInstanceOf<RegisterController>());
    });

    test("Set Value", () {
      expect(register.value, equals(0));
      register.increment();
      expect(register.value, equals(1));
    });
  });
}
