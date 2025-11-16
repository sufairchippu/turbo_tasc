import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:reubro_machin_test/features/language/controller/language_provider.dart';

class AppProvider extends StatelessWidget {
  final Widget child;
  const AppProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: child,
    );
  }
}
