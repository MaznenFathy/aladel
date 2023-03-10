import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:quran_karim/constants.dart';
import 'package:quran_karim/getx/controller.dart';

import '../../services/auth.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text.dart';
import '../custom_widgets/custom_text_form_field.dart';
import 'login.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Auth controller = Get.put(Auth());

  String? downloadUrlImage;

  String? imageUrl = "";

  XFile? file;

  var titleController = TextEditingController();

  var timeController = TextEditingController();

  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.off(Login());
          },
        ),
      ),
      body: GetBuilder<Controller>(
        init: Controller(),
        builder: (getController) => Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 20, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          getController.pickImage();
                        },
                        child: Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: SizedBox(
                                height: height * 20 / 100,
                                child: getController.file == null ? Icon(Icons.add_a_photo,size: 100,color: primaryColor,): Image.file(
                                  File(getController.file!.path),
                                  fit: BoxFit.cover,
                                ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 6 / 100),
                      CustomTextFormField(
                        text: "??????????",
                        hint: "???????? ?????????? ??????????????",
                        onSave: (value) {
                          controller.name = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "name is required";
                          }
                        },
                      ),
                      SizedBox(height: height * 3 / 100),
                      CustomTextFormField(
                        controller: dateController,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.parse('2000-01-01'),
                            lastDate: DateTime.parse('2030-01-01'),
                          ).then((value) {
                            dateController.text =
                                DateFormat.yMMMd().format(value!);
                          });
                        },
                        prefixIcon: const Icon(Icons.calendar_today),
                        keyboardType: TextInputType.none,
                        text: "????????",
                        onSave: (value) {
                          controller.age = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Age is required";
                          }
                        },
                      ),
                      SizedBox(height: height * 4 / 100),
                      CustomTextFormField(
                        text: "???????????? ????????????????????",
                        hint: "???????? ?????????? ????????????????????",
                        onSave: (value) {
                          controller.email = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Email is required";
                          }
                        },
                      ),
                      SizedBox(height: height * 4 / 100),
                      CustomTextFormField(
                        text: "???????? ????????",
                        hint: "???????? ???????? ????????",
                        obscureText: true,
                        onSave: (value) {
                          controller.password = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password is required";
                          }
                        },
                      ),
                      SizedBox(height: height * 4 / 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DropdownSearch<String>(
                              popupProps: PopupProps.dialog(
                                showSearchBox: true,
                                showSelectedItems: true,
                                disabledItemFn: (String s) => s.startsWith('I'),
                              ),
                              items: quran!,
                              dropdownDecoratorProps:
                                  const DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  labelText: "???? ????????",
                                  hintText: "???????? ????????????",
                                ),
                              ),
                              onChanged: from,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "required field";
                                }
                              },
                            ),
                          ),
                          SizedBox(width: width * 3 / 100),
                          Expanded(
                            child: DropdownSearch<String>(
                              popupProps: PopupProps.dialog(
                                showSearchBox: true,
                                showSelectedItems: true,
                                disabledItemFn: (String s) => s.startsWith('I'),
                              ),
                              items: quran!,
                              dropdownDecoratorProps:
                                  const DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  labelText: "?????? ????????",
                                  hintText: "???????? ????????????",
                                ),
                              ),
                              onChanged: to,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "required field";
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 6 / 100),
                      CustomTextFormField(
                        keyboardType: TextInputType.number,
                        text: "?????? ????????????",
                        hint: "???????? ?????? ????????????",
                        obscureText: false,
                        onSave: (value) {
                          controller.mobile = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Mobile number is required";
                          }
                        },
                      ),
                      SizedBox(height: height * 4 / 100),
                      CustomTextFormField(
                        keyboardType: TextInputType.number,
                        text: "?????? ???????????? ????????",
                        hint: "???????? ?????? ???????????? ??????",
                        obscureText: false,
                        onSave: (value) {
                          controller.phone = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Mobile number is required";
                          }
                        },
                      ),
                      SizedBox(height: height * 4 / 100),
                      CustomTextFormField(
                        text: "?????? ??????????????",
                        hint: "???????? ?????? ??????????????",
                        obscureText: false,
                        onSave: (value) {
                          controller.school_name = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "school name is required";
                          }
                        },
                      ),
                      SizedBox(height: height * 6 / 100),
                      CustomTextFormField(
                        text: "?????????????? ??????????????",
                        hint: "???????? ?????????????? ?????????????? ????????????????",
                        obscureText: false,
                        onSave: (value) {
                          controller.city = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "city filed is required";
                          }
                        },
                      ),
                      SizedBox(height: height * 6 / 100),
                      // DropdownSearch<String>(
                      //   popupProps: PopupProps.dialog(
                      //     showSearchBox: true,
                      //     showSelectedItems: true,
                      //     disabledItemFn: (String s) => s.startsWith('I'),
                      //   ),
                      //   items: teachers!,
                      //   dropdownDecoratorProps:
                      //   const DropDownDecoratorProps(
                      //     dropdownSearchDecoration: InputDecoration(
                      //       labelText: "?????? ????????",
                      //       hintText: "???????? ????????????",
                      //     ),
                      //   ),
                      //   onChanged: teachersName,
                      // ),
                      DropdownSearch<String>(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "required field";
                          }
                        },
                        popupProps: PopupProps.dialog(
                          showSearchBox: true,
                          showSelectedItems: true,
                          disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        items: academic_year!,
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "?????????? ????????????????",
                            hintText: "???????? ?????????? ????????????????",
                          ),
                        ),
                        onChanged: academicYear,
                      ),
                      SizedBox(height: height * 6 / 100),
                      DropdownSearch<String>(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "required field";
                          }
                        },
                        popupProps: PopupProps.menu(
                          showSearchBox: false,
                          showSelectedItems: true,
                          disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        items: Academic_type!,
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "?????????? / ?????????? ????????????",
                            hintText: "???????? ??????????",
                          ),
                        ),
                        onChanged: academicType,
                      ),

                      SizedBox(height: height * 6 / 100),
                      Container(
                        padding: const EdgeInsets.only(top: 2.0),
                        width: width,
                        child: CustomButton(
                          text: "?????????? ????????",
                          onpressed: () async {
                            if (imageUrl == "") {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: const Text('?????????? ?????????? ???????? ????????????'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              _formKey.currentState!.save();
                              print("goooooooooooooooooooooooood");
                              if (_formKey.currentState!.validate()) {
                                controller.register();
                                uploadMyImage(imageUrl);
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(height: height * 4 / 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void uploadMyImage(String? value) {
    controller.image = value;
  }

  void from(String? value) {
    controller.from = value;
  }

  void to(String? value) {
    controller.to = value;
  }

  void academicType(String? value) {
    controller.academic_type = value;
  }

  void academicYear(String? value) {
    controller.academic_year = value;
  }

  void teachersName(String? value) {
    controller.teacher_name = value;
  }

  void cities(String? value) {
    controller.city = value;
  }
}
