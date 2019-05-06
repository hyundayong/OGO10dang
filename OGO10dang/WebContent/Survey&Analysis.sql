-- �������� �� ���� MBODYINFO_HM ���̺� ���� �� Ȯ��
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
    SCORE       NUMBER(2)      NOT NULL,       /*�׸� �� �ջ� ����(ARM + CHEST + SHOULDER + BELLY + LEG)*/
    MUSCLE      NUMBER(1)      NOT NULL,       /*�׸� �� ������ ���� ����*/
    BODYTYPE    VARCHAR2(10)   NOT NULL        /*(����, ����, ��, ������)*/
);

DESC MBODYINFO_HM;
SELECT * FROM MBODYINFO_HM;

-- �������� �� ���� WBODYINFO_HM ���̺� ���� �� Ȯ��
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
    SCORE       NUMBER(2)      NOT NULL,       /*�׸� �� �ջ� ����(ARM + BELLY + THIGH + CALF + HIP)*/
    MUSCLE      NUMBER(1)      NOT NULL,       /*�׸� �� ������ ���� ����*/
    BODYTYPE    VARCHAR2(10)   NOT NULL        /*(����, ����, ��, ������)*/
);

DESC WBODYINFO_HM;
SELECT * FROM WBODYINFO_HM;


-- ü���м� �� ���� FOODDICT_HM ���̺� ���� �� Ȯ��
CREATE TABLE FOODDICT_HM (
    FOOD		VARCHAR2(10)	PRIMARY KEY,		
    SMOKE		VARCHAR2(1)		NOT NULL,		    /* Y/N(�� ���� 1�� = Y / 2�� = N) */
    DRINK		VARCHAR2(1)		NOT NULL,		    /* Y/N(���� ���� 3, 4�� = Y / 1, 2�� = N) */
    DIET		VARCHAR2(1),				        /* Y/N(����� ���� 1�� = Y) */
    HEALTH	    VARCHAR2(1),				        /* Y/N(����� ���� 2�� = Y) */
    MUSCLE	    VARCHAR2(1),					    /* Y/N(����� ���� 3�� = Y) */
    FOODPHOTO   VARCHAR2(25)                        /* ���� ������ */   
); 

DESC FOODDICT_HM;
SELECT * FROM FOODDICT_HM;
SELECT FOOD, FOODPHOTO FROM FOODDICT_HM WHERE SMOKE='Y' AND DRINK='N' AND HEALTH='Y';

-- �Ĵ� �׸� ���� SQL����

-- ����� 2�� �̻� �ش�Ǵ� �׸�
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, MUSCLE, FOODPHOTO)
VALUES('���', 'Y', 'Y', 'Y', 'Y', 'apple.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, HEALTH, FOODPHOTO)
VALUES('�ƺ�ī��', 'N', 'Y', 'Y', 'Y', 'avocado.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, MUSCLE, FOODPHOTO)
VALUES('��', 'N', 'N', 'Y', 'Y', 'bean.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, MUSCLE, FOODPHOTO)
VALUES('���', 'N', 'N', 'Y', 'Y', 'egg.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, MUSCLE, FOODPHOTO)
VALUES('ȣ��', 'N', 'Y', 'Y', 'Y', 'walnut.png');

-- ����� DIET(���̾�Ʈ)�� �ش�Ǵ� �׸�
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, FOODPHOTO)
VALUES('��Ŭ', 'N', 'N', 'Y', 'pickle.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, FOODPHOTO)
VALUES('���尡��', 'N', 'N', 'Y', 'redpepperpowder.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, FOODPHOTO)
VALUES('��ũ ���ݸ�', 'N', 'N', 'Y', 'darkchocolate.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, FOODPHOTO)
VALUES('�߰���', 'N', 'N', 'Y', 'nuts.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, DIET, FOODPHOTO)
VALUES('��', 'N', 'N', 'Y', 'water.png');

-- ����� HEALTH(ü������)�� �ش�Ǵ� �׸�
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('����', 'Y', 'Y', 'Y', 'garlic.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('����', 'Y', 'N', 'Y', 'greentea.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('�丶��', 'Y', 'N', 'Y', 'tomato.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('������', 'N', 'N', 'Y', 'omija.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('����', 'N', 'N', 'Y', 'redpepper.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('����', 'N', 'N', 'Y', 'barley.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('��纣��', 'N', 'N', 'Y', 'blueberry.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('����', 'N', 'N', 'Y', 'mackerel.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('��', 'N', 'N', 'Y', 'seaweed.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, HEALTH, FOODPHOTO)
VALUES('����', 'N', 'N', 'Y', 'mushroom.png');

-- ����� MUSCLE(�ٷ�����)�� �ش�Ǵ� �׸�
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, MUSCLE, FOODPHOTO)
VALUES('Ŀ��', 'N', 'Y', 'Y', 'coffee.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, MUSCLE, FOODPHOTO)
VALUES('����', 'N', 'N', 'Y', 'potato.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, MUSCLE, FOODPHOTO)
VALUES('�ñ�ġ', 'N', 'N', 'Y', 'spinach.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, MUSCLE, FOODPHOTO)
VALUES('�� ������', 'N', 'N', 'Y', 'chickenbreast.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, MUSCLE, FOODPHOTO)
VALUES('����', 'Y', 'N', 'Y', 'onion.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, MUSCLE, FOODPHOTO)
VALUES('���� �Ǹ�', 'N', 'N', 'Y', 'redpaprika.png');

-- ��, ���ֿ��� �ش��ϰ�, ��������� ���յ��� �ʴ� �׸�
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, FOODPHOTO)
VALUES('��Ʈ��', 'N', 'Y', 'oatmeal.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, FOODPHOTO)
VALUES('�ڸ�', 'N', 'Y', 'grapefruit.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, FOODPHOTO)
VALUES('��Ȳ', 'N', 'Y', 'turmeric.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, FOODPHOTO)
VALUES('����ݸ�', 'Y', 'N', 'broccoli.png');
INSERT INTO FOODDICT_HM (FOOD, SMOKE, DRINK, FOODPHOTO)
VALUES('��', 'Y', 'N', 'radish.png');


SELECT * FROM MEMBERINFO_HM;

-- ü���м� �� ���� WEXERCISEDICT_HM ���̺� ���� �� Ȯ��(��)
CREATE TABLE MEXERCISEDICT_HM (
    EXERCISE         VARCHAR2(45)      PRIMARY KEY,   
    GRADE            NUMBER(1),                       /*1, 2, 3, 4(� ��ü�� ����)*/
    ARM              VARCHAR2(1),                     /*U/D/N(�ȿ� ���� � : �̵� = U, ��� = U))*/
    BELLY            VARCHAR2(1),                     /*Y/N(���ο� ���� � = Y)*/
    CHEST            VARCHAR2(1),                     /*Y/N(������ ���� � = Y)*/
    SHOULDER         VARCHAR2(1),                     /*Y/N(���, � ���� � = Y)*/
    LEG              VARCHAR2(1),                     /*Y/N(��ü�� ���� � = Y)*/
    EXERCISELINK     VARCHAR2(120),                   /*� ���� ��ũ*/
    EXERCISEPHOTO    VARCHAR2(40)                     /*� ���� ��*/
);
DROP TABLE MEXERCISEDICT_HM;
DESC MEXERCISEDICT_HM;
SELECT * FROM MEXERCISEDICT_HM;

-- ���� � ���� SQL��
-- ����(ARM�� U or D�̸� �ٸ� ��� ������ Y)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, BELLY, CHEST, SHOULDER, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('����(�޸���)', 1, 'D', 'Y', 'Y', 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=939085&cid=51036&categoryId=51036', 'running.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, BELLY, CHEST, SHOULDER, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('Ǫ�þ�(�ȱ������)', 1, 'D', 'Y', 'Y', 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=938871&cid=51030&categoryId=51030', 'pushUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, BELLY, CHEST, SHOULDER, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('Ÿ��Ÿ(��Ŷ Ʈ���̴�)', 4, 'D', 'Y', 'Y', 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=1111436&cid=40942&categoryId=31946', 'tabata.png');

-- ARM - U(�� - �̵�)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('���� ��', 2, 'U', 'https://terms.naver.com/entry.nhn?docId=938886&cid=51030&categoryId=51030', 'dumbbellCurl.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('�ظ� ��', 2, 'U', 'https://terms.naver.com/entry.nhn?docId=938887&cid=51030&categoryId=51030', 'hammerCurl.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('�ٺ� ��', 3, 'U', 'https://terms.naver.com/entry.nhn?docId=938884&cid=51030&categoryId=51030', 'barbellCurl.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('������ ��', 3, 'U', 'https://terms.naver.com/entry.nhn?docId=938888&cid=51030&categoryId=51030', 'preatcherCurl.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('���̺� ��', 2, 'U', 'https://terms.naver.com/entry.nhn?docId=938890&cid=51030&categoryId=51030', 'cableCurl.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('����Ʈ���̼� ��', 2, 'U', 'https://terms.naver.com/entry.nhn?docId=938889&ref=y&cid=51030&categoryId=51030', 'concentrationCurl.png');

-- ARM - D(�� - ���)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('ű ��', 2, 'D', 'https://terms.naver.com/entry.nhn?docId=2403392&cid=51617&categoryId=51618', 'kickBack.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('��ġ ����', 2, 'D', 'https://terms.naver.com/entry.nhn?docId=938899&cid=51030&categoryId=51030', 'benchDips.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('���̾Ƹ�� Ǫ�þ�', 3, 'D', 'https://ybyb.tistory.com/18', 'diamondPushUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('���� Ʈ���̼��� �ͽ��ټ�', 2, 'D', 'https://terms.naver.com/entry.nhn?docId=938895&cid=51030&categoryId=51030', 'oneArmTricepsExtension.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('���̺� Ʈ���̼��� ������ �ٿ�', 3, 'D', 'https://terms.naver.com/entry.nhn?docId=2403391&cid=51617&categoryId=51618', 'cableTricepsExtension.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO)
VALUES('���� Ʈ���̼��� �ͽ��ټ�', 3, 'D', 'https://terms.naver.com/entry.nhn?docId=2403388&cid=51617&categoryId=51618', 'lyingTricepsExtension.png');

-- CHEST(����)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('��Ŭ���� Ǫ�þ�', 2, 'Y', 'https://www.youtube.com/watch?v=hG3pL-tl00Y', 'inclinePushUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('��Ŭ���� Ǫ�þ�', 2, 'Y', 'https://www.youtube.com/watch?v=TaSG5bTv4PU', 'declinePushUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('����', 2, 'Y', 'https://www.youtube.com/watch?v=W6I5Tsuu_CE', 'dips.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('�÷� ��ġ ������', 3, 'Y', 'https://www.youtube.com/watch?v=CcrNkBl2oE8', 'flapBenchPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('��Ŭ���� ��ġ ������', 3, 'Y', 'https://www.youtube.com/watch?v=VvhSWcvAZjg', 'inclineBenchPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('���̺� �ö���', 3, 'Y', 'https://www.youtube.com/watch?v=NvdXJ_aWefo', 'cableFly.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('�÷� ���� ������', 3, 'Y', 'https://www.youtube.com/watch?v=ZrMM99aVVtA', 'flatDumbbellPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, CHEST, EXERCISELINK, EXERCISEPHOTO)
VALUES('��Ŭ���� ���� ������', 3, 'Y', 'https://www.youtube.com/watch?v=s9D_mxCWpeQ', 'inclineDumbbellPress.png');

-- SHOULDER(���, ��)
-- Part1(���)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('����Ʈ ��Ʈ�� ������', 2, 'Y', 'https://www.youtube.com/watch?v=RuQSH745eZM', 'frontLateralRaise.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('���̵� ��Ʈ�� ������', 2, 'Y', 'https://www.youtube.com/watch?v=L04H6tiS50k', 'sideLateralRaise.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('��Ʈ ���� ��Ʈ�� ������', 2, 'Y', 'https://www.youtube.com/watch?v=l8yAJ5JFqtQ', 'bentOverLateralRaise.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('�������� Ǫ�þ�', 4, 'Y', 'https://www.youtube.com/watch?v=XWWFVOJwunY', 'handstandPushUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('�ӽ� ��� ������', 3, 'Y', 'https://www.youtube.com/watch?v=QXhw6sJ8Hf8', 'machineShoulderPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('���� ��� ������', 3, 'Y', 'https://www.youtube.com/watch?v=6k_teeNrI-g', 'dumbbellShoulderPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('������� ������', 4, 'Y', 'https://www.youtube.com/watch?v=W5rN5QkUH_k', 'overheadPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('�Ƴ�� ������', 3, 'Y', 'https://www.youtube.com/watch?v=_kUebUzDIaA', 'arnoldPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('�����ε� �� ������', 4, 'Y', 'https://www.youtube.com/watch?v=yrhhti1FArY', 'behindNeckPress.png');

-- Part2(��)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('ö�� �Ŵ޸���(30���̻�)', 1, 'Y', 'https://www.youtube.com/watch?v=1juG-_ZlytA', 'deadHang.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('�ΰ���(Ǯ��)', 3, 'Y', 'https://www.youtube.com/watch?v=I0DPkJoz1CU', 'pullUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('�ΰ���(ģ��)', 2, 'Y', 'https://www.youtube.com/watch?v=WXMCA3umX-w', 'chinUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('�ٺ� �ο�', 3, 'Y', 'https://www.youtube.com/watch?v=IBG8XWAyeGQ', 'barbellRow.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('���� �����ο�', 3, 'Y', 'https://www.youtube.com/watch?v=cqPAC3xTSk4', 'oneArmDumbbellRow.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('�����ų� ���帮��Ʈ', 4, 'Y', 'https://www.youtube.com/watch?v=15raAtp_lN0', 'conventionalDeadLift.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('�縶�Ͼ� ���帮��Ʈ', 4, 'Y', 'https://www.youtube.com/watch?v=MJerfdJzki4' , 'rumanianDeadLift.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('��Ʈ����Ʈ Ǯ�ٿ�', 2, 'Y', 'https://www.youtube.com/watch?v=SWY9E60hSmk', 'straightPullDown.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('���̺� �ο�', 2, 'Y', 'https://www.youtube.com/watch?v=DY3wSoNWt4Y', 'cableRow.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, SHOULDER, EXERCISELINK, EXERCISEPHOTO)
VALUES('��Ǯ �ٿ�', 2, 'Y', 'https://www.youtube.com/watch?v=Nw59Ikf81_Q', 'latPullDown.png');

-- BELLY(����)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO)
VALUES('���� ����Ű��', 1, 'Y', 'https://www.youtube.com/watch?v=80N4tDCyzKc', 'sitUp.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO)
VALUES('ũ��ġ', 2, 'Y', 'https://terms.naver.com/entry.nhn?docId=938919&cid=51030&categoryId=51030', 'crunch.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO)
VALUES('�÷�ũ', 1, 'Y', 'https://www.youtube.com/watch?v=Zq8nRY9P_cM', 'plank.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO)
VALUES('���̵� �÷�ũ', 2, 'Y', 'https://terms.naver.com/entry.nhn?docId=5704917&cid=51617&categoryId=62877', 'sidePlank.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO)
VALUES('���� ���� ������', 2, 'Y', 'https://www.youtube.com/watch?v=UL5BW-xe9ms', 'lyingLegraise.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO)
VALUES('���� ���� ������', 3, 'Y', 'https://www.youtube.com/watch?v=wFMvTzo9v2o', 'hangingLegraise.png');

-- LEG(��ü)
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('�Ǹ� ����Ʈ', 1, 'Y', 'https://www.youtube.com/watch?v=kX5TRwq1hn8', 'squat.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('��Ʋ�� ����Ʈ', 2, 'Y', 'https://www.youtube.com/watch?v=V2OmLxdCE7Y', 'kettleBellSquat.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('�ٺ� �� ����Ʈ', 3, 'Y', 'https://www.youtube.com/watch?v=dKXBdIQSTkU', 'barbellBackSquat.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('�ٺ� ����Ʈ ����Ʈ', 4, 'Y', 'https://www.youtube.com/watch?v=ur3hZZR8CmE', 'barbellFrontSquat.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('���� �ͽ��ټ�', 2, 'Y', 'https://www.youtube.com/watch?v=-RpN9QLJr00', 'legExtension.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('���� ��', 2, 'Y', 'https://www.youtube.com/watch?v=D83D-rhO6eQ' , 'legCurl.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('����Ʈ ����', 2, 'Y', 'https://www.youtube.com/watch?v=GTAH9L2Y0ik', 'frontLunge.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('�� ����', 3, 'Y', 'https://www.youtube.com/watch?v=oCwiMnnhiX8' ,'backLunge.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('���� ������', 3, 'Y', 'https://www.youtube.com/watch?v=0lvSmzOkeik', 'legPress.png');
INSERT INTO MEXERCISEDICT_HM (EXERCISE, GRADE, LEG, EXERCISELINK, EXERCISEPHOTO)
VALUES('��Ƽ��', 3, 'Y', 'https://www.youtube.com/watch?v=_IK8DOVFOLI', 'stiff.png');

-- ü���м� �� ���� WEXERCISEDICT_HM ���̺� ���� �� Ȯ��(��)
CREATE TABLE WEXERCISEDICT_HM (
    EXERCISE        VARCHAR2(45)      PRIMARY KEY,   
    GRADE           NUMBER(1),                       /*1, 2, 3, 4(� ��ü�� ����)*/
    ARM             VARCHAR2(1),                     /*Y/N(�ȿ� ���� � = Y)*/
    BELLY           VARCHAR2(1),                     /*Y/N(���ο� ���� � = Y)*/
    THIGH           VARCHAR2(1),                     /*Y/N(������� ���� � = Y)*/
    CALF            VARCHAR2(1),                     /*Y/N(���Ƹ��� ���� � = Y)*/
    HIP             VARCHAR2(1),                     /*Y/N(�����̿� ���� � = Y)*/
    EXERCISELINK    VARCHAR2(120),                   /*� ���� ��ũ*/
    EXERCISEPHOTO   VARCHAR2(40)
);

DROP TABLE WEXERCISEDICT_HM;
DESC WEXERCISEDICT_HM;
SELECT * FROM WEXERCISEDICT_HM;

-- ���� � ���� SQL��(��, ����, �����, ������)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, BELLY, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�޸���', 1, 'Y', 'Y', 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=939085&cid=51036&categoryId=51036', 'running.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, BELLY, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('Ÿ��Ÿ', 4, 'Y', 'Y', 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=1111436&cid=40942&categoryId=31946', 'tabata.png');

-- ���� � ���� SQL��(��)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('��Ͽ', 1, 'Y', 'https://cachette.tistory.com/165', 'penguinExercise.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�� ��Ŭ��', 1, 'Y', 'http://realpilates.co.kr/221167690803', 'armCircles.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('Ǫ�� �ٿ�', 2, 'Y', 'https://blog.naver.com/dkfnal2232/221348721508', 'pushDown.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�� Ǫ�þ�', 2, 'Y', 'https://blog.naver.com/lsjis123/221418464426', 'kneePushUp.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�� �� ���� ű��', 3, 'Y', 'https://cafe.naver.com/goondong/19807', 'twoArmDumbbellKickBack.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('���� Ʈ���̼��� �ͽ��ټ�', 3, 'Y', 'https://terms.naver.com/entry.nhn?docId=938894&cid=51030&categoryId=51030', 'dumbbellTricepsExtension.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('��ġ ����', 4, 'Y', 'https://m.blog.naver.com/dkfnal2232/221278057773', 'benchDips.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, ARM, EXERCISELINK, EXERCISEPHOTO) 
VALUES('������� ��ġ', 4, 'Y', 'https://blog.naver.com/yi851113/221295127783', 'overheadReach.png');

-- ���� � ���� SQL��(����)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�÷�ũ', 1, 'Y', 'https://m.post.naver.com/viewer/postView.nhn?volumeNo=18986971&memberNo=23953116&vType=VERTICAL', 'plank.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('ũ��ġ', 1, 'Y', 'https://blog.naver.com/chtqnf7741/220993253954', 'crunch.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�÷�ũ Ʈ����Ʈ', 2, 'Y', 'https://blog.naver.com/boyish2000/221501311039', 'plankTwist.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�� �� ��Ƽ��', 2, 'Y', 'https://blog.naver.com/gorilla_gym/221228051743', 'kneeUpSeated.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('������ ũ��ġ', 3, 'Y', 'https://blog.naver.com/yunwangs/221311913611', 'reverseCrunch.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('���̵� �÷�ũ', 3, 'Y', 'https://blog.naver.com/jincau81/221509216859', 'sidePlank.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('V-UP', 4, 'Y', 'https://cyhani1577.blog.me/221485471335', 'vUp.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, EXERCISELINK, EXERCISEPHOTO) 
VALUES('���׷�����', 4, 'Y', 'https://terms.naver.com/entry.nhn?docId=938922&cid=51030&categoryId=51030', 'legraise.png');

-- ���� � ���� SQL��(�����, ������)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�긴��', 1, 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=2099777&cid=51030&categoryId=51030', 'bridge.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('����Ʈ', 1, 'Y', 'Y', 'https://blog.naver.com/utqumndatj/220463738878', 'squat.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('����', 1, 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=2099784&cid=51030&categoryId=51030', 'lunge.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('ũ�ν� ����', 3, 'Y', 'Y', 'https://m.post.naver.com/viewer/postView.nhn?volumeNo=4519605&memberNo=32133137&vType=VERTICAL', 'crossLunge.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('���̵� ����', 2, 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=2099781&cid=51030&categoryId=51030', 'sideLunge.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�� ���� �긴��', 3, 'Y', 'Y', 'https://blog.naver.com/llyyhh9090/221361389279', 'oneLegBridge.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('���� ����Ʈ', 3, 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=2099782&cid=51030&categoryId=51030', 'jumpSquat.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('���̵� ����Ʈ', 2, 'Y', 'Y', 'https://terms.naver.com/entry.nhn?docId=2099783&cid=51030&categoryId=51030', 'wideSquat.png');

-- ���� � ���� SQL��(�����)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�� ���� ���� ����Ʈ', 4, 'Y', 'https://1boon.kakao.com/tlxpass/181221', 'oneLegDeadLift.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, THIGH, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�÷�ũ ����ű��', 4, 'Y', 'https://blog.naver.com/wpilates3/221431221421', 'plankLegKickBack.png');

-- ���� � ���� SQL��(����, ������)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, BELLY, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('���嵶', 4, 'Y', 'Y', 'https://blog.naver.com/2009pyrus/220131523847', 'birdDog.png');

-- ���� � ���� SQL��(������)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('��Űű', 3, 'Y', 'https://terms.naver.com/entry.nhn?docId=2099776&cid=51030&categoryId=51030', 'donkyKick.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, HIP, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�� ������', 3, 'Y', 'https://blog.naver.com/screem123/221417099655', 'hipAbduction.png');

-- ���� � ���� SQL��(���Ƹ�)
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, CALF, EXERCISELINK, EXERCISEPHOTO) 
VALUES('������ ���', 1, 'Y', 'https://story.kakao.com/ch/diethunter/fJQ78P2Wsv9', 'forwardBand.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, CALF, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�ٿ� ����', 2, 'Y', 'https://blog.naver.com/funfunmani2/221040336548', 'downDog.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, CALF, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�ܹ߶ٱ�', 1, 'Y', 'https://terms.naver.com/entry.nhn?docId=2099789&cid=51030&categoryId=51030', 'shortPitch.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, CALF, EXERCISELINK, EXERCISEPHOTO) 
VALUES('���ϳ� ��Ʈ��Ī', 3, 'Y', 'https://www.youtube.com/watch?v=LZWORB39zQk&t=322s', 'stretchKang.png');
INSERT INTO WEXERCISEDICT_HM (EXERCISE, GRADE, CALF, EXERCISELINK, EXERCISEPHOTO) 
VALUES('�ٳ� ���Ƹ� ��Ʈ��Ī', 2, 'Y', 'https://blog.naver.com/dagymdieting/221199708281', 'stretchDano.png');


-- �ۼ��� SQL�� �ݿ��ϴ� Ʈ������
COMMIT

