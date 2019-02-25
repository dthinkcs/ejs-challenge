#include <bits/stdc++.h>
#define ull unsigned long long int
#define mod 1000000007
using namespace std;

int numberOfPossibleDecodings(string s)
{
  int n = s.length();
  ull* ans = new ull[n];
  for (int i = 0; i < n; i++)
    ans[i] = 0;

  ans[0] = 1;

  for (int i = 1; i < n ; i++)
  {
    if (s[i] != '0')
      ans[i] = ans[i - 1];
    ull x = (s[i - 1] - '0') * 10 + s[i] - '0';
    if (x >= 10 && x <= 26 && i > 1)
      ans[i] += ans[i - 2];
    else if (x >= 10 && x <= 26)
      ans[i]++;
    ans[i] = ans[i] % mod;
  }
  return ans[n - 1];
}

int main()
{
  string s;

  while(true)
  {
    cin >> s;
    if (s == 0) // std::str
      break;

    cout << numberOfPossibleDecodings(s) << endl;
  }
}
