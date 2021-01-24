import 'package:flutter/material.dart';
import 'CountryStats Card.dart';

class FirstHalf extends StatefulWidget {
  final List countryData;
  FirstHalf({this.countryData});

  @override
  _FirstHalfState createState() => _FirstHalfState();
}

class Country {
  String countryName;
  int totalConfirmed;
  int totalDeaths;
  int totalRecovered;
  int activeCases;
  int seriousCases;

  Country(
      {this.countryName,
      this.totalConfirmed,
      this.totalDeaths,
      this.totalRecovered,
      this.activeCases,
      this.seriousCases});
}

class _FirstHalfState extends State<FirstHalf> {
  getCountries() {
    List<Country> contries = [];
    for (var i in widget.countryData) {
      setState(() {
        Country country = Country(
          countryName: i["country"],
          totalConfirmed: i["cases"],
          totalRecovered: i["recovered"],
          totalDeaths: i["deaths"],
          activeCases: i["active"],
          seriousCases: i["critical"],
        );
        contries.add(country);
      });
    }

    return contries;
  }

  List<DropdownMenuItem<Country>> _dropdownMenuItems;
  Country _selectedCountry;
  int cases;
  int recovered;
  int deaths;
  int activeCases;
  int criticalCases;

  List<DropdownMenuItem<Country>> buildDropDownMenuItems() {
    List<DropdownMenuItem<Country>> dropDownItems = [];
    for (Country country in getCountries()) {
      var items = DropdownMenuItem(
        value: country,
        child: Text(country.countryName),
      );

      dropDownItems.add(items);
    }
    return dropDownItems;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    getCountries();
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
            child: Text(
              'STATISTICS',
              style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontFamily: 'BebasNeue',
              ),
            ),
          ),
          Container(
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.location_on,
                    color: Color(0xFF473F97),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                Expanded(
                  child: DropdownButton(
                    items: _dropdownMenuItems,
                    isExpanded: true,
                    value: _selectedCountry,
                    underline: SizedBox(),
                    onChanged: (Country selectedCountry) {
                      setState(() {
                        _selectedCountry = selectedCountry;
                        cases = selectedCountry.totalConfirmed;
                        deaths = selectedCountry.totalDeaths;
                        recovered = selectedCountry.totalRecovered;
                        activeCases = selectedCountry.activeCases;
                        criticalCases = selectedCountry.seriousCases;
                      });
                    },
                    iconEnabledColor: Color(0xFF473F97),
                    hint: Text(
                      'Select Country',
                      style: TextStyle(
                        color: Color(0xFF473F97),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CountryStatCard(
            cases: cases,
            recovered: recovered,
            deaths: deaths,
            criticalCases: criticalCases,
            activeCases: activeCases,
          )
        ],
      ),
    );
  }
}
