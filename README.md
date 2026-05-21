# Hotel STO Lab

호텔 객실 운영 수익을 기반으로 토큰증권(STO) 투자 수익률, 배당 구조, 리스크 이벤트를 학습하는 금융교육형 시뮬레이션 프로젝트입니다.

> 본 프로젝트는 실제 증권 발행, 투자 청약, 매수/매도, 결제, 배당 지급 기능을 제공하지 않는 교육용 시뮬레이션입니다.

---

## Live Preview

GitHub Pages에서 정적 미리보기 화면을 확인할 수 있습니다.

- [Open Preview](https://code88morning-cmd.github.io/hotel-sto-simulator/preview.html)

## 1. Project Overview

**Hotel STO Lab**은 호텔 객실 운영 수익을 예시로 사용하여 STO 구조를 학습할 수 있도록 만든 금융교육형 시뮬레이션 프로젝트입니다.

사용자는 가상의 호텔 프로젝트를 선택하고, 객실 점유율, 평균 객실단가, 운영비율, 모의 투자금 등을 조정하면서 다음 내용을 학습할 수 있습니다.

- 호텔 객실 수익이 어떻게 계산되는지
- 배당가능이익이 어떻게 산정되는지
- 가상 STO 토큰 수량과 보유비율이 어떻게 계산되는지
- 보유비율에 따라 예상 배당금이 어떻게 달라지는지
- 리스크 이벤트가 수익률과 배당금에 어떤 영향을 주는지

---

## 2. Project Description

A hotel revenue-based STO simulation platform for learning tokenized securities, investment returns, dividend structures, and hospitality asset financing.

This project connects hotel operation data with a simulated tokenized securities structure.  
It is designed for education, portfolio demonstration, and financial service planning practice.

---

## 3. Why This Project?

STO, 조각투자, 투자계약증권, 배당 구조는 일반 사용자가 이해하기 어렵습니다.

특히 다음 개념은 단순 설명만으로는 직관적으로 이해하기 어렵습니다.

| Concept | Difficulty |
|---|---|
| STO | 코인과 증권형 토큰의 차이 |
| Fractional Investment | 자산 일부를 나누어 투자한다는 구조 |
| Distributable Profit | 매출 전체가 아니라 비용 차감 후 남는 금액이라는 점 |
| Dividend | 보유비율에 따라 배당금이 달라지는 구조 |
| Hotel Revenue | 점유율, ADR, 운영비가 수익에 미치는 영향 |
| Risk | 공실률, 비용 증가, 비수기 이벤트가 수익률에 미치는 영향 |

Hotel STO Lab은 이 복잡한 개념을 **호텔 객실 운영 수익**이라는 현실적인 예시로 단순화합니다.

---

## 4. Core Simulation Flow

```text
호텔 프로젝트 선택
→ 객실 수익 계산
→ 가상 STO 발행 조건 적용
→ 토큰 보유비율 계산
→ 배당가능이익 산정
→ 투자자 배당금 계산
→ 월 수익률 계산
→ 리스크 이벤트 적용
→ Before / After 결과 비교
```

---

## 5. Main Features

### 5.1 Hotel Project Selection

사용자는 가상의 호텔 프로젝트를 선택할 수 있습니다.

예시 호텔 프로젝트:

| Hotel Project | Description |
|---|---|
| 부산 해운대 비즈니스호텔 | 관광과 출장 수요가 혼합된 비즈니스 호텔 |
| 제주 리조트형 호텔 | 성수기와 비수기 편차가 큰 리조트형 호텔 |
| 서울 도심 부티크호텔 | ADR은 높지만 운영비 부담도 큰 도심형 호텔 |
| 부산 원도심 리노베이션 호텔 | 지역재생 콘셉트의 중소형 호텔 |

---

### 5.2 Hotel Revenue Simulation

호텔 수익은 객실 수, 영업일수, 객실 점유율, 평균 객실단가를 기준으로 계산합니다.

```text
Room Revenue = Room Count × Operating Days × Occupancy Rate × ADR
```

부대매출, 운영비, 예비비를 반영하여 배당가능이익을 계산합니다.

```text
Total Revenue = Room Revenue + Additional Revenue

Operating Profit = Total Revenue - Operating Cost

Distributable Profit = Operating Profit - Reserve Amount
```

---

### 5.3 Token Offering Simulation

본 프로젝트는 실제 STO 발행이 아니라 가상 발행 조건을 사용합니다.

```text
Total Token Supply = Total Offering Amount ÷ Token Price

User Token Quantity = Investment Amount ÷ Token Price

Ownership Ratio = User Token Quantity ÷ Total Token Supply
```

예시:

| Item | Value |
|---|---:|
| Total Offering Amount | 1,000,000,000원 |
| Token Price | 10,000원 |
| Total Token Supply | 100,000개 |
| Investment Amount | 1,000,000원 |
| User Token Quantity | 100개 |
| Ownership Ratio | 0.1% |

---

### 5.4 Dividend Simulation

배당금은 배당가능이익과 사용자 보유비율을 기준으로 계산합니다.

```text
Investor Dividend = Distributable Profit × Ownership Ratio
```

월 수익률은 다음과 같이 계산합니다.

```text
Monthly ROI = Investor Dividend ÷ Investment Amount × 100
```

---

### 5.5 Risk Event Simulation

호텔 운영에는 다양한 리스크 이벤트가 발생할 수 있습니다.

| Risk Event | Target Variable | Impact |
|---|---|---|
| 성수기 관광객 증가 | Occupancy Rate | 점유율 상승 |
| 지역 축제 개최 | ADR | 객실단가 상승 |
| 기상 악화 | Occupancy Rate | 점유율 하락 |
| OTA 수수료 인상 | Operating Cost Rate | 운영비율 상승 |
| 인건비 상승 | Operating Cost Rate | 운영비율 상승 |
| 리모델링 공사 | Room Count | 판매 가능 객실 수 감소 |

리스크 이벤트 적용 후에는 적용 전/후 결과를 비교합니다.

```text
Before
- Occupancy Rate
- ADR
- Operating Cost Rate
- Distributable Profit
- Investor Dividend
- Monthly ROI

After
- Adjusted Occupancy Rate
- Adjusted ADR
- Adjusted Operating Cost Rate
- Adjusted Distributable Profit
- Adjusted Investor Dividend
- Adjusted Monthly ROI
```

---

## 6. Development Stages

본 프로젝트는 호텔 객실 운영 수익 기반 STO 시뮬레이션을 단계별로 설계하고 구현하는 방식으로 진행합니다.

| Stage | Deliverable |
|---:|---|
| 1단계 | 프로젝트 개요, 시장·제도 조사, README 작성 |
| 2단계 | 호텔 수익 계산 로직 설계 |
| 3단계 | STO 토큰 발행 구조 시뮬레이션 설계 |
| 4단계 | DB ERD 작성 |
| 5단계 | API 명세 작성 |
| 6단계 | 프론트엔드 화면 설계 |
| 7단계 | 수익률·배당 계산 엔진 구현 |
| 8단계 | 대시보드 시각화 |
| 9단계 | 리스크 이벤트 시뮬레이션 추가 |
| 10단계 | GitHub Pages 또는 배포용 미리보기 제작 |

각 단계의 상세 산출물은 `docs/` 폴더에서 확인할 수 있습니다.

---

## 7. Tech Stack

| Area | Stack |
|---|---|
| Backend | Java, Spring Boot |
| Calculation | BigDecimal |
| Frontend | TypeScript, React |
| Chart | Recharts |
| Database | PostgreSQL |
| Mockup | HTML, CSS, JavaScript |
| Documentation | Markdown, DOCX |
| Data Format | JSON, CSV |

---

## 8. Folder Structure

```text
hotel-sto-lab/
├─ README.md
├─ project-tree.txt
├─ git-commit-messages.md
│
├─ docs/
│  ├─ 00-integrated-plan.md
│  ├─ 01-project-overview.md
│  ├─ 02-market-regulation-research.md
│  ├─ 03-hotel-revenue-model.md
│  ├─ 04-token-offering-simulation.md
│  ├─ 05-erd.md
│  ├─ 06-api-spec.md
│  ├─ 07-frontend-screen-design.md
│  ├─ 08-calculation-engine.md
│  ├─ 09-dashboard-visualization.md
│  ├─ 10-risk-event-simulation.md
│  └─ compliance-notice.md
│
├─ db/
│  ├─ schema.sql
│  └─ seed.sql
│
├─ data/
│  ├─ hotel-project-sample.csv
│  ├─ token-offering-sample.csv
│  ├─ risk-event-sample.csv
│  └─ monthly-operation-sample.csv
│
├─ backend/
│  ├─ README.md
│  ├─ build.gradle
│  ├─ settings.gradle
│  └─ src/main/java/com/hotelsto/simulation/
│
├─ frontend/
│  ├─ README.md
│  ├─ package.json
│  ├─ tsconfig.json
│  └─ src/
│
├─ preview/
│  └─ index.html
│
└─ deliverables/
   ├─ hotel_sto_lab_integrated_plan.md
   ├─ hotel_sto_lab_integrated_plan.docx
   └─ hotel_sto_lab_schema.sql
```

---

## 9. Database Design

본 프로젝트는 PostgreSQL을 기준으로 설계되었습니다.

주요 테이블은 다음과 같습니다.

| Table | Description |
|---|---|
| `hotel_project` | 호텔 프로젝트 기본 정보 |
| `token_offering` | 가상 STO 발행 조건 |
| `user_token_position` | 사용자 모의 투자 포지션 |
| `monthly_operation_result` | 월별 호텔 운영 결과 |
| `token_dividend_result` | 사용자별 배당 계산 결과 |
| `risk_event` | 리스크 이벤트 정의 |
| `simulation_history` | 시뮬레이션 실행 이력 |

DB 스키마는 다음 파일에서 확인할 수 있습니다.

```text
db/schema.sql
```

샘플 데이터는 다음 파일에 포함되어 있습니다.

```text
db/seed.sql
```

---

## 10. API Overview

1차 MVP에서 사용하는 주요 API는 다음과 같습니다.

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/hotels` | 호텔 프로젝트 목록 조회 |
| GET | `/api/hotels/{hotelId}` | 호텔 프로젝트 상세 조회 |
| GET | `/api/offerings` | 가상 STO 발행 조건 목록 조회 |
| GET | `/api/offerings/{offeringId}` | 가상 STO 발행 조건 상세 조회 |
| POST | `/api/simulations/hotel-revenue` | 호텔 수익 계산 |
| POST | `/api/simulations/token-offering` | 토큰 보유비율 계산 |
| POST | `/api/simulations/dividend` | 배당금 계산 |
| POST | `/api/simulations/full` | 통합 시뮬레이션 계산 |
| GET | `/api/risk-events` | 리스크 이벤트 목록 조회 |
| POST | `/api/simulations/risk-event` | 리스크 이벤트 적용 시뮬레이션 |

---

## 11. Example API Request

### Full Simulation Request

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

### Full Simulation Response

```json
{
  "revenue": {
    "roomRevenue": 179520000,
    "additionalRevenue": 21542400,
    "totalRevenue": 201062400,
    "operatingCost": 116616192,
    "operatingProfit": 84446208,
    "reserveAmount": 8444621,
    "distributableProfit": 76001587
  },
  "token": {
    "totalTokenSupply": 100000,
    "userTokenQuantity": 100,
    "ownershipRatio": 0.001,
    "ownershipRatioPercent": 0.1,
    "dividendRightRatio": 0.001
  },
  "dividend": {
    "investorDividend": 76002,
    "monthlyRoi": 7.60,
    "annualizedRoi": 91.20
  },
  "educationComment": "객실 운영성과로 계산된 배당가능이익이 사용자의 보유비율에 따라 배당금으로 환산되었습니다.",
  "complianceNotice": "본 결과는 교육용 시뮬레이션이며 실제 투자 수익 또는 배당 지급을 의미하지 않습니다."
}
```

---

## 12. How to Run

### 12.1 Preview Only

GitHub Pages 미리보기 링크에서 정적 HTML 목업을 확인할 수 있습니다.

- [Open Preview](https://code88morning-cmd.github.io/hotel-sto-simulator/preview.html)

로컬에서 확인하려면 다음 파일을 브라우저에서 열면 됩니다.

```text
preview/index.html
```

---

### 12.2 Database Setup

PostgreSQL 데이터베이스를 생성합니다.

```bash
createdb hotel_sto_lab
```

스키마를 실행합니다.

```bash
psql -U postgres -d hotel_sto_lab -f db/schema.sql
```

샘플 데이터를 삽입합니다.

```bash
psql -U postgres -d hotel_sto_lab -f db/seed.sql
```

---

### 12.3 Backend

백엔드 폴더로 이동합니다.

```bash
cd backend
```

Spring Boot 서버를 실행합니다.

```bash
./gradlew bootRun
```

Windows 환경에서는 다음 명령을 사용할 수 있습니다.

```bash
gradlew.bat bootRun
```

---

### 12.4 Frontend

프론트엔드 폴더로 이동합니다.

```bash
cd frontend
```

패키지를 설치합니다.

```bash
npm install
```

개발 서버를 실행합니다.

```bash
npm run dev
```

---

## 13. MVP Scope

### Included

```text
- 호텔 프로젝트 목록
- 호텔 수익 계산
- 가상 STO 발행 조건
- 토큰 보유비율 계산
- 배당가능이익 계산
- 투자자 배당금 계산
- 월 수익률 계산
- 리스크 이벤트 적용
- 대시보드 시각화
- 교육용 고지 문구
```

### Excluded

```text
- 실제 증권 발행
- 실제 토큰 발행
- 실제 투자 청약
- 실제 결제
- 실제 매수/매도
- 실제 배당 지급
- 지갑 연동
- 블록체인 메인넷 연동
- 증권사 API 연동
```

---

## 14. Compliance Notice

본 서비스는 STO와 호텔 수익구조를 학습하기 위한 교육용 시뮬레이션입니다.

본 프로젝트는 다음 기능을 제공하지 않습니다.

```text
- 실제 투자상품 청약
- 실제 증권 발행
- 실제 토큰 발행
- 실제 매수/매도
- 실제 결제
- 실제 배당 지급
- 실제 투자 권유
```

화면에 표시되는 토큰 수량, 보유비율, 수익률, 배당금은 가상의 조건에 따른 계산 결과입니다.

---

## 15. Documentation

상세 설계 문서는 `docs/` 폴더에서 확인할 수 있습니다.

| Document | Description |
|---|---|
| `00-integrated-plan.md` | 전체 통합 기획서 |
| `01-project-overview.md` | 프로젝트 개요 |
| `02-market-regulation-research.md` | 시장·제도 조사 |
| `03-hotel-revenue-model.md` | 호텔 수익 계산 로직 |
| `04-token-offering-simulation.md` | STO 토큰 발행 구조 시뮬레이션 |
| `05-erd.md` | DB ERD |
| `06-api-spec.md` | API 명세 |
| `07-frontend-screen-design.md` | 프론트엔드 화면 설계 |
| `08-calculation-engine.md` | 수익률·배당 계산 엔진 |
| `09-dashboard-visualization.md` | 대시보드 시각화 |
| `10-risk-event-simulation.md` | 리스크 이벤트 시뮬레이션 |
| `compliance-notice.md` | 교육용 고지 문구 |

---

## 16. Portfolio Point

이 프로젝트는 다음 역량을 보여주기 위한 포트폴리오입니다.

| Area | Demonstrated Capability |
|---|---|
| Financial Domain | STO, 배당 구조, 투자 수익률 개념 이해 |
| Backend | Java/Spring Boot 기반 계산 엔진 설계 |
| Data Modeling | PostgreSQL 기반 ERD 및 스키마 설계 |
| Frontend | React 기반 대시보드 화면 설계 |
| Simulation | 수익률, 배당, 리스크 이벤트 계산 구조 |
| Documentation | 기획서, API 명세, DB 설계, README 작성 |
| Compliance Awareness | 실제 투자 기능과 교육용 시뮬레이션의 구분 |

---

## 17. Git Commit Message Example

```bash
git add README.md
git commit -m "docs: improve README with development stages"
```

---

## 18. License

This project is for educational and portfolio purposes.

Actual securities issuance, investment solicitation, payment, trading, and dividend services are not included.