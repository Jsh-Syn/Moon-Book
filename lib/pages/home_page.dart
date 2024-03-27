import 'package:flutter/material.dart';
import 'package:flutter_course/pages/last_page.dart';
import 'package:flutter_course/widgets/custom_dropdown.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late double _deviceHeight, _deviceWidth;
  // declaration of variables to be used for transferring items.
  String _selectedStation = '';
  String _selectedshipNum = '';
  String _selectedTravelType = '';

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          // Container Padding
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // Column contains all widgets visible in Homepage
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _pageTitle(),
              const SizedBox(height: 60),
              _astroImageWidget(),
              const SizedBox(height: 20),
              _bookRideWidget(context),
            ],
          ),
        ),
      ),
    );
  }

// Visible Widgets below

  Widget _pageTitle() {
    return Container(
      child: const Text(
        'Moon Book',
        style: TextStyle(
          color: Color.fromARGB(255, 243, 249, 255),
          fontWeight: FontWeight.w800,
          fontSize: 47,
        ),
      ),
    );
  }

  Widget _astroImageWidget() {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        image:
            DecorationImage(image: AssetImage("assets/images/astronaut.png")),
      ),
    );
  }

  Widget _destinationDropDownWidget() {
    return CustomDropDownButtonClass(
      items: const [
        '',
        'MarsX Station',
        'VenusX Station',
        'PlutoX Station',
      ],
      width: _deviceWidth,
      onChanged: (value) {
        setState(() {
          _selectedStation = value;
        });
      },
    );
  }

  Widget _travellerInformationWidget() {
    return Row(
      children: [
        Expanded(
          child: CustomDropDownButtonClass(
            items: const [
              '',
              '1',
              '2',
              '3',
              '4',
            ],
            width: _deviceWidth * 0.45,
            onChanged: (value) {
              setState(() {
                _selectedshipNum = value;
              });
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CustomDropDownButtonClass(
            items: const [
              '',
              'Economy',
              'Private',
              'Public',
              'Hybrid',
            ],
            width: _deviceWidth * 0.45,
            onChanged: (value) {
              setState(() {
                _selectedTravelType = value;
              });
            },
          ),
        ),
      ],
    );
  }

  //Grouped every dropdown to the button for uniform format.
  Widget _bookRideWidget(BuildContext context) {
    return SizedBox(
      height: _deviceHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _destinationDropDownWidget(),
          _travellerInformationWidget(),
          _button(context),
          const SizedBox(height: 1)
        ],
      ),
    );
  }

  Widget _button(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: _deviceHeight * 0.002),
      width: 380,
      child: MaterialButton(
        height: 48,
        color: const Color.fromARGB(255, 170, 178, 208),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LastPage(
                shipNum: _selectedshipNum,
                shipType: _selectedTravelType,
                station: _selectedStation,
              ),
            ),
          );
        },
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
