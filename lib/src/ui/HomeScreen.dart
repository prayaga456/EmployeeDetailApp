import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task_employee/src/models/Employee.dart';
import 'package:flutter_task_employee/src/others/localData.dart';
import 'package:flutter_task_employee/src/ui/DetailScreen.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> resultList=[];

  TextEditingController controller = new TextEditingController();

  List<dynamic> _searchResult = [];

  bool searchClick = false;

  @override
  void initState() {
    getEmployeeData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){
            setState(() {
              searchClick=true;
            });
          })
        ],
      ),
body: resultList.isEmpty?Center(child: CircularProgressIndicator()): Column(
  children: [
    searchClick? Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Card(
          child:  ListTile(
            leading:  Icon(Icons.search),
            title:  TextField(
              controller: controller,
              decoration:  InputDecoration(
                  hintText: 'Search', border: InputBorder.none),
              onChanged: onSearchTextChanged,
            ),
            trailing:  IconButton(icon:  Icon(Icons.cancel), onPressed: () {
              controller.clear();
              onSearchTextChanged('');
            },),
          ),
        ),
      ),
    ):Container(),
        Expanded(
      child:   ListView.builder(

          itemCount: resultList.length,

          itemBuilder: (context,index)=>Container(

        child: ListTile(

          title: Text(resultList[index]['name']),

          subtitle: Text(resultList[index]['company']!=null?resultList[index]['company']['name']:''),

          leading: Image.network(resultList[index]['profile_image']!=null?resultList[index]['profile_image']:'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png'),

          onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(employeeDetails: resultList[index],)));

          },

        ),

      )),
    ),
  ],
),
    );
  }

  Future getEmployeeData() async {
var response = await http.get('https://www.mocky.io/v2/5d565297300000680030a986');
// print('RESPONSE:${response.body}');
    if(response.statusCode==200){
      setState(() {
        resultList= jsonDecode(response.body);
      });
    }
    else{
      setState(() {
        resultList=jsonDecode(localVar.toString());
      });
    }
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
  }
}
