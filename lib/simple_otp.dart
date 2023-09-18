library simple_otp;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPController {
  final _codeControllers = List.generate(4, (index) => TextEditingController());

  /// The current otp in the OTP field
  String get otpValue {
    return _codeControllers.map((e) => e.text).reduce((p0, p1) => p0 + p1);
  }

  void _onFinished(Function(String otpValue)? onFinished) {
    for (var controller in _codeControllers) {
      controller.addListener(() {
        if (onFinished != null && otpValue.length == 4) onFinished(otpValue);
      });
    }
  }

  // ignore: unused_element
  void _dispose() {
    for (var controller in _codeControllers) {
      controller.dispose();
    }
  }
}

class OTPTextField extends StatefulWidget {
  final OTPController? controller;
  final GlobalKey<FormState>? formKey;
  final Function(String)? onFinished;
  final int fieldCount;

  const OTPTextField({
    super.key,
    this.controller,
    this.fieldCount = 4,
    this.formKey,
    this.onFinished,
  });

  @override
  State<StatefulWidget> createState() => _OTPState();
}

class _OTPState extends State<OTPTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller?._onFinished(widget.onFinished);
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: Can't dispose off this TextEditControllers, dispose them without bugs
    //  widget.controller?._dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / widget.fieldCount + 1;

    return Form(
      key: widget.formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: size,
            width: size - 4,
            child: TextFormField(
              //   controller: _codeControllers[0],
              validator: (value) => value != null && value.isEmpty ? '' : null,
              onChanged: (value) => value.length == 1 ? FocusScope.of(context).nextFocus() : null,
              decoration: InputDecoration(
                hintText: '*',
                //  errorStyle: AppStyle.hidden,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                focusedBorder: OutlineInputBorder(
                  // borderSide: const BorderSide(color: AppColor.green),
                  borderRadius: BorderRadius.circular(7),
                ),
                errorBorder: OutlineInputBorder(
                  // borderSide: const BorderSide(color: AppColor.red),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              //   style: AppStyle.headline3,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          SizedBox(
            height: size,
            width: size - 4,
            child: TextFormField(
              //   controller: _codeControllers[1],
              validator: (value) => value != null && value.isEmpty ? '' : null,
              onChanged: (value) {
                value.length == 1 ? FocusScope.of(context).nextFocus() : FocusScope.of(context).previousFocus();
              },
              decoration: InputDecoration(
                hintText: '*',
                //  errorStyle: AppStyle.hidden,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                focusedBorder: OutlineInputBorder(
                  // borderSide: const BorderSide(color: AppColor.green),
                  borderRadius: BorderRadius.circular(7),
                ),
                errorBorder: OutlineInputBorder(
                  // borderSide: const BorderSide(color: AppColor.red),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              //   style: AppStyle.headline3,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          SizedBox(
            height: size,
            width: size - 4,
            child: TextFormField(
              //   controller: _codeControllers[2],
              validator: (value) => value != null && value.isEmpty ? '' : null,
              onChanged: (value) {
                value.length == 1 ? FocusScope.of(context).nextFocus() : FocusScope.of(context).previousFocus();
              },
              decoration: InputDecoration(
                hintText: '*',
                //  errorStyle: AppStyle.hidden,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                focusedBorder: OutlineInputBorder(
                  // borderSide: const BorderSide(color: AppColor.green),
                  borderRadius: BorderRadius.circular(7),
                ),
                errorBorder: OutlineInputBorder(
                  // borderSide: const BorderSide(color: AppColor.red),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              //   style: AppStyle.headline3,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          SizedBox(
            height: size,
            width: size - 4,
            child: TextFormField(
              //   controller: _codeControllers[3],
              validator: (value) => value != null && value.isEmpty ? '' : null,
              onChanged: (value) => value.isEmpty ? FocusScope.of(context).previousFocus() : null,
              decoration: InputDecoration(
                hintText: '*',
                //  errorStyle: AppStyle.hidden,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                focusedBorder: OutlineInputBorder(
                  // borderSide: const BorderSide(color: AppColor.green),
                  borderRadius: BorderRadius.circular(7),
                ),
                errorBorder: OutlineInputBorder(
                  // borderSide: const BorderSide(color: AppColor.red),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              //   style: AppStyle.headline3,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
