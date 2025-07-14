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
      body: Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.teal.shade50, Colors.teal.shade100],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(height: 10),
              buildTextField('Full Name', nameController, icon: Icons.person, validator: (value) {
                if (value == null || value.isEmpty) return "Please enter your name";
                return null;
              }),
              buildTextField('Email', emailController, keyboardType: TextInputType.emailAddress, icon: Icons.email, validator: (value) {
                if (value == null || !value.contains('@')) return "Please enter a valid email";
                return null;
              }),
              buildTextField('Phone Number', phoneController, keyboardType: TextInputType.phone, icon: Icons.phone, validator: (value) {
                if (value == null || value.length != 10) return "Please enter a valid phone number";
                return null;
              }),
              buildTextField('Address', addressController, maxLines: 3, icon: Icons.home, validator: (value) {
                if (value == null || value.isEmpty) return "Please enter your address";
                return null;
              }),
              buildTextField('PAN Card Number', panController, keyboardType: TextInputType.text, icon: Icons.credit_card, validator: (value) {
                if (value == null || value.length != 10) return "Please enter your valid PAN card number";
                return null;
              }),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 6,
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    ),
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
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.teal.shade700, fontWeight: FontWeight.w600),
        prefixIcon: icon != null ? Icon(icon, color: Colors.teal) : null,
        filled: true,
        fillColor: Colors.teal.shade50,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal.shade700, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

}




