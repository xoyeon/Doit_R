# 산점도는 연속 값으로 된 두 변수의 관계를 표현할 때 사용

## 산점도 만들기
library(ggplot2)

# x축은 displ, y축은 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))

# 배경에 산점도 추가. + 기호를 이용해 그래프 유형 geom_point() 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# xlim으로 x축 범위 3~6으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6)

# ylim으로 y축 범위 10~30으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() +
  xlim(3, 6) + ylim(10, 30)

## 혼자서 해보기
# Q1.mpg 데이터의 cty와 hwy 간에 어떤 관계가 있는지 알아보려고 한다. x축은 cty, y축은 hwy로 된 산점도를 만들어 보시오.
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()

# Q2. 미국 지역별 인구통계 정보를 담은 ggplot2 패키지의 midwest 데이터를 이용해 전체 인구와 아시아인 인구 간에 어떤 관계가 있는지 알아보려고 한다. x축은 poptotal, y축은 popasian으로 된 산점도를 만들어 보시오. 전체 인구는 50만 명 이하, 아시아인 인구는 1만 명 이하인 지역만 산점도에 표시되게 설정하시오.
ggplot(data = midwest, aes(x=poptotal, y=popasian)) + geom_point() + 
  xlim(0,500000) + ylim(0,10000)