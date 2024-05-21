# Input a list of student scores
student_scores = input().split()
for n in range(0, len(student_scores)):
  student_scores[n] = int(student_scores[n])

# Write your code below this row 👇
score_check = 0

for score in student_scores:
  if score > score_check:
    score_check = score
print(score_check)