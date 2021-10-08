## 선 그래프(Line Chart)는 시간에 따라 달라지는 데이터를 표현할 때 주로 사용
# -> 일정 시간 간격을 두고 나열된 데이터를 '시계열 데이터(Time Series Data)'라고 하고, 시계열 데이터를 선으로 표현한 그래프를 '시계열 그래프(Time Series Chart)'라고 함.

## 시계열 그래프 만들기
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

## 혼자서 해보기
#Q1. psavert가 시간에 따라 어떻게 변해 왔는지 알아보려고 함. 시간에 따른 개인 저축률의 변화를 나타낸 시계열 그래프를 만들어 보라.
ggplot(data = economics, aes(x=date, y = psavert)) + geom_line()