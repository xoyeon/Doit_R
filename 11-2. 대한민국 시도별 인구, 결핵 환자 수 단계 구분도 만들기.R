# 패키지 준비하기
install.packages("stringi")

install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")

library(kormaps2014)

# 대한민국 시도별 인구 데이터 준비하기
str(changeCode(korpop1))

library(dplyr)
korpop1 <- rename(korpop1,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)

# 대한민국 시도 지도 데이터 준비하기
str(changeCode(kormap1))

# 단계 구분도 만들기
library(ggplot2)
library(ggiraphExtra)

ggChoropleth(data = korpop1,       # 지도에 표현할 데이터
             aes(fill = pop,       # 색깔로 표현할 변수
                 map_id = code,    # 지역 기준 변수
                 tooltip = name),  # 지도 위에 표시할 지역명
             map = kormap1,        # 지도 데이터
             interactive = T)      # 인터랙티브

# 대한민국 시도별 결핵 환자 수 단계 구분도 만들기
str(changeCode(tbc))

ggChoropleth(data = tbc,          # 지도에 표현할 데이터
             aes(fill = NewPts,    # 색깔로 표현할 변수
                 map_id = code,    # 지역 기준 변수
                 tooltip = name),  # 지도 위에 표시할 지역명
             map = kormap1,        # 지도 데이터
             interactive = T)      # 인터랙티브