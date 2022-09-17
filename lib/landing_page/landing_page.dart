import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final Uri _url = Uri.parse('https://www.chuffed.solutions/');

  final _emailController = TextEditingController();

  String _emailWarning = " ";

  bool _emailSent = false;

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Landing Page"),
        ),
        body: ListView(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        const Color.fromARGB(255, 7, 31, 51).withOpacity(0.6),
                        BlendMode.darken),
                    image: const AssetImage("foldImage.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "icon.png",
                        width: MediaQuery.of(context).size.width / 6,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Here will be an inspirational tagline",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "A value proposition that tells the visitor that this is the solution the a problem that is clearly stated",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 200.0,
                                  child: TextField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      filled: true,
                                      fillColor: Colors.white,
                                      label: Text("email"),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 51.0,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (EmailValidator.validate(
                                          _emailController.text)) {
                                        var headers = {
                                          'Content-Type': 'application/json'
                                        };
                                        var request = http.Request(
                                            'POST',
                                            Uri.parse(
                                                'https://chuffeddom:mindthegapHgotn44B\$newton@marketing.chuffed.app/api/contacts/new'));
                                        request.body = json.encode({
                                          "email": _emailController.text,
                                          "tags": "el-landing"
                                        });
                                        request.headers.addAll(headers);

                                        http.StreamedResponse response =
                                            await request.send();

                                        if (response.statusCode == 200) {
                                          print(await response.stream
                                              .bytesToString());
                                        } else {
                                          print(response.reasonPhrase);
                                        }

                                        setState(
                                          () {
                                            _emailSent = true;
                                            _emailWarning = " ";
                                          },
                                        );
                                      } else {
                                        setState(
                                          () {
                                            _emailWarning =
                                                "Please enter a valid email address";
                                          },
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                    child: _emailSent
                                        ? Icon(Icons.check)
                                        : Text("SUBSCRIBE"),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              _emailWarning,
                              style: TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MediaQuery.of(context).size.width > 700
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(child: BenefitElement()),
                      Expanded(child: BenefitElement()),
                      Expanded(child: BenefitElement()),
                    ],
                  )
                : Column(
                    children: const [
                      BenefitElement(),
                      BenefitElement(),
                      BenefitElement(),
                    ],
                  ),
            Container(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: _launchUrl,
                      child: const Text(
                        "A Chuffed Solutions Product",
                        style: TextStyle(
                          color: Color.fromARGB(255, 8, 76, 194),
                        ),
                      ),
                    ),
                    const Text("  Released 2022"),
                    const SizedBox(
                      height: 6.0,
                    ),
                    const Text("  help@chuffed.solutions"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BenefitElement extends StatelessWidget {
  const BenefitElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(45.0),
      child: Column(
        children: const [
          Icon(
            Icons.access_time_outlined,
            size: 60.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Oneword",
            style: TextStyle(
              fontSize: 30.0,
              color: Color.fromARGB(255, 49, 49, 49),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 49, 49, 49),
            ),
          )
        ],
      ),
    );
  }
}
