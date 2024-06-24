import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetDesign{

  static PreferredSizeWidget appbarHomepage({required BuildContext context}){
    return AppBar(
      elevation: 0, 
      iconTheme: IconThemeData(color: Colors.white),
      // actions: [
      //   IconButton(icon: Container(
      //       decoration: BoxDecoration(
      //       borderRadius: BorderRadius.all(Radius.circular(50)),
      //       border: Border.all(color: Colors.white, width: 2),
      //       ),
      //       padding: EdgeInsets.all(2),
      //       child: Icon(Icons.person_rounded)), onPressed: () => Scaffold.of(context).openDrawer()),
      // ],
    );
  }

  static Container boxShadow({required Widget? child, bool? borderColor}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          boxShadow: borderColor!=null?borderColor!=false?null:[
            BoxShadow(
              color: CupertinoColors.systemGrey2,
              blurRadius: borderColor!=null?borderColor!=false?2:4:4,
              offset: borderColor!=null?borderColor!=false?Offset(0,3):Offset(0, 0):Offset(0, 0),),
          ]:[
            BoxShadow(
              color: CupertinoColors.systemGrey2,
              blurRadius: borderColor!=null?borderColor!=false?2:4:4,
              offset: borderColor!=null?borderColor!=false?Offset(0,3):Offset(0, 0):Offset(0, 0),),
          ],
          color: Colors.white,
        border: borderColor!=null?borderColor!=false?
        Border(
          left: BorderSide(color: Colors.grey),
          right: BorderSide(color: Colors.lightGreen.shade900),
        ):null: null,
      ),
      child: child,
    );
  }

  static tileMenu({required bool border, required IconData icon, required String text}){
    return Padding(
      padding: EdgeInsets.only(top: border?2:20),
      child: WidgetDesign.boxShadow(
          borderColor: border,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 30, color: Colors.orange),
                    SizedBox(width: 10,),
                    Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, )),
                  ],
                ),
                border?SizedBox():Icon(Icons.arrow_drop_down_outlined, size: 30, color: Colors.black),
              ],
            ),
          )
      ),
    );
  }


}