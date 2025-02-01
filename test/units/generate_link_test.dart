import 'package:direct_link_generator/core/generate_link.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should generate a valid link', () {
    var input = "https://drive.google.com/file/d/EXEMPLO/view?usp=sharing";
    var expectedOutput = "https://drive.usercontent.google.com/download?id=EXEMPLO";
    expect(generateLink(input), expectedOutput);
  });

  test('Should generate a invalid link', () {
    var invalidLink = "https://exemplo.com";
    expect(generateLink(invalidLink), null);
  });
}

