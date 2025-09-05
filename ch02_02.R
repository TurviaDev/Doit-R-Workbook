### 데이터 파악하기 ----------
# 데이터 프레임 생성
exam <- read.csv("csv_exam.csv")
exam

## exam 데이터 파악하기  ----------
# 1. head() - 데이터 앞 부분 확인하기
# 앞에서부터 6행까지 출력
head(exam)
##   id class math english science
## 1  1     1   50      98      50
## 2  2     1   60      97      60
## 3  3     1   45      86      78
## 4  4     1   30      98      58
## 5  5     2   25      80      65
## 6  6     2   50      89      98

# 앞에서부터 10행까지 출력
head(exam, 10)
##    id class math english science
## 1   1     1   50      98      50
## 2   2     1   60      97      60
## 3   3     1   45      86      78
## 4   4     1   30      98      58
## 5   5     2   25      80      65
## 6   6     2   50      89      98
## 7   7     2   80      90      45
## 8   8     2   90      78      25
## 9   9     3   20      98      15
## 10 10     3   50      98      45

# 2. tail() - 데이터 뒷부분 확인하기
# 뒤에서부터 6행까지 출력
tail(exam)
## 15 15     4   75      56      78
## 16 16     4   58      98      65
## 17 17     5   65      68      98
## 18 18     5   80      78      90
## 19 19     5   89      68      87
## 20 20     5   78      83      58

# 뒤에서부터 10행까지 출력
tail(exam, 10)
##    id class math english science
## 11 11     3   65      65      65
## 12 12     3   45      85      32
## 13 13     4   46      98      65
## 14 14     4   48      87      12
## 15 15     4   75      56      78
## 16 16     4   58      98      65
## 17 17     5   65      68      98
## 18 18     5   80      78      90
## 19 19     5   89      68      87
## 20 20     5   78      83      58

# 3. View() - 뷰어 창에서 데이터 확인하기
# 데이터 뷰어 창에서 exam 데이터 확인
View(exam)

# 4. dim() - 데이터가 몇 행, 몇 열로 구성되어 있는지 알아보기
# 행, 열 출력
dim(exam)
## [1] 20  5

# 5. str() - 속성 파악하기
# 데이터 속성 확인
str(exam)
## 'data.frame':	20 obs. of  5 variables:
## $ id     : int  1 2 3 4 5 6 7 8 9 10 ...
## $ class  : int  1 1 1 1 2 2 2 2 3 3 ...
## $ math   : int  50 60 45 30 25 50 80 90 20 50 ...
## $ english: int  98 97 86 98 80 89 90 78 98 98 ...
## $ science: int  50 60 78 58 65 98 45 25 15 45 ...

# 6. summary() - 요약 통계햘 산출하기
# 요약 통계량 출력
summary(exam)
##       id            class        math          english        science     
## Min.   : 1.00   Min.   :1   Min.   :20.00  Min.   :56.0   Min.   :12.00  
## 1st Qu.: 5.75   1st Qu.:2   1st Qu.:45.75  1st Qu.:78.0   1st Qu.:45.00 
## Median :10.50   Median :3   Median :54.00  Median :86.5   Median :62.50 
## Mean   :10.50   Mean   :3   Mean   :57.45  Mean   :84.9   Mean   :59.45 
## 3rd Qu.:15.25   3rd Qu.:4   3rd Qu.:75.75  3rd Qu.:98.0   3rd Qu.:78.00  
## Max.   :20.00   Max.   :5   Max.   :90.00  Max.   :98.0   Max.   :98.00

## mpg 데이터 파악하기 ----------
# 1. 내장 데이터셋 사용을 위한 필수 패키지 설치
install.packages("ggolit2")

# 2. 데이터 프레임 생성
# ggplot2의 mpg 데이터를 데이터 프레임 형태로 불러오기
mpg <- as.data.frame(ggplot2::mpg)

# Raw 데이터 앞 부분 확인
head(mpg)
##   manufacturer model displ year cyl      trans drv cty hwy fl   class
## 1         audi    a4   1.8 1999   4   auto(l5)   f  18  29  p compact
## 2         audi    a4   1.8 1999   4 manual(m5)   f  21  29  p compact
## 3         audi    a4   2.0 2008   4 manual(m6)   f  20  31  p compact
## 4         audi    a4   2.0 2008   4   auto(av)   f  21  30  p compact
## 5         audi    a4   2.8 1999   6   auto(l5)   f  16  26  p compact
## 6         audi    a4   2.8 1999   6 manual(m5)   f  18  26  p compact

# Raw 데이터 뒷부분 확인
tail(mpg)
##     manufacturer  model displ year cyl      trans drv cty hwy fl   class
## 229   volkswagen passat   1.8 1999   4   auto(l5)   f  18  29  p midsize
## 230   volkswagen passat   2.0 2008   4   auto(s6)   f  19  28  p midsize
## 231   volkswagen passat   2.0 2008   4 manual(m6)   f  21  29  p midsize
## 232   volkswagen passat   2.8 1999   6   auto(l5)   f  16  26  p midsize
## 233   volkswagen passat   2.8 1999   6 manual(m5)   f  18  26  p midsize
## 234   volkswagen passat   3.6 2008   6   auto(s6)   f  17  26  p midsize

# Raw 데이터 뷰어 창에서 확인
View(mpg)

# 행, 열 출력
dim(mpg)
## [1] 234  11

# 데이터 속성 확인
str(mpg)
## 'data.frame':	234 obs. of  11 variables:
##  $ manufacturer: chr  "audi" "audi" "audi" "audi" ...
##  $ model       : chr  "a4" "a4" "a4" "a4" ...
##  $ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
##  $ year        : int  1999 1999 2008 2008 1999 1999 2008 1999 1999 2008 ...
##  $ cyl         : int  4 4 4 4 6 6 6 4 4 4 ...
##  $ trans       : chr  "auto(l5)" "manual(m5)" "manual(m6)" "auto(av)" ...
##  $ drv         : chr  "f" "f" "f" "f" ...
##  $ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
##  $ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
##  $ fl          : chr  "p" "p" "p" "p" ...
##  $ class       : chr  "compact" "compact" "compact" "compact" ...

# 요약 통계량 출력
summary(mpg)
## manufacturer       model              displ           year           cyl             trans             drv                cty             hwy             fl                 class        
## Length:234         Length:234         Min.   :1.600   Min.   :1999   Min.   :4.000   Length:234        Length:234         Min.   : 9.00   Min.   :12.00   Length:234         Length:234
## Class :character   Class :character   1st Qu.:2.400   1st Qu.:1999   1st Qu.:4.000   Class :character  Class :character   1st Qu.:14.00   1st Qu.:18.00   Class :character   Class :character
## Mode  :character   Mode  :character   Median :3.300   Median :2004   Median :6.000   Mode  :character  Mode  :character   Median :17.00   Median :24.00   Mode  :character   Mode  :character
## Mean   :3.472   Mean   :2004   Mean   :5.889                                                                              Mean   :16.86   Mean   :23.44
## 3rd Qu.:4.600   3rd Qu.:2008   3rd Qu.:8.000                                                                              3rd Qu.:19.00   3rd Qu.:27.00
## Max.   :7.000   Max.   :2008   Max.   :8.000                                                                              Max.   :35.00   Max.   :44.00

### 변수명 바꾸기 ----------
# 1. 데이터 프레임 생성
df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2))
df_raw
##   var1 var2
## 1    1    2
## 2    2    3
## 3    1    2

# 2. dplyr 설치 및 로드
install.packages("dplyr")
library(dplyr)

# 3. 변수명을 바꾸기 전 원본 보유를 위해 데이터 프레임 복사본 만들기
df_new <- df_raw
df_new
##   var1 var2
## 1    1    2
## 2    2    3
## 3    1    2

# 4. 변수명 바꾸기
df_new <- rename(df_new, v2 = var2)  # var2를 v2로 수정
df_new
##   var1 v2
## 1    1  2
## 2    2  3
## 3    1  2

# 5. 원본과 복사본 비교
df_raw
##   var1 var2
## 1    1    2
## 2    2    3
## 3    1    2

df_new
##   var1 v2
## 1    1  2
## 2    2  3
## 3    1  2

### 파생변수 만들기  ----------
## 변수 조합해 패상변수 만들기 ----------
# 1. 데이터 프레임 생성
df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df
##   var1 var2
## 1    4    2
## 2    3    6
## 3    8    1

# 2. 파생변수 생성
df$var_sum <- df$var1 + df$var2
df
##   var1 var2 var_sum
## 1    4    2       6
## 2    3    6       9
## 3    8    1       9

df$var_mean <- (df$var1 + df$var2)/2
df
##   var1 var2 var_sum var_mean
## 1    4    2       6      3.0
## 2    3    6       9      4.5
## 3    8    1       9      4.5

## mpg 통합 연비 변수 만들기  ----------
# 1. 파생변수 생성
# 통합 연비 변수 생성
mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)
##   manufacturer model displ  year   cyl      trans  drv  cty   hwy   fl     class   total
## 1    audi         a4   1.8  1999     4   auto(l5)    f   18    29    p   compact    23.5
## 2    audi         a4   1.8  1999     4 manual(m5)    f   21    29    p   compact      25  
## 3    audi         a4     2  2008     4 manual(m6)    f   20    31    p   compact    25.5
## 4    audi         a4     2  2008     4   auto(av)    f   21    30    p   compact    25.5
## 5    audi         a4   2.8  1999     6   auto(l5)    f   16    26    p   compact      21  
## 6    audi         a4   2.8  1999     6 manual(m5)    f   18    26    p   compact      22  

# 2. 분석하기
# 통합 연비 변수 평균
mean(mpg$total)
## [1] 20.14957

## 조건문을 활용해 파생변수 만들기 ----------
# <조건> 전체 자동차 중에서 연비 기준을 충족해 ‘고연비 합격 판정’을 받은 자동차가 몇 대나 되는 지 알아보기 (연비가 기준치를 넘으면 합격, 넘기지 못하면 불합격)
# 1. 기준값 정하기
# 통합 연비 변수 total의 평균(Mean)과 중앙값(Median)을 확인
# 요약 통계량 산출
summary(mpg$total)
##  Min.  1st Qu.  Median   Mean  3rd Qu.    Max. 
## 10.50    15.50   20.50  20.15    23.50   39.50 

# 자동차들의 연비 분포 확인
# 히스토그램 생성 - 빈도를 막대 길이로 표현
hist(mpg$total)

# 2. 합격 판정 변수 만들기
# 20 이상이면 pass, 그렇지 않으면 fail 부여
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")

# 데이터 확인
head(mpg, 20)
##   manufacturer model    displ   year   cyl     trans   drv     cty   hwy   fl    class  total   test 
## 1         audi    a4      1.8   1999     4   auto(l…     f      18    29    p    comp…   23.5   pass 
## 2         audi    a4      1.8   1999     4   manual…     f      21    29    p    comp…     25   pass 
## 3         audi    a4      2     2008     4   manual…     f      20    31    p    comp…   25.5   pass 
## 4         audi    a4      2     2008     4   auto(a…     f      21    30    p    comp…   25.5   pass 
## 5         audi    a4      2.8   1999     6   auto(l…     f      16    26    p    comp…     21   pass
## ...

# 3. 빈도표로 합격 판정 자동차 수 살펴보기
# 연비 합격 빈도표 생성
table(mpg$test)
## 
## fail pass 
## 106  128

# 4. 막대 그래프로 빈도 표현하기
# ggplot2 로드
library(ggplot2)

# 연비 합격 빈도 막대 그래프 생성
qplot(mpg$test)


## 중첩 조건문 활용하기 ----------
# <조건> total 이 30 이상이면 A, 20~29는 B, 20 미만이면 C
# 1. 파생 변수 생성
# total을 기준으로 A, B, C 등급 부여
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))

# 데이터 확인
head(mpg, 20)
##   manufacturer model    displ   year   cyl     trans   drv     cty   hwy   fl    class  total   test   grade
## 1         audi    a4      1.8   1999     4   auto(l…     f      18    29    p    comp…   23.5   pass       B
## 2         audi    a4      1.8   1999     4   manual…     f      21    29    p    comp…     25   pass       B
## 3         audi    a4      2     2008     4   manual…     f      20    31    p    comp…   25.5   pass       B
## 4         audi    a4      2     2008     4   auto(a…     f      21    30    p    comp…   25.5   pass       B
## 5         audi    a4      2.8   1999     6   auto(l…     f      16    26    p    comp…     21   pass       B
## ...

# 2. 빈도표, 막대 그래프로 연비 등급 살펴보기
# 등급 빈도표 생성
table(mpg$grade)
##
##  A   B   C 
## 10 118 106 

# 등급 빈도 막대 그래프 생성
qplot(mpg$grade)

# 원하는 만큼 변주 만들기
# A, B, C, D 등급 부여
mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                     ifelse(mpg$total >= 25, "B",
                            ifelse(mpg$total >= 20, "C", "D")))

### 정리하기 ----------
# 1.데이터 준비, 패키지 준비
mpg <- as.data.frame(ggplot2::mpg)  # 데이터 불러오기
library(dplyr)                      # dplyr 로드
library(ggplot2)                    # ggplot2 로드

# 2.데이터 파악
head(mpg)     # Raw 데이터 앞부분
tail(mpg)     # Raw 데이터 뒷부분
View(mpg)     # Raw 데이터 뷰어창에서 확인
dim(mpg)      # 차원
str(mpg)      # 속성
summary(mpg)  # 요약 통계량

# 3.변수명 수정
mpg <- rename(mpg, company = manufacturer)

# 4.파생변수 생성
mpg$total <- (mpg$cty + mpg$hwy)/2                   # 변수 조합
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")  # 조건문 활용

# 5.빈도 확인
table(mpg$test)  # 빈도표 출력
qplot(mpg$test)  # 막대 그래프 생성
