student_heights = input().split()

for n in range(0,len(student_heights)):
    student_heights[n] = int(student_heights[n])
    
length = len(student_heights)
average = 0
for height in range(0,length):
    average += student_heights[height]

print(f"total height: {average} \nnumber of students = {length} \naverage height = {int(average/length)}")