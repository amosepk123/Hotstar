import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_service.dart';
import 'home.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final auth = AuthService();
  late final Theme_text=MediaQuery.of(context).platformBrightness==Brightness.dark
      ?"DarkTheme"
      : "LightTheme";

  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select image from:'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            child: Text('Gallery'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            child: Text('Camera'),
          ),
        ],
      ),
    );

    if (pickedImage != null) {
      final pickedFile = await picker.pickImage(source: pickedImage);
      if (pickedFile != null) {
        final bytes = await File(pickedFile.path).readAsBytes();
        setState(() {
          _image = bytes;
        });
        _saveImage(bytes);
      }
    }
  }

  Future<void> _saveImage(Uint8List bytes) async {
    final prefs = await SharedPreferences.getInstance();
    final base64String = base64Encode(bytes);
    await prefs.setString('profile_image', base64String);
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final base64String = prefs.getString('profile_image');
    if (base64String != null) {
      setState(() {
        _image = base64Decode(base64String);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        // foregroundColor: Colors.black,
        title: const Text("PROFILE"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_rounded),
          ),
          ChangeThemeButtonWidget(),
        ],

      ),
      body: Column(
        children: [
          SizedBox(height: 70),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                                      backgroundColor: Theme.of(context).iconTheme.color,
                                      radius: 80,
                                      backgroundImage: MemoryImage(_image!),
                                    )
                    : Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child:  CircleAvatar(
                    backgroundColor: Theme.of(context).iconTheme.color,

                    radius: 80,
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToiRnzzyrDtkmRzlAvPPbh77E-Mvsk3brlxQ&s",
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: -10,
                  child: IconButton(
                    onPressed: _selectImage,
                    icon: Icon(
                      Icons.add_a_photo,

                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width/1.5,
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                label: Text("Name"),
                border: OutlineInputBorder(

                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width/1.5,
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today),
                label: Text("Date of Birth"),
                border: OutlineInputBorder(

                ),
              ),

            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width/1.5,
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                label: Text("Phone Number"),
                border: OutlineInputBorder(

                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await auth.signout();
              //goToLogin(context);
            },
            child: const Text("Sign Out"),
          ),
        ],
      ),
    );
  }
}
