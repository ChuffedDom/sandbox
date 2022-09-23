# GET and POST HTTP requests

## 🤔 y tho?

I was working in a project and needed to create a new record in Mautic (open-source self-hosting marketing platform), so I tried to send it through the API ... and my Flutter app broke. So I am going to figure it out in my sandbox so not to mess up any other part of my app.

## 📱 How it works

Firstly, will need to download the Flutter http package

`flutter pub add http`

Once downloaded add the import to the dart file

`import 'package:http/http.dart';`

Unlike many other technologies, here a URL has to be parsed first as an object to load into calls.

`Uri.parse('https://jsonplaceholder.typicode.com/albums/1')`

### ⬆️ GET

To send a GET request then, in an async function, call the get function with the parsed URL as the only the only argument.

```
() async {
    final response = await get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
```
### ⬆️ POST

I call the post function in the same with an unnamed parameter being a parsed URL. From there 2 more parameters are set. 

Headers are a `Map<String, String>` object with the key value pairs for the POST request. The body is simply a JSON of the data I want to send as a string. With that I can call post like so:

```
() async {
    final url =
        Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final headers = {"Content-type": "application/json"};
    final json = '{"title": "Chuffed", "body": "Dom", "userId": 1}';
    final response = await post(url, headers: headers, body: json);
```

### 🗣️ Response

From the object I get back in both types, reponse can access 2 methods; `body` and `statusCode`.

With `response.body` I get a string, that we can set to a state to update UI.

`setState(() {
    postResponse = response.body;
});`

With `response.statusCode`, I get back a string with HTTP response which I can use in an `if` statement.

`if (response.statusCode == 200) {
    setState(() {
    getResponse = response.body;
    });
}`