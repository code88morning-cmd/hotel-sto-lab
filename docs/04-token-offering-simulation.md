# STO 토큰 발행 구조 시뮬레이션

## 목적

가상 모집금액, 토큰 가격, 투자금 기준으로 사용자의 가상 토큰 수량, 보유비율, 배당권 비율을 계산합니다.

## 계산식

```text
totalTokenSupply = totalOfferingAmount ÷ tokenPrice
userTokenQuantity = investmentAmount ÷ tokenPrice
ownershipRatio = userTokenQuantity ÷ totalTokenSupply
dividendRightRatio = ownershipRatio
investorDividend = distributableProfit × ownershipRatio
monthlyRoi = investorDividend ÷ investmentAmount × 100
```

## 가상 발행 조건 예시

| 항목 | 값 |
|---|---:|
| 총 모집금액 | 1,000,000,000원 |
| 토큰 가격 | 10,000원 |
| 총 토큰 발행량 | 100,000개 |
| 사용자 투자금 | 1,000,000원 |
| 사용자 보유 토큰 | 100개 |
| 보유비율 | 0.1% |

## 제외 범위

- 실제 증권 발행
- 실제 청약
- 실제 배당 지급
- 실제 매매
- 지갑 연동
