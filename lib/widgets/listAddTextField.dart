import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListAddTextField extends StatefulWidget {
  final String name;
  TextEditingController? controller;

  ListAddTextField({Key? key, required this.name, this.controller})
      : super(key: key);

  @override
  _ListAddTextFieldState createState() => _ListAddTextFieldState();
}

class _ListAddTextFieldState extends State<ListAddTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // Use the provided controller or create a new one if not provided
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${widget.name}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter ${widget.name}',
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Setter method for the controller
  set controller(TextEditingController value) {
    _controller = value;
  }

  @override
  void dispose() {
    // Dispose of the controller if it was created in initState
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}
