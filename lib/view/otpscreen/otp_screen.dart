import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/home_controller.dart';
import 'package:assignment/service/firebaseservices.dart';
import 'package:assignment/view/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class ScreenOtp extends StatelessWidget {
  const ScreenOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.white,
      ),
    );
    final authcontroller = Provider.of<AuthController>(context, listen: false);
    FireService fireService = FireService();
    return Scaffold(
      body: Container(
        // margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                child: Image.asset(
                  'assets/images/Auth and otp.png', // Change this to your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  // border: Border.all(
                  //     width: 3, color: const Color.fromARGB(255, 52, 181, 241)),
                  // color: Colors.amber,
                  color: Color.fromARGB(255, 245, 241, 241),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45), // Adjust the radius as needed
                    topRight:
                        Radius.circular(45), // Adjust the radius as needed
                  ),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      ' Enter OTP',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Sent to +91 8800642354   EDIT',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Pinput(
                      validator: (value) {
                        if (value?.length != 6 || value == null) {
                          return 'please Enter the  6-digit otp';
                        } else {
                          return null;
                        }
                      },
                      controller: authcontroller.otpcontroller,
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "00:28",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 370,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 33, 103, 243)),
                        ),
                        onPressed: () async {
                          await authcontroller.verifyOtp();

                          fireService.fetchdata();
                          // ignore: use_build_context_synchronously
                          await Provider.of<HomeController>(context,
                                  listen: false)
                              .getallTask();
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'verify',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
