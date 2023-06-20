import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repositories/auth_repository.dart';
import 'screens/screens.dart';
import 'blocs/blocs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ShopBloc(),
          ),
          BlocProvider(
            create: (context) => AddressBloc(),
          ),
          BlocProvider(
              create: (context) => AuthBloc(
                    authRepository: context.read<AuthRepository>(),
                  ))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(unselectedWidgetColor: Colors.white),
          title: 'Aura',
          home: (FirebaseAuth.instance.currentUser != null)
              ? DashboardScreen()
              : const SplashScreen(),
        ),
      ),
    );
  }
}
