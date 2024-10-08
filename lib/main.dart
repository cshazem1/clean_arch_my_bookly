import 'package:bookly/core/utils/app_roter.dart';
import 'package:bookly/core/utils/simple_bloc_observer.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_feature_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'constans.dart';
import 'core/utils/functions/ServerLocated.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/manager/fetch_newest_featured_books_cubit/fetch_newest_featured_books_cubit.dart';

void main() async {
  serverLocatedSetup();
  Bloc.observer = SimpleBlocObserver();

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FetchNewestFeaturedBooksCubit(
                fetchNewestFeatureBooksUseCase: FetchNewestBooksUseCase(
                    homeRepo: getIt.get<HomeRepoImpl>()))
              ..fetchFeatureNewestBooks()),
        BlocProvider(
          create: (context) {
            return FetchFeaturedBooksCubit(
                featureBooksUseCase: FetchFeatureBooksUseCase(
                    homeRepo: getIt.get<HomeRepoImpl>()))
              ..fetchFeatureBooks();
          },
        ),

      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.montserratTextTheme(
              ThemeData.dark().textTheme,
            )),
      ),
    );
  }
}
