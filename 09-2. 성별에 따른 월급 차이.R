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

# 성변 변수 검토 및 전처리
class(Welfare$sex)
table(Welfare$sex)

# 이상치 확인
table(Welfare$sex)

# 이상치 결측 처리
Welfare$sex <- ifelse(Welfare$sex == 9, NA, Welfare$sex)  #모른다고 답하거나 응답하지 않았을 경우는 9로 코딩되어 있음

# 결측치 확인
table(is.na(Welfare$sex))

# 성별 항목 이름 부여
Welfare$sex <- ifelse(Welfare$sex == 1, "male", "female")
table(Welfare$sex)

qplot(Welfare$sex)

# 월급 변수 검토 및 전처리
class(Welfare$income)
summary(Welfare$income)

qplot(Welfare$income)
qplot(Welfare$income) + xlim(0,1000) # 0~1000까지만 표현되게 설정

# 이상치 확인
summary(Welfare$income)

# 이상치 결측 확인
Welfare$income <- ifelse(Welfare$income %in% c(0, 9999), NA, Welfare$income)

# 결측치 확인
table(is.na(Welfare$income))

# 성별에 따른 월급 차이 분석하기
sex_income <- Welfare %>%
  filter(!is.na(income)) %>%
  summarise(mean_income = mean(income))

sex_income

# 그래프 만들기
ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()