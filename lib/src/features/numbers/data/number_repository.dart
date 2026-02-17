import '../domain/number_model.dart';

class NumberRepository {
  List<NumberModel> getNumbers() {
    return [
      const NumberModel(digit: 1, word: 'One', colorValue: 0xFFFFCDD2),
      const NumberModel(digit: 2, word: 'Two', colorValue: 0xFFE1BEE7),
      const NumberModel(digit: 3, word: 'Three', colorValue: 0xFFC5CAE9),
      const NumberModel(digit: 4, word: 'Four', colorValue: 0xFFB3E5FC),
      const NumberModel(digit: 5, word: 'Five', colorValue: 0xFFB2DFDB),
      const NumberModel(digit: 6, word: 'Six', colorValue: 0xFFDCEDC8),
      const NumberModel(digit: 7, word: 'Seven', colorValue: 0xFFFFF9C4),
      const NumberModel(digit: 8, word: 'Eight', colorValue: 0xFFFFE0B2),
      const NumberModel(digit: 9, word: 'Nine', colorValue: 0xFFD7CCC8),
      const NumberModel(digit: 10, word: 'Ten', colorValue: 0xFFCFD8DC),
    ];
  }
}
