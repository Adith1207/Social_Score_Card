import 'package:flutter/material.dart';

class OTPPage extends StatelessWidget{
  final TextEditingController OtpController = TextEditingController();

  OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade400, Colors.teal.shade900],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              )
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
          elevation: 4,
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: SizedBox(
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                TextFormField(
                  controller: OtpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    labelText:"Enter OTP",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)) 
                  ),
                ),

                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){
                    //Empty Logic (Nothing will happen)
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
              ),
              
    );
  }
  
}