# Risk Event Simulation

## 목적

호텔 운영 변수에 이벤트 영향을 적용하여 배당가능이익, 투자자 배당금, 수익률이 어떻게 변하는지 비교합니다.

## 이벤트 목록

| 이벤트 | 유형 | 영향 변수 | 영향값 |
|---|---|---|---:|
| 성수기 관광객 증가 | POSITIVE | occupancyRate | +0.15 |
| 지역 축제 개최 | POSITIVE | adr | +0.10 |
| 기상 악화 | NEGATIVE | occupancyRate | -0.25 |
| OTA 수수료 인상 | NEGATIVE | operatingCostRate | +0.05 |
| 리모델링 공사 | NEGATIVE | roomCount | -0.20 |

## 처리 흐름

```text
기본 변수
→ 리스크 이벤트 적용
→ 조정된 변수 계산
→ 호텔 수익 재계산
→ 배당금 재계산
→ Before/After 비교
```
