
void printIncreasingNumbers(int n, int start=1, string outputD="") {

	/* Don't write main().
 	Don't read input, it is passed as function argument.
	Print the required output
	*/
  if (n == 0) {
    cout << outputD <<  " ";
    return;
  }

  for (int i = start; i <= 9; i++) {
    printIncreasingNumbers(n - 1, i + 1, outputD + to_string(i));
  }
}
