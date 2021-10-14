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

# 종교 변수 검토 및 전처리하기
class(welfare$religion)
table(welfare$religion)

# 종교 유무 이름 부여
welfare$religion <- ifelse(welfare$religion == 1, "yes", "no")
table(welfare$religion)

qplot(welfare$religion)

# 혼인 상태 변수 검토 및 전처리하기
class(welfare$marriage)
table(welfare$marriage)

# 이혼 여부 변수 만들기
welfare$group_marriage <- ifelse(welfare$marriage == 1, "marriage",
                                 ifelse(welfare$marriage == 3, "divorce", NA))
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))

qplot(welfare$group_marriage)

# 종교 유무에 따른 이혼율 분석하기
religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

religion_marriage

religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  count(religion, group_marriage) %>%
  group_by(religion) %>%
  mutate(pct = round(n/sum(n)*100, 1))

# 이혼 추출
divorce <- religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(religion, pct)

divorce

ggplot(data = divorce, aes(x=religion, y = pct)) + geom_col()

# -- 연령대 변수 검토 및 전처리하기
welfare$age <- 2015 - welfare$birth + 1
        
welfare <- welfare %>%
  mutate(ageg = ifelse(age < 30, "young",
                       ifelse(age <= 59, "middle", "old")))

# 연령대 및 종교 유무에 따른 이혼율 분석하기
ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(ageg, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

ageg_marriage

ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  count(ageg, group_marriage) %>%
  group_by(ageg) %>%
  mutate(pct = round(n/sum(n)*100, 1))

# 초년 제외, 이혼 추출
ageg_divorce <- ageg_marriage %>%
  filter(ageg != "young" & group_marriage == "divorce") %>%
  select(ageg, pct)

ageg_divorce

# 그래프 만들기
ggplot(data = ageg_divorce, aes(x = ageg, y = pct)) + geom_col()

# 연령대, 종교 유무, 결혼 상태별 비율표 만들기
ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  group_by(ageg, religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

ageg_religion_marriage

ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  count(ageg, religion, group_marriage) %>%
  group_by(ageg, religion) %>%
  mutate(pct = round(n/sum(n)*100, 1))

ageg_religion_marriage

# 연령대 및 종교 유무별 이혼율 표 만들기
df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(ageg, religion, pct)

df_divorce

ggplot(data = df_divorce, aes(x = ageg, y = pct, fill = religion)) +
  geom_col(position = "dodge")