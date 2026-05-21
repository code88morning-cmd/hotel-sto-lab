# Hotel Revenue Model

## 계산 흐름

```text
호텔 기본 정보 입력
→ 객실 운영 변수 입력
→ 월 객실매출 계산
→ 부대매출 계산
→ 총매출 계산
→ 운영비 계산
→ 영업이익 계산
→ 예비비 차감
→ 배당가능이익 계산
```

## 변수 정의

| 변수 | 필드 | 설명 |
|---|---|---|
| 객실 수 | `roomCount` | 판매 가능한 객실 수 |
| 영업일수 | `operatingDays` | 월 영업일수 |
| 객실 점유율 | `occupancyRate` | 판매된 객실 비율 |
| 평균 객실단가 | `adr` | ADR |
| 부대매출률 | `additionalRevenueRate` | 객실매출 대비 부대매출 |
| 운영비율 | `operatingCostRate` | 총매출 대비 운영비 |
| 예비비율 | `reserveRate` | 영업이익 중 예비비 적립 비율 |

## 계산식

```text
roomRevenue = roomCount × operatingDays × occupancyRate × adr
additionalRevenue = roomRevenue × additionalRevenueRate
totalRevenue = roomRevenue + additionalRevenue
operatingCost = totalRevenue × operatingCostRate
operatingProfit = totalRevenue - operatingCost
reserveAmount = operatingProfit × reserveRate
distributableProfit = max(0, operatingProfit - reserveAmount)
```

## 예시

| 항목 | 값 |
|---|---:|
| 객실 수 | 80 |
| 영업일수 | 30 |
| 점유율 | 68% |
| ADR | 110,000원 |
| 객실매출 | 179,520,000원 |
| 배당가능이익 | 76,001,587원 |
