import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_classes_project/presentation/form_page.dart';
import 'package:fteam_classes_project/presentation/form_page_controller.dart';

class AppModule extends Module {
  AppModule();

  @override
  void binds(i) {
    i.add<FormPagecontroller>(FormPagecontroller.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const FormPage());
  }
}
