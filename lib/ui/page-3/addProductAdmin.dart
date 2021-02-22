import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductAdmin extends StatefulWidget {
  @override
  _AddProductAdminState createState() => _AddProductAdminState();
}

class _AddProductAdminState extends State<AddProductAdmin> {
  final TextEditingController nameProductController = TextEditingController();
  final TextEditingController descriptionProductController =
      TextEditingController();

  final TextEditingController stockProductController = TextEditingController();
  final TextEditingController priceProductController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // drop down bottom
  String selectedProducts = 'FlashSale';
  List listCategoryProducts = [
    'FlashSale',
    'BestProduct',
    'SpecialDiscount',
    'FeedAdmin'
  ];

  // get local image
  File image;
  Future getImage(ImageSource sourceImage) async {
    // Get image from gallery.
    File imageFile = await ImagePicker.pickImage(source: sourceImage);

    if (imageFile != null) {
      setState(() {
        image = imageFile;
      });
    }
  }

  _showImage() {
    if (image == null) {
      return SizedBox(height: 0);
    } else if (image != null) {
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            image,
            fit: BoxFit.cover,
            height: 250,
          ),
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: Text(
              'Change Image',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () => getImage(ImageSource.gallery),
          )
        ],
      );
    } else {
      return Text('EROR');
    }
  }

  String imageLocation;
  Future<void> _uploadImageToFirebase() async {
    try {
      // Make random image name.
      int randomNumber = Random().nextInt(100000);
      imageLocation = 'images/image${randomNumber}.jpg';

      // Upload image to firebase.
      final Reference storageReference =
          FirebaseStorage.instance.ref().child(imageLocation);
      final UploadTask uploadTask = storageReference.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;

      _addPathToDatabase(imageLocation, taskSnapshot, uploadTask);
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> _addPathToDatabase(
      String text, TaskSnapshot a, UploadTask uploadTask) async {
    // Get image URL from firebase
    final ref = FirebaseStorage.instance.ref().child(text);
    final String imageURL = await ref.getDownloadURL();

    //
    String url = (await a.ref.getDownloadURL());
    print('URL Is $url');
    print('product controller ${nameProductController.text}');

    //search Index Function
    List<String> splitList = nameProductController.text.split(' ');
    List<String> indexList = [];

    for (int i = 0; i < splitList.length; i++) {
      for (int j = 0; j < splitList[i].length + i; j++) {
        indexList.add(splitList[i].substring(0, j).toLowerCase());
        indexList.add(splitList[i].substring(0, j).toUpperCase());
      }
    }

    if (url != null) {
      await FirebaseFirestore.instance.collection('${selectedProducts}').add({
        'name': nameProductController.text,
        'stock': stockProductController.text ?? 1,
        'description': descriptionProductController.text,
        'price': priceProductController.text,
        'url': url,
      });

      await FirebaseFirestore.instance.collection('allProduct').add({
        'name': nameProductController.text,
        'stock': stockProductController.text ?? 1,
        'description': descriptionProductController.text,
        'price': priceProductController.text,
        'url': url,
        'searchIndex': indexList,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'Add',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'PoppinsBold')),
              TextSpan(
                  text: 'Product',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF016DF7),
                      fontFamily: 'PoppinsBold')),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                children: [
                  //TODO: Input Name
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _showImage(),
                        (image == null)
                            ? ButtonTheme(
                                child: RaisedButton(
                                  onPressed: () =>
                                      getImage(ImageSource.gallery),
                                  child: Text(
                                    'Add Image',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            : SizedBox(height: 0),
                        (image == null)
                            ? ButtonTheme(
                                child: RaisedButton(
                                  onPressed: () => getImage(ImageSource.camera),
                                  child: Text(
                                    'Take a picture',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            : SizedBox(height: 0),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontFamily: 'PoppinsReg', color: Colors.black),

                          // add controller
                          controller: nameProductController,

                          decoration: InputDecoration(
                            labelText: 'Product',
                            labelStyle: TextStyle(
                                fontFamily: 'PoppinsReg', color: Colors.black),
                          ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Cant be a Empty!';
                            }
                            if (val.length < 5) {
                              return 'Product name must more than 5';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontFamily: 'PoppinsReg', color: Colors.black),
                          minLines: 4,
                          maxLines: 30,

                          // add controller
                          controller: descriptionProductController,

                          decoration: InputDecoration(
                            labelText: 'Description',
                            labelStyle: TextStyle(
                                fontFamily: 'PoppinsReg', color: Colors.black),
                          ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Cant be a Empty!';
                            }
                            if (val.length < 10) {
                              return 'Description product must more than 10';
                            }
                            if (val.length > 200) {
                              return 'Description product must less than 200';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontFamily: 'PoppinsReg', color: Colors.black),

                          // add controller
                          controller: stockProductController,

                          decoration: InputDecoration(
                            labelText: 'Stock',
                            labelStyle: TextStyle(
                                fontFamily: 'PoppinsReg', color: Colors.black),
                          ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Cant be a Empty!';
                            }
                            if (val == '0') {
                              return 'Stock cant be 0';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontFamily: 'PoppinsReg', color: Colors.black),

                          // add controller
                          controller: priceProductController,

                          decoration: InputDecoration(
                            labelText: 'Price',
                            labelStyle: TextStyle(
                                fontFamily: 'PoppinsReg', color: Colors.black),
                          ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Cant be a Empty!';
                            }
                            if (val == '0') {
                              return 'Price cant be 0';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  //TODO: Watch THis fking code
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items:
                          listCategoryProducts.map<DropdownMenuItem>((value) {
                        return DropdownMenuItem(
                            child: Text(value), value: value);
                      }).toList(),

                      // text
                      value: selectedProducts,
                      style: TextStyle(
                          fontFamily: 'PoppinsReg', color: Colors.black),
                      onChanged: (value) {
                        setState(() {
                          selectedProducts = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),

                  Center(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.black,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          // ADD DATA
                          // product.add({
                          //   'name': nameProductController.text,
                          //   'stock': stockProductController.text ?? 1,
                          //   'description': descriptionProductController.text,
                          //   'price': priceProductController.text,
                          //   'url': '${urlImage}',
                          //   'location': '${imageLocation}',
                          // });

                          //Add Image Data
                          _uploadImageToFirebase();
                          // uploadImage2Firebase(context);
                          Navigator.of(context).pop();
                          // uploadFoodAndImage();
                        }
                      },
                      child: Text(
                        "Add Products",
                        style: TextStyle(color: Colors.white),
                      ),
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