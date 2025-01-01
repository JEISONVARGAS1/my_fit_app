import 'package:firebase_core/firebase_core.dart';

Future<void> globalSetting() async {


  await Firebase.initializeApp();
  print("Vamos a ver");

}
