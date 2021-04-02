import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/login/controller/teddy.dart';
import 'package:flutter_samples/login/provider/service.dart';
import 'package:flutter_samples/login/widget/input.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final provider = Provider.of<Service>(context);
    provider.init();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black12,
      body: Container(
        width: size.width,
        height: size.height,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                SizedBox(
                  height: 60,
                  width: 200,
                ),

                //space for teddy actor
                Center(
                  child: Container(
                      height: 300,
                      width: 300,
                      child: CircleAvatar(
                        child: ClipOval(
                          child: FlareActor(
                            "assets/Teddy.flr",
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            controller: provider.teddyController,
                            animation: provider.animationType,
                          ),
                        ),
                        backgroundColor: Colors.white,
                      )),
                ),

                //just for vertical spacing
                SizedBox(
                  height: 80,
                  width: 10,
                ),

                //container for textfields user name and password
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      TrackingTextInput(
                          hint: "Email",
                          onCaretMoved: (Offset caret) {
                            provider.teddyController.lookAt(caret);
                          }),
                          Divider(),
                      TrackingTextInput(
                        hint: "Password",
                        isObscured: true,
                        onCaretMoved: (Offset caret) {
                         provider.teddyController.coverEyes(caret != null);
                          provider.teddyController.lookAt(null);
                        },
                        onTextChanged: (String value) {
                          provider.teddyController.setPassword(value);
                        },
                      ),
                      // TextFormField(
                      //   controller: provider.userController,
                      //   decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintText: "User name",
                      //       contentPadding: EdgeInsets.all(20)),
                      // ),
                      // Divider(),
                      // TextFormField(
                      //   obscureText: true,
                      //   decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintText: "Password",
                      //       contentPadding: EdgeInsets.all(20)),
                      //   controller: provider.passwordController,
                      //   focusNode: provider.passwordFocusNode,
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                //container for raised button
                GestureDetector(
                  onTap: () => provider.pressed(),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFF01C62),
                    elevation: 1.0,
                    child: Container(
                      width: 350,
                      height: 70,
                      alignment: Alignment.center,
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
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
