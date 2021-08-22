import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/constants.dart';
import '../widgets/active_icon.dart';

class TesisDetail extends StatelessWidget {
  final String name;
  final String address;
  const TesisDetail({Key key, this.name, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.primaryColor,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                ListView(children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        'assets/ARNAVUTKOY.png',
                        // height: (MediaQuery.of(context).size.width * 0.95),
                        // width: (MediaQuery.of(context).size.width * 0.95),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    title: Text(name,
                        style:
                            GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                    subtitle: Text(address, style: GoogleFonts.poppins()),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          icon: ActiveIcon(
                            size: 75,
                            backgroundColor: Constants.primaryColor,
                            iconData: Icons.phone,
                          ),
                          onPressed: () => _launchURL('tel://4441034')),
                      IconButton(
                          icon: ActiveIcon(
                            size: 75,
                            backgroundColor: Constants.primaryColor,
                            iconData: Icons.map,
                          ),
                          onPressed: () => Navigator.of(context).pop()),
                      IconButton(
                          icon: ActiveIcon(
                            size: 75,
                            backgroundColor: Constants.primaryColor,
                            iconData: Icons.directions,
                          ),
                          onPressed: () => print('')),
                      IconButton(
                          icon: ActiveIcon(
                              size: 75,
                              backgroundColor: Constants.primaryColor,
                              iconData: Icons.language),
                          onPressed: () =>
                              _launchURL('https://tesislerimiz.ibb.istanbul/')),
                    ],
                  ),
                ]),
                Positioned(
                    top: 10,
                    left: 20,
                    child: IconButton(
                        icon: ActiveIcon(
                          borderRadius: 100,
                          iconColor: Colors.white,
                          backgroundColor: Colors.white.withOpacity(0.5),
                          iconData: Icons.arrow_back,
                          size: 75,
                        ),
                        onPressed: () => Navigator.of(context).pop())),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
