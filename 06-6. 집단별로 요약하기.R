# math 평균 산출
exam %>% summarise(mean_math = mean(math))

# 집단별로 요약하기
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math))

# 여러 요약 통계량 한 번에 산출하기
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())

# 각 집단별로 다시 집단 나누기
mpg %>%
  group_by(manufacturer, drv) %>%
  summarise(mean_cty = mean(cty)) %>%
  head(10)

# dplyr 조합하기 "회사별로 "suv" 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 1~5위까지 출력하기"
mpg %>%
  group_by(manufacturer) %>%  #회사별로 정리
  filter(class == "suv") %>%  #suv 추출
  mutate(tot = (cty+hwy)/2) %>% #통합 연비 변수 생성
  summarise(mean_tot = mean(tot)) %>% #통합 연비 평균 산출
  arrange(desc(mean_tot)) %>% # 내림차순 정렬
  head(5) # 1~5위까지 출력력

## 혼자서 해보기
#Q1. mpg 데이터의 class는 "suv","compact"등 자동차를 특징에 따라 일곱 종류로 분류한 변수다. 어떤 차종의 도시 연비가 높은지 비교해 보려고 한다. class별 cty 평균을 구하라.
mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty))

#Q2. 앞 문제의 출력 결과는 class 값 알파벳 순으로 정렬되어 있다. 어떤 차종의 도시 연비가 높은지 숩게 알아볼 수 있도록 cty 평균이 높은 순으로 정렬해 출력하라.
mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty))

#Q3. 어떤 회사 자동차의 hwy가 가장 높은지 알아보려고 한다. hwy 평균이 가장 높은 회사 세 곳을 출력하라.
mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>%
  head(3)

#Q4. 어떤 회사에서 "compact" 차종을 가장 많이 생산하는지 알아보려고 한다. 각 회사별 "compact" 차종 수를 내림차순으로 정렬해 출력하라.
mpg %>%
  filter(class == "compact") %>%
  group_by(manufacturer) %>%
  summarise(count = n()) %>%
  arrange(desc(count))