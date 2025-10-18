import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
      //   ),
      // ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Back Arrow
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 22.w,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // Title
                  Text(
                    'Sign up',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // Text
                  Text(
                    'Create an account to continue!',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 32.h),

                  // Full Name Input
                  Text('Full Name', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4.h),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 12.w,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Email Input
                  Text('Email', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4.h),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 12.w,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Date Input
                  Text('Date of Birth ', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4.h),
                  TextField(
                    readOnly: true,
                    controller: TextEditingController(text: '18/03/2024'),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: SvgPicture.asset(
                          'lib/assets/icons/calendar.svg',
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 12.w,
                      ),
                    ),
                    onTap: () async {
                      FocusScope.of(
                        context,
                      ).requestFocus(FocusNode()); // close keyboard
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          // _dateController.text =
                          // "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                        });
                      }
                    },
                  ),
                  SizedBox(height: 16.h),

                  // Phone Number Input
                  Text('Phone Number', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4.h),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '901787337',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Color(0xFF1D61E7), width: 1.5),
                      ),
                    ),
                    dropdownIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    flagsButtonMargin: EdgeInsets.only(left: 8.w, right: 4.w),
                    disableLengthCheck: true,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r)
                    ),
                    initialCountryCode: 'UZ',
                    onChanged: (phone) => print(phone),
                  ),
                  SizedBox(height: 16.h),

                  // Set Password Input
                  Text('Set Password', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4.h),
                  TextField(
                    obscureText: !_isPasswordVisible,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        iconSize: 18,
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 12.w,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Register button
                  SizedBox(
                    height: 48.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D61E7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Register', style: TextStyle(fontSize: 16.sp)),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Log In link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
