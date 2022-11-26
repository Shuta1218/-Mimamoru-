import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mimamoru/src/app.dart';
import 'firebase_options.dart';

final userNameProvider = StateProvider<String>((ref) => "");
final targetNameProvider = StateProvider<String>((ref) => "");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting().then((_) =>runApp(const ProviderScope(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void initState(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.system,
      theme: ThemeData(
        primaryColor: Colors.blue[50],
      ),
      home: const MyStatefulWidget(),
    );
  }
}
