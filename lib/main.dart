import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sandbox/http-requests/http-requests.dart';
import 'firebase_options.dart';

import 'emoji_slider/emoji_slider.dart';
import 'landing_page/landing_page.dart';
import 'markdown/markdown.dart';
import 'the_black_lion/the_black_lion.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: '--apple-system',
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const HomePage(),
        '/emoji-slider': (context) => const EmojiSlider(),
        '/landing-page': (context) => const LandingPage(),
        '/markdown': (context) => const MarkdownNotepad(),
        '/black-lion': (context) => const Randomiser(),
        '/http-requests': (context) => const HttpRequests(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storageRef = FirebaseStorage.instance.ref();
    bool isMobile = MediaQuery.of(context).size.width < 600 ? true : false;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dom's Sandbox"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey,
        child: GridView.count(
          padding: const EdgeInsets.all(20.0),
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          crossAxisCount: isMobile ? 2 : 3,
          children: const [
            PageCard(
              imagePath: "emoji.jpg",
              text: "emoji slider 😁",
              routeName: "/emoji-slider",
            ),
            PageCard(
              imagePath: "landing-page.png",
              text: "Landing Page",
              routeName: "/landing-page",
            ),
            PageCard(
              imagePath: "markdown.png",
              text: "Markdown",
              routeName: "/markdown",
            ),
            PageCard(
              imagePath: "black-lion.jpg",
              text: "The Black Lion",
              routeName: "/black-lion",
            ),
            PageCard(
              imagePath: "black-lion.jpg",
              text: "HTTP Requests",
              routeName: "/http-requests",
            ),
          ],
        ),
      ),
    );
  }
}

class PageCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final String routeName;

  const PageCard(
      {Key? key,
      required this.imagePath,
      required this.text,
      required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = _screenWidth < 600 ? true : false;
    double _borderRadius = 30.0;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_borderRadius),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                  )),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  text,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? _screenWidth / 20 : _screenWidth / 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
