# 변수명 바꾸기
df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw

# dplyr 설치 및 로드
install.packages('dplyr')
library(dplyr)

# 데이터 프레임 복사본 만들기
df_new <- df_raw # 복사본 생성
df_new # 출력

# 변수명 바꾸기
df_new <- rename(df_new, v2 = var2) # var2를 v2로 수정
df_new

## 혼자서 해보기
# Q1. ggplot2() 패키지의 mpg 데이터를 사용할 수 있도록 볼러온 후 복사본을 만드세요
mpg <- as.data.frame(ggplot2::mpg)
mpg_copy <- mpg

# Q2.복사본 데이터를 이용해 cty는 city로, hwy는 highway로 수정하세요
mpg_copy <- rename(mpg_copy, city = cty, highway = hwy)

# Q3.데이터 일부를 출력해 변수명이 바뀌었는지 확인해 보세요.
mpg_copy
