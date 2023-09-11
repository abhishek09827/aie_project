import 'package:aie_project/service/http_service.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
enum Auth{
  sigin,
  signup
}
class AuthScreen extends StatefulWidget {

  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.sigin;
  late String username;
  late String pass;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void signUpUser(){
    // authServices.signUpUser(
    //     context: context,
    //     name: _nameController.text,
    //     email: _emailController.text,
    //     password: _passwordController.text
    // );
  }
  void signInUser(){
    // authServices.signInUser(
    //     context: context,
    //     email: _emailController.text,
    //     password: _passwordController.text
    // );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: 370,
                  width: double.infinity,
                  decoration:const BoxDecoration(

                    image: DecorationImage(
                      image: AssetImage("assets/images/img.png",)
                      ,fit: BoxFit.fill,),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          top: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Hello Again !",style: GoogleFonts.poppins(color: Colors.white,shadows:  <Shadow>[
                          Shadow(
                          offset: Offset(1.0, 2.0),
                            blurRadius: 2.0,
                            color: Colors.white,
                          ),
                    ] ),).text.bold.size(32).make(),
                              Text("Welcome Back, We’ve been\n            waiting for you.",style: GoogleFonts.poppins(color: Colors.white),).text.bold.size(16).make(),

                            ],
                          ),
                        ),
                      ],
                  ),
                ),
                if(_auth==Auth.signup)
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height /2,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                          shape: BoxShape.rectangle
                      )     ,
                      child: Form(
                        key: _signUpFormKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Create your Account",style: GoogleFonts.lato(color: Color(0xff9163D7)),).text.size(24).bold.make().p(20),
                              Padding(
                                padding: EdgeInsetsDirectional.symmetric(horizontal: 50),
                                child: VxTextField(
                                  hint: "Username",
                                  controller: _nameController,

                                ).p(20),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.symmetric(horizontal: 50),
                                child: VxTextField(
                                  hint: "Email",
                                  controller: _nameController,

                                ).p(20),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.symmetric(horizontal: 50),
                                child: VxTextField(
                                  hint: "Mobile no.",
                                  controller: _nameController,

                                ).p(20),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.symmetric(horizontal: 50),
                                child: VxTextField(
                                  hint: "Password",
                                  controller: _nameController,


                                ).p(20),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25.0),

                                        )
                                    ),
                                minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width - 20, 49)),
                                  backgroundColor: MaterialStateProperty.all(Color(0xff9163D7))
                                ),
                                child: Text("Login",style: GoogleFonts.lato(color:Colors.white),).text.make(),
                                onPressed: (){
                                  if(_signUpFormKey.currentState!.validate()){
                                    signUpUser();
                                  }
                                },
                              ).p12(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an account ? ",style: GoogleFonts.lato(),).text.gray500.make(),
                                  TextButton(onPressed: (){
                                    setState(() {
                                      _auth = Auth.sigin;
                                    });

                                  }, child: const Text("LogIn",style: TextStyle(
                                    color: Color(0xff9163D7)
                                  ),))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ),
                  ),
                if(_auth==Auth.sigin)
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height /2,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                          shape: BoxShape.rectangle
                      )     ,
                      child: Form(
                        key: _signUpFormKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Login",style: GoogleFonts.lato(color: Color(0xff9163D7)),).text.size(24).bold.make().p(20),

                              Padding(
                                padding: EdgeInsetsDirectional.symmetric(horizontal: 50),
                                child: VxTextField(
                                  hint: "Email",
                                  controller: _nameController,
                                  onChanged: (value) {
                                    username = value;
                                  },

                                ).p(20),
                              ),

                              Padding(
                                padding: EdgeInsetsDirectional.symmetric(horizontal: 50),
                                child: VxTextField(
                                  hint: "Password",
                                  controller: _nameController,
                                  onChanged: (value) {
                                    pass = value;
                                  },


                                ).p(20),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25.0),

                                        )
                                    ),
                                    minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width - 20, 49)),
                                    backgroundColor: MaterialStateProperty.all(Color(0xff9163D7))
                                ),
                                child: Text("Login",style: GoogleFonts.lato(color:Colors.white),).text.make(),
                                onPressed: () async {
                                  await HttpService.login(username, pass, context);
                                },
                              ).p12(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account ? ",style: GoogleFonts.lato(),).text.gray500.make(),
                                  TextButton(onPressed: (){
                                    setState(() {
                                      _auth = Auth.signup;
                                    });

                                  }, child: const Text("SignUp",style: TextStyle(
                                      color: Color(0xff9163D7)
                                  ),))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ),
                  ),



              ],
            ),
          )

    );
  }
}