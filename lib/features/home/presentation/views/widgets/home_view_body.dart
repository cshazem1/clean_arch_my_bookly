import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/fetch_newest_featured_books_cubit/fetch_newest_featured_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/build_snack_bar.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_book_list_view_bloc_consumer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }
bool isDone=false;
  int nextNumber = 1;
  Future<void> _onScroll() async {
    if (_scrollController.position.hasViewportDimension) {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentScrollPosition = _scrollController.position.pixels;
      final triggerPosition = maxScrollExtent * 0.7;

      if (currentScrollPosition >= triggerPosition) {
        // Trigger your cubit method here
        if(!isDone)
          {
            isDone=true;
       await BlocProvider.of<FetchNewestFeaturedBooksCubit>(context)
            .fetchFeatureNewestBooks(nextNumber++);
          isDone=false;
          }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const CustomAppBar(),
      Expanded(
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: const [
            SliverToBoxAdapter(
              child: FeaturedBookListViewBlocConsumer(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            FeaturedNewestBooksListViewBlocConsumer()
          ],
        ),
      )
    ]);
  }
}

class FeaturedNewestBooksListViewBlocConsumer extends StatelessWidget {
  const FeaturedNewestBooksListViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<BookEntity> book = [];
    return BlocConsumer<FetchNewestFeaturedBooksCubit,
        FetchNewestFeaturedBooksState>(
      listener: (context, state) {
        if (state is FetchNewestFeaturedBooksSuccess) {
          book.addAll(state.books);
        } else if (state is FetchNewestFeaturedBooksPaginationFailure) {
          showErrorSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is FetchNewestFeaturedBooksSuccess ||
            state is FetchNewestFeaturedBooksPaginationFailure ||
            state is FetchNewestFeaturedBooksLoading) {
          return BestSellerListView(book);
        } else if (state is FetchNewestFeaturedBooksFailure) {
          Text(state.error);
        }
        else if (state is FetchNewestFeaturedBooksPaginationFailure) {
          Text(state.error);
        }

          {return const SliverToBoxAdapter(child: CircularProgressIndicator());}
      },
    );
  }
}
