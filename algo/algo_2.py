def bubleSort(alist):
    for i in range(len(alist),0,-1):
        for s in range(1,i):
            if alist[s-1] > alist[s]:
                alist[s], alist[s-1] = alist[s-1], alist[s]

def insertSort(alist):
    for index in range(1,len(alist)):
        val = alist[index]
        val_index = index

        while index > 0 and alist[index-1] > val:
            alist[index] = alist[index-1]
            index -= 1

        alist[index] = val

def selectionSort(alist):
    for i in range(len(alist),0,-1):
        Index_of_max = 0
        for s in range(1,i):
            if alist[Index_of_max]<alist[s]:
                Index_of_max = s
        alist[i-1], alist[Index_of_max] = alist[Index_of_max], alist[i-1]

def mergeSort(alist):
    if len(alist) > 1:
        center = len(alist) // 2
        left_half = alist[:center]
        right_half = alist[center:]

        mergeSort(left_half)
        mergeSort(right_half)

        i,s,n = 0,0,0

        while i < len(left_half) and s < len(right_half) and n < len(alist):
            if left_half[i] < right_half[s]:
                alist[n] = left_half[i]
                i += 1
                n += 1
            else:
                alist[n] = right_half[s]
                s += 1
                n += 1

        for index in range(i, len(left_half)):
            alist[n] = left_half[index]
            n += 1

        for index in range(s, len(right_half)):
            alist[n] = right_half[index]
            n += 1



if __name__ == '__main__':
    al = [12,11,10,9,8,7,6,5,4,3,2,1]
    mergeSort(al)
    print(al)
