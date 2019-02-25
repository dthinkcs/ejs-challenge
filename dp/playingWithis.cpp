#include <bits/stdc++.h>
using namespace std;
// TESTED 2

// dp: STARTGAME
int longestDecreasingSubsequence(int* arr, int n)
{
  // ans := ans[i] contains the longestDecreasingSubsequence with arr[i] as the FIRST element: CRUX
  int* ans = new int[n];

  // initialize it to one
  for (int i = 0; i < n; i++)
    ans[i] = 1;

  ans[n - 1] = 1; // redundant but good for pattern recognition
  for (int i = n - 2 ; i >= 0; i--)
  {
    // assume that curr max ans is going to be one
    int curr_max_ans = 1;

    // search for everything below that index to find out a greater ans...greatest ans
    for (int j = i + 1; j < n; j++)
    {
      // arr at j (inner traversal) is less than the current answer
      if (arr[i] > arr[j])
      {
        if (1 + ans[j] > curr_max_ans)
          curr_max_ans = 1 + ans[j];
      }
    }

    ans[i] = curr_max_ans;
  }

  // find the maximum in the ans array
  int finalAns = ans[0];
  for (int i = 1; i < n; i++)
  {
    if (ans[i] > finalAns)
      finalAns = ans[i];
  }
  return finalAns;
}


// dp: ENDGAME
int longestIncreasingSubsequence(int* arr, int n)
{
  // ans := ans[i] contains the longestIncreasingSubsequence with arr[i] as the last element: CRUX
  int* ans = new int[n];

  // initialize it to one
  for (int i = 0; i < n; i++)
    ans[i] = 1;

  ans[0] = 1; // redundant but good for pattern recognition
  for (int i = 1; i < n; i++)
  {
    // assume that curr max ans is going to be one
    int curr_max_ans = 1;

    // search for everything below that index to find out a greater ans...greatest ans
    for (int j = i - 1; j >= 0; j--)
    {
      // arr at j (inner traversal) is less than the current answer
      if (arr[j] < arr[i])
      {
        if (1 + ans[j] > curr_max_ans)
          curr_max_ans = 1 + ans[j];
      }
    }

    ans[i] = curr_max_ans;
  }

  // find the maximum in the ans array
  int finalAns = ans[0];
  for (int i = 1; i < n; i++)
  {
    if (ans[i] > finalAns)
      finalAns = ans[i];
  }
  return finalAns;
}

int longestIncreasingSubsequence2(int* arr, int n)
{
  // ans := ans[i] contains the longestIncreasingSubsequence with arr[i] as the FIRST element: CRUX
  int* ans = new int[n];

  // initialize it to one
  for (int i = 0; i < n; i++)
    ans[i] = 1;

  ans[n - 1] = 1; // redundant but good for pattern recognition
  for (int i = n - 2 ; i >= 0; i--)
  {
    // assume that curr max ans is going to be one
    int curr_max_ans = 1;

    // search for everything below that index to find out a greater ans...greatest ans
    for (int j = i + 1; j < n; j++)
    {
      // arr at j (inner traversal) is less than the current answer
      if (arr[i] < arr[j])
      {
        if (1 + ans[j] > curr_max_ans)
          curr_max_ans = 1 + ans[j];
      }
    }

    ans[i] = curr_max_ans;
  }

  // find the maximum in the ans array
  int finalAns = ans[0];
  for (int i = 1; i < n; i++)
  {
    if (ans[i] > finalAns)
      finalAns = ans[i];
  }
  return finalAns;
}


int longestBitonic(int* arr, int n)
{
  // ans := ans[i] contains the longestIncreasingSubsequence with arr[i] as the last element: CRUX
  int* ans1 = new int[n];

  // initialize it to one
  for (int i = 0; i < n; i++)
    ans1[i] = 1;

  ans1[0] = 1; // redundant but good for pattern recognition
  for (int i = 1; i < n; i++)
  {
    // assume that curr max ans is going to be one
    int curr_max_ans = 1;

    // search for everything below that index to find out a greater ans...greatest ans
    for (int j = i - 1; j >= 0; j--)
    {
      // arr at j (inner traversal) is less than the current answer
      if (arr[j] < arr[i])
      {
        if (1 + ans1[j] > curr_max_ans)
          curr_max_ans = 1 + ans1[j];
      }
    }

    ans1[i] = curr_max_ans;
  }

  // ans := ans[i] contains the longestDecreasingSubsequence with arr[i] as the FIRST element: CRUX
  int* ans2 = new int[n];

  // initialize it to one
  for (int i = 0; i < n; i++)
    ans2[i] = 1;

  ans2[n - 1] = 1; // redundant but good for pattern recognition
  for (int i = n - 2 ; i >= 0; i--)
  {
    // assume that curr max ans is going to be one
    int curr_max_ans = 1;

    // search for everything below that index to find out a greater ans...greatest ans
    for (int j = i + 1; j < n; j++)
    {
      // arr at j (inner traversal) is less than the current answer
      if (arr[i] > arr[j])
      {
        if (1 + ans2[j] > curr_max_ans)
          curr_max_ans = 1 + ans2[j];
      }
    }

    ans2[i] = curr_max_ans;
  }

  int* ans = new int[n];
  for (int i = 0; i < n; i++)
    ans[i] = ans1[i] + ans2[i] - 1;

  return *max_element(ans, ans + n);
}


int main(void)
{
  int n;
  cin >> n;
  int* arr = new int[n];
  for (int i = 0 ; i < n; i++)
    cin >> arr[i];
  cout << longestBitonic(arr, n) << endl;
  delete [] arr;
}
