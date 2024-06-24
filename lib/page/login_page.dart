import 'package:flutter/material.dart';
import 'package:pigfarming/widget/widget_design.dart';
import '../page/home_page.dart';
import '../widget/size_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color defaultColors = Colors.grey;
  Color borderBox = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: Drawer(),
        body: Container(
        alignment: Alignment.center,
           child:Center(
             child: WidgetDesign.boxShadow(
               child: Wrap(
                 children: [
                   _title(),
                   Container(color: borderBox,height: 1,width: MediaQuery.of(context).size.width,),
                   Container(
                     margin: EdgeInsets.only(top: 10),
                     decoration: BoxDecoration(),
                     child: Wrap(
                       crossAxisAlignment: WrapCrossAlignment.center,
                       children: [
                         _textDescription(),
                         _textField(text: "Username", password: false),
                         _textField(text: "Password",password: true),
                         _button()
                       ],
                     ),
                   )
                 ],
               )
             ),
         ),

      )
    );
  }


  _title(){
    double sizeWidth = SizeUtils.doubleSizeWidth( context: context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: Text("Log In", style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: sizeWidth*35/100,
          color: borderBox
      )),
    );
  }

  _textField({String? text, bool? password}){
    double sizeWidth = SizeUtils.doubleSizeWidth(textField: true, context: context);
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: sizeWidth,
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: password!=false?Icon(Icons.remove_red_eye):null,
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              label: Text(text!, style: TextStyle(fontSize: 15, color: defaultColors),)
          ),
        ),
      ),
    );
  }

  _textDescription(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: Text("Enter your user name and password below", style: TextStyle(
          fontSize: 15,
          color: defaultColors
      )),
    );
  }

  _button(){
    double sizeWidth = SizeUtils.doubleSizeWidth(textField: true,context: context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ButtonStyle(),
        onPressed: (){
          // Scaffold.of(context).openDrawer();
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sizeWidth*20/100),
          child: Text(
            'Log In',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}



