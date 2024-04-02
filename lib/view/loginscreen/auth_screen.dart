import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/view/otpscreen/otp_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    final controller = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                // margin: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  border: Border.all(
                      width: 3, color: const Color.fromARGB(255, 52, 181, 241)),
                  // color: Colors.amber,
                  color: const Color.fromARGB(255, 245, 241, 241),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45), // Adjust the radius as needed
                    topRight:
                        Radius.circular(45), // Adjust the radius as needed
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400),
                      ),
                      const Text(
                        'Excited to continue your financial journey!',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Mobile Number :',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: controller.phonenumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const Text(
                            'By continuing, you agree to our privacy policies ',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          'and Terms & Conditions.  ',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: SizedBox(
                          width: 350,
                          height: 32,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 33, 103, 243)),
                            ),
                            onPressed: () async {
                              await controller.phonenumberverification();
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ScreenOtp(),
                                ),
                              );
                            },
                            child: const Text(
                              'Get OTP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
