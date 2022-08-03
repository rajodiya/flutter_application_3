import 'package:flutter/material.dart';
import 'package:flutter_application_3/page/second.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _loginFormkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Form(
          key: _loginFormkey,
          child: Column(children: [
            Center(
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Image.network(
                      "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80",
                      height: 500,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            "welcom",
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              // suffixIcon: Icon(Icons.mark_email_unread_rounded),
                              prefixIcon: Icon(Icons.email),
                              hintText: "Email"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            if (!value.isValidEmail()) {
                              return "Enter Valid Email";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              // suffixIcon: Icon(Icons.password),
                              prefixIcon: Icon(Icons.lock),
                              hintText: "Password"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_loginFormkey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondPage()));
                            }
                          },
                          child: const Text("Login"),
                        ),
                        TextButton(
                          onPressed: () {
                            _container();
                          },
                          child: const Text(
                            "DilogueBox",
                            style: TextStyle(fontSize: 18 ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  void _container() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("yes"))
            ],
            title: const Text("save your Work"),
          );
        });
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}
