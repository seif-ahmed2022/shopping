//import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../cubits/login_cubit.dart';
import '../../shared/local/cash_helper.dart';
import '../../shared/local/component/component.dart';
import '../../shared/local/const.dart';
import '../home_screen.dart';

class RegisterScreen extends StatelessWidget {
  // const ShopLoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            // if (state.loginModel.status!) {
            //   print(state.loginModel.message);
            //   print(state.loginModel.data!.token);
            //   CacheHelper.saveData(
            //       key: 'token', value: state.loginModel.data!.token)
            //       .then((value) {
            //     token=state.loginModel.data!.token!;
            //     navigateAndFinish(
            //       context,
            //       ShopLayoutScreen(),
            //     );
            //   });
            // } else {
            //   print(state.loginModel.message);
            //   // showToast(
            //   //     text: state.loginModel.message!, state: ToastStates.ERROR);
            // }
            CashHelper.saveData(
                    key: "token",
                    value: LoginCubit.get(context).registerModel!.data!.token!)
                .then((value) {
                  if(value){
                    MyComponents.navigateAndFinish(context, const HomeScreen());
                  }
            });
          }else if(state is RegisterErrorState){
              // Flushbar(
              //   title:  "attention!",
              //   message:  "that is an error occured",
              //   duration:  const Duration(seconds: 3),
              //   backgroundColor: Colors.red,
              // ).show(context);
          }
            },
        builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Register now to brows our new offers',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      MyComponents.defaultFormField(
                        controller: nameController,
                        type: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your name ';
                          }
                        },
                        label: 'Name',
                        prefix: Icons.drive_file_rename_outline,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyComponents.defaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your email address';
                          }
                        },
                        label: 'Email Address',
                        prefix: Icons.email_outlined,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyComponents.defaultFormField(
                        controller: phoneController,
                        type: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your phone number';
                          }
                        },
                        label: 'phone number',
                        prefix: Icons.phone,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      MyComponents.defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validator: (String? value) {
                          if (value!.isEmpty) return 'password is too short ';
                        },
                        isPassword: LoginCubit.get(context).isPassword,
                        suffixPressed: () {
                          LoginCubit.get(context).changePasswordVisibility();
                        },
                        label: 'Password',
                        prefix: Icons.lock,
                        suffix: LoginCubit.get(context).isPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {

                            if(formKey.currentState!.validate())
                            {
                              LoginCubit.get(context).userRegister(
                                name: nameController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }

                          },
                          child: const Text(
                            "REGISTER",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}