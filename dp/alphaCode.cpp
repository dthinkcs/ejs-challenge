#include <bits/stdc++.h>
#define ull unsigned long long int
#define M 1000000007
using namespace std;

ull numberOfPossibleDecodings(string str, unordered_map<string, int> ans)
{
  if (str.empty())
    return 0;

  if (ans.contains(str))
    return ans[str];

  ull smallOuput1 = numberOfPossibleDecodings(str.substr(1), ans);
  ull smallOuput2;
  if ( str.length() > 1 && stoi(str.substr(0, 2)) <= 26 )
  	smallOutput2 = numberOfPossibleDecodings(str.substr(2), ans);

  ull finalOutput = (smallOuput1 % M + smallOutput2 % M) % M;
  ans[str] = finalOutput;
  return finalOutput;
}

int main()
{
  while(true)
  {
    string str;
    cin >> str;
    if (stoi(str) == 0)
      break;

    //unordered_ma
    cout << numberOfPossibleDecodings(str) << endl;
  }
    return 0;

}
