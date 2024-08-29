import 'package:flutter/material.dart';
import 'package:techtime/main.dart';
import 'package:techtime/pages/home.dart';
import 'package:techtime/main.dart';

class LandingPages extends StatefulWidget {
  const LandingPages({super.key});

  @override
  State<LandingPages> createState() => _LandingPagesState();
}

class _LandingPagesState extends State<LandingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: Column(
          children: [
            Material(
              elevation: 3.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset("images/techtimes.jpeg",
                height: MediaQuery.of(context).size.height/1.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tech",style: TextStyle(color: Colors.black,fontSize: 23.0,fontWeight: FontWeight.bold),),
                Text("Times",
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 23.0)
                  ,),
              ],
            ),

            Text("     Where Tech\nMeets Tomorrow.", style: TextStyle(color: Colors.black,fontSize: 26.0,fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Text(" Stay connected to the pulse of innovation with the\n   our in-depth technology coverage and discover \n     the future of technology—today and beyond.",style: TextStyle(color: Colors.black,fontSize: 13.0,fontWeight: FontWeight.w500),),

            SizedBox(height: 10.0,),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the second page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text('Get Started'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
