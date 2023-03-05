abstract class AppStates {}

//App
class AppInitialState extends AppStates {}
class AppChangeNavBarState extends AppStates {}

//Business
class AppGetBusinessSuccessState extends AppStates {}
class AppGetBusinessErrorState extends AppStates {}
class AppBusinessLoadingState extends AppStates {}

//Sports
class AppGetSportsSuccessState extends AppStates {}
class AppGetSportsErrorState extends AppStates {}
class AppSportsLoadingState extends AppStates {}

//Science
class AppGetScienceSuccessState extends AppStates {}
class AppGetScienceErrorState extends AppStates {}
class AppScienceLoadingState extends AppStates {}

//modes
// class AppChangeModeState extends AppStates {}
// class AppDarkModeState extends AppStates {}
// class AppLightModeState extends AppStates {}
