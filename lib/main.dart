import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/cubits/shopcubit.dart';
import 'package:shopping/screens/home_screen.dart';
import 'screens/login_register/Login_screen.dart';
import 'screens/login_register/on_boarding_screen.dart';
import 'package:shopping/shared/local/cash_helper.dart';
import 'package:shopping/shared/local/const.dart';
import 'package:shopping/shared/remote/dio_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  DioHelper.init();
  Constant.token=CashHelper.getData(key: "token", def: "");
  bool isBoardingScreen=CashHelper.getData(key: "isBoardingScreen", def: true);

  runApp( MyApp(isBoardingScreen:isBoardingScreen));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key, required this.isBoardingScreen}) : super(key: key);
   bool isBoardingScreen;

   Widget firstScreen(){
     if(!isBoardingScreen)
       {
         if(Constant.token.isNotEmpty){
           return const HomeScreen();
         }else{
           return LoginScreen();
         }
       }else{
       return OnBoardingScreen();
     }
   }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Constant.lightTheme,
      themeMode: ThemeMode.light,
      darkTheme: Constant.darkTheme,
      home: firstScreen(),            // HomeScreen(),   //isBoardingScreen? OnBoardingScreen():  LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}