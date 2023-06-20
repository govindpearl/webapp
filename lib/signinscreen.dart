
import 'package:flutter/material.dart';
import 'package:hinton/signupscree.dart';

import 'homepage.dart';


class signinscreen extends StatefulWidget {
  const signinscreen({Key? key}) : super(key: key);

  @override
  State<signinscreen> createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {

  TextEditingController useremailController = TextEditingController();

  TextEditingController userpasswordController = TextEditingController();
  bool _obscured = false;
  final textFieldFocusNode = FocusNode();

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
      false; // Prevents focus if tap on eye
    });
  }





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create account",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xffA29EB6),
                      fontSize: 16),
                ),
                SizedBox(
                  width: 6,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signupscreen()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFF8A00),
                          fontSize: 16),
                    )),
              ],
            ),
            //Text("Already have an account?",style: TextStyle(fontWeight: FontWeight.w500,color: Color(0xffA29EB6),fontSize: 16),),
            padding: EdgeInsets.only(left: 22,bottom: 30),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 55,
              ),
              child: Column(
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  TextField(
                    controller: useremailController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      //Hides label on focus or if filled
                      labelText: "Enter your id",
                      filled: true,
                      // Needed for adding a fill color
                      //fillColor: Colors.grey.shade800,
                      isDense: true,
                      // Reduces height a bit
                      border: OutlineInputBorder(
                        // borderSide: BorderSide.none,              // No border
                        borderRadius:
                        BorderRadius.circular(12), // Apply corner radius
                      ),
                      prefixIcon: Icon(Icons.person, size: 24),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),



                  TextField(
                    controller: userpasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscured,
                    focusNode: textFieldFocusNode,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      //Hides label on focus or if filled
                      labelText: "Password",
                      filled: true,
                      // Needed for adding a fill color
                      //fillColor: Colors.grey.shade800,
                      isDense: true,
                      // Reduces height a bit
                      border: OutlineInputBorder(
                        // borderSide: BorderSide.none,              // No border
                        borderRadius:
                        BorderRadius.circular(12), // Apply corner radius
                      ),
                      prefixIcon: Icon(Icons.lock_rounded, size: 24),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: GestureDetector(
                          onTap: _toggleObscured,
                          child: Icon(
                            _obscured
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Color(0xffFEE572)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17.0),
                              // side: BorderSide(color: Colors.red)
                            ))),
                        onPressed: () async {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));


                          //signin(
                          //
                          //
                          //
                          // .text.toString(), userpasswordController.text.toString());

                          print(useremailController.text);
                          print(userpasswordController.text);
                        //  signUp(useremailController.text, userpasswordController.text,);


                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) =>  HomeScreen())
                          // );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),

                ],
              ),
            ),
          )),
    );
  }
}
