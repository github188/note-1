#!/usr/bin/env python


def qsort3(alist, lower, upper):
	print(alist)
	if lower >= upper:
		return

	pivot = alist[lower]
	left, right = lower + 1, upper
	while left <= right:
		while left <= right and alist[left] < pivot:
			left += 1
		while left <= right and alist[right] >= pivot:
			right -= 1
		if left > right:
			break
		# swap while left <= right
		alist[left], alist[right] = alist[right], alist[left]
	# swap the smaller with pivot
	alist[lower], alist[right] = alist[right], alist[lower]

	qsort3(alist, lower, right - 1)
	qsort3(alist, right + 1, upper)

unsortedArray = [8,7,6,5,4,3,2,1]
print(qsort3(unsortedArray, 0, len(unsortedArray) - 1))