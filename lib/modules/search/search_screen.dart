import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        List news = cubit.search;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Search',
            ),
            titleSpacing: 15,
            actions: [
              IconButton(
                onPressed: () {
                  cubit.changeMode();
                },
                icon: const Icon(Icons.dark_mode_outlined),
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: defaultFormField(
                  isDark: cubit.isDark,
                  controller: searchController,
                  validated: (value) {
                    value.isEmpty ? 'Search can\'t be empty' : null;
                  },
                  type: TextInputType.text,
                  title: 'Search',
                  prefix: const Icon(Icons.search),
                  function: (searchValue) {
                    cubit.getSearchNews(searchValue);
                  },
                ),
              ),
              Expanded(
                child: newsBuilder(news: news, isSearch: true),
              ),
            ],
          ),
        );
      },
    );
  }
}
