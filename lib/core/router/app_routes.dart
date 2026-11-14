class AppRoutes {
  AppRoutes._();

  static const home = '/home';
  static const weigh = '/weigh';
  static const history = '/history';
  static const items = '/items';
  static const settings = '/settings';

  static const devices = '/devices';
  static const reports = '/reports';
  static const manualEntry = '/manual-entry';
  static const transactionBase = '/transaction';
  static const transaction = '$transactionBase/:id';

  static const itemNew = '/item/new';
  static const itemEdit = '/item/:id/edit';

  static const weighing = '/weighing';

  static String weighWith(String type) => '$weighing?type=$type';

  static String manualEntryWith(String type) => '$manualEntry?type=$type';

  static String transactionDetail(String id) => '$transactionBase/$id';

  static String itemEditPath(String id) => '/item/$id/edit';

  static String itemNewWith({String? name, String? code, String? category}) {
    return Uri(
      path: itemNew,
      queryParameters: {
        if (name != null) 'name': name,
        if (code != null) 'code': code,
        if (category != null) 'category': category,
      },
    ).toString();
  }
}