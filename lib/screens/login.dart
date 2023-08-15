import 'package:flutter/material.dart';
import 'package:stopwatch/variables.dart';
import 'package:stopwatch/screens/timerpage.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String? userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kbgcolour,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 26.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(
                    height: 250.0,
                    child: Image.asset('images/stopwatch.jpg',
                        fit: BoxFit.fitHeight)),
                Container(
                    height: 100.0,
                    width: 200.0,
                    child: Image.asset('images/logotext.PNG')),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your username',
                    style: knormalStyle,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        userName = value;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Username',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 23.0, horizontal: 18.0)),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Builder(builder: (context) {
                  return ElevatedButton(
                    style: klogbtnstyle,
                    onPressed: () {
                      if (userName != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TimerPage(currentUser: userName!)),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("The Username can't be empty"),
                          duration: Duration(seconds: 3),
                        ));
                      }
                    },
                    child: Text(
                      'Continue',
                      style: kdefaultsize,
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
