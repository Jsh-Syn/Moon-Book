import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/custom_dropdown.dart';

class Homepage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _pageTitle(),
              const SizedBox(height: 60),
              _astroImageWidget(),
              const SizedBox(height: 20),
              _bookRideWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return Container(
      child: const Text(
        'Moon Book',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w800, fontSize: 47),
      ),
    );
  }

  Widget _astroImageWidget() {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        image: /*fit: BoxFit.fill,*/
            DecorationImage(image: AssetImage("assets/images/astronaut.png")),
      ),
    );
  }

  Widget _destinationDropDownWidget() {
    return CustomDropDownButtonClass(
      items: const [
        'MarsX Station',
        'VenusXX Station',
      ],
      width: _deviceWidth,
    );
  }

  Widget _travellerInformationWidget() {
    return Row(
      children: [
        Expanded(
          child: CustomDropDownButtonClass(
            items: const [
              '1',
              '2',
              '3',
              '4',
            ],
            width: _deviceWidth * 0.45,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CustomDropDownButtonClass(
            items: const [
              'Economy',
              'Private',
              'Public',
              'Hybrid',
            ],
            width: _deviceWidth * 0.45,
          ),
        ),
      ],
    );
  }

  Widget _bookRideWidget() {
    return SizedBox(
      height: _deviceHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _destinationDropDownWidget(),
          _travellerInformationWidget(),
          _button(),
          const SizedBox(height: 1)
        ],
      ),
    );
  }

  Widget _button() {
    return Container(
      margin: EdgeInsets.only(bottom: _deviceHeight * 0.002),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 170, 178, 208),
        borderRadius: BorderRadius.circular(11),
      ),
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: () {},
        child: const Text(
          "Book a ride!",
          style: TextStyle(
              color: Color.fromARGB(255, 51, 52, 58),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
