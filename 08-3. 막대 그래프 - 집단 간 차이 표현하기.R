# 막대 그래프(Bar Chart) : 성별 소득 차이처럼 집단 간 차이를 표현할 때 주로 사용

## 평균 막대 그래프 만들기
# 집단별 평균표 만들기 '구동 방식별 평균 고속도로 연비'
library(dplyr)

df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))
df_mpg

# 그래프 생성하기
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

# 크기 순으로 정렬하기. 정렬 기준 변수 앞에 - 기호를 붙이면 내림차순으로 정렬.
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()

## 빈도 막대 그래프 만들기. y축 없이 x축만 지정, geom_bar() 사용
ggplot(data = mpg, aes(x=drv)) + geom_bar()

# x축에 연속 변수를 지정하면 값의 분포 파악 용이.
ggplot(data = mpg, aes(x=hwy)) + geom_bar()

# !!정리!! geom_col()은 요약표를 이용, geom_bar()dms 원자료 이용

## 혼자서 해보기
#Q1. 어떤 회사에서 생산한 "suv"차종의 도시 연비가 높은지 알아보려고 함. "suv"차종을 대상으로 평균 cty가 가장 높은 회사 다섯 곳을 막대 그래프로 표현하라. 막대는 연비가 높은 순으로 정렬
suv_mpg <- mpg %>% filter(class == "suv") %>% group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty)) %>% arrange(desc(mean_cty)) %>% head(5)
ggplot(data = suv_mpg, aes(x=reorder(manufacturer, -mean_cty), y = mean_cty)) +  geom_col()

#Q2. 자동차 중에서 어떤 class가 가장 많은지 알아보려고 함. 자동차 종류별 빈도를 표현한 막대 그래프 만들어라.
ggplot(data = mpg, aes(x=class)) + geom_bar()