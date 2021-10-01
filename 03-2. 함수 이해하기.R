## 숫자를 다루는 함수 이용하기

# 변수 만들기
x <- c(1, 2, 3)
x

# 함수 적용하기
mean(x)

max(x)

min(x)

## 문자를 다루는 함수 이용하기
## paste() : 여러 문자를 합쳐 하나로 만드는 함수
str5 <- c("Hello!","World","is","good!")
paste(str5, collapse=",")  # 쉼표를 구분자로 str5의 단어들 하나로 합치기
paste(str5, collapse=" ")

x_mean <- mean(x)
x_mean

str5_paste <- paste(str5, collapse = " ")
str5_paste