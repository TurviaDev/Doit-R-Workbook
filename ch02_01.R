### 데이터 프레임 만들기 - 시험 성적 데이터를 만들어보자! ----------
## 데이터를 입력해 데이터 프레임 만들기 ----------
# 1. 변수 만들기
# 영어 점수
english <- c(90, 80, 60, 70)
english
## [1] 90 80 60 70

# 수학 점수
math <- c(50, 60, 100, 20)
math
## [1]  50  60 100  20

# 2. 데이터 프레임 만들기
# english, math로 데이터 프레임 생성해서 df_midterm에 할당
df_midterm <- data.frame(english, math)
df_midterm
##   english math
## 1      90   50
## 2      80   60
## 3      60  100
## 4      70   20

# 반 정보
class <- c(1, 1, 2, 2)
class
## [1] 1 1 2 2

# 학생의 반에 대한 정보가 추가된 데이터 프레임
df_midterm <- data.frame(english, math, class)
df_midterm
##   english math class
## 1      90   50     1
## 2      80   60     1
## 3      60  100     2
## 4      70   20     2

# 3. 분석하기
# df_midterm의 english로 평균 산출
mean(df_midterm$english) 
## [1] 75

# df_midterm의 math로 평균 산출
mean(df_midterm$math) 
## [1] 57.5

# 4. 데이터 프레임 한 번에 만들기
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm
##   english math class
## 1      90   50     1
## 2      80   60     1
## 3      60  100     2
## 4      70   20     2

### 외부 데이터 이용하기 - 축적된 시험 성적 데이터를 불러오자! ----------
## 엑셀 파일 불러오기 ----------
# 1. 깃허브에서 excel_exam.xlsx 파일 다운로드 하기

# 2. 프로젝트 폴더에 엑셀 파일 삽입하기
# R>easy_r>excel_exam 

# 3. readxl 패키지 설치하고 로드하기
install.packages("readxl")
library(readxl) # readxl의 맨 뒷 글자는 소문자 엘(l)

# 4. 엑셀 파일 불러오기
df_exam <- read_excel("excel_exam.xlsx")
df_exam
##      id class  math english science
## 1     1     1    50      98      50
## 2     2     1    60      97      60
## 3     3     1    45      86      78
## 4     4     1    30      98      58
## 5     5     2    25      80      65
## 6     6     2    50      89      98
## ...

# 다른 폴더에 있는 엑셀 파일을 불러올 때
df_exam <- read_excel("d:/easy_r/excel_exam.xlsx")

# 5. 분석하기
mean(df_exam$english)
## [1] 84.9

mean(df_exam$science)
## [1] 59.45

# 첫 번째 행이 변수명이 아닐 경우
df_exam_nover <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_nover
##    ...1  ...2  ...3  ...4  ...5
## 1     1     1    50    98    50
## 2     2     1    60    97    60
## 3     3     2    25    80    65
## 4     4     2    50    89    98
## 5     5     3    20    98    15
## 6     6     3    50    98    45
## 7     7     4    46    98    65
## 8     8     4    48    87    12

# 엑셀 파일에 시트가 여러 개일 때 원하는 시트 불러오기
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

## CSV 파일 불러오기 ----------
# 1. 프로젝트 폴더에 CSV 파일 삽입

# 2. CSV 파일 불러오기
df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam
##      id class  math english science
## 1     1     1    50      98      50
## 2     2     1    60      97      60
## 3     3     1    45      86      78
## 4     4     1    30      98      58
## 5     5     2    25      80      65
## 6     6     2    50      89      98
## ...

## 데이터 프레임 CSV 파일로 저장하기 ----------
# 1. 데이터 프레임 만들기
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm
##   english math class
## 1      90   50     1
## 2      80   60     1
## 3      60  100     2
## 4      70   20     2

# 2. CSV 파일로 저장하기
write.csv(df_midterm, file = "df_midterm.csv")

## RDS 파일 활용하기 ----------
# 1. 데이터 프레임을 RDS 파일로 저장하기
saveRDS(df_midterm, file = "df_midterm.rds")

# 2. RDS 파일 불러오기
# df_midterm 데이터 삭제
rm(df_midterm)

# 삭제 확인
df_midterm
## 에러 메시지 출력

# RDS 파일 불러오기
df_midterm <- readRDS("df_midterm.rds")

df_midterm
##   english math class
## 1      90   50     1
## 2      80   60     1
## 3      60  100     2
## 4      70   20     2

### 정리하기 ----------
# 1.변수 만들기, 데이터 프레임 만들기
english <- c(90, 80, 60, 70)  # 영어 점수 변수 생성
math <- c(50, 60, 100, 20)    # 수학 점수 변수 생성
data.frame(english, math)     # 데이터 프레임 생성

# 2. 외부 데이터 이용하기
# 엑셀 파일
library(readxl)                                 # readxl 패키지 로드
df_exam <- read_excel("excel_exam.xlsx")        # 엑셀 파일 불러오기

# CSV 파일
df_csv_exam <- read.csv("csv_exam.csv")         # CSV 파일 불러오기
write.csv(df_midterm, file = "df_midterm.csv")  # CSV 파일로 저장하기

# RDS 파일
df_midterm <- readRDS("df_midterm.rds")         # RDS 파일 불러오기
saveRDS(df_midterm, file = "df_midterm.rds")    # RDS 파일로 저장하기
