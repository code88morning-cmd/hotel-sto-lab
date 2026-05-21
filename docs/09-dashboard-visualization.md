# Dashboard Visualization

## 목적

계산 결과를 사용자가 즉시 해석할 수 있게 KPI, 차트, 흐름 카드로 표시합니다.

## 시각화 컴포넌트

| 컴포넌트 | 설명 |
|---|---|
| `KpiCard` | 핵심 수치 표시 |
| `KpiSummaryGrid` | KPI 4개 배치 |
| `HotelRevenueFlow` | 매출→배당가능이익 흐름 |
| `TokenPositionSummary` | 토큰 보유비율 표시 |
| `DividendResultCard` | 배당금·수익률 표시 |
| `MonthlyDividendChart` | 월별 배당 막대 차트 |
| `RiskEventCard` | 리스크 이벤트 표시 |

## 1차 MVP 차트

- X축: 월
- Y축: 예상 배당금
- Tooltip: 점유율, ADR, 배당가능이익, 배당금
