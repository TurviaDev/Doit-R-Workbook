### 조건에 맞는 데이터만 추출하기 ----------
## 조건에 맞는 데이터만 추출 ----------
# 패키지 로드
library(dplyr)

# 데이터 프레임 생성
exam <- read.csv("csv_exam.csv")
exam
##    id class math english science
## 1   1     1   50      98      50
## 2   2     1   60      97      60
## 3   3     1   45      86      78
## 4   4     1   30      98      58
## 5   5     2   25      80      65
## ...

# exam에서 1반 학생들의 데이터만 추출
exam %>% filter(class == 1)
##   id class math english science
## 1  1     1   50      98      50
## 2  2     1   60      97      60
## 3  3     1   45      86      78
## 4  4     1   30      98      58

# 2반인 경우만 추출
exam %>% filter(class == 2)  
##  id class math english science
## 1  5     2   25      80      65
## 2  6     2   50      89      98
## 3  7     2   80      90      45
## 4  8     2   90      78      25

# 1반이 아닌 경우
exam %>% filter(class != 1)
##    id class math english science
## 1   5     2   25      80      65
## 2   6     2   50      89      98
## 3   7     2   80      90      45
## 4   8     2   90      78      25
## 5   9     3   20      98      15
## ...

# 3반이 아닌 경우
exam %>% filter(class != 3)
##    id class math english science
## 1   1     1   50      98      50
## 2   2     1   60      97      60
## 3   3     1   45      86      78
## 4   4     1   30      98      58
## 5   5     2   25      80      65
## ...

## 초과, 미만, 이상, 이하 조건 ----------
# 수학 점수가 50점을 초과한 경우
exam %>% filter(math > 50)
##    id class math english science
## 1   2     1   60      97      60
## 2   7     2   80      90      45
## 3   8     2   90      78      25
## 4  11     3   65      65      65
## ...

# 수학 점수가 50점 미만인 경우
exam %>% filter(math < 50)
##   id class math english science
## 1  3     1   45      86      78
## 2  4     1   30      98      58
## 3  5     2   25      80      65
## 4  9     3   20      98      15
## ...

# 영어 점수가 80점 이상인 경우
exam %>% filter(english >= 80)
##    id class math english science
## 1   1     1   50      98      50
## 2   2     1   60      97      60
## 3   3     1   45      86      78
## 4   4     1   30      98      58
## ...

# 영어 점수가 80점 이하인 경우
exam %>% filter(english <= 80)
##   id class math english science
## 1  5     2   25      80      65
## 2  8     2   90      78      25
## 3 11     3   65      65      65
## 4 15     4   75      56      78
## ...

## 여러 조건을 충족하는 행 추출 ----------
# 1반이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class == 1 & math >= 50)
##   id class math english science
## 1  1     1   50      98      50
## 2  2     1   60      97      60

# 2반이면서 영어 점수가 80점 이상인 경우
exam %>% filter(class == 2 & english >= 80)
##   id class math english science
## 1  5     2   25      80      65
## 2  6     2   50      89      98
## 3  7     2   80      90      45

## 여러 조건 중 하나 이상 충족하는 행 추출 ----------
# 수학 점수가 90점 이상이거나 영어 점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)
##   id class math english science
## 1  1     1   50      98      50
## 2  2     1   60      97      60
## 3  4     1   30      98      58
## 4  7     2   80      90      45
## ...

# 영어 점수가 90점 미만이거나 과학점수가 50점 미만인 경우
exam %>% filter(english < 90 | science < 50)
##    id class math english science
## 1   3     1   45      86      78
## 2   5     2   25      80      65
## 3   6     2   50      89      98
## 4   7     2   80      90      45
## ...

## 목록에 해당하는 행 추출 ----------
# 1, 3, 5 반에 해당되면 추출
exam %>% filter(class == 1 | class == 3 | class == 5)
##    id class math english science
## 1   1     1   50      98      50
## 2   2     1   60      97      60
## 3   3     1   45      86      78
## 4   4     1   30      98      58
## ...

# 아래와 같이 표현 가능
exam %>% filter(class %in% c(1,3,5))
##    id class math english science
## 1   1     1   50      98      50
## 2   2     1   60      97      60
## 3   3     1   45      86      78
## 4   4     1   30      98      58
## 5   9     3   20      98      15
## 6  10     3   50      98      45
## 7  11     3   65      65      65
## 8  12     3   45      85      32
## 9  17     5   65      68      98
## 10 18     5   80      78      90
## 11 19     5   89      68      87
## 12 20     5   78      83      58

## 추출한 행으로 데이터 생성 ----------
# class가 1인 행 추출, class1에 할당
class1 <- exam %>% filter(class == 1)

# class가 2인 행 추출, class2에 할당
class2 <- exam %>% filter(class == 2)

# 1반 수학 점수 평균 구하기
mean(class1$math)
## [1] 46.25

# 2반 수학 점수 평균 구하기
mean(class2$math)
## [1] 61.25

### 필요한 변수만 추출하기 ----------
## 변수 추출 ----------
# 1. 변수 1개 추출
# math 추출
exam %>% select(math)
##    math
## 1    50
## 2    60
## 3    45
## 4    30
## ...

# english 추출
exam %>% select(english)
##    english
## 1       98
## 2       97
## 3       86
## 4       98
## ...

# 2. 여러 변수 추출
# class, math, english 변수 추출
exam %>% select(class, math, english)
##    class math english
## 1      1   50      98
## 2      1   60      97
## 3      1   45      86
## 4      1   30      98
## ...

# 3. 변수 제외
# math 제외
exam %>% select(-math)
##    id class english science
## 1   1     1      98      50
## 2   2     1      97      60
## 3   3     1      86      78
## 4   4     1      98      58
## ...

# 4. 여러 변수 제외
# math, english 제외
exam %>% select(-math, -english)
##    id class science
## 1   1     1      50
## 2   2     1      60
## 3   3     1      78
## 4   4     1      58
## ...

## dplyr 함수 조합 ----------
# 1. filter()와 select() 조합하기
# 1반 학생의 영어 점수 추출
exam %>% filter(class == 1) %>% select(english)
##   english
## 1      98
## 2      97
## 3      86
## 4      98

# 2. 가독성 있게 줄 바꾸기 (단, 실행 시 구문 전체를 함께 실행행)
exam %>%
  filter(class == 1) %>%  # class가 1인 행 추출
  select(english)         # english 추출

# 3. 일부만 추출하기기
exam %>% 
  select(id, math) %>%    # id, math 추출
  head                    # 앞부분 6행까지 추출
##   id math
## 1  1   50
## 2  2   60
## 3  3   45
## 4  4   30
## 5  5   25
## 6  6   50

exam %>% 
  select(id, math) %>%  # id, math 추출
  head(10)              # 앞부분 10행까지 추출
##    id math
## 1   1   50
## 2   2   60
## 3   3   45
## 4   4   30
## 5   5   25
## 6   6   50
## 7   7   80
## 8   8   90
## 9   9   20
## 10 10   50

### 순서대로 정렬하기 ----------
## 오름차순 정렬 ----------
# math 오름차순으로 정렬
exam %>% arrange(math)
##    id class math english science
## 1   9     3   20      98      15
## 2   5     2   25      80      65
## 3   4     1   30      98      58
## 4   3     1   45      86      78
## 5  12     3   45      85      32
## 6  13     4   46      98      65
## ...

# class 및 math 오름차순 정렬
exam %>% arrange(class, math)
##    id class math english science
## 1   4     1   30      98      58
## 2   3     1   45      86      78
## 3   1     1   50      98      50
## 4   2     1   60      97      60
## 5   5     2   25      80      65
## 6   6     2   50      89      98
## ...

## 내림차순 정렬 ----------
# math 내림차순 정렬
exam %>% arrange(desc(math))
##    id class math english science
## 1   8     2   90      78      25
## 2  19     5   89      68      87
## 3   7     2   80      90      45
## 4  18     5   80      78      90
## 5  20     5   78      83      58
## 6  15     4   75      56      78
## ...

### 파생변수 추가하기 ----------
## 파생변수 추가하기 ----------
# 1. 총합 변수 생성
exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  head                                          # 일부 추출
##   id class math english science total
## 1  1     1   50      98      50   198
## 2  2     1   60      97      60   217
## 3  3     1   45      86      78   209
## 4  4     1   30      98      58   186
## 5  5     2   25      80      65   170
## 6  6     2   50      89      98   237

# 2. 여러 파생 변수 한 번에 추가
exam %>%
  mutate(total = math + english + science,         # 총합 변수 추가
         mean = (math + english + science)/3) %>%  # 총평균 변수 추가
  head                                             # 일부 추출
##   id class math english science total     mean
## 1  1     1   50      98      50   198 66.00000
## 2  2     1   60      97      60   217 72.33333
## 3  3     1   45      86      78   209 69.66667
## 4  4     1   30      98      58   186 62.00000
## 5  5     2   25      80      65   170 56.66667
## 6  6     2   50      89      98   237 79.00000

# 3. mutate()에 ifelse() 적용
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head
##   id class math english science test
## 1  1     1   50      98      50 fail
## 2  2     1   60      97      60 pass
## 3  3     1   45      86      78 pass
## 4  4     1   30      98      58 fail
## 5  5     2   25      80      65 pass
## 6  6     2   50      89      98 pass

# 4. 추가한 변수를 dplyr 코드에 활용
exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  arrange(total) %>%                            # 총합 변수 기준 정렬
  head                                          # 일부 추출
##   id class math english science total
## 1  9     3   20      98      15   133
## 2 14     4   48      87      12   147
## 3 12     3   45      85      32   162
## 4  5     2   25      80      65   170
## 5  4     1   30      98      58   186
## 6  8     2   90      78      25   193

### 집단별로 요약하기 ----------
## 집단별로 요약하기 ----------
# 1. summarise()
# math 평균 산출
exam %>% summarise(mean_math = mean(math))
##   mean_math
## 1     57.45

# 2. 집단별로 요약하기
exam %>% 
  group_by(class) %>%                   # class별로 분리
  summarise(mean_math = mean(math))     # math 평균 산출
## # A tibble: 5 × 2
##   class mean_math
##   <int>     <dbl>
## 1     1      46.2
## 2     2      61.2
## 3     3      45  
## 4     4      56.8
## 5     5      78  

# 3. 여러 요약 통계량 한 번에 산출하기
exam %>% 
  group_by(class) %>%                   # class별로 분리
  summarise(mean_math = mean(math),     # math 평균
            sum_math = sum(math),       # math 합계
            median_math = median(math), # math 중앙값
            n = n())                    # 학생 수
## # A tibble: 5 × 5
##   class mean_math sum_math median_math     n
##   <int>     <dbl>    <int>       <dbl> <int>
## 1     1      46.2      185        47.5     4
## 2     2      61.2      245        65       4
## 3     3      45        180        47.5     4
## 4     4      56.8      227        53       4
## 5     5      78        312        79       4

# 4. 각 집단별로 다시 집단 나누기
# 회사별로 집단 나눈 후 다시 구동 방식별로 나눠 도시 연비 평균 구하기
mpg %>%
  group_by(manufacturer, drv) %>%       # 회사별, 구동방식별 분리
  summarise(mean_cty = mean(cty)) %>%   # cty 평균 산출
  head(10)                              # 일부 출력
## # A tibble: 10 × 3
## # Groups:   manufacturer [5]
##    manufacturer drv   mean_cty
##    <chr>        <chr>    <dbl>
##  1 audi         4         16.8
##  2 audi         f         18.9
##  3 chevrolet    4         12.5
##  4 chevrolet    f         18.8
##  5 chevrolet    r         14.1
##  6 dodge        4         12  
##  7 dodge        f         15.8
##  8 ford         4         13.3
##  9 ford         r         14.8
## 10 honda        f         24.4

## dplyr 조합하기 ----------
# [문제] 회사별로 “suv” 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 1~5위까지 출력하기
# dplyr 구문 생성
mpg %>%
  group_by(manufacturer) %>%           # 회사별로 분리
  filter(class == "suv") %>%           # suv 추출
  mutate(tot = (cty+hwy)/2) %>%        # 통합 연비 변수 생성
  summarise(mean_tot = mean(tot)) %>%  # 통합 연비 평균 산출
  arrange(desc(mean_tot)) %>%          # 내림차순 정렬
  head(5)                              # 1~5위까지 출력
## # A tibble: 5 × 2
##   manufacturer mean_tot
##   <chr>           <dbl>
## 1 subaru           21.9
## 2 toyota           16.3
## 3 nissan           15.9
## 4 mercury          15.6
## 5 jeep             15.6

### 데이터 합치기 ----------
## 가로로 합치기 ----------
# 1. 데이터 프레임 생성
# 중간고사 데이터 생성
test1 <- data.frame(id = c(1, 2, 3, 4, 5),           
                    midterm = c(60, 80, 70, 90, 85))
test1
##   id midterm
## 1  1      60
## 2  2      80
## 3  3      70
## 4  4      90
## 5  5      85

# 기말고사 데이터 생성
test2 <- data.frame(id = c(1, 2, 3, 4, 5),           
                    final = c(70, 83, 65, 95, 80))
test2
##   id final
## 1  1    70
## 2  2    83
## 3  3    65
## 4  4    95
## 5  5    80

# 2. 두 개의 데이터 하나로 합치기
total <- left_join(test1, test2, by = "id")  # id 기준으로 합쳐서 total에 할당
total                                        # total 출력
##   id midterm final
## 1  1      60    70
## 2  2      80    83
## 3  3      70    65
## 4  4      90    95
## 5  5      85    80

## 다른 데이터 활용해 변수 추가하기 ----------
# 1. 반별 담임교사 명단 데이터 생성
name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name
##   class teacher
## 1     1     kim
## 2     2     lee
## 3     3    park
## 4     4    choi
## 5     5    jung

# 2. class 변수 기준으로 name의 teacher 변수를 exam에 추가
exam_new <- left_join(exam, name, by = "class")
exam_new
##    id class math english science teacher
## 1   1     1   50      98      50     kim
## 2   2     1   60      97      60     kim
## 3   3     1   45      86      78     kim
## 4   4     1   30      98      58     kim
## 5   5     2   25      80      65     lee
## 6   6     2   50      89      98     lee
## ...
  
## 세로로 합치기 ----------
# 1. 데이터 프레임 생성
# 학생 1~5번 시험 데이터 생성
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))
group_a
##   id test
## 1  1   60
## 2  2   80
## 3  3   70
## 4  4   90
## 5  5   85

# 학생 6~10번 시험 데이터 생성
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))
group_b
##   id test
## 1  6   70
## 2  7   83
## 3  8   65
## 4  9   95
## 5 10   80

# 2. 두 개의 데이터 하나로 합치기
group_all <- bind_rows(group_a, group_b)  # 데이터 합쳐서 group_all에 할당
group_all                                 # group_all 출력
##    id test
## 1   1   60
## 2   2   80
## 3   3   70
## 4   4   90
## 5   5   85
## 6   6   70
## 7   7   83
## 8   8   65
## 9   9   95
## 10 10   80

### 정리하기 ----------
## 1.조건에 맞는 데이터만 추출하기
exam %>% filter(english >= 80)

# 여러 조건 동시 충족
exam %>% filter(class == 1 & math >= 50)

# 여러 조건 중 하나 이상 충족
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(class %in% c(1,3,5))

## 2.필요한 변수만 추출하기
exam %>% select(math)
exam %>% select(class, math, english)

## 3.함수 조합하기, 일부만 출력하기
exam %>%
  select(id, math) %>%
  head(10)

## 4.순서대로 정렬하기
exam %>% arrange(math)         # 오름차순 정렬
exam %>% arrange(desc(math))   # 내림차순 정렬
exam %>% arrange(class, math)  # 여러 변수 기준 오름차순 정렬

## 5.파생변수 추가하기
exam %>% mutate(total = math + english + science)

# 여러 파생변수 한 번에 추가하기
exam %>%
  mutate(total = math + english + science,
         mean = (math + english + science)/3)

# mutate()에 ifelse() 적용하기
exam %>% mutate(test = ifelse(science >= 60, "pass", "fail"))

# 추가한 변수를 dplyr 코드에 바로 활용하기
exam %>%
  mutate(total = math + english + science) %>%
  arrange(total)

## 6.집단별로 요약하기
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math))

# 각 집단별로 다시 집단 나누기
mpg %>%
  group_by(manufacturer, drv) %>%
  summarise(mean_cty = mean(cty))

## 7.데이터 합치기
# 가로로 합치기
total <- left_join(test1, test2, by = "id")

# 세로로 합치기
group_all <- bind_rows(group_a, group_b)
