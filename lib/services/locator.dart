import 'package:get_it/get_it.dart';
import 'package:todo_list/services/authorization.dart';
import 'package:todo_list/services/user_controller.dart';


final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<AuthentificationService>(AuthentificationService());
  locator.registerSingleton<UserController>(UserController());
}