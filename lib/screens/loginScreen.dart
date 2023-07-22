import 'package:dailynotes/screens/HomeScreenForBoom.dart';
import 'package:dailynotes/screens/HomeScrenForMe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fwfh_cached_network_image/fwfh_cached_network_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(toolbarHeight: 0),
      backgroundColor: Color.fromARGB(255, 240, 235, 223),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                child: TextFormField(
                  validator: (value) {
                    if (value == "MyBoom") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return LockScreenForBoom();
                      }));
                    } else if (value == "YourBaby") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return LockScreenForMe();
                      }));
                    } else {
                      return "Wrong Username";
                    }
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Username",
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                child: TextFormField(
                  validator: (value) {
                    if (value == "ArrBwarr") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return LockScreenForBoom();
                      }));
                    } else if (value == "Chittl") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return LockScreenForMe();
                      }));
                    } else {
                      return "Wrong Pasword";
                    }
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Password",
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 100,
                height: 40,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                      ;
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.black),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidgetFactor extends WidgetFactory with CachedNetworkImageFactory {}
