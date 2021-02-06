import 'Matrix.dart';
main(List<String> args) {
  var matrix_a = Matrix(3,3);
  var matrix_b = Matrix(3,3);
  if(Matrix.empty().isInverse(matrix_a.getMatrix(), matrix_b.getMatrix()))
  {
    print('dung');
  }
  else
  {
    print('sai');
  }
}

