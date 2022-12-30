import 'package:blesket/core/locator.dart';
import 'package:blesket/state/auth/AuthProvider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => locator.get<AuthProvider>())
];
