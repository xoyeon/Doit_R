# 패키지 설치
install.packages("dygraphs")
library(dygraphs)

economics <- ggplot2 :: economics
head(economics)

library(xts)  # 데이터가 시간 순서 속성을 지니는 xts 데이터 타입으로 변경경
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)

dygraph(eco)

# 날짜 범위 선택 기능
dygraph(eco) %>% dyRangeSelector()

# 저축률 표현하기
eco_a <- xts(economics$psavert, order.by = economics$date)

# 실업자 수 표현하기
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)  ## 100만 명 단위로 수정정

eco2 <- cbind(eco_a, eco_b)   # 가로로 데이터 결합
colnames(eco2) <- c("psavert", "unemploy")  # xts 타입이기 때문에 rename() 대신 colnames() 사용
head(eco2)

dygraph(eco2) %>% dyRangeSelector()