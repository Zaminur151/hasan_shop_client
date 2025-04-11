import 'package:flutter/material.dart';
import 'package:hasan_shop_client/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Hasan Shop",style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.deepOrangeAccent,
              fontSize: 20
            ),),
            SizedBox(height: 50,),
            TextField(
              controller: controller,
              cursorColor: Colors.orangeAccent,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_android),
                label: Text('Phone Number'),
                hintText: 'Enter phone number',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 1),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){},
                child: Text('Login')
            ),
            SizedBox(height: 10,),
            RichText(
              text:TextSpan(
                children: [
                  TextSpan(text: 'Don\'t have an account?',style: TextStyle(
                    color: Colors.black
                  )),
                  TextSpan(text: ' Register',style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w600
                  ))
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}
