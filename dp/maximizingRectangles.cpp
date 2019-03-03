#include <bits/stdc++.h>
using namespace std;

int main()
{
    int n;
    cin >> n;
    int m;
    cin >> m;

    int arr[100][100];

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            cin >> arr[i][j];
        }
    }


    int sumStartArr[100][100];
    for (int i = 0; i < 100; i++)
      for (int j = 0; j < 100; j++)
        sumStartArr[i][j] = 0;

    sumStartArr[n - 1][m - 1] = arr[n - 1][m - 1];
    for (int j = m - 2; j >= 0; j--)
    {
        sumStartArr[n - 1][j] = arr[n - 1][j] + sumStartArr[n - 1][j + 1];
    }
    for (int i = n - 2; i >= 0; i--)
    {
        sumStartArr[i][m - 1] = arr[i][m - 1] + sumStartArr[i + 1][m - 1];
    }

    for (int i = n - 2; i >= 0; i--)
    {
        for (int j = m - 2; j >= 0; j--)
        {
            sumStartArr[i][j] = arr[i][j] + sumStartArr[i + 1][j] + sumStartArr[i][j + 1] - sumStartArr[i + 1][j + 1];
        }
    }

    // push_banck  all possibe values into std::vector<int> v;
    std::vector<int> v;
    for (int i1 = 0; i1 < n; i1++)
      for (int j1 = 0; j1 < m; j1++)
        for (int i2 = 0 ; i2 <= n; i2++)
          for (int j2 = 0; j2 <= n; j2++)
            if (i2 > i1 && j2 > j1)
              v.push_back(sumStartArr[i1][j1] - sumStartArr[i1][j2] -sumStartArr[i2][j1] + sumStartArr[i2][j2]);

   cout << *max_element(v.begin(), v.end()) << endl;
}
