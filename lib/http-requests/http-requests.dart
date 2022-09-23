import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class HttpRequests extends StatefulWidget {
  const HttpRequests({super.key});

  @override
  State<HttpRequests> createState() => _HttpRequestsState();
}

class _HttpRequestsState extends State<HttpRequests> {
  late String getResponse = "";
  late String postResponse = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP requests"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.purple,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "GET",
                      style: GoogleFonts.robotoMono(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  "https://jsonplaceholder.typicode.com/albums/1",
                  style: GoogleFonts.robotoMono(),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () async {
                final response = await get(
                    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

                if (response.statusCode == 200) {
                  setState(() {
                    getResponse = response.body;
                  });
                } else {
                  throw Exception('Failed to load album');
                }
              },
              child: const Text("SEND"),
            ),
            SizedBox(height: 8.0),
            // Response from GET request
            Text(
              getResponse,
              style: GoogleFonts.robotoMono(),
            ),
            SizedBox(height: 8.0),
            Divider(),
            // ##### POST request
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.deepOrange,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "POST",
                      style: GoogleFonts.robotoMono(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  "https://jsonplaceholder.typicode.com/posts",
                  style: GoogleFonts.robotoMono(),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () async {
                final url =
                    Uri.parse('https://jsonplaceholder.typicode.com/posts');
                final headers = {"Content-type": "application/json"};
                final json = '{"title": "Chuffed", "body": "Dom", "userId": 1}';
                final response = await post(url, headers: headers, body: json);
                /* print('Status code: ${response.statusCode}');
                print('Body: ${response.body}'); */
                setState(() {
                  postResponse = response.body;
                });
              },
              child: const Text("SEND"),
            ),
            SizedBox(height: 8.0),
            // Response from GET request
            Text(
              postResponse,
              style: GoogleFonts.robotoMono(),
            ),
            SizedBox(height: 8.0),
            Divider(),
          ],
        ),
      ),
    );
  }
}
