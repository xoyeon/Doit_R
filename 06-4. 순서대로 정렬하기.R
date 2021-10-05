# math 오름차순 정렬
exam %>% arrange(math)

# math 내림차순 정렬
exam %>% arrange(desc(math))

# class 및 math 오름차순 정렬
exam %>% arrange(class, math)

## 혼자서 해보기
#Q1. "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy가 높은지 알아보려고 한다. "audi"에서 생산한 자동사 중 hwy가 1~5위에 해당하는 자동차의 데이터를 출력하시오.
mpg %>%
  filter(manufacturer == "audi") %>%
  arrange(desc(hwy)) %>%
  head(5)