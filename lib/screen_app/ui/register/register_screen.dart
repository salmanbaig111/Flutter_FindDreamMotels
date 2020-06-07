import 'package:findingmotels/config_app/sizeScreen.dart';
import 'package:findingmotels/screen_app/custom_widget/clip_path_custom/registerClipPath.dart';
import 'package:findingmotels/screen_app/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String imageUrl = 'assets/registerSvg.svg';
  TextEditingController controllerEmail;
  TextEditingController controllerPassword;

  @override
  void initState() {
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(211, 220, 240, 1),
      body: Stack(
        children: <Widget>[
          buildBackground(height),
          buildPageView(height, width),
        ],
      ),
    );
  }

  Widget buildPageView(double height, double width) {
    return Positioned.fill(
      child: Column(
        children: <Widget>[
          buildTitleImage(height),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: height * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  buildTitleEmail(width),
                  buildTFFEmail(width),
                  buildTitlePass(width),
                  buildTFFPass(width),
                  buildRegisterEmail(width, height),
                  buildLoginText(height)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTitleEmail(double width) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        margin: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        width: width,
        child: Text("Email/PhoneNumber",
            textAlign: TextAlign.start, style: StyleText.content14Black400),
      ),
    );
  }

  Widget buildTFFPass(double width) {
    return Container(
        margin: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        child: TextFormField(
          obscureText: true,
          controller: controllerPassword,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding:
                const EdgeInsets.only(left: 16.0, bottom: 16.0, top: 16.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          style: new TextStyle(
            fontSize: 16.0 * Size.scaleTxt,
            fontFamily: "Poppins",
          ),
        ));
  }

  Widget buildTitlePass(double width) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        margin: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        width: width,
        child: Text("Password",
            textAlign: TextAlign.start, style: StyleText.content14Black400),
      ),
    );
  }

  Widget buildTFFEmail(double width) {
    return Container(
        margin: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        child: TextFormField(
          controller: controllerEmail,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding:
                const EdgeInsets.only(left: 16.0, bottom: 16.0, top: 16.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          style: new TextStyle(
            fontSize: 16.0 * Size.scaleTxt,
            fontFamily: "Poppins",
          ),
        ));
  }

  Container buildTitleImage(double height) {
    return Container(
      color: Colors.transparent,
      height: height * 0.5,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: (Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0 * Size.scaleTxt,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: SvgPicture.asset(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ],
      )),
    );
  }

  Widget buildLoginText(double height) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.only(top: height * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Already have an account? ",
                style: StyleText.subhead18Black500),
            Text("Login", style: StyleText.subhead18GreenMixBlue)
          ],
        ),
      ),
    );
  }

  Widget buildRegisterEmail(double width, double height) {
    return Container(
      width: width * 0.75,
      height: height * 0.08,
      margin: EdgeInsets.only(top: height * 0.035),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.red,
      ),
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FittedBox(child: Text("Register", style: StyleText.header20White)),
        ],
      ),
    );
  }

  Widget buildLoginFacebook(double width, double height) {
    return Container(
      width: width * 0.75,
      height: height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            child: Container(
              width: 25,
              height: 25,
              child: Image.asset(
                'assets/facebookIcon.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text("Register with Facebook",
                      style: StyleText.header20Black)))
        ],
      ),
    );
  }

  Widget buildLoginGoogle(double width, double height) {
    return Container(
      width: width * 0.75,
      height: height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            child: Container(
              width: 25,
              height: 25,
              child: Image.asset(
                'assets/googleIcon.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 13.0),
          FittedBox(
              child:
                  Text("Register with Google", style: StyleText.header20Black))
        ],
      ),
    );
  }

  Widget buildBackground(double height) {
    return Positioned.fill(
      child: AnimatedContainer(
        height: height * 0.8,
        duration: Duration(milliseconds: 10000),
        curve: Curves.ease,
        child: ClipPath(
          child: Container(
            color: Color.fromRGBO(9, 92, 113, 1),
          ),
          clipper: RegisterClipPath(),
        ),
      ),
    );
  }
}
