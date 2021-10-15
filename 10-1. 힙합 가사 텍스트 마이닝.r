# 텍스트 마이닝 패키지 설치
install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")

# 패키지 로드
library(KoNLP)
library(dplyr)

useNIADic() 

# 데이터 불러오기
txt <- readLines("hiphop.txt")
head(txt)

# 특수문자 제거하기
install.packages("stringr")
library(stringr)

txt <- str_replace_all(txt, "\\W", " ")

##가장 많이 사용된 단어 알아보기

# 명사 추출하기
extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")

# 가사에서 명사 추출
nouns <- extractNoun(txt)

# 추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))

# 데이터 프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

# 변수명 수정
df_word <- rename(df_word, word = Var1, freq = Freq)

# 두 글자 이상 단어 추출
df_word <- filter(df_word, nchar(word) >= 2)

# 빈도 순으로 정렬 후 상위 20개 단어 추출
top_20 <- df_word %>% arrange(desc(freq)) %>% head(20)
top_20

# 워드 클라우드 만들기
install.packages("wordcloud")

library(wordcloud)
library(RColorBrewer)

# Dark2 색상 목록에서 8개 색상 추출
pal <- brewer.pal(8,"Dark2")

# 난수 고정하기
set.seed(1234)

wordcloud(words = df_word$word,  # 단어
         freq = df_word$freq,    # 빈도
         min.freq = 2,           # 최소 단어 빈도
         max.words = 200,        # 표현 단어 수
         random.order = F,       # 고빈도 단어 중앙 배치
         rot.per = .1,           # 회전 단어 비율
         scale = c(4, 0.3),      # 단어 크기 범위
         colors = pal)           # 색상 목록

# 단어 색상 바꾸기
pal <- brewer.pal(9, "Blues")[5:9] # 색상 목록 새성
set.seed(1234)  # 난수 고정

wordcloud(words = df_word$word,  # 단어
         freq = df_word$freq,    # 빈도
         min.freq = 2,           # 최소 단어 빈도
         max.words = 200,        # 표현 단어 수
         random.order = F,       # 고빈도 단어 중앙 배치
         rot.per = .1,           # 회전 단어 비율
         scale = c(4, 0.3),      # 단어 크기 범위
         colors = pal)           # 색상 목록
