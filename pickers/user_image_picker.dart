import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);

  final void Function(File pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;
  void _pickImage() {
    showDialog(
        context: context,
        builder: (_) {
          File pickedImageFile;
          Widget alertBox = AlertDialog(
            title: const Text('Pick image from'),
            actions: <Widget>[
              FlatButton(
                onPressed: () async {
                  // ignore: deprecated_member_use
                  pickedImageFile = await (ImagePicker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 25,
                    maxWidth: 150,
                  ));
                  setState(() {
                    _pickedImage = pickedImageFile;
                  });
                  widget.imagePickFn(pickedImageFile);
                  Navigator.of(context).pop();
                },
                child: const Text('Camera'),
              ),
              FlatButton(
                onPressed: () async {
                  pickedImageFile =
                      await (ImagePicker.pickImage(source: ImageSource.camera));
                  setState(() {
                    _pickedImage = pickedImageFile;
                  });
                  widget.imagePickFn(pickedImageFile);
                  Navigator.of(context).pop();
                },
                child: const Text('Gallery'),
              ),
            ],
          );

          return alertBox;
        });

    //ImagePicker.pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 40,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        FlatButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: const Text('Add Image'),
        ),
      ],
    );
  }
}
