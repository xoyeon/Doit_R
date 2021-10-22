# 행 번호로 행 추출하기
exam <- read.csv("csv_exam.csv")

exam[]  # 조건 없이 전체 데이터 출력력

exam[1,]  # 1행 추출
exam[2,]  # 2행 추출

# 조건을 충족하는 행 추출하기
exam[exam$class == 1,]  # class가 1인 행 추출

exam[exam$math >= 80,]  # 수학 점수가 80점 이상인 행 추출

# 1반 이면서 수학 점수가 50점 이상
exam[exam$class == 1 & exam$math >= 50,]

# 영어 점수가 90점 미만이거나 과학 점수가 50점 미만
exam[exam$english < 90 | exam$science < 50,]

# 열 번호로 변수 추출하기
exam[,1]  # 첫 번째 열 추출
exam[,2]  # 두 번째 열 추출
exam[,3]  # 세 번째 열 추출

# 변수명으로 변수 추출하기
exam[, "class"]  # class 변수 추출
exam[, "math"]   # math 변수 추출

exam[, c("class", "math", "english")]  # class, math, english 변수 추출

# 행, 변수 동시 추출하기
exam[1,3]  # 행, 변수 모두 인덱스

exam[5, "english"]  # 행 인덱스, 열 변수명

exam[exam$math >= 50, "english"]  # 행 부등호 조건, 열 변수명

exam[exam$math >= 50, c("english", "science")]  # 행 부등호 조건, 열 변수명



# -- dplyr과 내장 함수의 차이
#### 내장 함수 코드
exam$tot <- (exam$math + exam$english + exam$science)/3
aggregate(data = exam[exam$math >= 50 & exam$english >= 80,], tot~class, mean)

#### dplyr 코드
filter(math >= 50 & english >= 80) %>%
  mutate(tot =(math +english + science)/3) %>%
  group_by(class) %>%
  summarise(mean = mean(tot))


## 혼자서 해보기
mpg <- as.data.frame(ggplot2 :: mpg)  # mpg 데이터 불러오기

mpg %>%
  mutate(tot = (cty + hwy)/2) %>%                  # 통합 연비 변수 생성
  filter(class == "compact" | class == "suv") %>%  # compact, suv 추출
  group_by(class) %>%                              # class별 분리
  summarise(mean_tot = mean(tot))                  # tot 평균 산출