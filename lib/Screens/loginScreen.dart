import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    late String dPath;
    late File _image;
    late File img;
    bool val = false;

    Future getGalleryImage() async {
      final Directory dir = await getTemporaryDirectory();
      dPath = dir.path;
      try {
        final XFile? image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        setState(() {
          val = true;
          _image = File(image!.path);
          img = _image;
          print(val);
        });
      } catch (e) {
        print(e);
      }
    }

    Future getCamImage() async {
      final Directory dir = await getTemporaryDirectory();
      dPath = dir.path;
      try {
        final PickedFile? image =
            await ImagePicker().getImage(source: ImageSource.camera);
        setState(() {
          val = true;
          img = File(image!.path);
          print(img.path);
        });
      } catch (e) {
        print(e);
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff34656D),
        appBar: AppBar(
          backgroundColor: Color(0xff003638),
          centerTitle: true,
          title: Text(
            "LDD",
            style: TextStyle(
                fontSize: queryData.size.width * 0.07,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(),
          child: Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: val
                          ? Image.file(img)
                          : Image.asset("images/images.jpg"),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      getGalleryImage();
                      setState(() {
                        print(
                            "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                      });
                    },
                    child: Container(
                      child: Text("Gallery image"),
                    ),
                  ),
                  FlatButton(
                    onPressed: getCamImage,
                    child: Container(
                      child: Text("Gallery image"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
