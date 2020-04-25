import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  String value='';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            //TO Decorate the container
            decoration: BoxDecoration(
              // FOr multiple colors
              gradient:LinearGradient(
                colors: [
                  Colors.deepOrange,
                  Colors.orangeAccent
              ],
                begin:Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
              borderRadius: BorderRadius.only(
                bottomLeft : Radius.circular(100)
              )
            ),
            height: height*7/20,
            width: width,
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              elevation: 10,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.mail),
                  border: InputBorder.none
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30 , right: 30),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20)
                )
              ),
              elevation: 10,
              child: TextField(
                onChanged: (v){
                  setState(() {
                    value = v;
                  });
                },
                obscureText: obscureText,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.vpn_key),
                  suffixIcon: IconButton(
                    icon: Icon(obscureText?Icons.visibility:Icons.visibility_off),
                    onPressed: (){
                      setState(() {
                        obscureText = !obscureText;
                      });
                    }),
                  border: InputBorder.none
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30,right:30),
            width: width,
            height: 10,
            color: getColor(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top:20
            ),
            child: Text('Forgot password ?'),
          ),
          SizedBox(
            height: 80,
          ),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20)
              )
            ),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors:[
                    Colors.orangeAccent,
                    Colors.deepOrange,
                  ]
                )
              ),
              width: width-60,
              child: Center(
                child: Text('LOGIN',
                style: TextStyle(
                  color: Colors.white
                ),
                )
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Dont have an account ? '),
              Text('Register',style: TextStyle(
                color: Colors.orange
              ),)
            ],
          )
        ],
      ),
    );
  }

  Color getColor() {
    if(value.isEmpty)
      return Colors.transparent;
    else if(value.length<6)
      return Colors.red;
    else if(value.length<8)
      return Colors.orange;
    else
      return Colors.green;
  }
}
