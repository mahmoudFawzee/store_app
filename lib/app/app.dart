import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:store_app/data/constants/lang.dart';
import 'package:store_app/logic/cubits/lang_cubit/lang_cubit.dart';
import 'package:store_app/logic/cubits/theme_cubit/theme_cubit.dart';
import 'package:store_app/view/routes/routes_manger.dart';
import 'package:store_app/view/theme/theme_manger.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal({Key? key}) : super(key: key);
  static const _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit()..getCurrentTheme(),
        ),
        BlocProvider(
          create: (context) => LangCubit()..getLang(),
        ),
      ],
      child: Builder(builder: (context) {
        return BlocBuilder<ThemeCubit, bool>(
          builder: (context, isDark) {
            return BlocBuilder<LangCubit, String>(
              builder: (context, lang) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale(LangCode.arabic), // Arabic
                    Locale(LangCode.arabic), // English
                  ],
                  locale: Locale(lang),
                  theme: isDark
                      ? ThemeManger.getLightMode()
                      : ThemeManger.getLightMode(),
                  initialRoute: RoutesManger.initialRoute,
                  routes: RoutesManger.routes,
                );
              },
            );
          },
        );
      }),
    );
  }
}
