# 실업자 수와 개인 소비 지출의 상관관계
economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)

# 상관행렬 히트맵 만들기
head(mtcars) # mtcars는 자동차 32종의 11개 속성에 대한 정보를 담고 있는 데이터

car_cor <- cor(mtcars) # 상관행렬 생성
round(car_cor, 2)      # 소수점 셋째 자리에서 반올림해 출력

install.packages("corrplot")
library(corrplot)

corrplot(car_cor)

corrplot(car_cor, method = "number")

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

corrplot(car_cor,
         method = "color",        # 색깔로 표현
         col = col(200),          # 색상 200개 선정
         type = "lower",          # 왼쪽 아래 행렬만 표시
         order = "hclust",        # 유사한 상관계수끼리 군집화
         addCoef.col = "black",   # 상관계수 색깔
         tl.col = "black",        # 변수명 색깔
         tl.srt = 45,             # 변수명 45도 기울임
         diag = F)                # 대각 행렬 제외