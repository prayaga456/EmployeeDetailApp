import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  var employeeDetails;
  DetailScreen({this.employeeDetails});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.employeeDetails['name']}'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Center(child: Image.network(widget.employeeDetails['profile_image']!=null?widget.employeeDetails['profile_image']:'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${widget.employeeDetails['name']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ),
              myText('E-mail: ${widget.employeeDetails['email']}'),
              Card(

                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myText('User name: '),
                        myText('Address: '),
                        myText('Phone: '),
                        myText('Website: '),

                      ],
              ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myText('${widget.employeeDetails['id']}'),
                          myText('${widget.employeeDetails['username']}'),
                          myText('${widget.employeeDetails['phone']}'),
                          myText('${widget.employeeDetails['website']}'),

                        ],
                      ),
                    ],
                  ),
                ),),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Company Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      myText(widget.employeeDetails['company']!=null?widget.employeeDetails['company']['name']:''),
                      myText(widget.employeeDetails['company']!=null?widget.employeeDetails['company']['catchPhrase']:''),
                      myText(widget.employeeDetails['company']!=null?widget.employeeDetails['company']['bs']:''),
                      Row(children: [Expanded(child: Container())],)
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      myText(widget.employeeDetails['address']!=null?widget.employeeDetails['address']['street']:''),
                      myText(widget.employeeDetails['address']!=null?widget.employeeDetails['address']['suite']:'',),
                      myText(widget.employeeDetails['address']!=null?widget.employeeDetails['address']['city']:''),
                      myText(widget.employeeDetails['address']!=null?widget.employeeDetails['address']['zipcode']:''),
                      Row(children: [Expanded(child: Container())],)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myText(String s) {
    return Text(s,style: TextStyle(fontSize: 20),);
  }
}
