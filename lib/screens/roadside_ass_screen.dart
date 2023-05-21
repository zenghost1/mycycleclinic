import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../datamodels/clinic_model.dart';

class RoadSideAssistance extends StatelessWidget {
  RoadSideAssistance({super.key});

  static const routeName = "/roadsideScreen";
  final Clinic clinic = Clinic(id: 'dc', name: 'Clinic Name', description: 'description', imageFile: File('path'), products: [], services: [], isOpen: true, number: '8295647903');
  
  _makingPhoneCall() async {
  var url = Uri.parse("tel:$clinic.number");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roadside Assistance', textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: ListView(
            children: [
                ListTile(
                    leading: ClipRRect(
                        child: Image.file(clinic.imageFile),
                    ),
                    title: Text(clinic.name),
                    trailing: IconButton(onPressed: (){
                        _makingPhoneCall();                       
                    }, icon: Icon(Icons.call)),
                )
            ],
        ),
      ),
    );
  }
}