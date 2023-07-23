import 'package:explanedtour/cubit/auth_cubit.dart';
import 'package:explanedtour/cubit/destination_cubit.dart';
import 'package:explanedtour/cubit/page_cubit.dart';
import 'package:explanedtour/cubit/seat_cubit.dart';
import 'package:explanedtour/cubit/transaction_cubit.dart';
import 'package:explanedtour/ui/pages/bonus.dart';
import 'package:explanedtour/ui/pages/get_started.dart';
import 'package:explanedtour/ui/pages/main_page.dart';
import 'package:explanedtour/ui/pages/sign_in.dart';
import 'package:explanedtour/ui/pages/sign_up.dart';
import 'package:explanedtour/ui/pages/splash_page.dart';
import 'package:explanedtour/ui/pages/succes_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (Context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          '/succes': (context) => SuccesPages(),
        },
      ),
    );
  }
}
