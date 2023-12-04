import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ListAddImage extends StatefulWidget {
  const ListAddImage({super.key});

  @override
  _ListAddImageState createState() => _ListAddImageState();
}

class _ListAddImageState extends State<ListAddImage> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 70,
            backgroundColor: Colors.grey[300],
            child: _image != null
                ? ClipOval(
                    child: Image.file(
                      _image!,
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  )
                : IconButton(
                    icon: const Icon(Icons.add),
                    iconSize: 40,
                    onPressed: _pickImage,
                  ),
          ),
        ],
      ),
    );
  }
}
