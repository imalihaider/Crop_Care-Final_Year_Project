
import 'package:flutter/material.dart';
import 'package:plantdetectionfyp/ui/screens/farmer.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Detail Page',style: TextStyle(color: Colors.white),),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {  Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const Farmer())); },
            );
          },
        ),
      ),
      backgroundColor: Color(0xff296e48),
      body: Center(
        child: Text('Detail page',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
      ),
    );
  }
}
