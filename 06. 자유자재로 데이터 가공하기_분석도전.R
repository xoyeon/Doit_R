#문제1. popadults는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타낸다. midwest 데이터에 '전체 인구 대비 미성년 인구 백분율'변수를 추가하라.
midwest <- as.data.frame(ggplot2::midwest)
midwest <- midwest %>% mutate(ratio_child = (poptotal-popadults)/poptotal*100)


#문제2. 미성년 인구 백분율이 가장 높은 상위 5개 county의 미성년 인구 백분율을 출력하라.
midwest %>%
  arrange(desc(ratio_child)) %>%
  select(county, ratio_child) %>%
  head(5)

#문제3. 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 각 등급에 몇 개의 지역이 있는지 알아보라.
midwest <- midwest %>%
  mutate(grade = ifelse(ratio_child >= 40, "large",
                        ifelse(ratio_child >= 30, "middle", "small")))
table(midwest$grade)

#문제4. popasian은 해당 지역의 아시아인 인구를 나타난다. '전체 인구 대비 아시아인 인구 백분율'변수를 추가하고 하위 10개 지역의 state, county, 아시아인 인구 백분율을 출력하라.
midwest %>%
  mutate(ratio_asian = (popasian/poptotal)*100) %>%
  arrange(ratio_asian) %>%
  select(state, county, ratio_asian) %>%
  head(10)