import 'package:bookingapp/components/register.dart';
import 'package:bookingapp/data/Data.dart';
import 'package:bookingapp/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String _userName, _password;
  final url = Uri.parse('http://192.168.100.8:5000/api/posts');
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  void getData() async {
    http.Response response =
        await http.get(url, headers: {'Accept': 'application/json'});
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    var doLogin = (_userName, _password) {
// Map  data ={
//   'login':_userName,
//   'mp':_password
// };
//       var response = await Uri.parse('http://192.168.100.8:5000/api/posts',body:data);
      print("_userName");
    };
    // getData();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Text("Email"),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  autofocus: false,
                  obscureText: false,
                  validator: (value) =>
                      value!.isEmpty ? "pleae entre votre mail" : null,
                  controller: emailController,
                  onSaved: (value) => _userName = value!,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color.fromRGBO(50, 62, 72, 1.0),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                Text("Password"),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) =>
                      value!.isEmpty ? "pleae entre votre password" : null,
                  onSaved: (value) => _password = value!,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color.fromRGBO(50, 62, 72, 1.0),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  minWidth: double.infinity,
                  color: Colors.blue,
                  splashColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BookingApp()));
                    // doLogin(emailController.text ,passwordController.text);
                  },
                  textColor: Colors.white,
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => {},
                        child: Text(
                          'Hello World',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text(
                          'Sign up',
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
