import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
// DI placeholder - generated later
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // ignores everything after this
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {}

Future<void> init() async => await configureDependencies();

// Extension for BlocObserver etc. if needed
