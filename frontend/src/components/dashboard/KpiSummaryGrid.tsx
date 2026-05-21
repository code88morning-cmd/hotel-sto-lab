import KpiCard from './KpiCard';
import { FullSimulationResult } from '../../types/dashboard';
import { formatCurrency, formatPercent, formatShortCurrency } from '../../utils/formatters';

type Props = { result: FullSimulationResult };

export default function KpiSummaryGrid({ result }: Props) {
  return (
    <section className="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-4">
      <KpiCard title="Monthly Room Revenue" value={formatShortCurrency(result.revenue.roomRevenue)} description="객실 수 × 영업일수 × 점유율 × ADR" />
      <KpiCard title="Distributable Profit" value={formatShortCurrency(result.revenue.distributableProfit)} description="운영비와 예비비 차감 후 금액" />
      <KpiCard title="My Dividend" value={formatCurrency(result.dividend.investorDividend)} description="보유비율 기준 예상 배당금" />
      <KpiCard title="Monthly ROI" value={formatPercent(result.dividend.monthlyRoi)} description="월 배당금 ÷ 모의 투자금" />
    </section>
  );
}
