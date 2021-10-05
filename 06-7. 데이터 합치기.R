# 가로로 합치기
test1 <- data.frame(id = c(1,2,3,4,5),
                    midterm = c(60,80,70,90,85))
test1

test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(70,83,65,95,80))
test2

total <- left_join(test1, test2, by = 'id')
total

# 다른 데이터를 활용해 변수 추가하기
name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name

exam_new <- left_join(exam, name, by = "class")
exam_new

# 세로로 합치기
group_a <- data.frame(id = c(1,2,3,4,5),  ## 학생 1~5번 시험 데이터 생성
                      test = c(60,80,70,90,85))
group_a

group_b <- data.frame(id = c(6,7,8,9,10),  ## 학생 6~10번 시험 데이터 생성
                     test = c(70,83,65,95,80))
group_b

group_all <- bind_rows(group_a, group_b)
group_all

## 혼자서 해보기
fuel <- data.frame(fl = c("C","d","e","p","r"),
                   price_fl = c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F)
fuel

#Q1. mpg 데이터에는 연료 종류를 나타낸 fl 변수는 있지만 연료 가격을 나타낸 변수는 없다. 위에서 만든 fuel 데이터를 이용해 mpg 데이터에 price_fl 변수를 추가하여라.
fuel_add <- left_join(mpg, fuel, id = "fl")

#Q2. 연료 가격 변수가 잘 추가됐는지 확인하기 위해 model, fl, price_fl 변수를 추출해 앞부분 5행을 출력하라.
fuel_add %>%
  select(model, fl, price_fl) %>%
  head(5)