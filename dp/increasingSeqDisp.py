
def lis(inputarr, outputarr = []):
    if inputarr == []:
        outputarr.append([])
        return outputarr

    lis(inputarr[1:], outputarr)
    # chooe inputarr[0]
    length = len(outputarr)
    for i in range(length):
        if len(outputarr[i]) == 0 or inputarr[0] < outputarr[i][0]: # A + A'B
            outputarr.append([inputarr[0]] + outputarr[i])
    # dont choose inputarr[]

    return outputarr


inputarr = [2, 1, 3, 4, 9, 7, 8]
print(lis(inputarr))
