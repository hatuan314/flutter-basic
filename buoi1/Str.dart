


class Str
{
  String s;
  
  Str(this.s);
  Str.empty();
  int count_number_of_char(String s,String c)
  {
    
    int count=0;
    for(int i=0;i<s.length;i++)
    {
      if(s[i].compareTo(c)==0) count++;
    }
    return count;
  }
  String concate(String s1,String s2){
    return s1+s2;
  }
  
}