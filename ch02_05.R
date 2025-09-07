### 산점도 - 변수 간 관계 표현하기 ----------
## 산점도 만들기 ----------
# 1. mpg 데이터 이용을 위한 패키지 로드
library(ggplot2)

# 2. 배경 설정하기
# x축 displ(배기량), y축 hwy(고속도로 연비)로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))

# 3. 그래프 추가
# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# 4. 축 범위를 조정하는 설정 추가
# xlim을 이용해 x축 범위 3~6으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3, 6)

# xlim을 이용해 x축 범위 3~6, ylim을 이용해 y축 범위 10~30으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  xlim(3, 6) + 
  ylim(10, 30)

### 막대 그래프 - 집단 간 차이 표현하기 ----------
## 평균 막대 그래프 만들기 ----------
# mpg 데이터를 이용해 drv(구동방식)별 평균 hwy(고속도로 연비) 막대 그래프 생성
# 1. 집단별 평균표 생성
library(dplyr)

# 구동 방식별 평균 고속도로 연비 데이터 프레임 생성
df_mpg <- mpg %>% 
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))
df_mpg
## # A tibble: 3 × 2
##   drv   mean_hwy
##   <chr>    <dbl>
## 1 4         19.2
## 2 f         28.2
## 3 r         21  

# 2. 그래프 생성
# x측에 범주를 나타내는 변수 지정, y축에 평균값을 나타내는 변수 지정, + 막대그래프 함수
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

# 3. 크기 순으로 정렬
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()

## 빈도 막대 그래프 만들기 ----------
# drv 변수 항목별 빈도 막대 그래프 출력
ggplot(data = mpg, aes(x = drv)) + geom_bar()

# hwy 변수의 분포를 나타낸 빈도 막대 그래프 출력
ggplot(data = mpg, aes(x = hwy)) + geom_bar()

### 선 그래프 - 시간에 따라 달라지는 데이터 표현하기 ----------
## 시계열 그래프 만들기 ----------
# 시간에 따라 실업자 수가 어떻게 변하는지 나타낸 시계열 그래프 생성
# x축: date(시간), y축: unemploy(실업자 수), + 선 그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

### 상자 그림 - 집단 간 분포 차이 표현하기 ----------
## 상자 그림 만들기 ----------
# mpg 데이터의 drv(구동 방식)별 hwy(고속도로 연비)를 상자 그림으로 표현
# x축: drv, y축: hwy + 상자그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

### 정리하기 ----------
## 1.산점도
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# 축 설정 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  xlim(3, 6) +
  ylim(10, 30)

## 2.평균 막대 그래프
# 1단계.평균표 만들기
df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

# 2단계.그래프 생성하기, 크기순 정렬하기
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()

## 3.빈도 막대 그래프
ggplot(data = mpg, aes(x = drv)) + geom_bar()

## 4.선 그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

## 5.상자 그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()
