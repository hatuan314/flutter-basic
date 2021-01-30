void taoMang(int n,List arr){
  int max=arr[0];
  int min=arr[0];
  for(int i=0;i<n;i++){
    if(max<arr[i]){
      max=arr[i];
    }
    if(min>arr[i]){
      min=arr[i];
    }

  }
  print('Max=$max \nMin=$min');
}
void soChan(int n,List arr){
  print('so chan:');
  for(int i=0;i<arr.length;i++){
    if(arr[i]%2==0){
      print('${arr[i]}');
    }
  }
}
void chiaHet23(int n,List arr){
  for(int i=0;i<n;i++){
    if(arr[i]%2==0 && arr[i]%3==0){
      print('số chia hết cho 2 và 3 là:${arr[i]}');
    }
  }
}


void main()
{
  int n=3;
  List arr = new List(3);
  arr[0]=1;
  arr[1]=2;
  arr[2]=6;
  taoMang(n, arr);
  soChan(n, arr);
  chiaHet23(n, arr);
}
