import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:prominor/bottomnavigation.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  bool isHiddenPassword =true;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      return Colors.grey;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png',width: 200, height: 200,),
                  SizedBox(
                    height: 24 ,
                  ),
                  Text("Waste Recyclerz", style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Roboto',
                    wordSpacing: 3,
                    color: Color(0xff1A6350),
                  ),),
                  SizedBox(
                    height: 40,
                  ),
                  Text('Login to your account', style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    color: Color(0xff08211A),
                  ),),
                  SizedBox(
                    height: 24,
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 1, color: Color(0xff1A6350)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 1, color: Color(0xff1A6350)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: TextField(
                          obscureText: isHiddenPassword,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: InkWell(onTap: _togglePasswordView,child: Icon(Icons.visibility)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 1, color: Color(0xff1A6350)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(width: 1, color: Color(0xff1A6350)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('Remember me',style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff1A6350),
                        ),),
                        SizedBox(
                          width: 76,
                        ),
                        Text('Forget Password?', style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff1A6350),
                        ),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      width: 370,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff1A6350),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black87, minimumSize: Size(40, 40)),
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) {
                            return BottomNavigation();
                          },),);
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 55,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text("Don't have an account ?",style: TextStyle(
                        fontSize: 14,
                      ),),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black87, minimumSize: Size(40, 40)),
                          child: Text("Sign up",style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),),
                          onPressed: (){

                          }
                      )
                    ],
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
  void _togglePasswordView() {
    isHiddenPassword =!isHiddenPassword;
    setState(() {});
  }
}