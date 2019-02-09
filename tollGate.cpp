#include <bits/stdc++.h>
using namespace std;

class Tollgate {
  public:
  	int n;
  	int cost;
};

int minAns = INT_MAX;

void solution(int* tollArr, int n, int costTillNow=0, int menTillNow=0, int oneFightMen, int twoFightMen) {

  if (costTillNow > minAns) {
    return;
  }
  // atleast calculate the first min ans by traversing the entire tree atleast once
  if (n == 0) {
	 if (costTillNow < minAns) {
       minAns = costTillNow;
     }
  }
  solution(tollArr + 1, n - 1, costTillNow + tollArr[0].cost, menTillNow, oneFightMen, twoFightMen);
  if (menTillNow > tollArr[0].n)
  {
    // battle TODO
      int menTollingBooth = tollArr[0].n
      int freshman = menTollingBooth - oneFightMen - twoFightMen;
      // first send the twoFightmen
      if (menTollingBooth > twoFightMen) { // 10 men 8 men
        menTollingBooth = menTollingBooth - twoFightMen;
        menTillNow -= twoFightMen;
        twoFightMen = 0;
      }
      else {// 8men 10 men
        twoFightMen = twoFightMen - menTollingBooth;
        menTillNow -= menTollingBooth;
        menTollingBooth = 0;
      }

      if (menTollingBooth != 0)
      {
        if (menTollingBooth > oneFightMen) { // 10 men 8 men
          menTollingBooth = menTollingBooth - oneFightMen;
          menTillNow -= oneFightMen;
          oneFightMen = 0;

        }
        else {// 8men 10 men
          oneFightMen = oneFightMen - menTollingBooth;
          menTillNow -= menTollingBooth;
          menTollingBooth = 0;
        }

        if (menTollingBooth != 0) { // freshman > menTillNow // 10 8
            freshman = freshman - menTollingBooth;
            menTillNow -= menTollingBooth;
            menTollingBooth = 0;
        }

      }                                                    //oneFightMen, twoFightMen
      solution(tollArr + 1, n - 1, costTillNow, menTillNow, freshman, oneFightMen);
  }
  
  solution(tollArr + 1, n - 1, costTillNow + 2 * tollArr[0].cost, menTillNow + tollArr[0].n, oneFightMen, twoFightMen);

}

int main()
{
	int n;
  	cin >> n;

	Tollgate* tollArr = new Tollgate[n];
  	for (int i = 0; i < n; i++) {
      cin >> tollArr[i].n >> tollArr[i].cost >> endl;
    }

	solution(tollArr, n, output);
    cout << maxAns << endl;

}
