import { RiskEventSimulationResult } from '../../types/risk-event';
import { formatCurrency, formatPercent } from '../../utils/formatters';

type Props = { result: RiskEventSimulationResult };

export default function RiskEventComparisonCard({ result }: Props) {
  return (
    <section className="rounded-3xl border bg-white/80 p-6 shadow-sm">
      <h3 className="text-xl font-black text-slate-900">{result.riskEvent.eventName} 이벤트 적용 결과</h3>
      <div className="mt-6 grid grid-cols-1 gap-4 md:grid-cols-3">
        <div className="rounded-2xl bg-slate-50 p-4">적용 전<br />배당금: {formatCurrency(result.before.investorDividend)}<br />수익률: {formatPercent(result.before.monthlyRoi)}</div>
        <div className="rounded-2xl bg-slate-900 p-4 text-white">적용 후<br />배당금: {formatCurrency(result.after.investorDividend)}<br />수익률: {formatPercent(result.after.monthlyRoi)}</div>
        <div className="rounded-2xl bg-amber-50 p-4">변화<br />배당금: {formatCurrency(result.difference.investorDividendChange)}<br />수익률: {formatPercent(result.difference.monthlyRoiChange)}p</div>
      </div>
      <p className="mt-5 text-sm text-slate-600">{result.educationComment}</p>
    </section>
  );
}
