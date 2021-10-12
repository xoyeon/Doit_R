# 데이터 불러오기
raw_welfare <- read.spss(file = 'Koweps_hpc10_2015_beta1.sav', to.data.frame = T, reencode='utf-8')

# 복사본 만들기
Welfare <- raw_welfare

# 데이터 검토하기
head(Welfare)
tail(Welfare)
View(Welfare)
dim(Welfare)
str(Welfare)
summary(Welfare)

# 변수명 바꾸기
Welfare <- rename(Welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)

# 나이 변수 검토 및 전처리
class(Welfare$birth)

summary(Welfare$birth)
qplot(Welfare$birth)

# 이상치 확인
summary(Welfare$birth)

# 결측치 확인
table(is.na(Welfare$birth))

# 이상치 결측 처리
Welfare$birth <- ifelse(Welfare$birth == 9999, NA, Welfare$birth)
table(is.na(Welfare$birth))

# 파생변수 만들기 - 나이
Welfare$age <- 2015 - Welfare$birth + 1

summary(Welfare$age)
qplot(Welfare$age)

# 나이와 월급의 관계 분석하기
age_income <- Welfare %>%
  filter(!is.na(income)) %>%
  summarise(mean_income = mean(income))

head(age_income)

ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()