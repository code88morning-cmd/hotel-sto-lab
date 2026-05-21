-- =========================================================
-- Hotel STO Lab Seed Data
-- =========================================================

INSERT INTO hotel_project (
    hotel_id, hotel_name, location, room_count, base_adr, base_occupancy_rate,
    additional_revenue_rate, operating_cost_rate, reserve_rate, risk_level, description
) VALUES
('HOTEL-001', '부산 해운대 비즈니스호텔', 'Busan, Haeundae', 80, 110000, 0.680000, 0.120000, 0.580000, 0.100000, 'MEDIUM', '관광과 출장 수요가 혼합된 비즈니스 호텔'),
('HOTEL-002', '제주 리조트형 호텔', 'Jeju', 120, 145000, 0.610000, 0.150000, 0.640000, 0.100000, 'HIGH', '성수기와 비수기 편차가 큰 리조트형 호텔'),
('HOTEL-003', '서울 도심 부티크호텔', 'Seoul', 45, 185000, 0.730000, 0.100000, 0.670000, 0.100000, 'MEDIUM', 'ADR은 높지만 운영비 부담도 큰 도심형 부티크 호텔'),
('HOTEL-004', '부산 원도심 리노베이션 호텔', 'Busan, Old Downtown', 60, 92000, 0.550000, 0.080000, 0.520000, 0.120000, 'LOW', '지역재생 콘셉트의 중소형 리노베이션 호텔');

INSERT INTO token_offering (
    offering_id, hotel_id, total_offering_amount, token_price, total_token_supply,
    minimum_investment_amount, maximum_investment_amount, dividend_cycle,
    dividend_basis, offering_status, compliance_notice
) VALUES
('OFFERING-001', 'HOTEL-001', 1000000000, 10000, 100000, 100000, 10000000, 'MONTHLY', 'DISTRIBUTABLE_PROFIT', 'OPEN_SIMULATION', '본 조건은 교육용 시뮬레이션이며 실제 증권 발행 또는 투자 청약이 아닙니다.'),
('OFFERING-002', 'HOTEL-002', 2000000000, 10000, 200000, 100000, 10000000, 'MONTHLY', 'DISTRIBUTABLE_PROFIT', 'OPEN_SIMULATION', '본 조건은 교육용 시뮬레이션이며 실제 증권 발행 또는 투자 청약이 아닙니다.');

INSERT INTO risk_event (
    risk_event_id, event_name, event_type, target_variable, impact_type,
    impact_value, description, education_comment
) VALUES
('RISK-001', '성수기 관광객 증가', 'POSITIVE', 'occupancyRate', 'ADD_RATE', 0.150000, '성수기 수요 증가로 객실 점유율이 상승합니다.', '점유율 상승은 객실매출 증가로 이어지고 배당가능이익이 증가할 수 있습니다.'),
('RISK-002', '지역 축제 개최', 'POSITIVE', 'adr', 'MULTIPLY_AMOUNT', 0.100000, '지역 이벤트로 평균 객실단가가 상승합니다.', 'ADR 상승은 객실매출과 배당가능이익 증가로 이어질 수 있습니다.'),
('RISK-004', '기상 악화', 'NEGATIVE', 'occupancyRate', 'ADD_RATE', -0.250000, '기상 악화로 관광 수요가 감소하고 객실 점유율이 하락합니다.', '점유율 하락은 객실매출 감소로 이어지고 배당가능이익과 예상 배당금도 줄어들 수 있습니다.'),
('RISK-005', 'OTA 수수료 인상', 'NEGATIVE', 'operatingCostRate', 'ADD_RATE', 0.050000, '판매 채널 수수료 증가로 운영비율이 상승합니다.', '운영비율 상승은 영업이익과 배당가능이익 감소로 이어질 수 있습니다.');
