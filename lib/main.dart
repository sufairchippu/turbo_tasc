import 'package:flutter/cupertino.dart';
import 'package:reubro_machin_test/core/app_provider.dart';
import 'package:reubro_machin_test/core/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      title: 'Reubro',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,

      builder: (context, child) {
        return AppProvider(
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child!,
          ),
        );
      },
    );
  }
}