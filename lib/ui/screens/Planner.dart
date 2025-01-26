import 'package:flutter/material.dart';



class Planner extends StatefulWidget {
  const Planner({Key? key}) : super(key: key);

  @override
  State<Planner> createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff296e48),

      child: Center(
        child: Text('Planner ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
      )
    );
  }
}
