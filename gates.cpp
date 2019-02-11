#include <bits/stdc++.h>
using namespace std;

class Tollgate {
  public:
      int n;
      int cost;
};

int minAns = INT_MAX;

void solution(Tollgate* tollArr, int n, int costTillNow=0, int menTillNow=0, int oneFightMen=0, int twoFightMen=0) {



  if (costTillNow > minAns) {
    return;
  }
  // atleast calculate the first min ans by traversing the entire tree atleast once
  //cout << "costTillNow: " << costTillNow << " Men Till Now: " << menTillNow << " One Fight Men: " << oneFightMen << " Two Fight Men: " << twoFightMen << endl;

  if (n == 0) {
    //cout << "Travelled All the Way minAns: " << minAns << endl;
     if (costTillNow < minAns) {
       minAns = costTillNow;
     }
    return;
  }

  // OPTION1: PAY THE TOLL
  solution(tollArr + 1, n - 1, costTillNow + tollArr[0].cost, menTillNow, oneFightMen, twoFightMen);

  // OPTION2: BATTLE IT OUT
  if (menTillNow > tollArr[0].n)
   {
    // battle TODO
      int menTollingBooth = tollArr[0].n;
      int freshman = menTillNow - oneFightMen - twoFightMen;// BUG HERE :: int freshman = menTollingBooth - oneFightMen - twoFightMen;
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
      // TODO WHY DOES IT NOT WORK IF I CHANGE TWOFIGHTMEN
      solution(tollArr + 1, n - 1, costTillNow, freshman + oneFightMen, freshman, oneFightMen);
  }

  // OPTION 3: HIRE THE MEN
  solution(tollArr + 1, n - 1, costTillNow + 2 * tollArr[0].cost, menTillNow + tollArr[0].n, oneFightMen, twoFightMen);

}

int main()
{
    int n;
    //  cin >> n;'
    n = 7;

    Tollgate* tollArr = new Tollgate[n];


    tollArr[0].n = 10;
    tollArr[0].cost = 100;
    tollArr[1].n = 70;
    tollArr[1].cost =5;
    tollArr[2].n = 80 ;
    tollArr[2].cost = 15;
    tollArr[3].n = 20 ;
    tollArr[3].cost = 60;
    tollArr[4].n = 50 ;
    tollArr[4].cost = 90;
    tollArr[5].n = 30 ;
    tollArr[5].cost = 80;
    tollArr[6].n = 10;
    tollArr[6].cost = 10;

    /*  for (int i = 0; i < n; i++) {
      cin >> tollArr[i].n >> tollArr[i].cost;
    }*/

    solution(tollArr, n);
    cout << minAns << endl;

}
