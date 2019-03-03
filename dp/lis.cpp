#include <bits/stdc++.h>
using namespace std;

 int lis(int arr[], int n) {


	/*Write your code here.
	 *Don't write main().
	 *Don't take input, it is passed as function argument.
	 *Don't print output.
	 *Taking input and printing output is handled automatically.
	*/
     // dp[i] represents the LIS with ith index as the LAST ELEEMENT
     int* dp = new int[n];
     for (int i = 0; i < n; i++)
         dp[i] = 1;

     for (int i = 1; i < n; i++)
         for (int j = i - 1; j >= 0; j--)
             if (arr[j] < arr[i] && dp[j] + 1 > dp[i])
                 dp[i] = dp[j] + 1;

     return *max_element(dp, dp + n);
 }
