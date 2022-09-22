import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;

class MarkdownNotepad extends StatefulWidget {
  const MarkdownNotepad({super.key});

  @override
  State<MarkdownNotepad> createState() => _MarkdownNotepadState();
}

class _MarkdownNotepadState extends State<MarkdownNotepad> {
  late TextEditingController _controller;

  late String _notepadText = "";

  late Uri _url;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Markdown Notepad"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            MarkdownBody(data: _notepadText),
            TextField(
              maxLines: 8,
              controller: _controller,
              onChanged: (value) => setState(() {
                _notepadText = value;
              }),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type some markdown',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
