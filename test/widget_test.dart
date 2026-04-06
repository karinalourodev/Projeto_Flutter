import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/login.dart';

void main() {
  testWidgets('Tela de Login mostra campos de email e senha', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // Verifica se os campos existem
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);

    // Verifica se o botão "Entrar" existe
    expect(find.text('Entrar'), findsOneWidget);
  });
}
