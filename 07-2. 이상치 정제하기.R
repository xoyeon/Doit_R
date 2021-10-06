## 이상치 제거하기 - 존재할 수 없는 값
outlier <- data.frame(sex = c(1,2,1,3,2,1),
                      score = c(5,4,3,4,2,6))
outlier

table(outlier$sex)
table(outlier$score)

# 결측 처리하기 - sex가 3이면 NA 할당, score가 5보다 크면 NA 할당
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier

outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier

# 결측치를 제외한 후 성별에 따른 score 평균 출력
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))

## 이상치 제거하기 - 극단적인 값
boxplot(mpg$hwy)

# 상자 그림 통계치 출력
boxplot(mpg$hwy)$stats

# 12~17 벗어나면 NA 할당
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))

## 혼자서 해보기
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"] <- "k"
mpg[c(29,43,129,203),"cty"] <- c(3,4,39,42)

#Q1. drv에 이상치가 있는지 확인하시오. 이상치를 결측 처리한 후 이상치가 사라졌는지 확인하시오. 결측 처리를 할 때는 %in% 기호를 활용.
table(mpg$drv)

mpg$drv <- ifelse(mpg$drv %in% c("4","f","r"), mpg$drv, NA)
table(mpg$drv)

#Q2. 상자 그림을 이용해 cty에 이상치가 있는지 확인. 상자 그림의 통계치를 이용해 정상 범위를 벗어난 값을 결측 처리한 후 다시 상자 그림을 만들어 이상치가 사라졌는지 확인.
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)

#Q3. 두 변수의 이상치를 결측 처리 했으니 이제 분석할 차례. 이상치를 제외한 다음 drv별로 cty 평균이 어떻게 다른지 알아보자. 하나의 dplyr 구문으로 만들어야 함.
mpg %>%
  filter(!is.na(drv) & !is.na(cty)) %>%
  group_by(drv) %>%
  summarise(mean_cty = mean(cty))