import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'NewsStates.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(NewsAppInitialState());

    static NewsAppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeMode() {
    isDark = !isDark;
    print(isDark);
    emit(AppChangeModeState());
  }
}
