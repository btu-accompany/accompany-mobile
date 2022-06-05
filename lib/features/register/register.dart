import 'package:accompany/features/register/register_view_model.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}
//todo register view model oluşturulacak
class _RegisterViewState extends RegisterViewModel{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/accompanytema.png',
                ),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Image border
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(70), // Image radius
                      child: const Image(
                        image: AssetImage(
                          'assets/accompany_logo.png',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 1,
                          controller: phoneNumberController,
                          obscureText: false,
                          onChanged: null,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Phone Number",
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 1,
                          controller: nameController,
                          obscureText: false,
                          onChanged: null,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Name",
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                                            Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 1,
                          controller: surnameController,
                          obscureText: false,
                          onChanged: null,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Surname",
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                          value: selectedItem,
                          items: departmanlar
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  ))
                              .toList(),
                          onChanged: (item) =>
                              setState(() => selectedItem = item),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 1,
                          controller: emailController,
                          obscureText: false,
                          onChanged: null,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Mail Adress",
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 2,
                          controller: addressController,
                          obscureText: false,
                          onChanged: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              hintText: "Home Adress",
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 1,
                          controller: passwordController,
                          obscureText: true,
                          onChanged: null,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Password",
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            RegistersendButtonClicked();
                            
                          },
                          child: const Text("Register"),
                          
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey.shade200,
                              onPrimary: Colors.green.shade700,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
