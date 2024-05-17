import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneSMSPage extends StatelessWidget {
  late String phoneNumber;
  TextEditingController controller = new TextEditingController();
  PhoneSMSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone SMS"),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                labelText: "SDT"
            ),
            keyboardType: TextInputType.phone,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    openPhoneDial(controller.text);
                  },
                  child: Text("Phone")
              ),
              ElevatedButton(
                  onPressed: () {
                    openSMS(controller.text);
                    print(controller.text);
                  },
                  child: Text("SMS")
              )
            ],
          )
        ],
      ),
    );
  }
}
Future<bool> openPhoneDial (String phoneNumber) async{
  bool check = await canLaunchUrl(Uri(scheme: 'tel', path: phoneNumber));
  if(check == false) return false;
  return launchUrl(Uri(scheme: 'tel', path: phoneNumber));
}
Future<bool> openSMS (String phoneNumber) async {
  bool check = await canLaunchUrl(Uri(scheme: 'sms', path: phoneNumber));
  if (check == false) return false;
  return launchUrl(Uri(scheme: 'sms', path: phoneNumber));
}