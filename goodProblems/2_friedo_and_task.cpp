#include <iostream>
#include<math.h>
using namespace std;

long long int compute(long long int a[],int n){
    double d = 0;
    for(int i=0;i<n;i++){
        d=d+log10(a[i]);
    }
    d=d/n;
    return (long long int)exp10(d) + 1;
}

int main()
{
    long long int a[100000];
    int n;
    cin>>n;
    for(int i=0;i<n;i++)
        cin>>a[i];
    cout<<compute(a,n)<<endl;
    return 0;
}
