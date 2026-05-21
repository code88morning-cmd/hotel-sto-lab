# Hotel STO Lab 통합 기획·설계 문서

## 0. 프로젝트 정의

**Hotel STO Lab**은 호텔 객실 운영 수익을 기반으로 STO 구조, 배당가능이익, 토큰 보유비율, 투자자 배당금, 수익률 변동을 학습하는 금융교육형 시뮬레이션 플랫폼입니다.

## 1. 단계별 산출물

| 단계 | 산출물 | 파일 |
|---:|---|---|
| 1 | 프로젝트 개요, 시장·제도 조사, README | `docs/01-project-overview.md`, `docs/02-market-regulation-research.md`, `README.md` |
| 2 | 호텔 수익 계산 로직 설계 | `docs/03-hotel-revenue-model.md` |
| 3 | STO 토큰 발행 구조 시뮬레이션 설계 | `docs/04-token-offering-simulation.md` |
| 4 | DB ERD 및 Schema 설계 | `docs/05-erd.md`, `db/schema.sql` |
| 5 | API 명세 작성 | `docs/06-api-spec.md` |
| 6 | 프론트엔드 화면 설계 | `docs/07-frontend-screen-design.md` |
| 7 | 수익률·배당 계산 엔진 구현 | `docs/08-calculation-engine.md`, `backend/` |
| 8 | 대시보드 시각화 | `docs/09-dashboard-visualization.md`, `frontend/src/components/dashboard/` |
| 9 | 리스크 이벤트 시뮬레이션 추가 | `docs/10-risk-event-simulation.md`, `frontend/src/components/risk/` |

## 2. 핵심 계산 흐름

```text
roomRevenue = roomCount × operatingDays × occupancyRate × adr
additionalRevenue = roomRevenue × additionalRevenueRate
totalRevenue = roomRevenue + additionalRevenue
operatingCost = totalRevenue × operatingCostRate
operatingProfit = totalRevenue - operatingCost
reserveAmount = operatingProfit × reserveRate
distributableProfit = max(0, operatingProfit - reserveAmount)
totalTokenSupply = totalOfferingAmount ÷ tokenPrice
userTokenQuantity = investmentAmount ÷ tokenPrice
ownershipRatio = userTokenQuantity ÷ totalTokenSupply
investorDividend = distributableProfit × ownershipRatio
monthlyRoi = investorDividend ÷ investmentAmount × 100
```

## 3. MVP 범위

### 포함

- 호텔 프로젝트 목록/상세
- 가상 STO 발행 조건 표시
- 호텔 수익 계산
- 토큰 보유비율 계산
- 배당금 및 월 수익률 계산
- 리스크 이벤트 적용 전/후 비교
- 교육용 고지 문구

### 제외

- 실제 증권 발행
- 실제 투자자 모집
- 실제 결제
- 실제 청약
- 실제 매수/매도
- 실제 배당 지급
- 지갑 연동
- 증권계좌 연동

## 4. 권장 구현 순서

1. `db/schema.sql` 실행
2. `db/seed.sql` 실행
3. `backend/` 계산 엔진 구현
4. `POST /api/simulations/full` 구현
5. `frontend/` KPI 대시보드 구현
6. 리스크 이벤트 비교 UI 구현

## 5. 최종 포지셔닝

> 호텔 객실 운영 데이터를 기반으로 STO 투자구조, 배당가능이익, 투자자 수익률 변동을 학습하는 금융교육형 시뮬레이션 플랫폼
