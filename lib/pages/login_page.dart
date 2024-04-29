import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/widgets/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(
          Duration(seconds: 1)); //delayed before entering homepage

      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height:200
                ),
                const Text(
                  "welcome ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "username",
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your username";
                          }
                          return null;
                        },
                        /*  onChanged: (value) {
                      name = value;
                      setState(() {});
                    }, */
                      ),
                      TextFormField(
                        /* validator: (value) {
                      if (value == null || value.isEmpty) {
                        changeButton = false;
                        return 'Please enter your password';
                      }
                      return null;
                    }, */
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter password",
                          labelText: "password",
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          } else if (value.length < 6) {
                            return "Password should contain at least 6 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      InkWell(
                        //for animated properties

                        onTap: () => moveToHome(context),

                        child: AnimatedContainer(
                          duration: Duration(
                              seconds:
                                  1), //will say how long animation is shown

                          width: changeButton ? 50 : 130,

                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  "login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 15),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
