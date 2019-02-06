#include <bits/stdc++.h>
using namespace std;

class Tollgate {
  public:
  	int n;
  	int cost;
};

int minAns = INT_MAX;

void solution(int* tollArr, int n, int costTillNow=0, int menTillNow=0) {
  if (n == 0) {
	 if (costTillNow < minAns) {
       minAns = costTillNow;
     }
  }
  solution(tollArr + 1, n - 1, costTillNow + tollArr[0].cost, menTillNow);
  if (menTillNow > tollArr[0].n) {
    // battle TODO
  }
  solution(tollArr + 1, n - 1, costTillNow + 2 * tollArr[0].cost, menTillNow + tollArr[0].n);

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
