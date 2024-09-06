import 'package:educatly/app.dart';
import 'package:educatly/app_router.dart';
import 'package:educatly/data/injector.dart';
import 'package:educatly/logic/auth/auth_cubit.dart';
import 'package:educatly/logic/auth/auth_state.dart';
import 'package:educatly/logic/cubits.dart';
import 'package:educatly/logic/settings/bloc/language_bloc.dart';
import 'package:educatly/ui/themes/app_theme.dart';
import 'package:educatly/ui/view/chat/widgets/user_status/user_status_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  configureDependencies();

  // initialize hydrated bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(const App());
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...providers],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return BlocListener<AuthCubit, AuthState>(
            listener: (BuildContext context, AuthState state) {
              if (!state.isLoggedIn) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.go("/login");
                });
              }
            },
            child: BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, langState) {
                return UserStatusManager(
                  userId: '',
                  child: MaterialApp.router(
                    locale: langState.selectedLanguage.value,
                    localizationsDelegates: const [
                      // AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: const [Locale('en')],
                    debugShowCheckedModeBanner: false,
                    title: 'Educatly',
                    themeMode: ThemeMode.dark,
                    theme: AppTheme.lightThemeData,
                    darkTheme: AppTheme.darkThemeData,
                    routerConfig: AppRouter.router,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
