# ggplot2 패키지 설치
install.packages("ggplot2")

# ggplot2 패키지 로드
library(ggplot2)

# 여러 문자로 구성된 변수 생성
x <- c("a", "a", "b", "c")
x

# 빈도 막대 그래프 출력
qplot(x)

## ggplot2의 mpg 데이터로 그래프 만들기
# data에 mpg, x축에 hwy 변수 지정해 그래프 생성
qplot(data = mpg, x = hwy)

# qplot()의 파라미터 바꿔가서 코드 실행
qplot(data = mpg, x = cty)
qplot(data = mpg, x = drv, y = hwy)
qplot(data = mpg, x = drv, y = hwy, geom = 'line')
qplot(data = mpg, x = drv, y = hwy, geom = 'boxplot')
qplot(data = mpg, x = drv, y = hwy, geom = 'boxplot', colour = drv)

#qplot 함수 매뉴얼 출력
?qplot

## 혼자서 해보기
# Q1. 시험 점수 변수 만들고 출력하기
score <- c(80,60,70,50,90)
# Q2. 전체 평균 구하기
mean(score)
# Q3. 전체 평균 변수 만들고 출력하기
mean_score <- mean(score)
