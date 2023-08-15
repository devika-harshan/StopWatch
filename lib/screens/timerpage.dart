import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stopwatch/variables.dart';
import 'package:stopwatch/screens/userslistscreen.dart';

class TimerPage extends StatefulWidget {
  final currentUser;
  const TimerPage({Key? key, required this.currentUser}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  String buttonText = 'Start';
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  String _result = '00:00:00';

  // List<BoxShadow> _boxShadowList = [
  //   BoxShadow(
  //     color: Colors.grey,
  //     offset: const Offset(0.0, 0.0),
  //     blurRadius: 3.0,
  //     spreadRadius: 4.0,
  //   ),
  //   BoxShadow(
  //     color: Colors.white,
  //     spreadRadius: -10,
  //     blurRadius: 10,
  //     offset: Offset(0, 0),
  //   ),
  // ];

  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {
      setState(() {
        _result =
            '${_stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inMilliseconds % 100).toString().padLeft(2, '0')}';
      });
    });
    _stopwatch.start();
    kboxShadowList[0] = BoxShadow(
      color: Color(0xffff0000),
      offset: const Offset(0.0, 0.0),
      blurRadius: 3.0,
      spreadRadius: 4.0,
    );
  }

  void _stop() async {
    _timer.cancel();
    _stopwatch.stop();
    await FirebaseFirestore.instance.collection('Users').add({
      'uname': widget.currentUser,
      'time': _result,
    });
  }

  void _onButtonPressed() {
    setState(() {
      switch (buttonText) {
        case 'Start':
          buttonText = 'Stop';
          _start();
          break;
        case 'Stop':
          buttonText = 'Save';
          _stop();
          break;
        case 'Save':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UsersListScreen()),
          );

          break;
      }
    });
  }

  @override
  void dispose() {
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgcolour,
      appBar: AppBar(
        title: Text('Welcome ${widget.currentUser}'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 110,
            left: 25,
            child: Container(
                height: 310, child: Image.asset('images/Wristwatch.png')),
          ),
          Positioned(
            top: 148,
            left: 63,
            child: Container(
              width: 235.0,
              height: 235.0,
              decoration: BoxDecoration(
                boxShadow: kboxShadowList,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 240.0,
            left: 110.0,
            child: Text(
              _result,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            left: 86,
            bottom: 90,
            child: ElevatedButton(
              style: ktimerbtnstyle,
              onPressed: _onButtonPressed,
              child: Text(
                buttonText,
                style: kdefaultsize,
              ),
            ),
          )
        ],
      ),
    );
  }
}
