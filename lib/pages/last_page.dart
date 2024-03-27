import 'package:flutter/material.dart';
import 'package:flutter_course/pages/home_page.dart';

class LastPage extends StatelessWidget {
  final String trainNum;
  final String trainType;
  final String station;

  const LastPage({
    Key? key,
    required this.trainNum,
    required this.trainType,
    required this.station,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 35),
              Container(
                child: const Text(
                  'Welcome aboard!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 243, 249, 255),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Image(
                image: AssetImage('assets/images/rocket.png'),
                height: 310,
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  textAlign: TextAlign.center,
                  'You are in Train $trainNum - $trainType Type headed to $station.',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 243, 249, 255),
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              _buttonBack(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonBack(BuildContext context) {
    return SizedBox(
      width: 380,
      child: MaterialButton(
        height: 48,
        color: const Color.fromARGB(255, 170, 178, 208),
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(),
            ),
          );
        },
        child: const Text(
          "Back",
          style: TextStyle(
              color: Color.fromARGB(255, 51, 52, 58),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
