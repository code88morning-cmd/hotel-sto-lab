# API Specification

## Base URL

```text
http://localhost:8080/api
```

## API 목록

| Method | Endpoint | 설명 |
|---|---|---|
| GET | `/hotels` | 호텔 프로젝트 목록 조회 |
| GET | `/hotels/{hotelId}` | 호텔 프로젝트 상세 조회 |
| GET | `/offerings` | 가상 STO 발행 조건 목록 조회 |
| GET | `/offerings/{offeringId}` | 가상 STO 발행 조건 상세 조회 |
| POST | `/simulations/hotel-revenue` | 호텔 수익 계산 |
| POST | `/simulations/token-offering` | 토큰 보유비율 계산 |
| POST | `/simulations/dividend` | 배당금 계산 |
| POST | `/simulations/full` | 통합 계산 |
| GET | `/risk-events` | 리스크 이벤트 목록 조회 |
| POST | `/simulations/risk-event` | 리스크 이벤트 적용 계산 |

## 통합 시뮬레이션 요청

```json
{
  "hotelId": "HOTEL-001",
  "offeringId": "OFFERING-001",
  "roomCount": 80,
  "operatingDays": 30,
  "occupancyRate": 0.68,
  "adr": 110000,
  "additionalRevenueRate": 0.12,
  "operatingCostRate": 0.58,
  "reserveRate": 0.10,
  "totalOfferingAmount": 1000000000,
  "tokenPrice": 10000,
  "investmentAmount": 1000000
}
```
