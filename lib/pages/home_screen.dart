import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hasan Shop",style: TextStyle(fontWeight: FontWeight.w700),),centerTitle: true,backgroundColor: Colors.deepOrangeAccent,foregroundColor: Colors.white,),
      body: Expanded(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 200,
            ),
            itemCount: 10,
            itemBuilder: (context,index){
              return Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(16)
                )

              );
            }
        ),
      ),
    );
  }
}
