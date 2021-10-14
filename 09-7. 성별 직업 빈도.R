# 패지키 설치 및 로드하기
install.packages("foreign")

library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

# 데이터 불러오기
raw_welfare <- read.spss(file = 'Koweps_hpc10_2015_beta1.sav', to.data.frame = T, reencode='utf-8')

# 복사본 만들기
welfare <- raw_welfare

# 데이터 검토하기
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

# 변수명 바꾸기
welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)

# 09-2. 성별 변수 검토 및 전처리 --
class(welfare$sex)
table(welfare$sex)

# 이상치 확인
table(welfare$sex)

# 이상치 결측 처리
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)  #모른다고 답하거나 응답하지 않았을 경우는 9로 코딩되어 있음

# 결측치 확인
table(is.na(welfare$sex))

# 성별 항목 이름 부여
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)

qplot(welfare$sex)

# -- 직업 변수 검토 및 처리하기
class(welfare$code_job)

table(welfare$code_job)

# 전처리
library(readxl)
list_job <- read_excel("Koweps_Codebook.xlsx", col_names = T, sheet = 2)
head(list_job)

dim(list_job)

welfare <- left_join(welfare, list_job, id = "code_job")

welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)

## 직업별 월급 차이 분석하기
# 09-6.월급 변수 검토 및 전처리 --
class(welfare$income)
summary(welfare$income)

qplot(welfare$income)
qplot(welfare$income) + xlim(0,1000) # 0~1000까지만 표현되게 설정

# 이상치 확인
summary(welfare$income)

# 이상치 결측 확인
welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)

# 결측치 확인
table(is.na(welfare$income))

## 09-7. 성별 직업 빈도 분석하기 --
# 남성 직업 빈도 상위 10개 추출
job_male <- welfare %>%
  filter(!is.na(job) & sex == "male") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)

job_male

# 여성 직업 빈도 상위 10개 추출
job_female <- welfare %>%
  filter(!is.na(job) & sex == "female") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)

job_female

# 남성 직업 빈도 상위 10개 직업
ggplot(data = job_male, aes(x = reorder(job, n), y = n)) +
  geom_col() + coord_flip()

# 여성 직업 빈도 상위 10개 직업
ggplot(data = job_female, aes(x = reorder(job, n), y = n)) +
  geom_col() + coord_flip()

## 원자료를 이용해 막대 그래프를 만들 때는 geom_bar() 사용, 요약표를 이용해 막대 그래프를 만들 때는 geom_col() 사용용