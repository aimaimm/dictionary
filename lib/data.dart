import 'package:shared_preferences/shared_preferences.dart';

List most = [
  {'name': 'Adore'},
  {'name': 'Crush'},
  {'name': 'Devotion'},
  {'name': 'Fall in love'},
  {'name': 'Some day'},
];

void historyword() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String ?engword = prefs.getString('k_wordeng');
      print(engword);
    }

List History = [
  {'name': 'Adore'},
  {'name': 'Crush'},
  {'name': 'Devotion'},
  {'name': 'Fall in love'},
  {'name': 'Care'},
  {'name': 'Candel'},
  {'name': 'Beloved'},
  {'name': 'Mind'},
];

List category = [
  {'cat_name': 'Adore','isChecked':false},
  {'cat_name': 'Adore','isChecked':false},
  {'cat_name': 'Adore','isChecked':false},
];
