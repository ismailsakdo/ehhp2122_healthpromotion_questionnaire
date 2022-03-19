* Encoding: UTF-8.

DATASET ACTIVATE DataSet0.
FREQUENCIES VARIABLES=gender age race x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15
  /ORDER=ANALYSIS.

EFA - Exploratory Factor Analysis
To create / understand the pattern recognition

FACTOR
  /VARIABLES x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15
  /MISSING LISTWISE 
  /ANALYSIS x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15
  /PRINT UNIVARIATE INITIAL SIG KMO EXTRACTION ROTATION
  /FORMAT SORT
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.

maka perlu adjust according to the questionnaire answer

RECODE x2 (1=5) (2=4) (3=3) (4=2) (5=1) INTO x2.n.
EXECUTE.

RECODE x5 (1=5) (2=4) (3=3) (4=2) (5=1) INTO x5.n.
EXECUTE.

RECODE x7 (1=5) (2=4) (3=3) (4=2) (5=1) INTO x7.n.
EXECUTE.

RECODE x9 (1=5) (2=4) (3=3) (4=2) (5=1) INTO x9.n.
EXECUTE.

RECODE x10 (1=5) (2=4) (3=3) (4=2) (5=1) INTO x10.n.
EXECUTE.

RECODE x13 (1=5) (2=4) (3=3) (4=2) (5=1) INTO x13.n.
EXECUTE.

RECODE x14 (1=5) (2=4) (3=3) (4=2) (5=1) INTO x14.n.
EXECUTE.

RECODE x15 (1=5) (2=4) (3=3) (4=2) (5=1) INTO x15.n.
EXECUTE.


re run analysis based on the correct item

FACTOR
  /VARIABLES x1 x2.n x3 x4 x5.n x6 x7.n x8 x9.n x10.n x11 x12 x13.n x14.n x15.n
  /MISSING LISTWISE 
  /ANALYSIS x1 x2.n x3 x4 x5.n x6 x7.n x8 x9.n x10.n x11 x12 x13.n x14.n x15.n
  /PRINT UNIVARIATE INITIAL SIG KMO EXTRACTION ROTATION
  /FORMAT SORT
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.

// pakar akan komen soalan dan construct, ada 15 soalan tapi dah buang 1, than, 14 tadi jadi 3 group:
1) health risk
2) pollutants
3) law

// kepersisan

RELIABILITY
  /VARIABLES=x12 x7 x15 x14 x13 x11
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

COMPUTE sum_a=(sum(x12,x7.n,x15.n,x14.n,x13.n,x11)/6).
EXECUTE.

T-TEST GROUPS=gender(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=sum_a
  /CRITERIA=CI(.95).

Step:
1) organize and create
2) test and arrange/ repair
3) re-test
4) validate - face validity
5) other algorithm (reliability and way to calculate)
