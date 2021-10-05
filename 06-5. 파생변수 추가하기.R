# 파생변수 추가하기
exam %>%
  mutate(total = math + english + science) %>%
  head

# 여러 파생변수 한 번에 추가하기
exam %>%
  mutate(total = math + english + science,
         mean = (math +english + science)/3) %>%
  head

# 조건에 따라 다른 값을 부여한 변수 추가
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head

# 추가한 변수를 dplyr 코드에 바로 활용하기
exam %>%
  mutate(total = math + english + science) %>%
  arrange(total) %>%
  head

## 혼자서 해보기
#Q1. mpg() 데이터 복사본을 만들고, cty와 hwy를 더한 '합산 연비 변수'를 추가하시오.
mpg_copy <- mpg
mpg_copy <- mpg_copy %>% mutate(total = cty + hwy)
head(mpg_copy)

#Q2. 앞에서 만든 '합산 연비 변수'를 2로 나눠 '평균 연비 변수'를 추가하시오.
mpg_mean <- mpg_copy %>% mutate(mean = total/2)
head(mpg_mean)

#Q3. '평균 연비 변수'가 가장 높은 자동차 3종의 데이터를 출력하시오.
mpg_copy %>%
  arrange(desc(mean)) %>%
  head(3)

#Q4. 1~3번 문제를 해결할 수 있는 하나로 연결된 dplyr구문을 만들어 실행해 보시오. 데이터는 복사본 대신 mpg 원본 사용.
mpg %>%
  mutate(total = cty + hwy,
         mean = total/2) %>%
  arrange(desc(mean)) %>%
  head(3)