# readxl 패키지 설치하고 로드하기
install.packages("readxl")
library(readxl)

# 엑셀 파일 불러오기
df_exam <- read_excel("excel_exam.xlsx") # 엑셀 파일을 불러와 df_exam에 할당
df_exam

# 분석하기
mean(df_exam$english)
mean(df_exam$science)

# ★ 엑셀 파일 첫 번째 행이 변수명이 아니라면, col_names = F 파라미터 설정
# ★ 엑셀 파일에 시트가 여러 개 있다면, sheet = n 이용하여 시트 지정

# CSV 파일 불러오기(첫 번째 행에 변수명이 없는 csv파일은 header = F 지정)
df_csv_exam <- read.csv('csv_exam.csv')
df_csv_exam

# 문자가 들어 있는 파일 불러올 때
df_csv_exam <- read.csv('csv_exam.csv', stringsAsFactors = F)
df_csv_exam


# 데이터 프레임 만들기
df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class = c(1,1,2,2))
df_midterm

# CSV 파일로 저장하기
write.csv(df_midterm, file = 'df_midterm.csv')

# 데이터 프레임을 RData 파일로 저장하기
save(df_midterm, file = 'df_midterm.rda')

# RData 파일 불러오기
rm(df_midterm)  # rm()으로 데이터 삭제
load('df_midterm.rda')
df_midterm


# 엑셀 파일 불러와 df_exam에 할당하기
df_exam <- read_excel('excel_exam.xlsx')

# csv 파일 불러와 df_csv_exam에 할당하기
df_csv_exam <- read.csv('csv_exam.csv')

# Rda 파일 불러오기
load('df_midterm.rda')