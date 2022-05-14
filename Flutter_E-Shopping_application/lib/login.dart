import 'package:flutter/material.dart';
import 'package:flutter_application_4/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController Name = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.4,
              ),
              child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: Name,
                        decoration: InputDecoration(
                            labelText: 'Name',
                            suffixIcon: Icon(Icons.person),
                            hoverColor: Colors.blue[50],
                            focusColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: Password,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: Icon(Icons.password),
                            hoverColor: Colors.blue[50],
                            focusColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      IconButton(
                          onPressed: () async {
                            String username = Name.text;
                            String password = Password.text;

                            // Obtain shared preferences.
                            final prefs = await SharedPreferences.getInstance();

                            await prefs.setString('username', username);
                            await prefs.setString('password', password);

// Save an list of strings to 'items' key.
                            if (username == '' && password == '') {
                              print('Successfull');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }

                            {}
                          },
                          icon: Icon(Icons.login))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
