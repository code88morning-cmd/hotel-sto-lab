export type RiskEventType = 'POSITIVE' | 'NEGATIVE' | 'NEUTRAL';
export type ImpactType = 'ADD_RATE' | 'MULTIPLY_AMOUNT' | 'MULTIPLY_COUNT' | 'SET_VALUE';

export type RiskEvent = {
  eventId: string;
  eventName: string;
  eventType: RiskEventType;
  targetVariable: string;
  impactType: ImpactType;
  impactValue: number;
  description: string;
  educationComment: string;
};

export type RiskEventSimulationSnapshot = {
  occupancyRate: number;
  adr: number;
  operatingCostRate: number;
  distributableProfit: number;
  investorDividend: number;
  monthlyRoi: number;
};

export type RiskEventSimulationResult = {
  riskEvent: RiskEvent;
  before: RiskEventSimulationSnapshot;
  after: RiskEventSimulationSnapshot;
  difference: {
    distributableProfitChange: number;
    investorDividendChange: number;
    monthlyRoiChange: number;
  };
  educationComment: string;
  complianceNotice: string;
};
