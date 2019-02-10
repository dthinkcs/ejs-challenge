


# iloveicecreamandmango
# i loveicecreamandmango,

# abc
# a
def solutions(sent, setWords, wordsTillNow):

    if len(wordsTillNow) > 2:
        for i in range(len(wordsTillNow) - 1):
            word = wordsTillNow[i]
            if word not in setWords:
                return
    if (len(sent) <= 1):
        wordsTillNow[-1] = wordsTillNow[-1] + sent[0]
        for word in wordsTillNow:
            if word not in setWords:
                return
        #print (completeSent)
        for word in wordsTillNow:
            print(word, end=' ')
        print()
        return

    solutions(sent[1:], setWords, wordsTillNow + [sent[0]])
    # deide NOTto split it
    wordsTillNow[-1] = wordsTillNow[-1] + sent[0]
    solutions(sent[1:], setWords, wordsTillNow)

def solutions2(sent, setWords, outputD=""):
    #break it down
    wordsTillNow = outputD.split()
    if len(wordsTillNow) > 2:
        wordsDecided = wordsTillNow[:-1]
        for word in wordsDecided:
            if word not in setWords:
                return

    if (len(sent) <= 1):
        completeSent = outputD + sent[0]
        words = completeSent.strip().split()
        for word in words:
            if word not in setWords:
                return
        print(completeSent)
        return
    # decode NOT to split it
    solutions(sent[1:], setWords, outputD + sent[0])
    # decode to split it
    solutions(sent[1:], setWords, outputD + sent[0] + " ")


#f = open("test.txt")
n = int(input()) # replace f.readline() with input()
myDict = set(input().strip() for i in range(n))
sentence = input()#"iloveicecreamandmango"#  f.readline()
#print(myDict)
# given a sentence and setOfWordsinMyDict figure out how many ways to splice a string in meangful way
puttingFirstThingIn = [sentence[0]]
solutions(sentence[1:], myDict, puttingFirstThingIn)
