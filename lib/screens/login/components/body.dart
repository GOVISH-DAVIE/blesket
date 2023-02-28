import 'package:blesket/components/FormErrors.dart';
import 'package:blesket/components/buttons.dart';
import 'package:blesket/screens/home/home.dart';
import 'package:blesket/screens/otp/otp.dart';
import 'package:blesket/state/auth/AuthProvider.dart';
import 'package:blesket/state/sockets/socketsprovider.dart';
import 'package:blesket/utils/color.dart';
import 'package:blesket/utils/constants.dart';
import 'package:blesket/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  bool hidden = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool busy = false;

  bool error = false;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context
          .read<SocketsProvider>()
          .connect(signalingUrl: signalingEndPoint, context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Check in',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .7,
              width: MediaQuery.of(context).size.width / 1.5,
              child: Container(
                // padding: EdgeInsetsGeometry(),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.circular(1),
                    border: Border(
                        top: BorderSide(
                      color: Color(0xffB0A8EC),
                      width: 3.0,
                    ))),
                child: maincomponent(context),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'By checking in you agree to the',
                  style: TextStyle(color: themeGrey),
                ),
                Text(
                  'Terms of use',
                  style: TextStyle(color: themeGreen),
                ),
                Text(
                  ' of service and privacy policy',
                  style: TextStyle(color: themeGrey),
                ),
                Text(
                  ' privacy policy',
                  style: TextStyle(color: themeGreen),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Column maincomponent(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Consumer<AuthProvider>(
        builder: (context, authProvider, child) => Expanded(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: themeGreen.withOpacity(.2),
                      borderRadius: BorderRadius.circular(25)),
                  child: SvgPicture.asset(
                    'assets/images/Vector.svg',
                    color: themeGreen,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Login to your account',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: TextFormField(
                      onSaved: (newValue) => email = newValue,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kNullError);
                        }
                        return;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: kNullError);

                          return "";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Enter email address'),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: TextFormField(
                      onSaved: (newValue) => password = newValue,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kNullError);
                        }
                        return;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: kNullError);

                          return "";
                        }
                        return null;
                      },
                      obscureText: hidden,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  hidden = !hidden;
                                });
                              },
                              child: Icon(
                                hidden
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: themeGreen,
                              ))),
                    )),
                const SizedBox(
                  height: (10),
                ),
                FormError(errors: errors),
                const SizedBox(
                  height: (10),
                ),
                busy
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        height: 50,
                        width: 250,
                        child: FullWithButton(
                          callback: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              setState(() {
                                busy = true;
                              });
                              authProvider
                                  .login(password: password, email: email)
                                  .then((value) {
                                setState(() {
                                  busy = false;
                                });
                                Navigator.pushNamed(context, Home.route);
                              }).catchError((onError) {
                                addError(error: kInvalidCredentials);

                                setState(() {
                                  busy = false;
                                });
                              });
                            }
                          },
                          type: defaultButtonTheme,
                          child: const Text('Check In'),
                        ),
                      )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
