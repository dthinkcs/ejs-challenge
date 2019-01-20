#include <bits/stdc++.h>
using namespace std;
#define ll long long;

bool feed(ll* candiesArr, ll n, ll choice_num_candies, ll k) {
  ll curr_sum = 0;
  for (ll i = 0; i < n; i++){
    curr_sum += num_candies / choice_num_candies;
    if (curr_sum >= k) {
      return true;
    }
  }
  return false;
}

void solution(ll* candiesArr, ll n, ll k)
{
  ll* choicesArr = new ll[max(candiesArr)];

  ll best_choice = 0;
  ll l = 0;
  ll h = n - 1;

  while (l <= h)
  {
    ll mid = (l + h) / 2;
    ll choice = choicesArr[mid];
    if (feed(candiesArr, n, choice, k))
    {
      best_choice = choice;
      l = mid + 1;
    }
    else {
      h = mid - 1;
    }
  }
  cout << best_choice << endl;
}


int main()
{
  ll t;
  cin >> t;

  for (ll i = 0; i < t; i++)
  {
    ll n; ll k;
    cin >> n >> k;

    ll* candiesArr = new ll[n];
    for (ll j = 0; j < n; j++)
      cin >> candiesArr[j];

    solution(candiesArr, n, k);
  }
}
