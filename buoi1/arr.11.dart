import 'Matrix.dart';

main(List<String> args) {
  var matrix_1 = Matrix(3,2);
  var matrix_2 = Matrix(2,3);
  Matrix.empty().multiply(matrix_1.getMatrix(), matrix_2.getMatrix()).show();
}

