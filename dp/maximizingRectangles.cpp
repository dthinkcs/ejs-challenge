#include <bits/stdc++.h>
using namespace std;

int kadane(int arr[], int n)
{
  int curr_sum = 0;
  int max_sum = INT_MIN;

  for (int i = 0; i < n; i ++)
  {
    curr_sum = curr_sum + arr[i];
    if (curr_sum > max_sum)
      max_sum = curr_sum;
    if (curr_sum < 0)
       curr_sum = 0;
  }
  return max_sum;
}

void initializeToZero(int* arr, int n)
{
  for (int i = 0; i < n; i++)
    arr[i] = 0;
}

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

  // 1 2 3 4
  // 5 6 7 8
  int sumArr = new int[m];
  int currMax = 0;
  int maxMax = INT_MIN;
  for (int left = 0; left < n; left++)
  {
    // for every left initialize sumArr to zero
    initializeToZero(sumArr, m);
    for (int right = left; right < n; right++)
    {
      for (int i = 0; i < m; i++)
        sumArr[i] += arr[i][right];
      currMax = kadane(sumArr, m);
      if (currMax > maxMax)
        maxMax = currMax;
    }
  }

  cout << maxMax << endl;
}


int main2()
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
