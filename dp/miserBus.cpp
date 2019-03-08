#include <bits/stdc++.h>
using namespace std;

int minSoFar = INT_MAX;

// CHANGE THIS TO startingI that return INT_MAX if its less than minSoFar: Backtracking + DP
void solution2(int A[100][100], int n, int m, int sj, int currSum = 0)
{
    if (currSum > minSoFar)
        return;

    if (n == 0)
    {
        if (currSum < minSoFar)
        {
            minSoFar = currSum;
        }
        return;
    }

    for (int j = sj - 1; j <= sj + 1 ; j++)
    {
        if (j > -1 && j < m)
            solution2(A + 1, n - 1, m, j, currSum + A[0][j]);
    }
}

void solution(int A[100][100], int n, int m, int currSum = 0)
{
    if (currSum > minSoFar)
        return;

    if (n == 0)
    {
        if (currSum < minSoFar)
        {
            minSoFar = currSum;
        }
        return;
    }

    for (int j = 0; j < m; j++)
    {
        solution2(A + 1, n - 1, m, j, currSum + A[0][j]);
    }
}

int main()
{
    int n;
    int m;
    cin >> n;
    cin >> m;

    int A[100][100];
    for (int i = 0; i < n; i++)
        for (int j = 0; j < m; j++)
            cin >> A[i][j];

    solution(A, n, m);
    cout << minSoFar << endl;

    return 0;
}
