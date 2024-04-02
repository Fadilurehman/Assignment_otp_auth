import 'package:flutter/material.dart';
import 'package:assignment/service/authservice.dart';

class AuthController extends ChangeNotifier {
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();
  String countryCode = '+91';
  Future<void> phonenumberverification() async {
    await Authservice.verifyPhonenumber(
        countryCode + phonenumberController.text);
  }

  Future<void> verifyOtp() async {
    await Authservice.verifyOtp(otpcontroller.text);
  }
}
