import 'package:flutter/material.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          Text("Dashboard"),
          kSizedbox20,
          Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Sales Information",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      kSizedbox10,
                      SizedBox(
                        height: 110,

                        child: ListView(
                        scrollDirection: Axis.horizontal,
                          children: [
                            Container(

                              padding: EdgeInsets.symmetric(horizontal: 25 ,vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.red.withValues(alpha: .7),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [Text("230",style: TextStyle(fontSize: 24,color: Colors.white),),
                                  kSizedbox5,
                                  Text("data",style: TextStyle(fontSize: 18,color: Colors.white),)],
                              ),
                            ),
                            kSizedbox10,Container(

                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.red.withValues(alpha: .7),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [Text("230",style: TextStyle(fontSize: 24,color: Colors.white),),
                                  kSizedbox5,
                                  Text("data",style: TextStyle(fontSize: 18,color: Colors.white),)],
                              ),
                            ),
                            kSizedbox10,Container(

                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.red.withValues(alpha: .7),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [Text("230",style: TextStyle(fontSize: 24,color: Colors.white),),
                                  kSizedbox5,
                                  Text("data",style: TextStyle(fontSize: 18,color: Colors.white),)],
                              ),
                            ),
                            kSizedbox10,Container(

                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.red.withValues(alpha: .7),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [Text("230",style: TextStyle(fontSize: 24,color: Colors.white),),
                                  kSizedbox5,
                                  Text("data",style: TextStyle(fontSize: 18,color: Colors.white),)],
                              ),
                            ),
                            kSizedbox10,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
                ],
              ),
        ));
  }
}
