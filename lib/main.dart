import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_classes_project/form_module.dart';
import 'package:fteam_classes_project/presentation/form_page.dart';
import 'package:fteam_classes_project/presentation/form_page_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => FormPagecontroller(),
      child: ModularApp(module: AppModule(), child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = WatchContext(context).watch<FormPagecontroller>().themeMode;
    return MaterialApp(
      title: 'Formulário',
      themeMode: theme,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const FormPage(),
    );
  }
}
