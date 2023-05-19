import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'index.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ListState>(create: (_) => ListState())
];
