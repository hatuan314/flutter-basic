import 'dart:io';
class Matrix
{
  List<List> matrix = new List.empty(growable: true);
  int m;
  int n;
  Matrix(this.m,this.n)
  {
    for(int i = 0; i<m;i++)
    {
      List row = new List.empty(growable : true);
      for(int j =0;j<n;j++)
      {
        stdout.write('matrix[${i+1}][${j+1}] = ');
        row.add(int.parse(stdin.readLineSync()));
      }
      matrix.add(row);
    }
  }
  Matrix.copy(List<List> matrix)
  {
    this.matrix=matrix;
    m=matrix.length;
    n=matrix[0].length;
  }
  Matrix.empty()
  {
    m=0;
    n=0;
  }
  Matrix multiply(List<List>matrix_1,List<List> matrix_2)
  {
    if(matrix_1[0].length!=matrix_2.length)
    {
      print('khong the nhan');
      return null;
    }
    var result = List<List>.filled(matrix_1.length,List());
    for(int i=0;i<matrix_1.length;i++)
    {
      var row =List<int>.filled(matrix_2[0].length,0);
      for(int j=0;j<matrix_2[0].length;j++)
      {
        for(int k=0;k<matrix_2.length;k++)
        {
          row[j] =row[j]+matrix_1[i][k]*matrix_2[k][j];
        }
      }
      result[i]=row;
    }
    return Matrix.copy(result);
  }
  bool isInverse(List<List>matrix_1,List<List>matrix_2)
  {
    if(matrix_1.length!=matrix_2.length||matrix_1[0].length!=matrix_2[0].length)return false;
    var multiplied_matrix = multiply(matrix_1, matrix_2).getMatrix();
    for(int i=0;i<matrix_1.length;i++)
    {
      if(multiplied_matrix[i][i]!=1) return false;
      int sum=0;
      multiplied_matrix[i].forEach((element) {sum+=element;});
      if(sum!=1)return false;
    }
    return true;
  }

  void show()
  {
    matrix.forEach((element) {print(element);});
  }

  void sort()
  {
    List cache_arr = new List.empty(growable:true);
    matrix.forEach((element) {element.forEach((element) {cache_arr.add(element);});});
    cache_arr.sort();
    int k=0;
    for(int i=0;i<m;i++)
    {
      for(int j =0 ;j<n;j++)
      {
        matrix[i][j]=cache_arr[k];
        k++;
      }
    }
  }

  List<List> getMatrix()
  {
    return matrix;
  }

  bool setAt(int i,int j,int value)
  {
    try
    {
      matrix[i][j]=value;
      return true;
    } on Exception catch(_){
      return false;
    }
  }

  int getAt(int i,int j)
  {
    return matrix[i][j];
  }
}