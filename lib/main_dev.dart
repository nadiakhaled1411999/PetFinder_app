import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/petfinder_app.dart';

//! Entry point for the development flavor of the PetFinder app.(4)
void main()async {
 WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const PetFinderApp());
}

