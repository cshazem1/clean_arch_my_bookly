import 'package:bookly/core/utils/app_roter.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'constans.dart';

void main() async {
 await Hive.initFlutter();
 Hive.registerAdapter(BookEntityAdapter());
 await Hive.openBox<BookEntity>(KFeaturedBox);
 await Hive.openBox<BookEntity>(KNewestFeaturedBox);
  runApp(const Bookly());


}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,

      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          )),
    );
  }
}
