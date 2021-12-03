import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const InAppNotification(
      child: MaterialApp(
      home: MyHomePage(title: 'Notification'),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:const Color(0xffEEEEEE),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/photo-1559825481-12a05cc00344.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    delay:const Duration(milliseconds: 1000),
                    duration:const Duration(milliseconds: 1000),
                    child: Text("Les Sauveteurs du Dunkerquois",textAlign: TextAlign.center, style: GoogleFonts.robotoSlab(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),),
                  ),  
                ],
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 1300),
              duration: const Duration(milliseconds: 1000),
              child: Padding(
                padding:const EdgeInsets.only(left: 145, right: 25, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                    onPressed: () async{
                      InAppNotification.show(
                        child: NotificationBody(),
                        context: context,
                        onTap: () => print('Notification tapped!'),
                      );
                    },
                    child: Text('Alert moi',style: GoogleFonts.robotoSlab(
                          fontSize: 25,),)
                  )
                ],
              ),
            ),
            ),
          ]),
      )
    );
  }
}
class NotificationBody extends StatelessWidget {
  final int count;

  NotificationBody({
    Key? key,
    this.count = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 12,
              blurRadius: 16,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  width: 1.4,
                  color: Colors.redAccent.withOpacity(0.2),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(children: [
                    Image.asset("assets/alert-icon-red-11.png",width: 80,height: 80,),
                    Expanded(child: Column(children: [
                    const   Text("Attention! bateau noyé",style: TextStyle(fontWeight: FontWeight.bold
                    ,fontSize: 20),),
                    const  Text("Etat grave")
                    ])
                  )
                ])
              ),
            ),
          ),
        ),
      ),
    );
  }
}
