# 1.데이터 분비, 패키지 준비
mpg <- as.data.frame(ggplot2::mpg)  #데이터 불러오기
library(dplyr)   #dplyr 로드
library(ggplot2) #ggplot2 로드

# 2.데이터 파악
head(mpg) #Raw 데이터 앞부분
tail(mpg) #Raw 데이터 뒷부분
View(mpt) #Raw 데이터 뷰어 창에서 확인
dim(mpg)  #차원
str(mpg)  #속성
summary(mpg)  #요약 통계량

# 3.변수명 수정
mpg <- rename(mpg, company = manufacturer)

# 4. 파생변수 생성
mpg$total <- (mpg$cty + mpg$hwy)/2  #변수 조합
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail") #조건문 활용

# 5. 빈도 확인
table(mpg$test) #빈도표 출력
qplot(mpg$test) #막대 그래프 생성