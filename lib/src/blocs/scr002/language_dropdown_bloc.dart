import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SCR002LangDropdownBloc
    extends Bloc<SCR002LangDropdownEvent, SCR002LangDropdownState> {
  SCR002LangDropdownBloc() : super(SCR002LangDropdownState(lang: 'vi'));

  @override
  Stream<SCR002LangDropdownState> mapEventToState(
      SCR002LangDropdownEvent event) async* {
    /// When user first navigate to settings screen
    if (event is SCR002LangDropdownEventStart) {
      var prefs = await SharedPreferences.getInstance();

      String lang;

      /// If [LANGUAGE_CODE] is null
      if (prefs.getString(AppConstants.LANGUAGE_CODE) == null) {
        lang = 'vi';
        yield SCR002LangDropdownState(lang: lang);
        return;
      }

      /// Get [LANGUAGE_CODE] from [SharedPreferences]
      lang = prefs.getString(AppConstants.LANGUAGE_CODE);
      yield SCR002LangDropdownState(lang: lang);
    }

    /// When user change language dropdown
    else if (event is SCR002LangDropdownEventChange) {
      yield SCR002LangDropdownState(lang: event.lang);
    }
  }
}
