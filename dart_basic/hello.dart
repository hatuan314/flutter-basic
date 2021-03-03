import 'dart:io';
import 'dart:core';
main () {
  int n;
  int d;
  int i = 0;
  n = int.parse(stdin.readLineSync());

  List l = [n];
  for (i = 0; i < n; i++) {
    print("${i} insert element?\n");
    d = int.parse(stdin.readLineSync());
    l.add(d);
  }

  //return max of an array
  int max = l.elementAt(0);
  for (int i = 1; i < n; i++) {
    if (l.elementAt(i) > max) {max = l.elementAt(i);}
  }
  print("max = ${max}");


  //return min of an array
  int min = l.elementAt(0);
  for (int i = 1; i < n; i++) {
  if (l.elementAt(i) < min) {min = l.elementAt(i);}
  }
  print("\n");
  print("min = ${min}");
  
  
  //return the subarray of even numbers
  int s = l.elementAt(0);
  List evenno = [];
  for (s in l) {
    if (s % 2 == 0) {
      evenno.add(s);
    }
  }
  print("\n even array");
  for (s in evenno) {
    print("${s}, ");
  }

  //return the subarray of numbers divisible by 6
  //honestly that's kinda easy so, nah


  //return the subarray of numbers that are the divisors of MAX
  List maxdivisors = [];
  for (s in l) {
    if (max % s == 0) {
      maxdivisors.add(s);
    }
  }
  print("-------------------------");
  for (s in maxdivisors) {
    print("${s}, ");
  }
}