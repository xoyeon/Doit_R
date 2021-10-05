library(dplyr)
exam <- read.csv("csv_exam.csv")

# exam에서 class가 1인 경우만 추출해 출력
exam %>% filter(class == 1)

# 2반인 경우만 추출
exam %>% filter(class == 2)

# 1반이 아닌 경우
exam %>% filter(class != 1)

# 3반이 아닌 경우
exam %>% filter(class != 3)

# 수학 점수가 50점을 초과한 경우
exam %>% filter(math > 50)

# 수학 점수가 50점 미만인 경우
exam %>% filter(math < 50)

# 영어 점수가 80점 이상인 경우
exam %>% filter(english >= 80)

# 영어 점수가 80점 이하인 경우
exam %>% filter(english <= 80)

# 1반이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class == 1 & math >= 50)

# 2반이면서 영어 점수가 80점 이상인 경우
exam %>% filter(class ==2 & english >= 80)

# 수학 점수가 90점 이상이거나 영어 점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)

# 영어 점수가 90점 미만이거나 과학 점수가 50점 미만인 경우
exam %>% filter(english < 90 | science <50)

# 1, 3, 5반에 해당하면 추출
exam %>% filter(class == 1 | class == 3 | class == 5)

# %in% 기호는 변수의 값이 지정한 조건 목록에 해당하는지 확인하는 기능
exam %>% filter(class %in% c(1,3,5))

# class가 1인 행 추출, class 1에 할당
class1 <- exam %>% filter(class == 1)

# 1반 수학 점수 평균 구하기
mean(class1$math)

## 혼자서 해보기
#Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 한다. displ이 4이하인 자동차와 5이상인 자동차 중 어떤 자동차의 hwy가 평균적으로 더 높은지 알아보시오.
mpg <- as.data.frame(ggplot2::mpg)
mpg_4 <- mpg %>% filter(displ <= 4)
mpg_5 <- mpg %>% filter(displ >= 5)
mean(mpg_4$hwy)
mean(mpg_5$hwy)

#Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 한다. "audi"와 "toyota"중 어느 manufacturer의 cty가 평균적으로 더 높은지 알아보시오.
audi <- mpg %>% filter(manufacturer == 'audi')
toyota <- mpg %>% filter(manufacturer == 'toyota')
mean(audi$cty)
mean(toyota$cty)

#Q3. "chevrolet","ford","honda" 자동차의 고속도로 연비 평균을 알아보려고 한다. 이 회사들의 데이터를 추출한 후 hwy 전체 평균을 구하라.
hwy_mean <- mpg %>% filter(manufacturer %in% c("chevrolet","ford","honda"))
mean(hwy_mean$hwy)