#include <bits/stdc++.h>
using namespace std;

/*
#include <string>
#include <sstream>
#include <vector>
#include <iterator>
*/
template<typename Out>
void split(const std::string &s, char delim, Out result) {
    std::stringstream ss(s);
    std::string item;
    while (std::getline(ss, item, delim)) {
        *(result++) = item;
    }
}

std::vector<std::string> split(const std::string &s, char delim) {
    std::vector<std::string> elems;
    split(s, delim, std::back_inserter(elems));
    return elems;
}








unordered_set<string> myDict;


void solutions(string sent, string outputD="") {
    //cout << outputD << endl;
/*
    vector<string> wordsTillNow = split(outputD, ' ');

    //wordsTillNow = outputD.split()
  	if (wordsTillNow.size() > 2) {
    	  for (int i = 0; i < wordsTillNow.size() - 1; i++)  // ULL
        {
          if (myDict.find(wordsTillNow[i]) == myDict.end())
            return;

        }
    }
*/

  /*
    if len(wordsTillNow) > 2:
        wordsDecided = wordsTillNow[:-1]
        for word in wordsDecided:
            if word not in setWords:
                return
                */

    if (sent.length() <= 1)
    {
        string completeSent = outputD + sent[0];
        vector<string> words = split(completeSent, ' ');
    	  for (int i = 0; i < words.size(); i++)  // ULL
        {
          if (myDict.find(words[i]) == myDict.end())
            return;
        }
        cout << (completeSent) << endl;
        return;
    }

    // decide NOT to split it
    solutions(sent.substr(1), outputD + sent[0]);
    // decode to split it
    solutions(sent.substr(1), outputD + sent[0] + " ");

}

int main(void) {
  int n;
  cin >> n;

  for (int i = 0; i < n; i++) {
    string s;
    cin >> s;
    myDict.insert(s);
  }
  string empty_str = "";
  string one_space = " ";
  myDict.insert(empty_str);
  myDict.insert(one_space);

  string sentence;
  cin >> sentence;
  solutions(sentence);
}
