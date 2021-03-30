import 'package:demoapplication/colors.dart';
import 'package:demoapplication/home_screen.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _email, _password;

  /*void signIn() async {
    //await Firebase.initializeApp();
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password)
        .catchError((onError) {
      print(onError);
    }).then((authUser) {
      print(authUser.user.uid);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(
                      bgImage,
                      height: height * 0.40,
                      width: width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: height * 0.42,
                      width: width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              stops: [0.3, 0.8],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.white])),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                color: Colors.black),
                            text: appName + "\n",
                            children: [
                              TextSpan(
                                text: slogan,
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 20),
                  child: Container(
                    child: Text(
                      '  $loginString  ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primaryColor.withOpacity(0.1),
                            Colors.transparent
                          ],
                        ),
                        border: Border(
                            left: BorderSide(color: primaryColor, width: 5))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    onSaved: (value) {
                      _email = value;
                    },
                    validator: (email) {
                      if (email.isEmpty)
                        return "Please Enter Email";
                      else if (!RegExp(
                              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                          .hasMatch(email)) return "Invalid Email Address";
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      prefixIcon: Icon(Icons.email, color: primaryColor),
                      labelText: 'Email Address',
                      labelStyle: TextStyle(color: primaryColor, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    onSaved: (value) {
                      _password = value;
                    },
                    validator: (password) {
                      if (password.isEmpty)
                        return "Please Enter Password";
                      else if (password.length < 8 || password.length > 15)
                        return "Password Length is Incorrect";
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      prefixIcon: Icon(Icons.lock, color: primaryColor),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: primaryColor, fontSize: 16),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          forgetText,
                          style: TextStyle(color: Colors.black),
                        ))),
                Center(
                  child: SizedBox(
                    height: height * 0.08,
                    width: width - 150,
                    child: FlatButton(
                      color: Colors.lightGreen[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          //signIn();
                          if (_email == "anumitha96@gmail.com" &&
                              _password == "123456789") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                            FocusScope.of(context).unfocus();
                          } else {
                            print("Invalid Login Details");
                          }
                        }
                      },
                      child: Text(
                        'Sigin',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Dont' have an account?"),
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Create Account',
                          style: TextStyle(color: primaryColor),
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
