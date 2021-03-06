# 변수 만들기
a <- 1  # a에 1 할당
a       # a 출력

b <- 2
b

c <- 3
c

d <- 3.5
d

a+b

a+b+c

4/b

5*b

# 여러 값으로 구성된 변수 만들기

## c() 함수는 'Combine'의 머리글자. 변수에 여러 개의 값을 넣는 기능
var1 <- c(1,2,5,7,8)  # 숫자 5개로 구성된 var1 생성
var1

## 콜론(:)을 이용해 시작 숫자와 마지막 숫자 입력하면 1씩 증가
var2 <- c(1:5)  # 1~5까지 연속 값으로 var2 생성
var2

## seq() 함수는 괄호 안에 시작 숫자와 마지막 숫자를 쉼표로 구분하여 입력
var3 <- seq(1,5)  # 1~5까지 연속 값으로 var3 생성
var3

## by 파라미터를 이용하면 일정한 간격을 두고 연속된 숫자로 된 변수를 만듦
var4 <- seq(1, 10, by =2)  # 1~10까지 2 간격 연속 값으로 var4 생성
var4

var5 <- seq(1, 10, by =3)  # 1~10까지 3 간격 연속 값으로 var5 생성
var5

## 변수에 숫자 더하기
var1+2

## 변수에 변수 더하기
var1+var2

# 문자로 된 변수 만들기
str1 <- "a"
str1

str2 <- "text"
str2

str3 <- "Hello World"
str3

str4 <- c("a", "b", "c")
str4

str5 <- c("Hello!", "World", "is", "good")
str5

## BUT! 문자로 된 변수로는 연산할 수 없다