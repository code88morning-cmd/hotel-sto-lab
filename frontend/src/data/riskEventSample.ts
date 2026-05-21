import { RiskEvent } from '../types/risk-event';

export const riskEventSample: RiskEvent[] = [
  { eventId: 'RISK-001', eventName: '성수기 관광객 증가', eventType: 'POSITIVE', targetVariable: 'occupancyRate', impactType: 'ADD_RATE', impactValue: 0.15, description: '성수기 수요 증가로 객실 점유율이 상승합니다.', educationComment: '점유율 상승은 객실매출 증가로 이어질 수 있습니다.' },
  { eventId: 'RISK-004', eventName: '기상 악화', eventType: 'NEGATIVE', targetVariable: 'occupancyRate', impactType: 'ADD_RATE', impactValue: -0.25, description: '기상 악화로 관광 수요가 감소하고 객실 점유율이 하락합니다.', educationComment: '점유율 하락은 배당가능이익 감소로 이어질 수 있습니다.' }
];
