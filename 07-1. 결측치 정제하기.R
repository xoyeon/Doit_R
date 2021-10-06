# 결측치 찾기
df <- data.frame(sex = c("M","F",NA,"M","F"),
                 score = c(5,4,3,4,NA))
df

# 결측치 확인하기
is.na(df)

# 결측치 빈도 출력
table(is.na(df))

# sex 결측치 빈도 출력
table(is.na(df$sex))
# score 결측치 빈도 출력
table(is.na(df$score))

# 평균 산출
mean(df$score)

# 합계 산출
sum(df$score)

# 결측치 제거하기
library(dplyr)
df %>% filter(is.na(score))  #score가 NA인 데이터만 출력

# score 결측치 제거
df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score) # score 평균 산툴툴
sum(df_nomiss$score) # score 합계 산출출

# 여러 변수 동시에 결측치 없는 데이터 추출하기
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

# 결측치가 하나라도 있으면 제거하기
df_nomiss2 <- na.omit(df) # na.omit()을 이용하면 변수를 지정하기 않고 결측치가 있는 행을 한 번에 제거할 수 있음
df_nomiss2

# 결측치 제외하고 평균 산출
mean(df$score, na.rm = T)

# 결측치 제외하고 합계 산출
sum(df$score, na.rm = T)

# 3,8,15행의 math에 NA 할당
exam <- read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] <- NA
exam

# math 평균 산출
exam %>% summarise(mean_math = mean(math))

# math 결측치 제외하고 평균 산출
exam %>% summarise(mean_math = mean(math, na.rm = T))

# math 결측치 제외한 평균, 합계, 중앙값 산출
exam %>% summarise(mean_math = mean(math, na.rm = T),
                   sum_math = sum(math, na.rm = T),
                   median_math = median(math, na.rm = T))

## 평균값으로 결측치 대체하기
# 결측치 제외하고 math 평균 산출
mean(exam$math, na.rm = T)

# math가 NA면 55로 대체
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
exam

mean(exam$math)

## 혼자서 해보기
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"] <- NA 
# Q1. drv 별로 hwy 평균이 어떻게 다른지 알아보려고 한다. 분석을 하기 전에 우선 두 변수에 결측치가 있는지 확인. drv 변수와 hwy 변수에 결측치가 몇 개 있는가?
is.na(mpg)
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# Q2. filter()를 이용해 hwy 변수의 결측치를 제외하고, 어떤 구동 방식의 hwy 평균이 높은지 알아보자. 하나의 dplyr 구문으로 만들어 한다.
mpg %>%
  filter(!is.na(hwy)) %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))