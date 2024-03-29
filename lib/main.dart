import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fteam_classes_project/presentation/form_page_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    final controller = FormPagecontroller();
    Color emailBorderColor = Colors.grey.shade300;
    final sixteenPadding = MediaQuery.of(context).size.width * 0.04;
    return ValueListenableBuilder<bool>(
        valueListenable: controller.themeMode,
        builder: (BuildContext context, bool value, child) {
          return MaterialApp(
            title: 'Formulário',
            theme: value
                ? ThemeData.light()
                : ThemeData(
                    brightness: Brightness.dark,
                  ),
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: value ? Colors.blueAccent : const Color.fromARGB(255, 71, 3, 83),
                title: const Text('Formulário'),
                leading: IconButton(
                  icon: value ? const Icon(Icons.brightness_2) : const Icon(Icons.brightness_1),
                  onPressed: () {
                    controller.setTheme();
                  },
                ),
              ),
              body: Padding(
                padding: EdgeInsets.all(sixteenPadding),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: sixteenPadding, bottom: sixteenPadding),
                      child: const Text(
                        'Nome:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        validator: controller.validateName,
                        decoration: InputDecoration(
                          hintText: 'Nome',
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: emailBorderColor, width: 1.0),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            if (controller.validateName(value) == null) {
                              emailBorderColor = const Color(0xFFE91e63);
                            } else {
                              emailBorderColor = Colors.grey.shade300;
                              controller.nameController.text = value;
                            }
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: sixteenPadding, bottom: sixteenPadding),
                      child: const Text(
                        'E-Mail:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp("[0-9@a-zA-Z.]")),
                        ],
                        validator: controller.validateEmail,
                        decoration: InputDecoration(
                          hintText: 'test@gmail.com',
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: emailBorderColor, width: 1.0),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onChanged: (value) {
                          controller.emailController.text = value;
                          setState(() {
                            if (controller.validateEmail(value) == null) {
                              emailBorderColor = const Color(0xFFE91e63);
                            } else {
                              emailBorderColor = Colors.grey.shade300;
                            }
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: sixteenPadding, bottom: sixteenPadding),
                      child: const Text(
                        'Telefone:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    TextFormField(
                      inputFormatters: [controller.phoneMask.formatter],
                      validator: controller.phoneMask.validator,
                      keyboardType: controller.phoneMask.textInputType,
                      decoration: InputDecoration(
                        hintText: controller.phoneMask.hint,
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: emailBorderColor, width: 1.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onChanged: (value) {
                        controller.phoneController.text = value;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: sixteenPadding),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              controller
                                  .validateName(controller.nameController.text);
                            },
                            child: const Text('Continuar')),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
