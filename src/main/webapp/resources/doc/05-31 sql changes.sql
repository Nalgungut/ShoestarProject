-- ���� ���� ����� �߰�
ALTER TABLE RANGE_DISCOUNT
   ADD  RD_DATE DATE;

-- ���� ���� ������ �߰�
ALTER TABLE RANGE_DISCOUNT
    ADD RD_EDATE DATE;

-- ���� ���� �̺�Ʈ ����� ����
ALTER TABLE RANGE_DISCOUNT
    DROP COLUMN EV_NO;