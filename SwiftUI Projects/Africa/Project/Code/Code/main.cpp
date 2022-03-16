#include<iostream>
#include<math.h>
#define int long long

using namespace std;
int32_t main()
{
  long long first,second,S=0;
  cin>>first>>second;
  
  for(int i=ceil(sqrt(first)); i*i <= second; ++i)
  {
      int r=i*i;
      int l=r;
      int count=0;
      
      if(r%10==0){continue;}
      while(l!=0)
      {
          int p=l%10;
          count=count*10+p;
          l/=10;
      }
 
      int s=sqrt(count);
      if(s*s==count)S++;
  }
  cout<<S;
}
