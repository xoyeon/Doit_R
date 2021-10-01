exam <- read.csv('csv_exam.csv')

# 데이터 앞부분 확인하기
head(exam) # 앞에서부터 6행까지 출력
head(exam, 10) # 앞에서부터 10행까지 출력

# 데이터 뒷부분 확인하기
tail(exam) # 뒤에서부터 6행까지 출력
tail(exam, 10) # 뒤에서부터 10행까지 출력

# 데이터 뷰어 창에서 exam 데이터 확인
View(exam)

# 행, 열 출력
dim(exam)

# 데이터 속성 확인
str(exam)

# 요약 통계량 산출하기
summary(exam)


# ggplot2의 mpg 데이터를 데이터 프레임 형태로 불러오기.
mpg <- as.data.frame(ggplot2::mpg)

# mpg 데이터 파악하기
head(mpg)
tail(mpg)
dim(mpg)
str(mpg)
summary(mpg)