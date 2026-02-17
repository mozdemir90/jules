import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'number_repository.dart';
import '../domain/number_model.dart';

part 'number_provider.g.dart';

@riverpod
NumberRepository numberRepository(Ref ref) {
  return NumberRepository();
}

@riverpod
List<NumberModel> numberList(Ref ref) {
  return ref.watch(numberRepositoryProvider).getNumbers();
}
