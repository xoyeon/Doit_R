## 변수 만들기
english <- c(90,80,60,70)
english

math <- c(50,60,100,20)
math

## 데이터 프레임 만들기
# english, math로 데이터 프레임 새성해서 df_midterm에 할당
df_midterm <- data.frame(english, math)
df_midterm

class <- c(1,1,2,2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

## 분석하기
mean(df_midterm$english)  # df_midterm의 english로 평균 산출
mean(df_midterm$math) # df_midterm의 math로 평균 산출

# 데이터 프레임 한 번에 만들기
df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class = c(1,1,2,2))
df_midterm

## 혼자서 해보기
# Q1. data.frame()과 c()를 조합해 표의 내용을 데이터 프레임으로 만들어 출력해 보세요.
df <- data.frame(fruit = c('사과','딸기','수박'),
                 price = c(1800,1500,3000),
                 volume = c(24,38,13))
df
# Q2. 앞에서 만든 데이터 프레임을 이용해 과일 가격 평균, 판매량 평균을 구해 보세요.
mean(df$price)  #가격평균
mean(df$volume) #판매량평균
