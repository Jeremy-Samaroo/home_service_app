import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/dataClasses/jobData.dart';
import 'package:home_service_app/dataClasses/jobDataUtil.dart';
import 'package:home_service_app/dataClasses/userCredentials.dart';
import 'package:home_service_app/dataClasses/userCredentialsUtil.dart';
import 'package:home_service_app/dataClasses/userData.dart';
import 'package:home_service_app/views/editJobView.dart';
import 'package:home_service_app/views/homeView.dart';
import "package:home_service_app/dataClasses/User.dart";

class LoginWidget extends StatefulWidget {
  LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final conpassController = TextEditingController();
  bool isLogin = true;
  bool wrongcred = false;
  bool validated = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 15.0),
              //padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLogin = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Login",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(4, 30, 81, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              side: BorderSide(color: Colors.black))))),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 15.0),
              //padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLogin = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Signup",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(195, 166, 96, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              side: BorderSide(color: Colors.white))))),
            ),
          ],
        ),
        isLogin == true
            ? Container(
                height: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(229, 229, 229, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 35),
                      child: Text(
                        "Email",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
                      child: TextField(
                        obscureText: false,
                        enableSuggestions: true,
                        autocorrect: false,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        controller: emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, top: 15),
                      child: Text(
                        "Password",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
                      child: TextField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onSubmitted: (String value) {},
                        controller: passController,
                      ),
                    ),
                    if (wrongcred)
                      Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 200,
                          height: 25,
                          child: Text(
                            "Wrong Email or Password",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(75, 10, 75, 10),
                              child: Text(
                                "Login",
                                style: const TextStyle(fontSize: 25),
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(195, 166, 96, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0))))),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(229, 229, 229, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 35),
                      child: Text(
                        "Email",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
                      child: TextField(
                        obscureText: false,
                        enableSuggestions: true,
                        autocorrect: false,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        controller: emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 35),
                      child: Text(
                        "First Name",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
                      child: TextField(
                        obscureText: false,
                        enableSuggestions: true,
                        autocorrect: false,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        controller: fnameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 35),
                      child: Text(
                        "Last Name",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
                      child: TextField(
                        obscureText: false,
                        enableSuggestions: true,
                        autocorrect: false,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        controller: lnameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 35),
                      child: Text(
                        "Password",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
                      child: TextField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        controller: passController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 35),
                      child: Text(
                        "Confirm Password",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
                      child: TextField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        controller: conpassController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: () {
                              final email = emailController.text;
                              final name = fnameController.text +
                                  " " +
                                  lnameController.text;
                              final password = passController.text;
                              signUp(
                                  name: name, email: email, password: password);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(75, 10, 75, 10),
                              child: Text(
                                "Signup",
                                style: const TextStyle(fontSize: 25),
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(195, 166, 96, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )))),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  _validateSamePass() {
    if (conpassController.text != passController.text) {
      return "Passwords don't match";
    }
    return null;
  }

  authCredentials() async {
    final value = await FirebaseFirestore.instance
        .collection("credentials")
        .where('uName', isEqualTo: emailController.text)
        .get();
    for (var doc in value.docs) {
      String val = doc.get('Password');
      //print(val.toString());
      // print(passController.text);
      print((passController.text.compareTo(val.toString())));
      if (passController.text.compareTo(val.toString()) == 0) {
        setState(() {
          validated = true;
        });
      } else {
        setState(() {
          validated = false;
        });
      }
    }
  }

  submitUser() {
    var udata = userData(
            uName: fnameController.text + " " + lnameController.text,
            email: emailController.text,
            about: "n/a",
            contacts: "na",
            skills: "na",
            activeJob: "3",
            activeRequests: ["1", "2"],
            clientRating: "0",
            workerRating: "0",
            pfp:
                "https://firebasestorage.googleapis.com/v0/b/homeserviceapp-a9232.appspot.com/o/shrekpfp.jpg?alt=media&token=174f1566-8caf-4969-8b66-a11b0b680027")
        .toMap();
    FirebaseFirestore.instance.collection("users").add(udata);
  }

  submitCredentials() {
    var cred = userCredentials(
            uName: emailController.text, Password: passController.text)
        .toMap();

    FirebaseFirestore.instance.collection("credentials").add(cred);
  }

  loadUserProfile() async {}

  Future signUp(
      {required String name,
      required String email,
      required String password}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final user = User.register(docUser.id, name, email, password);
    print(user.toString());
    final jsonData = user.toJson();
    await docUser.set(jsonData);
  }
}
