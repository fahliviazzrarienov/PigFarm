import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pigfarming/widget/model.dart';

class DrawerDesignWidget extends StatefulWidget {
  const DrawerDesignWidget({super.key});

  @override
  State<DrawerDesignWidget> createState() => _DrawerDesignWidgetState();
}

class _DrawerDesignWidgetState extends State<DrawerDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Define your drawer content here
      child: Column(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: CupertinoColors.systemGrey2,
                                blurRadius: 2,
                                offset: Offset(0, 0),)
                            ],
                          ),
                          padding: EdgeInsets.all(2),
                          child: Icon(Icons.person_rounded, size: MediaQuery.of(context).size.width*20/100,)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width*30/100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("User Name", textAlign: TextAlign.start,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey)),
                              Text("Sammy", textAlign: TextAlign.start,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                            ],
                          ))
                    ],
                  ),
                  IconButton(onPressed: () {

                  },
                    icon: Icon(Icons.edit),
                    hoverColor: Colors.orange,
                  )
                ],
              )
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                        children: generateUnderlinedTextList(count: cattle)
                    ),Column(
                        children: generateUnderlinedTextList(count: cattle)
                    )
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }

  Model

  List<Widget> generateUnderlinedTextList({required List count}) {
    return List.generate(count.length, (index) {
      return Visibility(
        visible: count[index].childOf!=null?count[index].isVisible:true,
        child: ListTile(
          onTap: () {
           //print(count[index].childOf.toString());
          },
          leading: Icon(count[index].icon),
          title: Text(count[index].text),
          trailing: count[index].childOf!=null?null:IconButton(
            icon: Icon( count[index].isVisible?Icons.arrow_drop_down_outlined:Icons.arrow_drop_up_sharp),
            onPressed: () {
              // print(count[index].childOf.toString());
              //count.where((element) => element['parrent']==count[index].text);
              List<Model> filteredModels = cattle.where((model) => model.childOf == count[index].text).toList();


              setState(() {
                count[index].isVisible = !count[index].isVisible;
                filteredModels.forEach((model) {
                  model.isVisible = !model.isVisible;
                });
              });
            },
          ),
        ),
      );
    });
  }
  List<Model> cattle = [
    Model(icon: Icons.grid_view_rounded, text: "Cattle", isVisible: true, childOf: null),
    Model(icon: Icons.grid_view_rounded, text: "Cattle", isVisible: true, childOf: "Cattle"),
    Model(icon: Icons.grid_view_rounded, text: "Dog", isVisible: true, childOf: null),
    Model(icon: Icons.grid_view_rounded, text: "Puppy", isVisible: true, childOf: "Dog"),
  ];

}
