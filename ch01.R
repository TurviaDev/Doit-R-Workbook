### 변수 만들기기
a <- 1
a
## [1] 1

b <- 2
b
## [1] 2
c <- 3
c
## [1] 3

d <- 3.5
d
## [1] 3.5

### 여러 값으로 구성된 변수 만들기
var1 <- c(1, 2, 3, 4, 5)
var1
## [1] 1 2 3 4 5

var2 <- c(1:5)
var2
## [1] 1 2 3 4 5

var3 <- seq(1,5)
var3
## [1] 1 2 3 4 5

var4 <- seq(1, 10, by = 2)
var4
## [1] 1 3 5 7 9

### 문자로 된 변수 만들기
str1 <- "a"
str1
## [1] "a"

str2 <- "Hello World"
str2
## [1] "Hello World"

str4 <- c("a", "b", "c")
str4
## [1] "a" "b" "c"

str5 <- c("Hello!", "World", "is", "good")
str5
## [1] "Hello!" "World"  "is"     "good"  

### 숫자를 다루는 함수 이용하기
# 변수 만들기
x <- c(1, 2, 3)
x
## [1] 1 2 3

# 평균 구하는 함수 적용하기
mean(x)
## [1] 2

# 최댓값
max(x)
## [1] 3

#최솟값
min(x)
## [1] 1

### 문자를 다루는 함수 이용하기
str5
## [1] "Hello!" "World"  "is"     "good"  

paste(str5, collapse = ",") # 쉼표를 구분자로 str5의 단어들 하나로 합치기
## [1] "Hello!,World,is,good"

paste(str5, collapse = " ") # 빈칸을 구분자로
## [1] "Hello! World is good"

# 함수의 결과물로 새 변수 만들기
x_mean <- mean(x)
x_mean
## [1] 2

str5_paste <- paste(str5, collapse = " ")
str5_paste
## [1] "Hello! World is good"

### ggplot2 패키지 설치하기
# 설치
install.packages("ggplot2", dependencies = T)

# 로드
library(ggplot2)

# 함수 사용하기
x <- c("a", "a", "b", "c")
x

# 빈도 막대 그래프 출력
qplot(x)

### ggplot2의 mpg 데이터로 그래프 만들기 - 고속도로 연비별 빈도 막대 그래프프
# data에 mpg, x축에 hwy 변수 지정해 그래프 생성
qplot(data = mpg, x = hwy)

# x축 cty
qplot(data = mpg, x = cty)

# x축 drv, y축 hwy
qplot(data = mpg, x = drv, y = hwy)

# x축 drv, y축 hwy, 선 그래프 형태
qplot(data = mpg, x = drv, y = hwy, geom = "line")

# x축 drv, y축 hwy, 상자 그림 형태
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")

# x축 drv, y축 hwy, 상자 그림 형태, drv별 색 표현
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)