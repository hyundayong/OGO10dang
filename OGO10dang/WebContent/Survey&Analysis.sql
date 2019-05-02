-- 설문조사 탭 관련 MBODYINFO_HM 테이블 생성 및 확인
CREATE TABLE MBODYINFO_HM (
    ID          VARCHAR2(15)   PRIMARY KEY,
    NAME        VARCHAR2(20)   NOT NULL,
    AGE         NUMBER(3)      NOT NULL,
    HEIGHT      NUMBER(3)      NOT NULL,
    WEIGHT      NUMBER(3)      NOT NULL,
    SMOKE       VARCHAR2(3)    NOT NULL,
    DRINK       NUMBER(1)      NOT NULL,
    EXERCISE    NUMBER(1)      NOT NULL,
    PURPOSE     VARCHAR2(50)   NOT NULL,
    ARM         NUMBER(1)      NOT NULL,
    CHEST       NUMBER(1)      NOT NULL,
    SHOULDER    NUMBER(1)      NOT NULL,
    BELLY       NUMBER(1)      NOT NULL,
    LEG         NUMBER(1)      NOT NULL,
    SCORE       NUMBER(2)      NOT NULL,       /*항목 별 합산 점수(ARM + CHEST + SHOULDER + BELLY + LEG)*/
    MUSCLE      NUMBER(1)      NOT NULL,       /*항목 별 근육형 선택 개수*/
    BODYTYPE    VARCHAR2(10)   NOT NULL        /*(마름, 보통, 비만, 근육형)*/
);

DESC MBODYINFO_HM;
SELECT * FROM MBODYINFO_HM;

-- 설문조사 탭 관련 WBODYINFO_HM 테이블 생성 및 확인
CREATE TABLE WBODYINFO_HM(
    ID          VARCHAR2(15)   PRIMARY KEY,
    NAME        VARCHAR2(20)   NOT NULL,
    AGE         NUMBER(3)      NOT NULL,
    HEIGHT      NUMBER(3)      NOT NULL,
    WEIGHT      NUMBER(3)      NOT NULL,
    SMOKE       VARCHAR2(3)    NOT NULL,
    DRINK       NUMBER(1)      NOT NULL,
    EXERCISE    NUMBER(1)      NOT NULL,
    PURPOSE     VARCHAR2(20)   NOT NULL,
    ARM         NUMBER(1)      NOT NULL,
    BELLY       NUMBER(1)      NOT NULL,
    THIGH       NUMBER(1)      NOT NULL,
    CALF        NUMBER(1)      NOT NULL,
    HIP         NUMBER(1)      NOT NULL,
    SCORE       NUMBER(2)      NOT NULL,       /*항목 별 합산 점수(ARM + BELLY + THIGH + CALF + HIP)*/
    MUSCLE      NUMBER(1)      NOT NULL,       /*항목 별 근육형 선택 개수*/
    BODYTYPE    VARCHAR2(10)   NOT NULL        /*(마름, 보통, 비만, 근육형)*/
);

DESC WBODYINFO_HM;
SELECT * FROM WBODYINFO_HM;


-- 체형분석 탭 관련 FOODDICT_HM 테이블 생성 및 확인
CREATE TABLE FOODDICT_HM (
    FOOD		VARCHAR2(10)	PRIMARY KEY,		
    SMOKE		VARCHAR2(1)		NOT NULL,		    /* Y/N(흡연 설문 1번 = Y / 2번 = N) */
    DRINK		VARCHAR2(1)		NOT NULL,		    /* Y/N(음주 설문 3, 4번 = Y / 1, 2번 = N) */
    DIET		VARCHAR2(1),				        /* Y/N(운동목적 설문 1번 = Y) */
    HEALTH	    VARCHAR2(1),				        /* Y/N(운동목적 설문 2번 = Y) */
    MUSCLE	    VARCHAR2(1),					    /* Y/N(운동목적 설문 3번 = Y) */
    FOODPHOTO   VARCHAR2(25)                        /* 음식 사진명 */   
); 

DESC FOODDICT_HM;
SELECT * FROM FOODDICT_HM;
SELECT FOOD, FOODPHOTO FROM FOODDICT_HM WHERE SMOKE='Y' AND DRINK='N' AND HEALTH='Y';

-- 식단 항목 저장 SQL문↓

-- 운동목적 2개 이상에 해당되는 항목
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, MUSCLE, FOODPHOTO)
VALUES('사과', 'Y', 'Y', 'Y', 'Y', 'apple.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, HEALTH, FOODPHOTO)
VALUES('아보카도', 'N', 'Y', 'Y', 'Y', 'avocado.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, MUSCLE, FOODPHOTO)
VALUES('콩', 'N', 'N', 'Y', 'Y', 'bean.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, MUSCLE, FOODPHOTO)
VALUES('계란', 'N', 'N', 'Y', 'Y', 'egg.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, MUSCLE, FOODPHOTO)
VALUES('호두', 'N', 'Y', 'Y', 'Y', 'walnut.png');

-- 운동목적 DIET(다이어트)에 해당되는 항목
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, FOODPHOTO)
VALUES('피클', 'N', 'N', 'Y', 'pickle.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, FOODPHOTO)
VALUES('고춧가루', 'N', 'N', 'Y', 'redpepperpowder.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, FOODPHOTO)
VALUES('다크 초콜릿', 'N', 'N', 'Y', 'darkchocolate.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, FOODPHOTO)
VALUES('견과류', 'N', 'N', 'Y', 'nuts.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, FOODPHOTO)
VALUES('물', 'N', 'N', 'Y', 'water.png');

-- 운동목적 HEALTH(체력증진)에 해당되는 항목
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('마늘', 'Y', 'Y', 'Y', 'garlic.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('녹차', 'Y', 'N', 'Y', 'greentea.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('토마토', 'Y', 'N', 'Y', 'tomato.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('오미자', 'N', 'N', 'Y', 'omija.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('고추', 'N', 'N', 'Y', 'redpepper.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('보리', 'N', 'N', 'Y', 'barley.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('블루베리', 'N', 'N', 'Y', 'blueberry.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('고등어', 'N', 'N', 'Y', 'mackerel.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('김', 'N', 'N', 'Y', 'seaweed.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('버섯', 'N', 'N', 'Y', 'mushroom.png');

-- 운동목적 MUSCLE(근력증가)에 해당되는 항목
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, MUSCLE, FOODPHOTO)
VALUES('커피', 'N', 'Y', 'Y', 'coffee.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, MUSCLE, FOODPHOTO)
VALUES('감자', 'N', 'N', 'Y', 'potato.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, MUSCLE, FOODPHOTO)
VALUES('시금치', 'N', 'N', 'Y', 'spinach.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, MUSCLE, FOODPHOTO)
VALUES('닭 가슴살', 'N', 'N', 'Y', 'chickenbreast.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, MUSCLE, FOODPHOTO)
VALUES('양파', 'Y', 'N', 'Y', 'onion.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, MUSCLE, FOODPHOTO)
VALUES('붉은 피망', 'N', 'N', 'Y', 'redpaprika.png');

-- 흡연, 음주에만 해당하고, 운동목적과는 부합되지 않는 항목
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, FOODPHOTO)
VALUES('오트밀', 'N', 'Y', 'oatmeal.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, FOODPHOTO)
VALUES('자몽', 'N', 'Y', 'grapefruit.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, FOODPHOTO)
VALUES('심황', 'N', 'Y', 'turmeric.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, FOODPHOTO)
VALUES('브로콜리', 'Y', 'N', 'broccoli.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, FOODPHOTO)
VALUES('무', 'Y', 'N', 'radish.png');


SELECT * FROM MEMBERINFO_HM;

-- 체형분석 탭 관련 WEXERCISEDICT_HM 테이블 생성 및 확인(남)
CREATE TABLE MEXERCISEDICT_HM (
    EXERCISE         VARCHAR2(45)      PRIMARY KEY,   
    GRADE            NUMBER(1),                       /*1, 2, 3, 4(운동 자체의 강도)*/
    ARM              VARCHAR2(1),                     /*U/D/N(팔에 좋은 운동 : 이두 = U, 삼두 = U))*/
    BELLY            VARCHAR2(1),                     /*Y/N(복부에 좋은 운동 = Y)*/
    CHEST            VARCHAR2(1),                     /*Y/N(가슴에 좋은 운동 = Y)*/
    SHOULDER         VARCHAR2(1),                     /*Y/N(어깨, 등에 좋은 운동 = Y)*/
    LEG              VARCHAR2(1),                     /*Y/N(하체에 좋은 운동 = Y)*/
    EXERCISELINK     VARCHAR2(120),                   /*운동 관련 링크*/
    EXERCISEPHOTO    VARCHAR2(40)                     /*운동 사진 명*/
);
DROP TABLE MEXERCISEDICT_HM;
DESC MEXERCISEDICT_HM;
SELECT * FROM MEXERCISEDICT_HM;

-- 남자 운동 저장 SQL문
-- 전신(ARM이 U or D이며 다른 모든 부위가 Y)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, BELLY, CHEST, SHOULDER, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('런닝(달리기)', 1, 'D', 'Y', 'Y', 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=939085&cid=51036&categoryId=51036', 'running.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, BELLY, CHEST, SHOULDER, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('푸시업(팔굽혀펴기)', 1, 'D', 'Y', 'Y', 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=938871&cid=51030&categoryId=51030', 'pushUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, BELLY, CHEST, SHOULDER, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('타바타(서킷 트레이닝)', 4, 'D', 'Y', 'Y', 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=1111436&cid=40942&categoryId=31946', 'tabata.png');

-- ARM - U(팔 - 이두)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('덤벨 컬', 2, 'U', 'https://terms.naver.com/entry.nhn?docId=938886&cid=51030&categoryId=51030', 'dumbbellCurl.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('해머 컬', 2, 'U', 'https://terms.naver.com/entry.nhn?docId=938887&cid=51030&categoryId=51030', 'hammerCurl.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('바벨 컬', 3, 'U', 'https://terms.naver.com/entry.nhn?docId=938884&cid=51030&categoryId=51030', 'barbellCurl.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('프리쳐 컬', 3, 'U', 'https://terms.naver.com/entry.nhn?docId=938888&cid=51030&categoryId=51030', 'preatcherCurl.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('케이블 컬', 2, 'U', 'https://terms.naver.com/entry.nhn?docId=938890&cid=51030&categoryId=51030', 'cableCurl.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('컨센트레이션 컬', 2, 'U', 'https://terms.naver.com/entry.nhn?docId=938889&ref=y&cid=51030&categoryId=51030', 'concentrationCurl.png');

-- ARM - D(팔 - 삼두)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('킥 백', 2, 'D', 'https://terms.naver.com/entry.nhn?docId=2403392&cid=51617&categoryId=51618', 'kickBack.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('벤치 딥스', 2, 'D', 'https://terms.naver.com/entry.nhn?docId=938899&cid=51030&categoryId=51030', 'benchDips.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('다이아몬드 푸시업', 3, 'D', 'https://ybyb.tistory.com/18', 'diamondPushUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('원암 트라이셉스 익스텐션', 2, 'D', 'https://terms.naver.com/entry.nhn?docId=938895&cid=51030&categoryId=51030', 'oneArmTricepsExtension.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('케이블 트라이셉스 프레스 다운', 3, 'D', 'https://terms.naver.com/entry.nhn?docId=2403391&cid=51617&categoryId=51618', 'cableTricepsExtension.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('라잉 트라이셉스 익스텐션', 3, 'D', 'https://terms.naver.com/entry.nhn?docId=2403388&cid=51617&categoryId=51618', 'lyingTricepsExtension.png');

-- CHEST(가슴)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('인클라인 푸시업', 2, 'Y', 'https://www.youtube.com/watch?v=hG3pL-tl00Y', 'inclinePushUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('디클라인 푸시업', 2, 'Y', 'https://www.youtube.com/watch?v=TaSG5bTv4PU', 'declinePushUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('딥스', 2, 'Y', 'https://www.youtube.com/watch?v=W6I5Tsuu_CE', 'dips.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('플랫 벤치 프레스', 3, 'Y', 'https://www.youtube.com/watch?v=CcrNkBl2oE8', 'flapBenchPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('인클라인 벤치 프레스', 3, 'Y', 'https://www.youtube.com/watch?v=VvhSWcvAZjg', 'inclineBenchPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('케이블 플라이', 3, 'Y', 'https://www.youtube.com/watch?v=NvdXJ_aWefo', 'cableFly.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('플랫 덤벨 프레스', 3, 'Y', 'https://www.youtube.com/watch?v=ZrMM99aVVtA', 'flatDumbbellPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('인클라인 덤벨 프레스', 3, 'Y', 'https://www.youtube.com/watch?v=s9D_mxCWpeQ', 'inclineDumbbellPress.png');

-- SHOULDER(어깨, 등)
-- Part1(어깨)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('프런트 레트럴 레이즈', 2, 'Y', 'https://www.youtube.com/watch?v=RuQSH745eZM', 'frontLateralRaise.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('사이드 레트럴 레이즈', 2, 'Y', 'https://www.youtube.com/watch?v=L04H6tiS50k', 'sideLateralRaise.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('벤트 오버 레트럴 레이즈', 2, 'Y', 'https://www.youtube.com/watch?v=l8yAJ5JFqtQ', 'bentOverLateralRaise.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('물구나무 푸시업', 4, 'Y', 'https://www.youtube.com/watch?v=XWWFVOJwunY', 'handstandPushUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('머신 숄더 프레스', 3, 'Y', 'https://www.youtube.com/watch?v=QXhw6sJ8Hf8', 'machineShoulderPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('덤벨 숄더 프레스', 3, 'Y', 'https://www.youtube.com/watch?v=6k_teeNrI-g', 'dumbbellShoulderPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('오버헤드 프레스', 4, 'Y', 'https://www.youtube.com/watch?v=W5rN5QkUH_k', 'overheadPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('아놀드 프레스', 3, 'Y', 'https://www.youtube.com/watch?v=_kUebUzDIaA', 'arnoldPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('비하인드 넥 프레스', 4, 'Y', 'https://www.youtube.com/watch?v=yrhhti1FArY', 'behindNeckPress.png');

-- Part2(등)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('철봉 매달리기(30초이상)', 1, 'Y', 'https://www.youtube.com/watch?v=1juG-_ZlytA', 'deadHang.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('턱걸이(풀업)', 3, 'Y', 'https://www.youtube.com/watch?v=I0DPkJoz1CU', 'pullUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('턱걸이(친업)', 2, 'Y', 'https://www.youtube.com/watch?v=WXMCA3umX-w', 'chinUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('바벨 로우', 3, 'Y', 'https://www.youtube.com/watch?v=IBG8XWAyeGQ', 'barbellRow.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('원암 덤벨로우', 3, 'Y', 'https://www.youtube.com/watch?v=cqPAC3xTSk4', 'oneArmDumbbellRow.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('컨벤셔널 데드리프트', 4, 'Y', 'https://www.youtube.com/watch?v=15raAtp_lN0', 'conventionalDeadLift.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('루마니안 데드리프트', 4, 'Y', 'https://www.youtube.com/watch?v=MJerfdJzki4' , 'rumanianDeadLift.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('스트레이트 풀다운', 2, 'Y', 'https://www.youtube.com/watch?v=SWY9E60hSmk', 'straightPullDown.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('케이블 로우', 2, 'Y', 'https://www.youtube.com/watch?v=DY3wSoNWt4Y', 'cableRow.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('렛풀 다운', 2, 'Y', 'https://www.youtube.com/watch?v=Nw59Ikf81_Q', 'latPullDown.png');

-- BELLY(복부)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO)
VALUES('윗몸 일으키기', 1, 'Y', 'https://www.youtube.com/watch?v=80N4tDCyzKc', 'sitUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO)
VALUES('크런치', 2, 'Y', 'https://terms.naver.com/entry.nhn?docId=938919&cid=51030&categoryId=51030', 'crunch.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO)
VALUES('플랭크', 1, 'Y', 'https://www.youtube.com/watch?v=Zq8nRY9P_cM', 'plank.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO)
VALUES('사이드 플랭크', 2, 'Y', 'https://terms.naver.com/entry.nhn?docId=5704917&cid=51617&categoryId=62877', 'sidePlank.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO)
VALUES('라잉 레그 레이즈', 2, 'Y', 'https://www.youtube.com/watch?v=UL5BW-xe9ms', 'lyingLegraise.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO)
VALUES('행잉 레그 레이즈', 3, 'Y', 'https://www.youtube.com/watch?v=wFMvTzo9v2o', 'hangingLegraise.png');

-- LEG(하체)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('맨몸 스쿼트', 1, 'Y', 'https://www.youtube.com/watch?v=kX5TRwq1hn8', 'squat.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('케틀벨 스쿼트', 2, 'Y', 'https://www.youtube.com/watch?v=V2OmLxdCE7Y', 'kettleBellSquat.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('바벨 백 스쿼트', 3, 'Y', 'https://www.youtube.com/watch?v=dKXBdIQSTkU', 'barbellBackSquat.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('바벨 프런트 스쿼트', 4, 'Y', 'https://www.youtube.com/watch?v=ur3hZZR8CmE', 'barbellFrontSquat.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('레그 익스텐션', 2, 'Y', 'https://www.youtube.com/watch?v=-RpN9QLJr00', 'legExtension.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('레그 컬', 2, 'Y', 'https://www.youtube.com/watch?v=D83D-rhO6eQ' , 'legCurl.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('프런트 런지', 2, 'Y', 'https://www.youtube.com/watch?v=GTAH9L2Y0ik', 'frontLunge.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('백 런지', 3, 'Y', 'https://www.youtube.com/watch?v=oCwiMnnhiX8' ,'backLunge.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('레그 프레스', 3, 'Y', 'https://www.youtube.com/watch?v=0lvSmzOkeik', 'legPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('스티프', 3, 'Y', 'https://www.youtube.com/watch?v=_IK8DOVFOLI', 'stiff.png');

-- 체형분석 탭 관련 WEXERCISEDICT_HM 테이블 생성 및 확인(여)
CREATE TABLE WEXERCISEDICT_HM (
    EXERCISE        VARCHAR2(45)      PRIMARY KEY,   
    GRADE           NUMBER(1),                       /*1, 2, 3, 4(운동 자체의 강도)*/
    ARM             VARCHAR2(1),                     /*Y/N(팔에 좋은 운동 = Y)*/
    BELLY           VARCHAR2(1),                     /*Y/N(복부에 좋은 운동 = Y)*/
    THIGH           VARCHAR2(1),                     /*Y/N(허벅지에 좋은 운동 = Y)*/
    CALF            VARCHAR2(1),                     /*Y/N(종아리에 좋은 운동 = Y)*/
    HIP             VARCHAR2(1),                     /*Y/N(엉덩이에 좋은 운동 = Y)*/
    EXERCISELINK    VARCHAR2(120),                   /*운동 관련 링크*/
    EXERCISEPHOTO   VARCHAR2(40)
);

DROP TABLE WEXERCISEDICT_HM;
DESC WEXERCISEDICT_HM;
SELECT * FROM WEXERCISEDICT_HM;

-- 여자 운동 저장 SQL문(팔, 복부, 허벅지, 엉덩이)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, BELLY, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('달리기', 1, 'Y', 'Y', 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=939085&cid=51036&categoryId=51036', 'running.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, BELLY, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('타바타', 4, 'Y', 'Y', 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=1111436&cid=40942&categoryId=31946', 'tabata.png');

-- 여자 운동 저장 SQL문(팔)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('펭귄운동', 1, 'Y', 'https://cachette.tistory.com/165', 'penguinExercise.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('암 서클스', 1, 'Y', 'http://realpilates.co.kr/221167690803', 'armCircles.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('푸시 다운', 2, 'Y', 'https://blog.naver.com/dkfnal2232/221348721508', 'pushDown.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('니 푸시업', 2, 'Y', 'https://blog.naver.com/lsjis123/221418464426', 'kneePushUp.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('투 암 덤벨 킥백', 3, 'Y', 'https://cafe.naver.com/goondong/19807', 'twoArmDumbbellKickBack.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('덤벨 트라이셉스 익스텐션', 3, 'Y', 'https://terms.naver.com/entry.nhn?docId=938894&cid=51030&categoryId=51030', 'dumbbellTricepsExtension.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('벤치 딥스', 4, 'Y', 'https://m.blog.naver.com/dkfnal2232/221278057773', 'benchDips.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('오버헤드 리치', 4, 'Y', 'https://blog.naver.com/yi851113/221295127783', 'overheadReach.png');

-- 여자 운동 저장 SQL문(복부)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('플랭크', 1, 'Y', 'https://m.post.naver.com/viewer/postView.nhn?volumeNo=18986971&memberNo=23953116&vType=VERTICAL', 'plank.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('크런치', 1, 'Y', 'https://blog.naver.com/chtqnf7741/220993253954', 'crunch.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('플랭크 트위스트', 2, 'Y', 'https://blog.naver.com/boyish2000/221501311039', 'plankTwist.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('니 업 시티드', 2, 'Y', 'https://blog.naver.com/gorilla_gym/221228051743', 'kneeUpSeated.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('리버스 크런치', 3, 'Y', 'https://blog.naver.com/yunwangs/221311913611', 'reverseCrunch.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('사이드 플랭크', 3, 'Y', 'https://blog.naver.com/jincau81/221509216859', 'sidePlank.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('V-UP', 4, 'Y', 'https://cyhani1577.blog.me/221485471335', 'vUp.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('레그레이즈', 4, 'Y', 'https://terms.naver.com/entry.nhn?docId=938922&cid=51030&categoryId=51030', 'legraise.png');

-- 여자 운동 저장 SQL문(허벅지, 엉덩이)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('브릿지', 1, 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=2099777&cid=51030&categoryId=51030', 'bridge.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('스쿼트', 1, 'Y', 'Y', 'https://blog.naver.com/utqumndatj/220463738878', 'squat.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('런지', 1, 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=2099784&cid=51030&categoryId=51030', 'lunge.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('크로스 런지', 3, 'Y', 'Y', 'https://m.post.naver.com/viewer/postView.nhn?volumeNo=4519605&memberNo=32133137&vType=VERTICAL', 'crossLunge.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('사이드 런지', 2, 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=2099781&cid=51030&categoryId=51030', 'sideLunge.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('원 레그 브릿지', 3, 'Y', 'Y', 'https://blog.naver.com/llyyhh9090/221361389279', 'oneLegBridge.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('점프 스쿼트', 3, 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=2099782&cid=51030&categoryId=51030', 'jumpSquat.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('와이드 스쿼트', 2, 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=2099783&cid=51030&categoryId=51030', 'wideSquat.png');

-- 여자 운동 저장 SQL문(허벅지)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, EXERCISELINK, EXERCISEPHOTO) 
VALUES('원 레그 데드 리프트', 4, 'Y', 'https://1boon.kakao.com/tlxpass/181221', 'oneLegDeadLift.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, EXERCISELINK, EXERCISEPHOTO) 
VALUES('플랭크 레그킥백', 4, 'Y', 'https://blog.naver.com/wpilates3/221431221421', 'plankLegKickBack.png');

-- 여자 운동 저장 SQL문(복부, 엉덩이)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('버드독', 4, 'Y', 'Y', 'https://blog.naver.com/2009pyrus/220131523847', 'birdDog.png');

-- 여자 운동 저장 SQL문(엉덩이)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('덩키킥', 3, 'Y', 'https://terms.naver.com/entry.nhn?docId=2099776&cid=51030&categoryId=51030', 'donkyKick.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('힙 어브덕션', 3, 'Y', 'https://blog.naver.com/screem123/221417099655', 'hipAbduction.png');

-- 여자 운동 저장 SQL문(종아리)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, CALF, EXERCISELINK, EXERCISEPHOTO) 
VALUES('포워드 밴드', 1, 'Y', 'https://story.kakao.com/ch/diethunter/fJQ78P2Wsv9', 'forwardBand.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, CALF, EXERCISELINK, EXERCISEPHOTO) 
VALUES('다운 도그', 2, 'Y', 'https://blog.naver.com/funfunmani2/221040336548', 'downDog.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, CALF, EXERCISELINK, EXERCISEPHOTO) 
VALUES('잔발뛰기', 1, 'Y', 'https://terms.naver.com/entry.nhn?docId=2099789&cid=51030&categoryId=51030', 'shortPitch.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, CALF, EXERCISELINK, EXERCISEPHOTO) 
VALUES('강하나 스트레칭', 3, 'Y', 'https://www.youtube.com/watch?v=LZWORB39zQk&t=322s', 'stretchKang.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, CALF, EXERCISELINK, EXERCISEPHOTO) 
VALUES('다노 종아리 스트레칭', 2, 'Y', 'https://blog.naver.com/dagymdieting/221199708281', 'stretchDano.png');


-- 작성된 SQL문 반영하는 트랜젝션
COMMIT

