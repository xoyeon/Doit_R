# math 추출
exam %>% select(math)

# english 추출
exam %>% select(english)

# class, math, english 변수 추출
exam %>% select(class, math, english)

# math 변수 제외
exam %>% select(-math)

# math, english 제외
exam %>% select(-math, -english)

# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class == 1) %>% select(english)

# 가독성 있게 줄 바꾸기
exam %>%
  filter(class == 1) %>%
  select(english)

# 일부만 출력하기
exam %>%
  select(id, math) %>%
  head

## 혼자서 해보기
# Q1. mpg 데이터는 11개 변수로 구성되어 있다. 이 중 일부만 추출해 분석에 활용하려고 한다. mpg 데이터에서 class, cty 변수를 추출해 새로운 데이터를 만드시오. 새로 만든 데이터의 일부를 출력해 두 변수로만 구성되어 있는지 확인하시오.
mpg <- as.data.frame(ggplot2::mpg)
df <- mpg %>% select(class, cty)
head(df)

# Q2. 자동차 종류에 따라 도시 연비가 다른지 알아보려고 한다. 앞에서 추출한 데이터를 이요해 class가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty평균이 더 높은지 알아보라.
df_suv <- df %>% filter(class == "suv")
df_compact <- df %>% filter(class == "compact")
mean(df_suv$cty)
mean(df_compact$cty)