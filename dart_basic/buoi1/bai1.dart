
main(){
  List arr = [1,2,3,4,5];
  int min = arr[0], max = arr[0];
  List arrChan = [], arrLe = [], arr2v3 = [];
  for (int i=0; i<arr.length; i++){
    if (arr[i] <= min)
      min = arr[i];
    if (arr[i] >= max)
      max = arr[i];
    if (arr[i] % 2 == 0){
      arrChan.add(arr[i]);
      if (arr[i] % 3 == 0)
        arr2v3.add(arr[i]);
    }
    else
      arrLe.add(arr[i]);
  }
  List arrBoiMin = [], arrUocMax = [];
  for (int i=0; i<arr.length; i++){
    if (arr[i] % min == 0)
      arrBoiMin.add(arr[i]);
    if (max % arr[i] == 0)
      arrUocMax.add(arr[i]);
  }

  print('max: ${max}');
  print('min: ${min}');
  print('nguyen chan: ${arrChan}');
  print('nguyen le: ${arrLe}');
  print('nguyen %2==0 && %3==0: ${arr2v3}');
  print('uoc max: ${arrUocMax}');
  print('boi min: ${arrBoiMin}');
}