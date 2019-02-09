#include <bits/stdc++.h>
using namespace std;

class Cakes {
  public:
  int w;
  int c;
};

bool cakeCmp(Cakes a, Cakes b) {
	return a.w > b.w;
}

bool intCmp(int a, int b) {
	return a > b;
}

int solution(int* L, int m, int* W, int* C, int n) {
  int passes = 0;

  int maxLimit = *(max_element(L, L + m));
  int maxWeight = *(max_element(W, W + n));

  if (maxLimit < maxWeight) {
    return -1;
  }

  Cakes* WC = new Cakes[n];
  for (int i = 0; i < n; i++) {
    WC[i].w = W[i];
  	WC[i].c = C[i];
  }

  sort(L, L + m, intCmp);
  sort(WC, WC + n, cakeCmp);

  int zeroCakePtr = -1;
  int cakeIdx = 0;
  int limitIdx = 0;
  while (true) {


    if (WC[cakeIdx].w <=  L[limitIdx]) {
      WC[cakeIdx].c--; // /reduce the count

      if (WC[cakeIdx].c == 0) { // if cake count gets to zero
        zeroCakePtr += 1;
      	cakeIdx += 1;
      }

      limitIdx = limitIdx + 1; // moving on to the next Monk
    }
    else {
      cakeIdx += 1;
    }




    if (cakeIdx == n) { // if checked all the cakes
      cakeIdx = zeroCakePtr + 1;
      limitIdx = 0; // move to the first monk if all the cakes finish BUG WAS HERE!!! limitIdx += 1
    }

    if (limitIdx == m) {// if no next monk
      limitIdx = 0; // move to the highest monk
      cakeIdx = zeroCakePtr + 1;
      passes += 1;
    }


    if (zeroCakePtr == n - 1) {
      passes += 1; // This was one  final pass so add one
      break;
    }

  }

  // SORT IN DESC ORD both the N, M data structures
  // assign the largest of LiMIT to largest of cake
  // reduce count of that by 1
  // if count becomes zero then move the cakepointer ahead ELSE stay

  // choose the next guy in LIMIT and check if the  cake pointer's WEight <= LIMIT
  // if yes then  assign it (reduce the count if count is zero increment cake pointer) AND MOVE TO THE NEXT GUY
  // ELSE if no then move the cake pointer ahead anc check again and if none of the cakes can be eaten then DO NOT MOVE TO THE NEXT GUY
  // ex: L-> 8, 5, 4, 3
  //     W-> 7, 7, 7, 7
  //     C-> 10,10,10,10
  // reduce TIME COMPLEXITY!!! worst case is 10**8 * N**@

  //for (int i = 0;)

  return passes;
}

int main(void)
{
  	int t;
	cin >> t;

  	for (int cases = 0; cases < t; cases++) {
      int n, m;
      cin >> n >> m;
	  int* w = new int[n];
      int* c = new int[n];
      int* l = new int[m];

      for (int i = 0; i < m; i++) {
        cin >> l[i];
      }
      for (int i = 0; i < n; i++) {
		cin >> w[i];
      }
      for (int i = 0; i < n; i++) {
		cin >> c[i];
      }

      cout << solution(l, m, w, c, n) << endl;
    }
}
