# 't 검정(t-test)'은 두 집단의 평균에 통계적으로 유의한 차이가 있는지 알아볼 때 사용하는 통계 분석 기법

# compact 자동차와 suv 자동차의 도시 연비 t검정
mpg <- as.data.frame(ggplot2 :: mpg)

library(dplyr)
mpg_diff <- mpg %>%
  select(class, cty) %>%
  filter(class %in% c("compact", "suv"))

head(mpg_diff)

table(mpg_diff$class)

t.test(data = mpg_diff, cty ~ class, var.equal = T)

# 일반 휘발유와 고급 휘발유의 도시 연비 t 검정
mpg_diff2 <- mpg %>%
  select(fl, cty) %>%
  filter(fl %in% c("r", "p")) # r: regular, p: premiun

table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty ~ fl, var.equal = T)