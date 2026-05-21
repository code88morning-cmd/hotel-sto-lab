# 수익률·배당 계산 엔진

## 원칙

- 금액/비율 계산은 Java `BigDecimal` 사용
- 음수 배당은 0원 처리
- Controller가 아니라 Calculator/Service에서 계산
- 실제 금융거래가 아닌 교육용 시뮬레이션 계산만 수행

## Calculator 구성

```text
HotelRevenueCalculator
TokenOfferingCalculator
DividendCalculator
FullSimulationCalculator
RiskEventApplier
RiskEventSimulationCalculator
```

## Java 구현 파일

상세 코드는 `backend/src/main/java/com/hotelsto/simulation/calculator/`를 확인합니다.
