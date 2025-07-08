import 'package:flutter/material.dart';
import 'otp_page.dart';

class AadhaarPage extends StatelessWidget{
  final TextEditingController aadharController = TextEditingController();

  AadhaarPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aadhaar Details"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade400, Colors.teal.shade900],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
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
                  controller: aadharController,
                  keyboardType: TextInputType.number,
                  maxLength: 12,
                  decoration: InputDecoration(
                    labelText: "Aadhaar Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){
                    if (aadharController.text.length==12){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OTPPage()));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter a valid Adhaar number")));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    textStyle: TextStyle(fontSize: 18),
                  ), 
                  child: Text("Next"))
              ],
            ),
          ),
              ),
              
        ), 
      ),
    );
  }

  
}