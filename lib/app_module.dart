import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_ui/ui/controller/controller.dart';

import 'package:responsive_ui/ui/presenter.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(Controller.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => Presenter(controller: Modular.get()));
  }
}
