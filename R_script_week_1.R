# FAST CAMPUS × imkdoug
# 데이터 분석 입문 CAMP
# Introduction to data analysis CAMP
# 임경덕(Kyungdoug IM) / imkdoug@gmail.com

# Week 1 R Script

# 스크립트 실행(Run a script) : 'Ctrl + R" or "Ctrl + Enter'

# 작업폴더 설정(Set Working Directory) : 'Ctrl + Shift + h'
# RStudio Menu ; Session -> Set Working Directory -> Choose...
#              ; Tools -> Global Options...
# setwd('Your Working Directory Address')
getwd()



##0 시작!(START!)


    # 첫 패키지 설치
    install.packages('RColorBrewer')
    library(RColorBrewer)
    
    # 그림을 위한 새창 띄우기 : Windows 사용자
    windows()
    
    # 그림을 위한 새창 띄우기 : Mac 사용자
    quartz()
    
    
    display.brewer.all()
    
    # 우리가 사용할 색깔
    mycol = brewer.pal(9, 'Set1')
    mycol



##1 R 계산기(R Calculator)
    1+2
    sqrt(16)
    1+(2*3)/4



##2 값의 나열(List of values)
 
    # 문자
    "d"
    'd'
    d ##오류
    
    
    # 두 개 이상의 문자의 나열
    c('A', 'B')
    'A', 'B' ##오류
    
    letters
    LETTERS
    
    
    # 숫자
    # 연속된 숫자의 나열
    11:15
    
    # 분리된 숫자의 나열 
    c(1, 3, 6)
    
    c(11:13, 1, 2)
    
    # 반복
    rep(10, 3)
    rep(1:2, 3)
    rep(1:2, c(2,3))
    
    # 수열 만들기
    seq(1, 10, 5)
    ?seq
    seq(1, 10, by=5)
    seq(1, 10, length=5)



##3 값의 입력/할당(Allocation)

    x = 2
    x
    
    #예제-A,B,C,D 학생의 3과목 성적
    A = c(70, 80, 90)
    B = c(75, 85, 80)
    C = c(90, 90, 60)
    D = c(80, 80, 80)

    A
    B
    C
    D
    
    #예제-국어,영어,수학의 4학생의 성적 
    lan = c(70,
            75,
            90,
            80)
    eng = c(80,
            85,
            90,
            80)
    mat = c(90,
            80,
            60,
            80)

    lan
    eng
    mat



##4 행렬 만들기(Allocation of a matrix)
    # 행렬모양으로 자료 정렬하기
    matrix(c(70, 75, 90, 80, 80, 85, 90, 80, 90, 80, 60, 80), ncol=3)
     ## "[,1]", "[2,]"는 각각 "첫번째 열", "두번째 행"을 의미 
    
    # "score"라는 이름으로 행렬 저장하기 
    score = matrix(c(70, 75, 90, 80, 80, 85, 90, 80, 90, 80, 60, 80), ncol=3)

    # 또다른 방법 1
    # 행 결합(Combining rows)
    score2 = rbind(A, B, C, D)
    score2

    # 또다른 방법 2
    # 열 결합(Combining columns)
    score3 = cbind(lan, eng, mat)
    score3

    # 열이름, 행이름 지정하기 
    colnames(score3)
    rownames(score3)
    rownames(score3) = c('A', 'B', 'C', 'D')
    score3
    
    
    # 인덱스(index)를 활용한 특정한 행/열 자료 확인
    score3[ ,  ]
    score3[2,  ]
    score3[ , 3]
    score3[2, 3]
    
        # 여러가지 괄호의 활용 
        # () : 함수 
        # [] : 인덱스
        # {} : 묶음용
    
    
    # data.frame 형식의 활용
    score4 = data.frame(score3)
    score4
    
    # data.frame 형식의 "$"를 활용한 변수 인덱스
    score4$lan
    
    
      ## matrix 형식은 왜 문제가 생길까요?
      is.matrix(score3)
      score3
      
      # 요소값의 변경
      score3[2, 2] = 'F'
      score3 ##모든값이 문자형으로 바뀜
      
      
        
    # apply를 활용한 행/열 합/평균 구하기
    apply(score4, 1, sum)  # 행 합
    apply(score4, 1, mean) # 행 평균
    apply(score4, 2, sum)  # 열 합
    apply(score4, 2, mean) # 열 평균

        prop.table(score4, 1)  # 행 백분율
        prop.table(score4, 2)  # 열 백분율
    
        
##5 데이터의 순위와 순서(Rank and order of data)

    a = scan()
    # "Enter"를 이용해 숫자 10개 입력(Type and "Enter" any 10 numbers) 
    # 아래쪽 콘솔창으로 커서를 옮기고, 숫자를 하나씩 입력후 Enter
    # 마지막에 Enter 한번더 입력 
    a
    b = rank(a)
    b
    
    # 정렬
    sort(a)


    # 데이터 불러오기
    data = read.table('height.txt')
    height = data$V1
    
    # head 명령어를 통한 샘플(1~6번째) 값 확인
    head(height)
    
    # sort 명령어를 통한 데이터의 오름차순 정렬 
    sort(height)
    
    # 논리 연산 - 키가 180보다 큰가
    height > 70.87
    sort(height) > 70.87

    # 논리연산의 결과의 수치화(0/1)
    (sort(height) > 70.87) + 0 
    sum((sort(height) > 70.87))
    length(height)



### 연속형 변수를 위한 데이터 요약     
##6 다섯 숫자 요약 그리고 분위수(Five number summary and quantile)

    # 최솟값, 중앙값, 최댓값(min, median, max)
    min(height)
    median(height)
    max(height)
    
    # 최솟값의 위치 확인 
    which.min(height)
    height[ which.min(height) ]
    
    # 최댓값의 위치 확인 
    which.max(height)
    height[ which.max(height) ]

    
    # 4분위수(Quartile) ; 제1사분위수(Q1):25%, 제3사분위수(Q3):75%
    quantile(height, 0.25)
    quantile(height, 0.5)
    quantile(height, 0.75)

    quantile(height, 0.119)
    quantile(height, 0.911)

    # 다섯숫자(0%, 25%, 50%, 75%, 100%)
    quantile(height, 0)
    quantile(height, 0.25)
    quantile(height, 0.5)
    quantile(height, 0.75)
    quantile(height, 1)
    
    # 다섯숫자 한꺼번에 계산하기 
    quantile(height, seq(0, 1, 0.25))

    
    # summary 함수를 활용한 다섯숫자요약
    summary(height)


    # 다섯 숫자 요약 표현하기(Plotting the five number summary)
    # 상자그림 혹은 상자수염그림(Boxplot or Box-Whisker plot)
    # windows() or quartz()
    boxplot(height, outline=FALSE, col=mycol[1])
    
    # 이상치(Outlier)의  확인
    boxplot(height               , col=mycol[1])
    
    ## IQR(Inter-Quartile Range) = Q3-Q1
    ## Outlier ; Q3 + 1.5*IQR 보다 크거나
    ##         ; Q1 - 1.5*IQR 보다 작음
    
    ## 80/20 versus Longtail !!
    
    
    
##7 히스토그램(Histogram)
    ## 통계량 ; 몇개의 계산값으로 변수의 특징을 파악
    ## 도표   ; 변수에 포함된 관측치들의 전체적인 분포를 그림으로 확인 
    
    hist(height, col=mycol[2])
    hist(height, col=mycol[2], freq=FALSE)
    hist(height, col=mycol[2], probability=TRUE)
    abline(v = quantile(height,c(0,0.25,0.5,0.75,1) ), lty=3, lwd=2)

        # 히스토그램에 정규분포곡선 추가(Adding a curve on histogram)
          ## 20개의 구간으로 나눔
        hist(height, nclass=20, freq=FALSE, col=mycol[2])
        curve(dnorm(x, mean=mean(height), sd=sd(height)), add=TRUE, col=mycol[3], lwd=2)

          ## 100개의 구간으로 나눔
        hist(height, nclass=100, freq=FALSE, col=mycol[1])
        curve(dnorm(x, mean=mean(height), sd=sd(height)), add=TRUE, col=mycol[3], lwd=2)

          
        
##8 산점도(Scatterplot)
  ## 히스토그램이 한 변수의 분포를 확인한다면,
  ## 산점도는 두 변수의 분포를 그림으로 확인 
    
    # 데이터 불러오기     
    pearson = read.table("http://www.math.wustl.edu/~jmding/math3200/codes/pearson.dat")
    
    # 변수 이름 설정 
    names(pearson)=c("father","son")

    # 샘플확인
    head(pearson)

    # 변수별 다섯숫자요약
    summary(pearson)
    
    # 각각의 히스토그램 그리기 
    hist(pearson$father, probability=TRUE, nclass=20, col=mycol[3])
    hist(pearson$son, probability=TRUE, nclass=20, col=mycol[3])


    # Plot!(산점도 그리기)
    plot(pearson)
    plot(pearson, pch=16, col=mycol[2])

    # 보조선 그리기(Drawing auxiliary line)
      ## locator 함수를 이용한 좌표의 확인
      locator(1)
      loc = locator(1)
    
    abline(v=loc[1], lty=2)
    abline(h=loc[2], lty=2)

    
        # 누군가의 도움(Some help)
        # 산점도와 변수별 히스토그램 한번에 그리기 

        # 함수 만들기
        scatterhist = function(x, y, xlab="", ylab=""){
          zones=matrix(c(2,0,1,3), ncol=2, byrow=TRUE)
          layout(zones, widths=c(4/5,1/5), heights=c(1/5,4/5))
          xhist = hist(x, plot=FALSE, nclass=20)
          yhist = hist(y, plot=FALSE, nclass=20)
          top = max(c(xhist$counts, yhist$counts))
          par(mar=c(3,3,1,1))
          plot(x,y,col="dodgerblue4",pch=16)
          par(mar=c(0,3,1,1))
          barplot(xhist$counts, axes=FALSE, ylim=c(0, top), space=0,col="dodgerblue3")
          par(mar=c(3,0,1,1))
          barplot(yhist$counts, axes=FALSE, xlim=c(0, top), space=0,col="dodgerblue", horiz=TRUE)
          par(oma=c(3,3,0,0))
          mtext(xlab, side=1, line=1, outer=TRUE, adj=0, 
                at=.8 * (mean(x) - min(x))/(max(x)-min(x)))
          mtext(ylab, side=2, line=1, outer=TRUE, adj=0, 
                at=(.8 * (mean(y) - min(y))/(max(y) - min(y))))
        }
        
        # 함수 실행하기(그림 그리기)
        scatterhist(pearson$father, pearson$son)

        
### 범주형 데이터 요약         
##9 교차표(Contigency table)
    # 데이터 만들기
    x1 = c('a', 'x')
    x2 = c('a', 'x')
    x3 = c('a', 'y')
    x4 = c('b', 'x')
    x5 = c('b', 'y')
    x6 = c('c', 'y')
    x7 = c('c', 'y')
    x = rbind(x1,x2,x3,x4,x5,x6,x7)    

    table(x[ , 1])
    table(x[ , 2])
    table(x[ , 1], x[ , 2])

    
#10 모자이크 그림(Mosaic plot)

    library(stats)
    Titanic

    mosaicplot(Titanic, main = "Survival on the Titanic", color = TRUE)
    mosaicplot(~ Sex + Age + Survived, data = Titanic, color = TRUE)

    
# End of script