-- =========================================================
-- Hotel STO Lab Schema
-- PostgreSQL 기준
-- 본 DB는 실제 투자, 청약, 매매, 배당 지급이 아닌
-- 금융교육용 STO 시뮬레이션 데이터를 저장하기 위한 구조이다.
-- =========================================================

-- =========================================================
-- 1. 호텔 프로젝트 테이블
-- =========================================================
CREATE TABLE hotel_project (
    hotel_id VARCHAR(40) PRIMARY KEY,
    hotel_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    room_count INTEGER NOT NULL,
    base_adr BIGINT NOT NULL,
    base_occupancy_rate NUMERIC(8, 6) NOT NULL,
    additional_revenue_rate NUMERIC(8, 6) NOT NULL DEFAULT 0.120000,
    operating_cost_rate NUMERIC(8, 6) NOT NULL,
    reserve_rate NUMERIC(8, 6) NOT NULL DEFAULT 0.100000,
    risk_level VARCHAR(20) NOT NULL,
    description TEXT,
    active_yn BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_hotel_room_count CHECK (room_count > 0),
    CONSTRAINT chk_hotel_base_adr CHECK (base_adr > 0),
    CONSTRAINT chk_hotel_base_occupancy_rate CHECK (base_occupancy_rate >= 0 AND base_occupancy_rate <= 1),
    CONSTRAINT chk_hotel_additional_revenue_rate CHECK (additional_revenue_rate >= 0),
    CONSTRAINT chk_hotel_operating_cost_rate CHECK (operating_cost_rate >= 0 AND operating_cost_rate <= 1),
    CONSTRAINT chk_hotel_reserve_rate CHECK (reserve_rate >= 0 AND reserve_rate <= 1),
    CONSTRAINT chk_hotel_risk_level CHECK (risk_level IN ('LOW', 'MEDIUM', 'HIGH'))
);

COMMENT ON TABLE hotel_project IS '호텔 객실 운영 수익 시뮬레이션의 기준이 되는 호텔 프로젝트 정보';
COMMENT ON COLUMN hotel_project.hotel_id IS '호텔 프로젝트 ID. 예: HOTEL-001';
COMMENT ON COLUMN hotel_project.hotel_name IS '호텔 프로젝트명';
COMMENT ON COLUMN hotel_project.location IS '호텔 위치';
COMMENT ON COLUMN hotel_project.room_count IS '전체 객실 수';
COMMENT ON COLUMN hotel_project.base_adr IS '기본 평균 객실단가. ADR, Average Daily Rate';
COMMENT ON COLUMN hotel_project.base_occupancy_rate IS '기본 객실 점유율. 0~1 사이 값';
COMMENT ON COLUMN hotel_project.additional_revenue_rate IS '객실매출 대비 부대매출 비율';
COMMENT ON COLUMN hotel_project.operating_cost_rate IS '총매출 대비 운영비율';
COMMENT ON COLUMN hotel_project.reserve_rate IS '영업이익 중 예비비로 적립하는 비율';
COMMENT ON COLUMN hotel_project.risk_level IS '호텔 프로젝트 위험등급. LOW, MEDIUM, HIGH';
COMMENT ON COLUMN hotel_project.description IS '호텔 프로젝트 설명';
COMMENT ON COLUMN hotel_project.active_yn IS '사용 여부';
COMMENT ON COLUMN hotel_project.created_at IS '생성일시';
COMMENT ON COLUMN hotel_project.updated_at IS '수정일시';

-- =========================================================
-- 2. 가상 STO 발행 조건 테이블
-- =========================================================
CREATE TABLE token_offering (
    offering_id VARCHAR(40) PRIMARY KEY,
    hotel_id VARCHAR(40) NOT NULL,
    total_offering_amount BIGINT NOT NULL,
    token_price BIGINT NOT NULL,
    total_token_supply BIGINT NOT NULL,
    minimum_investment_amount BIGINT NOT NULL,
    maximum_investment_amount BIGINT NOT NULL,
    dividend_cycle VARCHAR(20) NOT NULL,
    dividend_basis VARCHAR(50) NOT NULL,
    offering_status VARCHAR(30) NOT NULL,
    compliance_notice TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_token_offering_hotel FOREIGN KEY (hotel_id) REFERENCES hotel_project (hotel_id),
    CONSTRAINT chk_offering_total_amount CHECK (total_offering_amount > 0),
    CONSTRAINT chk_offering_token_price CHECK (token_price > 0),
    CONSTRAINT chk_offering_total_supply CHECK (total_token_supply > 0),
    CONSTRAINT chk_offering_min_investment CHECK (minimum_investment_amount > 0),
    CONSTRAINT chk_offering_max_investment CHECK (maximum_investment_amount >= minimum_investment_amount),
    CONSTRAINT chk_offering_dividend_cycle CHECK (dividend_cycle IN ('MONTHLY', 'QUARTERLY', 'YEARLY')),
    CONSTRAINT chk_offering_dividend_basis CHECK (dividend_basis IN ('DISTRIBUTABLE_PROFIT')),
    CONSTRAINT chk_offering_status CHECK (offering_status IN ('DRAFT','OPEN_SIMULATION','CLOSED_SIMULATION','OPERATING','DIVIDEND_CALCULATED','COMPLETED','CANCELLED'))
);

COMMENT ON TABLE token_offering IS '호텔 프로젝트별 가상 STO 발행 조건. 실제 증권 발행이 아닌 교육용 시뮬레이션 조건';
COMMENT ON COLUMN token_offering.offering_id IS '가상 STO 발행 조건 ID. 예: OFFERING-001';
COMMENT ON COLUMN token_offering.hotel_id IS '연결된 호텔 프로젝트 ID';
COMMENT ON COLUMN token_offering.total_offering_amount IS '가상 총 모집금액';
COMMENT ON COLUMN token_offering.token_price IS '가상 토큰 1개 가격';
COMMENT ON COLUMN token_offering.total_token_supply IS '총 가상 토큰 수량. 총 모집금액 / 토큰 가격';
COMMENT ON COLUMN token_offering.minimum_investment_amount IS '모의 투자 최소 금액';
COMMENT ON COLUMN token_offering.maximum_investment_amount IS '모의 투자 최대 금액';
COMMENT ON COLUMN token_offering.dividend_cycle IS '배당 시뮬레이션 주기';
COMMENT ON COLUMN token_offering.dividend_basis IS '배당 기준. 1차 MVP에서는 배당가능이익 기준';
COMMENT ON COLUMN token_offering.offering_status IS '가상 발행 조건 상태';
COMMENT ON COLUMN token_offering.compliance_notice IS '교육용 시뮬레이션 고지 문구';

-- =========================================================
-- 3. 사용자 가상 토큰 포지션 테이블
-- =========================================================
CREATE TABLE user_token_position (
    position_id VARCHAR(40) PRIMARY KEY,
    offering_id VARCHAR(40) NOT NULL,
    user_code VARCHAR(40) NOT NULL,
    investment_amount BIGINT NOT NULL,
    token_quantity BIGINT NOT NULL,
    ownership_ratio NUMERIC(12, 10) NOT NULL,
    dividend_right_ratio NUMERIC(12, 10) NOT NULL,
    position_status VARCHAR(30) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_user_token_position_offering FOREIGN KEY (offering_id) REFERENCES token_offering (offering_id),
    CONSTRAINT chk_position_investment_amount CHECK (investment_amount > 0),
    CONSTRAINT chk_position_token_quantity CHECK (token_quantity > 0),
    CONSTRAINT chk_position_ownership_ratio CHECK (ownership_ratio > 0 AND ownership_ratio <= 1),
    CONSTRAINT chk_position_dividend_right_ratio CHECK (dividend_right_ratio > 0 AND dividend_right_ratio <= 1),
    CONSTRAINT chk_position_status CHECK (position_status IN ('SIMULATED','ACTIVE','LOCKED','EXPIRED','CANCELLED','DEFAULTED'))
);

COMMENT ON TABLE user_token_position IS '사용자의 모의 투자 결과와 가상 토큰 보유비율';
COMMENT ON COLUMN user_token_position.position_id IS '사용자 가상 토큰 포지션 ID';
COMMENT ON COLUMN user_token_position.offering_id IS '가상 STO 발행 조건 ID';
COMMENT ON COLUMN user_token_position.user_code IS '교육용 사용자 코드. 실제 실명 회원 식별값이 아님';
COMMENT ON COLUMN user_token_position.investment_amount IS '사용자가 입력한 모의 투자금';
COMMENT ON COLUMN user_token_position.token_quantity IS '모의 투자금 기준 보유 가상 토큰 수량';
COMMENT ON COLUMN user_token_position.ownership_ratio IS '전체 토큰 대비 사용자 보유비율';
COMMENT ON COLUMN user_token_position.dividend_right_ratio IS '배당금 계산에 적용되는 배당권 비율';
COMMENT ON COLUMN user_token_position.position_status IS '가상 토큰 포지션 상태';

-- =========================================================
-- 4. 월별 호텔 운영 결과 테이블
-- =========================================================
CREATE TABLE monthly_operation_result (
    operation_result_id VARCHAR(40) PRIMARY KEY,
    hotel_id VARCHAR(40) NOT NULL,
    operation_month VARCHAR(7) NOT NULL,
    operating_days INTEGER NOT NULL,
    room_count INTEGER NOT NULL,
    occupancy_rate NUMERIC(8, 6) NOT NULL,
    adr BIGINT NOT NULL,
    additional_revenue_rate NUMERIC(8, 6) NOT NULL,
    operating_cost_rate NUMERIC(8, 6) NOT NULL,
    reserve_rate NUMERIC(8, 6) NOT NULL,
    room_revenue BIGINT NOT NULL,
    additional_revenue BIGINT NOT NULL,
    total_revenue BIGINT NOT NULL,
    operating_cost BIGINT NOT NULL,
    operating_profit BIGINT NOT NULL,
    reserve_amount BIGINT NOT NULL,
    distributable_profit BIGINT NOT NULL,
    operation_status VARCHAR(30) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_monthly_operation_hotel FOREIGN KEY (hotel_id) REFERENCES hotel_project (hotel_id),
    CONSTRAINT uq_monthly_operation UNIQUE (hotel_id, operation_month),
    CONSTRAINT chk_operation_month_format CHECK (operation_month ~ '^[0-9]{4}-[0-9]{2}$'),
    CONSTRAINT chk_operation_days CHECK (operating_days BETWEEN 1 AND 31),
    CONSTRAINT chk_operation_room_count CHECK (room_count > 0),
    CONSTRAINT chk_operation_occupancy_rate CHECK (occupancy_rate >= 0 AND occupancy_rate <= 1),
    CONSTRAINT chk_operation_adr CHECK (adr > 0),
    CONSTRAINT chk_operation_additional_rate CHECK (additional_revenue_rate >= 0),
    CONSTRAINT chk_operation_cost_rate CHECK (operating_cost_rate >= 0 AND operating_cost_rate <= 1),
    CONSTRAINT chk_operation_reserve_rate CHECK (reserve_rate >= 0 AND reserve_rate <= 1),
    CONSTRAINT chk_operation_room_revenue CHECK (room_revenue >= 0),
    CONSTRAINT chk_operation_additional_revenue CHECK (additional_revenue >= 0),
    CONSTRAINT chk_operation_total_revenue CHECK (total_revenue >= 0),
    CONSTRAINT chk_operation_distributable_profit CHECK (distributable_profit >= 0),
    CONSTRAINT chk_operation_status CHECK (operation_status IN ('DRAFT','CALCULATED','CONFIRMED','CANCELLED'))
);

COMMENT ON TABLE monthly_operation_result IS '월별 호텔 운영 결과와 배당가능이익 계산 결과';
COMMENT ON COLUMN monthly_operation_result.operation_result_id IS '월별 운영 결과 ID';
COMMENT ON COLUMN monthly_operation_result.hotel_id IS '호텔 프로젝트 ID';
COMMENT ON COLUMN monthly_operation_result.operation_month IS '운영 월. YYYY-MM 형식';
COMMENT ON COLUMN monthly_operation_result.operating_days IS '해당 월 영업일수';
COMMENT ON COLUMN monthly_operation_result.room_count IS '해당 월 판매 가능 객실 수';
COMMENT ON COLUMN monthly_operation_result.occupancy_rate IS '해당 월 객실 점유율';
COMMENT ON COLUMN monthly_operation_result.adr IS '해당 월 평균 객실단가';
COMMENT ON COLUMN monthly_operation_result.room_revenue IS '객실매출';
COMMENT ON COLUMN monthly_operation_result.additional_revenue IS '부대매출';
COMMENT ON COLUMN monthly_operation_result.total_revenue IS '총매출';
COMMENT ON COLUMN monthly_operation_result.operating_cost IS '운영비';
COMMENT ON COLUMN monthly_operation_result.operating_profit IS '영업이익';
COMMENT ON COLUMN monthly_operation_result.reserve_amount IS '예비비';
COMMENT ON COLUMN monthly_operation_result.distributable_profit IS '배당가능이익. 음수일 경우 0으로 저장';
COMMENT ON COLUMN monthly_operation_result.operation_status IS '월별 운영 결과 상태';

-- =========================================================
-- 5. 사용자별 배당 계산 결과 테이블
-- =========================================================
CREATE TABLE token_dividend_result (
    dividend_id VARCHAR(40) PRIMARY KEY,
    position_id VARCHAR(40) NOT NULL,
    operation_result_id VARCHAR(40) NOT NULL,
    ownership_ratio NUMERIC(12, 10) NOT NULL,
    distributable_profit BIGINT NOT NULL,
    dividend_amount BIGINT NOT NULL,
    monthly_roi NUMERIC(10, 4) NOT NULL,
    annualized_roi NUMERIC(10, 4) NOT NULL,
    dividend_status VARCHAR(30) NOT NULL,
    education_comment TEXT,
    calculated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_dividend_position FOREIGN KEY (position_id) REFERENCES user_token_position (position_id),
    CONSTRAINT fk_dividend_operation FOREIGN KEY (operation_result_id) REFERENCES monthly_operation_result (operation_result_id),
    CONSTRAINT uq_dividend_position_operation UNIQUE (position_id, operation_result_id),
    CONSTRAINT chk_dividend_ownership_ratio CHECK (ownership_ratio >= 0 AND ownership_ratio <= 1),
    CONSTRAINT chk_dividend_distributable_profit CHECK (distributable_profit >= 0),
    CONSTRAINT chk_dividend_amount CHECK (dividend_amount >= 0),
    CONSTRAINT chk_dividend_status CHECK (dividend_status IN ('CALCULATED','ZERO_DIVIDEND','CANCELLED'))
);

COMMENT ON TABLE token_dividend_result IS '사용자 가상 토큰 포지션별 월별 배당 계산 결과';
COMMENT ON COLUMN token_dividend_result.dividend_id IS '배당 계산 결과 ID';
COMMENT ON COLUMN token_dividend_result.position_id IS '사용자 가상 토큰 포지션 ID';
COMMENT ON COLUMN token_dividend_result.operation_result_id IS '월별 호텔 운영 결과 ID';
COMMENT ON COLUMN token_dividend_result.ownership_ratio IS '배당 계산에 사용된 보유비율';
COMMENT ON COLUMN token_dividend_result.distributable_profit IS '배당 계산 기준이 되는 배당가능이익';
COMMENT ON COLUMN token_dividend_result.dividend_amount IS '사용자 예상 배당금';
COMMENT ON COLUMN token_dividend_result.monthly_roi IS '월 수익률. 배당금 / 투자금 * 100';
COMMENT ON COLUMN token_dividend_result.annualized_roi IS '단순 연환산 수익률. 월 수익률 * 12';
COMMENT ON COLUMN token_dividend_result.dividend_status IS '배당 계산 상태';
COMMENT ON COLUMN token_dividend_result.education_comment IS '배당 결과에 대한 학습용 해석 문구';

-- =========================================================
-- 6. 리스크 이벤트 테이블
-- =========================================================
CREATE TABLE risk_event (
    risk_event_id VARCHAR(40) PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    event_type VARCHAR(20) NOT NULL,
    target_variable VARCHAR(50) NOT NULL,
    impact_type VARCHAR(30) NOT NULL,
    impact_value NUMERIC(12, 6) NOT NULL,
    description TEXT NOT NULL,
    education_comment TEXT,
    active_yn BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_risk_event_type CHECK (event_type IN ('POSITIVE', 'NEGATIVE', 'NEUTRAL')),
    CONSTRAINT chk_risk_target_variable CHECK (target_variable IN ('occupancyRate','adr','operatingCostRate','additionalRevenueRate','roomCount','reserveRate')),
    CONSTRAINT chk_risk_impact_type CHECK (impact_type IN ('ADD_RATE','MULTIPLY_AMOUNT','MULTIPLY_COUNT','SET_VALUE'))
);

COMMENT ON TABLE risk_event IS '호텔 운영 변수에 영향을 주는 리스크 이벤트 정의';
COMMENT ON COLUMN risk_event.risk_event_id IS '리스크 이벤트 ID. 예: RISK-001';
COMMENT ON COLUMN risk_event.event_name IS '리스크 이벤트명';
COMMENT ON COLUMN risk_event.event_type IS '이벤트 유형. POSITIVE, NEGATIVE, NEUTRAL';
COMMENT ON COLUMN risk_event.target_variable IS '영향을 받는 시뮬레이션 변수';
COMMENT ON COLUMN risk_event.impact_type IS '영향 적용 방식';
COMMENT ON COLUMN risk_event.impact_value IS '영향값. 예: 점유율 -0.25, ADR +0.10';
COMMENT ON COLUMN risk_event.description IS '이벤트 설명';
COMMENT ON COLUMN risk_event.education_comment IS '사용자에게 보여줄 학습용 해석 문구';
COMMENT ON COLUMN risk_event.active_yn IS '사용 여부';

-- =========================================================
-- 7. 시뮬레이션 실행 이력 테이블
-- =========================================================
CREATE TABLE simulation_history (
    simulation_id VARCHAR(40) PRIMARY KEY,
    hotel_id VARCHAR(40) NOT NULL,
    offering_id VARCHAR(40) NOT NULL,
    risk_event_id VARCHAR(40),
    user_code VARCHAR(40),
    investment_amount BIGINT NOT NULL,
    input_snapshot JSONB NOT NULL,
    result_snapshot JSONB NOT NULL,
    education_comment TEXT,
    compliance_notice TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_simulation_hotel FOREIGN KEY (hotel_id) REFERENCES hotel_project (hotel_id),
    CONSTRAINT fk_simulation_offering FOREIGN KEY (offering_id) REFERENCES token_offering (offering_id),
    CONSTRAINT fk_simulation_risk_event FOREIGN KEY (risk_event_id) REFERENCES risk_event (risk_event_id),
    CONSTRAINT chk_simulation_investment_amount CHECK (investment_amount > 0)
);

COMMENT ON TABLE simulation_history IS '사용자가 실행한 통합 시뮬레이션 입력값과 결과값 이력';
COMMENT ON COLUMN simulation_history.simulation_id IS '시뮬레이션 실행 이력 ID';
COMMENT ON COLUMN simulation_history.hotel_id IS '시뮬레이션 대상 호텔 프로젝트 ID';
COMMENT ON COLUMN simulation_history.offering_id IS '시뮬레이션 대상 가상 STO 발행 조건 ID';
COMMENT ON COLUMN simulation_history.risk_event_id IS '적용된 리스크 이벤트 ID. 없으면 NULL';
COMMENT ON COLUMN simulation_history.user_code IS '교육용 사용자 코드';
COMMENT ON COLUMN simulation_history.investment_amount IS '시뮬레이션에 사용한 모의 투자금';
COMMENT ON COLUMN simulation_history.input_snapshot IS '시뮬레이션 실행 당시 입력값 JSON';
COMMENT ON COLUMN simulation_history.result_snapshot IS '시뮬레이션 계산 결과 JSON';
COMMENT ON COLUMN simulation_history.education_comment IS '시뮬레이션 결과 해석 문구';
COMMENT ON COLUMN simulation_history.compliance_notice IS '교육용 시뮬레이션 고지 문구';

-- =========================================================
-- 8. 인덱스
-- =========================================================
CREATE INDEX idx_token_offering_hotel_id ON token_offering (hotel_id);
CREATE INDEX idx_user_token_position_offering_id ON user_token_position (offering_id);
CREATE INDEX idx_user_token_position_user_code ON user_token_position (user_code);
CREATE INDEX idx_monthly_operation_hotel_month ON monthly_operation_result (hotel_id, operation_month);
CREATE INDEX idx_dividend_position_id ON token_dividend_result (position_id);
CREATE INDEX idx_dividend_operation_result_id ON token_dividend_result (operation_result_id);
CREATE INDEX idx_risk_event_active ON risk_event (active_yn);
CREATE INDEX idx_simulation_history_hotel_id ON simulation_history (hotel_id);
CREATE INDEX idx_simulation_history_offering_id ON simulation_history (offering_id);
CREATE INDEX idx_simulation_history_created_at ON simulation_history (created_at);
