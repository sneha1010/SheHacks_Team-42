import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
//import 'package:map/location.dart';
//import 'map';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  bool disablemonth = true;
  bool disaclecity = true;
  String chooseyear;
  String choosemonth;
  String countryValue;
  String stateValue;
  String cityValue;
  String choosecity;
  String choosestate;
  List<DropdownMenuItem<String>> listmonth = List();
  Map<String, String> stateCity = {
    "Allahabad": "Uttar Pradesh",
    "Agra": "Uttar Pradesh",
    "Mumbai": "Maharashtra",
    "Pune": "Maharashtra",
    "Jaipur": "Rajasthan",
    "Udaipur": "Rajasthan",
    "Patna": "Bihar",
    "Ahmedabad": "Gujarat",
    "Karnataka": "Bangalore",
    "Delhi": "Delhi"
  };

  List<String> state = [
    'Uttar Pradesh',
    'Maharashtra',
    'Rajasthan',
    'Bihar',
    'Gujarat',
    'Bangalore',
    'Delhi'
  ];
  List<String> city = [];

  String selectedState;
  String selectedcity;

  final app = {
    "1": "january",
    "2": "february",
  };

  final web = {
    "1": "january",
    "2": "february",
    "3": "march",
    "4": "april",
    "5": "may",
    "6": "june",
    "7": "july",
    "8": "August",
    "9": "september",
    "10": "october",
    "11": "november",
    "12": "december",
  };
  void populateyear1() {
    for (String key in app.keys) {
      listmonth.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(app[key]),
        ),
        value: app[key],
      ));
    }
  }

  void populateyear2() {
    for (String key in web.keys) {
      listmonth.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(web[key]),
        ),
        value: web[key],
      ));
    }
  }

  void selected(_value) {
    if (_value ==
        "year1"
            "") {
      listmonth = [];
      populateyear2();
    } else if (_value == "year2") {
      listmonth = [];
      populateyear1();
    }
    setState(() {
      chooseyear = _value;
      disablemonth = false;
    });
  }

  void secondselected(_value) {
    setState(() {
      choosemonth = _value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
          child: Row(
            children: [
              Text(
                'Filter',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              IconButton(
                icon: Icon(Icons.cancel),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Text('choose a date'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
          child: DropdownButton(
            // hint: Text('year'),
            value: chooseyear,
            items: [
              DropdownMenuItem<String>(
                value: "year1",
                child: Center(
                  child: Text("2021"),
                ),
              ),
              DropdownMenuItem<String>(
                value: "year2",
                child: Center(
                  child: Text("2020"),
                ),
              ),
            ].toList(),
            onChanged: (_value) => selected(_value),
            hint: Text("Select a year"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
          child: DropdownButton(
            hint: Text('select a month'),
            value: choosemonth,
            onChanged: disablemonth
                ? null
                : (newValue) {
                    setState(() {
                      choosemonth = newValue;
                    });
                  },
            items: listmonth,
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: SelectState(
        //     onCountryChanged: (value) {
        //       setState(() {
        //         countryValue = value;
        //       });
        //     },
        //     onStateChanged:(value) {
        //       setState(() {
        //         stateValue = value;
        //       });
        //     },
        //     onCityChanged:(value) {
        //       setState(() {
        //         cityValue = value;
        //       });
        //     },
        //
        //   ),
        // )
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
          child: Text('choose a location'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
          child: DropdownButton(
            hint: Text('select a state'),
            onChanged: (value) {
              setState(() {
                selectedState = value;
                selectedcity = null;
                city.clear();
                stateCity.forEach((k, v) {
                  print(k);
                  if (selectedState == v) {
                    city.add(k);
                  }
                });
              });
            },
            value: selectedState,
            items: state
                .map((state) => DropdownMenuItem(
                      child: Text(state),
                      value: state,
                    ))
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
          child: DropdownButton(
            hint: Text('select a city'),
            onChanged: (value) {
              setState(() {
                selectedcity = value;
              });
              print(value);
            },
            value: selectedcity,
            items: selectedState != null
                ? city
                    .map((city) => DropdownMenuItem(
                          child: Text(city),
                          value: city,
                        ))
                    .toList()
                : [],
          ),
        )
        // Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: DropdownButton(
        //     // hint: Text('year'),
        //     value: choosestate,
        //     items: [
        //       DropdownMenuItem<String>(
        //         value: "Uttar Pradesh",
        //         child: Center(
        //           child: Text("Uttar Pradesh"),
        //         ),
        //       ),
        //       DropdownMenuItem<String>(
        //         value: "Rajasthan",
        //         child: Center(
        //           child: Text("Rajasthan"),
        //         ),
        //       ),
        //       DropdownMenuItem<String>(
        //         value: "Delhi",
        //         child: Center(
        //           child: Text("Delhi"),
        //         ),
        //       ),
        //       DropdownMenuItem<String>(
        //         value: "Karnataka",
        //         child: Center(
        //           child: Text("Karnataka"),
        //         ),
        //       ),
        //       DropdownMenuItem<String>(
        //         value: "Bihar",
        //         child: Center(
        //           child: Text("Bihar"),
        //         ),
        //       ),
        //       DropdownMenuItem<String>(
        //         value: "Gujarat",
        //         child: Center(
        //           child: Text("Gujarat"),
        //         ),
        //       ),
        //       DropdownMenuItem<String>(
        //         value: "maharashtra",
        //         child: Center(
        //           child: Text("maharashtra"),
        //         ),
        //       ),
        //     ].toList(),
        //     onChanged: (_value) => selected(_value),
        //     hint: Text(
        //         "Select a state"
        //     ),
        //
        //   ),
        //
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: DropdownButton(
        //     hint: Text('select a city'),
        //     value: choosecity,
        //     onChanged: disablemonth?null:(newValue){
        //       setState((){
        //         choosemonth=newValue;
        //       });
        //     },
        //     items: listmonth,
        //   ),
        // ),
      ]),
    );
  }
}
