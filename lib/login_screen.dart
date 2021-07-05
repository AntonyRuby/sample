import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample/phone_number_formatter.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  final _mobileFocus = new FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _mobile;

  String? validateMobile(value) {
    String patttern = r'[6-9]{1}[0-9]{4}-[0-9]{5}';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mobile',
                    counterText: "",
                    prefixText: "+91  ",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.1),
                    ),
                  ),

                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  maxLength: 11,

                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    PhoneNumberInputFormatter(),
                  ],

                  validator: validateMobile,
                  // onSaved: (val) {
                  //   _mobile = val!;
                  //   // print(val);
                  // },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MaterialButton(
                    color: Colors.blue,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
