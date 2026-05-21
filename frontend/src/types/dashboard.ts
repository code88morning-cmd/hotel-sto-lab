export type RevenueResult = {
  roomRevenue: number;
  additionalRevenue: number;
  totalRevenue: number;
  operatingCost: number;
  operatingProfit: number;
  reserveAmount: number;
  distributableProfit: number;
};

export type TokenResult = {
  totalTokenSupply: number;
  userTokenQuantity: number;
  ownershipRatio: number;
  ownershipRatioPercent: number;
  dividendRightRatio: number;
};

export type DividendResult = {
  investorDividend: number;
  monthlyRoi: number;
  annualizedRoi: number;
};

export type FullSimulationResult = {
  revenue: RevenueResult;
  token: TokenResult;
  dividend: DividendResult;
  educationComment: string;
  complianceNotice: string;
};

export type MonthlyDividendData = {
  month: string;
  occupancyRate: number;
  adr: number;
  distributableProfit: number;
  investorDividend: number;
  monthlyRoi: number;
};
