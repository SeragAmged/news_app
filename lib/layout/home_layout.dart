import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/Bloc/NewsCubit.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusinessNews(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'News App',
              ),
              titleSpacing: 15,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    NewsAppCubit.get(context).changeMode();
                  },
                  icon: const Icon(Icons.dark_mode_outlined),
                ),
                // IconButton(
                //   onPressed: () {
                //     cubit.darkMode();
                //   },
                //   icon: const Icon(Icons.dark_mode_outlined),
                // ),
                // IconButton(
                //   onPressed: () {
                //     cubit.lightMode();
                //   },
                //   icon: const Icon(Icons.light_mode_outlined),
                // ),
              ],
            ),
            body:
                // PageView(
                //   children: cubit.screens,
                // ),
                cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.navBarItems,
              onTap: (index) {
                cubit.changeNavBarState(index);
              },
            ),
          );
        },
      ),
    );
  }
}
