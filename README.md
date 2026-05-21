# Hotel STO Lab

호텔 객실 운영 수익을 기반으로 토큰증권(STO) 투자 수익률과 배당 구조를 학습하는 금융교육형 시뮬레이션 프로젝트입니다.

> 본 프로젝트는 실제 증권 발행, 투자 청약, 매수/매도, 결제, 배당 지급 기능을 제공하지 않는 교육용 시뮬레이션입니다.

## Project Description

A hotel revenue-based STO simulation platform for learning tokenized securities, investment returns, and hospitality asset financing.

## Core Flow

```text
호텔 프로젝트 선택
→ 객실 수익 계산
→ 가상 STO 발행 조건 적용
→ 토큰 보유비율 계산
→ 배당가능이익 산정
→ 투자자 배당금 계산
→ 월 수익률/리스크 이벤트 시각화
```

## Tech Stack

| Area | Stack |
|---|---|
| Backend | Java, Spring Boot, BigDecimal |
| Frontend | TypeScript, React, Recharts |
| Database | PostgreSQL |
| Mockup | HTML, CSS, JavaScript |
| Docs | Markdown, DOCX |

## Folder Structure

```text
hotel-sto-lab/
├─ README.md
├─ docs/
├─ db/
├─ data/
├─ backend/
├─ frontend/
├─ preview/
└─ deliverables/
```

## Run Order

1. `docs/`에서 기획 및 설계 문서를 확인합니다.
2. PostgreSQL에서 `db/schema.sql`, `db/seed.sql`을 실행합니다.
3. `backend/`에서 Spring Boot API를 실행합니다.
4. `frontend/`에서 React 대시보드를 실행합니다.
5. `preview/index.html`은 정적 HTML 목업입니다.

## Compliance Notice

본 서비스는 STO와 호텔 수익구조를 학습하기 위한 교육용 시뮬레이션입니다. 실제 투자상품의 청약, 매수, 매도, 배당 지급, 투자 권유 기능을 제공하지 않습니다. 표시되는 토큰 수량, 보유비율, 수익률, 배당금은 가상의 조건에 따른 계산 결과입니다.
# hotel-sto-simulator
