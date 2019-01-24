#include<bits/stdc++.h>
using namespace std;
# define ll long long int

// given two sorted Arrays find the sum of all the numbers in the left half
// that are smaller than those subsegments in the right half
ll ourVeryOwn(ll input[], ll start1, ll end1, ll start2, ll end2 ) {
  ll sum = 0;
  ll i1 = start1;
  ll i2 = start2;

  while (i1 <= end1 && i2 <= end2) {
    if (input[i1] < input[i2]) {
    // if curr_left_part < curr_right_part
      // add required sum
      sum += input[i1] * (end2 - i2 + 1); // here lied a BUG i2 - end2 is wrong
      //left i.e i1++;
      i1++;

    }
    else {
     // move i2++
     // then check again
     // if i2 gets exhausted then return
     i2++;
    }

  }

  return sum;
}


void merge(ll input[], ll start1, ll end1, ll start2, ll end2) {
  ll i1 = start1;
  ll i2 = start2;
  ll* A = new ll[end1 - start1 + 1 + end2 - start2 + 1];
  ll k = 0;

  while (i1 <= end1 && i2 <= end2)
  {
    if (input[i1] < input[i2])
      A[k++] = input[i1++];
    else
      A[k++] = input[i2++];
  }

  while (i1 <= end1)
  {
    A[k++] = input[i1++];
  }

  while (i2 <= end2)
  {
    A[k++] = input[i2++];
  }

   i1 = start1;
   i2 = start2;
  for (ll idx = 0; idx < k; idx++)
  {
    if (i1 <= end1)
	  input[i1++] = A[idx];
    else
      input[i2++] = A[idx];
  }
}



ll solution(ll* arr, ll start, ll end) {
  if (start >= end) {
    return 0;
  }

  ll mid = (start + end ) / 2;
  ll leftPart = solution(arr, start, mid);
  ll rightPart = solution(arr, mid + 1, end);
  ll bothParts = ourVeryOwn(arr, start, mid, mid + 1, end);
  merge(arr, start, mid, mid + 1, end);
  return leftPart + rightPart + bothParts;
}

ll solutionNaive(ll* arr, ll n, ll index=0) {
  if (index == n) {
    return 0;
  }

  ll curr_sum = 0;
  for (; index < n; index++) {
    for (ll i = 0; i < index; i++) {
      if (arr[i] < arr[index]) {
        curr_sum += arr[i];
      }
    }
  }

  return curr_sum; //+ solutionNaive(arr, n, index + 1);
}



int main() {
	ll numOfTestCases;
  	cin >> numOfTestCases;

  	for (ll i = 0; i < numOfTestCases; i++) {
		ll numOfStairs;
      	cin >> numOfStairs;

      	ll* stairsArr = new ll[numOfStairs];
      	for (ll i = 0; i < numOfStairs; i++) {
          cin >> stairsArr[i];
        }
      	cout << solution(stairsArr, 0, numOfStairs - 1) << endl;
    }

}
