import 'package:flutter/material.dart';
// import 'package:otp_example_app/';

void main() {
  runApp(const OTPDemoApp());
}

class OTPDemoApp extends StatelessWidget {
  const OTPDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'OTP Example App', theme: ThemeData(primarySwatch: Colors.blue), home: const OTPHomePage());
  }
}

class OTPHomePage extends StatefulWidget {
  const OTPHomePage({super.key});

  @override
  State<OTPHomePage> createState() => _OTPHomePageState();
}

class _OTPHomePageState extends State<OTPHomePage> {
  String enteredOtp = '';
  bool showError = false;

  void onKeyPressed(String digit) {
    if (enteredOtp.length >= 4) return;
    setState(() {
      enteredOtp += digit;
      showError = false;
    });
  }

  void onBackspace() {
    if (enteredOtp.isEmpty) return;
    setState(() {
      enteredOtp = enteredOtp.substring(0, enteredOtp.length - 1);
    });
  }

  void onSubmit() {
    setState(() {
      showError = enteredOtp != "1234";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OTP Input Example")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SimpleOTPTextField(
            //   otpValue: enteredOtp,
            //   error: showError ? const Text("Invalid OTP", style: TextStyle(color: Colors.red)) : null,
            // ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 10,
              children: List.generate(10, (i) {
                return ElevatedButton(onPressed: () => onKeyPressed(i.toString()), child: Text(i.toString()));
              })..add(ElevatedButton(onPressed: onBackspace, child: const Icon(Icons.backspace))),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: onSubmit, child: const Text("Verify OTP")),
          ],
        ),
      ),
    );
  }
}
