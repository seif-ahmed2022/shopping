import 'package:flutter/material.dart';
import 'package:shopping/screens/login_register/Login_screen.dart';
import 'package:shopping/shared/local/cash_helper.dart';
import 'package:shopping/shared/local/component/component.dart';

class SettingsScreen  extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: (){
              CashHelper.removeData("token").then((value) {
                if(value)
                  {
                   MyComponents.navigateAndFinish(context, LoginScreen());
                  }
              });
            },
            child: const Text("Log out"),
        ),
      ],
      ),
    );
  }
}


