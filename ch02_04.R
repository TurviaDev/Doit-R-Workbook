### 빠진 데이터를 찾아라! - 결측치 정제하기 ----------
## 결측치 찾기 ----------
# 1. 결측치가 포함된 데이터 프레임 생성
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df
##    sex score
## 1    M     5
## 2    F     4
## 3 <NA>     3
## 4    M     4
## 5    F    NA

# 2. 결측치 확인
is.na(df)
##        sex score
## [1,] FALSE FALSE
## [2,] FALSE FALSE
## [3,]  TRUE FALSE
## [4,] FALSE FALSE
## [5,] FALSE  TRUE

# 3. 결측치 빈도 출력
table(is.na(df))
## FALSE  TRUE 
##     8     2 

# 3. 어떤 변수에 결측치가 있는 지 확인
# sex 결측치 빈도 출력
table(is.na(df$sex))
## FALSE  TRUE 
##     4     1 

# score 결측치 빈도 출력
table(is.na(df$score))
## FALSE  TRUE 
##     4     1 

# 4. 결측치가 포함된 데이터에 함수 적용
# 평균 산출
mean(df$score)
## [1] NA

# 합계 산출
sum(df$score)
## [1] NA

## 결측치 제거하기 ----------
# 1. 결측치가 있는 행 제거
# 패키지 로드
library(dplyr)

# score가 NA인 데이터만 출력
df %>% filter(is.na(score))
##   sex score
## 1   F    NA

# 2. 결측치가 아닌 행 출력
# score 결측치 제거
df %>% filter(!is.na(score))
##    sex score
## 1    M     5
## 2    F     4
## 3 <NA>     3
## 4    M     4

# 3. 결측치가 없는 지 확인
df_nomiss <- df %>% filter(!is.na(score))  # score 결측치 제거
mean(df_nomiss$score)                      # score 평균 산출
## [1] 4

sum(df_nomiss$score)                       # score 합계 산출
## [1] 16

# 4. 여러 변수 동시에 결측치 없는 데이터 추출
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))  # score, sex 결측치 제거
df_nomiss                                                # 출력
##   sex score
## 1   M     5
## 2   F     4
## 3   M     4

# 5. 결측지가 하나라도 있으면 제거
df_nomiss2 <- na.omit(df)  # 모든 변수에 결측치 없는 데이터 추출
df_nomiss2                 # 출력
##   sex score
## 1   M     5
## 2   F     4
## 4   M     4

## 함수의 결측치 제외 기능 이용하기 ----------
# 1. na.rm 파라미터 적용
mean(df$score, na.rm = T)  # 결측치 제외하고 평균 산출
## [1] 4

sum(df$score, na.rm = T)   # 결측치 제외하고 합계 산출
## [1] 16

# 2. 요약 통계량 산출할 때 na.rm 파라미터 적용
exam <- read.csv("csv_exam.csv")  # 데이터 불러오기
exam[c(3, 8, 15), "math"] <- NA   # 3, 8, 15행의 math에 NA 할당
exam
##    id class math english science
## 1   1     1   50      98      50
## 2   2     1   60      97      60
## 3   3     1   NA      86      78
## 4   4     1   30      98      58
## 5   5     2   25      80      65

# math 평균 산출
exam %>% summarise(mean_math = mean(math))
##   mean_math
## 1        NA

# 2. 결측치 제외한 평균 산출
exam %>% summarise(mean_math = mean(math, na.rm = T))  
##   mean_math
## 1  55.23529

# 3. 다른 수치 연산 함수에도 적용
exam %>% summarise(mean_math = mean(math, na.rm = T),      # 평균 산출
                   sum_math = sum(math, na.rm = T),        # 합계 산출
                   median_math = median(math, na.rm = T))  # 중앙값 산출
##   mean_math sum_math median_math
## 1  55.23529      939          50

## 평균값으로 결측치 대체하기 ----------
# 1. 평균값 구하기
mean(exam$math, na.rm = T) # 결측치 제외하고 math 평균 산출
## [1] 55.23529

# 2. ifelse()를 이용해 NA값을 평균값으로 대체
exam$math <- ifelse(is.na(exam$math), 55, exam$math)  # math가 NA면 55로 대체
table(is.na(exam$math))                               # 결측치 빈도표 생성
##
## FALSE 
##    20 

exam
##    id class math english science
## 1   1     1   50      98      50
## 2   2     1   60      97      60
## 3   3     1   55      86      78
## 4   4     1   30      98      58

# math 평균 산출
mean(exam$math)
## [1] 55.2


### 이상한 데이터를 찾아라! - 이상치 제거하기 ----------
## 이상치 제거하기 - 존재할 수 없는 값 ----------
# 1. 이상치가 포함된 데이터 생성
# 성별 변수: 남자 = 1, 여자 = 2
# 성적 변수: 1~5점
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier
##   sex score
## 1   1     5
## 2   2     4
## 3   1     3
## 4   3     4
## 5   2     2
## 6   1     6

# 2. 이상치 확인하기
table(outlier$sex)
## 
## 1 2 3 
## 3 2 1 

table(outlier$score)
## 
## 2 3 4 5 6 
## 1 1 2 1 1 

# 3. 결측 처리하기
# sex가 3이면 NA 할당
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier
##   sex score
## 1   1     5
## 2   2     4
## 3   1     3
## 4  NA     4
## 5   2     2
## 6   1     6

# score가 5보다 크면 NA 할당
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier
##   sex score
## 1   1     5
## 2   2     4
## 3   1     3
## 4  NA     4
## 5   2     2
## 6   1    NA

# 4. 결측치를 제외한 분석
outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))
# A tibble: 2 × 2
##     sex mean_score
##   <dbl>      <dbl>
## 1     1          4
## 2     2          3

## 이상치 제거하기 - 극단적인 값 ----------
# 1. mpg 데이터의 hwy 변수로 상자 그림 만들기
mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)

# 2. 상자 그림 통계치 출력
boxplot(mpg$hwy)$stats            
##      [,1]
## [1,]   12
## [2,]   18
## [3,]   24
## [4,]   27
## [5,]   37

# 3. 결측 처리하기
# 12~37 벗어나면 NA 할당
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))
## 
## FALSE  TRUE 
##   231     3

# 4. 결측치를 제외한 분석
mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))
## # A tibble: 3 × 2
##   drv   mean_hwy
##   <chr>    <dbl>
## 1 4         19.2
## 2 f         27.7
## 3 r         21  

### 정리하기 ----------
## 1.결측치 정제하기
# 결측치 확인
table(is.na(df$score))

# 결측치 제거
df_nomiss <- df %>% filter(!is.na(score))

# 여러 변수 동시에 결측치 제거
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))

# 함수의 결측치 제외 기능 이용하기
mean(df$score, na.rm = T)
exam %>% summarise(mean_math = mean(math, na.rm = T))

## 2.이상치 정제하기
# 이상치 확인
table(outlier$sex)

# 결측 처리
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)

# boxplot으로 극단치 기준 찾기
boxplot(mpg$hwy)$stats

# 극단치 결측 처리
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
