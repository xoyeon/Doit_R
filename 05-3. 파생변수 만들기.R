# 변수 조합해 파생변수 만들기
df <- data.frame(var1 = c(4,3,8),
                var2 = c(2,6,1))
df

# var_sum 파생변수 생성
df$var_sum <- df$var1 + df$var2
df

# var_mean 파생변수 생성
df$var_mean <- (df$var1 + df$var2)/2
df

# mpg 통합 연비 변수 만들기
mpg <- as.data.frame(ggplot2::mpg)

mpg$total <- (mpg$cty + mpg$hwy)/2 # 통합 연비 변수 생성성
head(mpg)
mean(mpg$total)


## 조건문을 활용해 파생변수 만들기
summary(mpg$total) # 요약 통계량
hist(mpg$total) # 히스토그램 생성

# 20 이상이면 pass, 그렇지 않으면 fail 부여
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20) # 데이터 확인

table(mpg$test) # 연비 합격 빈도표 생성성

library(ggplot2) # ggplot2 로드
qplot(mpg$test) # 연비 합격 빈도 막대 그래프 생성성

## 중첩 조건문 활용하기
# total을 기준으로 A, B, C 등급 부여
mpg$grade <- ifelse(mpg$total >= 30, 'A',
                    ifelse(mpg$total >= 20, "B", "C"))
head(mpg, 20) #데이터 확인

## 빈도표, 막대 그래프로 연비 등급 살펴보기기
table(mpg$grade) # 등급 빈도표 생성

qplot(mpg$grade) # 등급 빈도 막대 그래프 생성성

## 원하는 만큼 범주 만들기
# A, B, C, D 등급 부여
mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                     ifelse(mpg$total >= 24, "B",
                            ifelse(mpg$total >= 20,"C", "D")))
