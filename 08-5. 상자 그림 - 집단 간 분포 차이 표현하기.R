## 상자 그림(Box Plot)을 보면 분포를 알 수 있기 때문에 평균만 볼 때보다 데이터의 특징을 더 자세하게 이해할 수 있음

## 상자 그림 만들기
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

## 혼자서 해보기
#Q1. class가 "compact", "subcompact", "suv"인 자동차의 cty가 어떻게 다른지 비교해 보려고 한다. 세 차종의 cty를 나타낸 상자 그림을 만들어 보라.
mpg <- as.data.frame(ggplot2::mpg)
class_mpg <- mpg %>%
  filter(class %in% c("compact", "subcompact", "suv"))
ggplot(data=class_mpg, aes(x=class, y=cty)) + geom_boxplot()