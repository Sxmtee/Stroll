import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskone/Common/Theme/theme.dart';
import 'package:taskone/Common/Theme/theme_provider.dart';
import 'package:taskone/Common/Utils/router.dart';
import 'package:taskone/Common/Utils/stroll_preferences.dart';
import 'package:taskone/Screen/mobile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StrollPreferences.init();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themesProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stroll',
      darkTheme: ThemeState.darkTheme,
      theme: ThemeState.lightTheme,
      themeMode: themeModeState,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const MobileScreen(),
    );
  }
}
