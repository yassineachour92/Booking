// import 'package:flushbar/flushbar.dart';
import 'dart:convert';

import 'package:bookingapp/components/login.dart';
import 'package:bookingapp/components/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
  String loginunique = "false";

  final formKey = GlobalKey<FormState>();

  late String _username, _password, _confirmPassword;
  final url = Uri.parse('http://192.168.100.8:5000/api/posts');

  Future<dynamic> createUser(_username, _password) async {
    setState(() {
      loginunique = "false";
    });
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'login': _username,
        'mp': _password,
      }),
    );
    switch (response.statusCode) {
      case 200:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text('user add with Succès'),
              actions: <Widget>[
                // TextButton(
                //   onPressed: () => Navigator.pop(context, 'Cancel'),
                //   child: const Text('Cancel'),
                // ),
                TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    )
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        break;

      case 400:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text('user existe deja'),
              actions: <Widget>[
                // TextButton(
                //   onPressed: () => Navigator.pop(context, 'Cancel'),
                //   child: const Text('Cancel'),
                // ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        break;
      case 500:
        throw Exception('Failed to create user.');
    }

    print(response.statusCode);
    print(loginunique);
  }

  @override
  Widget build(BuildContext context) {
    var doRegister = () {
      print('on do Register');

      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();
        print(_username);
        if (_password.endsWith(_confirmPassword)) {
          createUser(_username, _password);
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Alert!!"),
                content: new Text("Please enter valid confirm password"),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      } else {
        print(false);

        // Flushbar(
        //   title: 'Invalid form',
        //   message: 'Please complete the form property',
        //   duration: Duration(seconds: 10),
        // ).show(context);
      }
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Text('Email'),
                TextFormField(
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      if (loginunique == "true") {
                        return 'user existe';
                      } else
                        return null;
                    },
                    onSaved: (value) => _username = value!,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Color.fromRGBO(50, 62, 72, 1.0),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Text('Password'),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                    autofocus: false,
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter password' : null,
                    onSaved: (value) => _password = value!,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(50, 62, 72, 1.0),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Text('Confirm Password'),
                TextFormField(
                    autofocus: false,
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Confirmer votre Mot de passe' : null,
                    onSaved: (value) => _confirmPassword = value!,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(50, 62, 72, 1.0),
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  minWidth: double.infinity,
                  color: Colors.blue,
                  splashColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var err = doRegister();
                      print("err$err");
                    }
                  },
                  textColor: Colors.white,
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
