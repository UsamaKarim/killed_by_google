import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:killed_by_google/app/repositories/data.dart';
import 'package:killed_by_google/app/services/api.dart';
import 'package:killed_by_google/app/services/caching.dart';
import 'package:killed_by_google/app/ui/home_screen.dart';

import 'app/services/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreference = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreference));
}

class MyApp extends StatelessWidget {
  const MyApp(this.sharedPreferences, {Key? key}) : super(key: key);
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppTheme(),
        ),
        Provider(
          create: (_) => Data(
            api: API(),
            cache: Cache(sharedPreferences),
          ),
        ),
      ],
      child: Consumer<AppTheme>(
        builder: (context, value, child) => MaterialApp(
          title: 'Killed by Google',
          theme: value.currentTheme,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
