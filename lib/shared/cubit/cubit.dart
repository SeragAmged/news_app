import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import '../../modules/businesses/businesses_screen.dart';
import '../../modules/science/science_screen.dart';
import '../../modules/sports/sports_screen.dart';
import '../cubit/states.dart';
import '../network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = const [
    BusinessesScreen(),
    SportsScreen(),
    ScienceScreen(),
    // SettingsScreen(),
  ];

  List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.cases_outlined),
      label: 'Business News',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer_outlined),
      label: 'Sports News',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science News',
    ),
  ];

  void changeNavBarState(index) {
    currentIndex = index;
    if (index == 0) {
      getBusinessNews();
    }
    if (index == 1) {
      getSportsNews();
    }
    if (index == 2) {
      getScienceNews();
    }
    emit(AppChangeNavBarState());
  }

  bool isDark = false;
  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putMode(key: 'isDark', value: isDark).then(
        (value) {
          emit(AppChangeModeState());
        },
      );
    }
  }

  List<dynamic> business = [];
  void getBusinessNews() {
    emit(AppBusinessLoadingState());

    if (business.isEmpty) {
      DioHelper.get(
        category: 'business',
      ).then(
        (value) async {
          business = value.data['articles'];
          emit(AppGetBusinessSuccessState());
        },
      ).catchError(
        (e) {
          emit(AppGetBusinessErrorState());
        },
      );
    } else {
      emit(AppGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];
  void getSportsNews() {
    emit(AppSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.get(
        category: 'sports',
      ).then(
        (value) {
          sports = value.data['articles'];
          emit(AppGetSportsSuccessState());
        },
      ).catchError(
        (e) {
          emit(AppGetSportsErrorState());
        },
      );
    } else {
      emit(AppGetSportsErrorState());
    }
  }

  List<dynamic> science = [];
  void getScienceNews() {
    emit(AppScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.get(
        category: "science",
      ).then(
        (value) {
          science = value.data['articles'];
          emit(AppGetScienceSuccessState());
        },
      ).catchError(
        (e) {
          emit(AppGetScienceErrorState());
        },
      );
    } else {
      emit(AppGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];
  void getSearchNews(String searchValue) {
    emit(AppSearchLoadingState());
    DioHelper.getSearch(
      value: searchValue,
    ).then(
      (value) {
        search = value.data['articles'];
        emit(AppGetSearchSuccessState());
      },
    ).catchError(
      (e) {
        emit(AppGetSearchErrorState());
      },
    );
  }
}
