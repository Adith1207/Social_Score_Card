import 'package:flutter/material.dart';
import './aadhar.dart';

void main() {
  runApp(MyFormApp());  // function is the entry point
}

class MyFormApp extends StatelessWidget{
  const MyFormApp({super.key});


  @override
  Widget build(BuildContext context){

    //MaterialApp provides material design components.
    return MaterialApp(
      title: 'Personal detail Form',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto'
        ), // Sets the primary color (teal).
      home: UserForm(), //The first screen is UserForm().
      debugShowCheckedModeBanner: false,
    );
  }
}

class UserForm extends StatefulWidget{
  const UserForm({super.key});

  @override

  //Creates a state class called _UserFormState.
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final formKey = GlobalKey<FormState>();
  
  //text controllers:
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController panController = TextEditingController();

  final TextStyle labelStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  void submitForm(){
    if (formKey.currentState!.validate()){
      if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>AadhaarPage()),
      );
    }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User data", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'poppins', fontSize: 30),),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade400, Colors.teal.shade900],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
              )
          ),
        ),
        ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
          child:Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formKey,
            child: ListView(
              children: [
                buildTextField('Full Name', nameController, validator: (value){
                  if (value==null || value.isEmpty) return "please Enter your Name";
                  return null; 
                }),


                buildTextField('Email', emailController, keyboardType: TextInputType.emailAddress, validator: (value){
                  if (value==null || !value.contains('@')) return "please Enter a valid Email";
                  return null; 
                }),


                buildTextField('Phone Number', phoneController, keyboardType: TextInputType.phone, validator: (value){
                  if (value==null || value.length!=10) return "please Enter a valid phone num";
                  return null; 
                }),



                buildTextField('Address', addressController, maxLines: 3,validator: (value){
                  if (value==null || value.isEmpty) return "please Enter your Address";
                  return null; 
                }),


                buildTextField('panCard num', panController, keyboardType: TextInputType.number,validator: (value){
                  if (value==null || value.length!=10) return "please Enter your valid aadhaar num";
                  return null; 
                }),

                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: submitForm, 
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    textStyle: TextStyle(fontSize: 18)
                  ),
                  child: Text('Next'),
                )
              ],
            ),
                ),
              ) 
        ),
      ),
    );
  }

  Widget buildTextField(
  String label,
  TextEditingController controller, {
  TextInputType keyboardType = TextInputType.text,
  String? Function(String?)? validator,
  int maxLines = 1,
  IconData? icon,
  }) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: labelStyle,
          prefixIcon: icon != null ? Icon(icon, color: Colors.teal) : null,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  

}




