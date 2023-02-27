import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import '../../modules/businesses/businesses_screen.dart';
import '../../modules/science/science_screen.dart';
import '../../modules/settings/settings_screen.dart';
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
    SettingsScreen(),
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
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'settings',
    ),
  ];

  void changeNavBarState(index) {
    currentIndex = index;
    if (index == 1) {
      getSportsNews();
    }
    if (index == 2) {
      getScienceNews();
    }
    emit(AppChangeNavBarState());
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
          var news;
          for (news in business) {
            print(news['url']);
            news['urlToImage'] = await getFirstImageUrl(news['url']);
          }

          emit(AppGetBusinessSuccessState());
        },
      ).catchError(
        (e) {
          print(e);
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
          print(e);
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
          print(e);
          emit(AppGetScienceErrorState());
        },
      );
    } else {
      emit(AppGetScienceSuccessState());
    }
  }

  Future<String?> getFirstImageUrl(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final document = parser.parse(response.body);
      print(document.outerHtml);
      final imgElements = document.getElementsByTagName('img');
      if (imgElements.isNotEmpty) {
        final imgElement = imgElements.first;
        final imgUrl = imgElement.attributes['src'];
        return imgUrl;
      } else {
        throw Exception('No img elements found in HTML document');
      }
    } else {
      throw Exception('Failed to load HTML document');
    }
  }
}
