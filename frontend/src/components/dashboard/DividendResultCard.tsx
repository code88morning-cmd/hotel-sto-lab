import { FullSimulationResult } from '../../types/dashboard';
import { formatCurrency, formatPercent, formatShortCurrency } from '../../utils/formatters';

type Props = { result: FullSimulationResult };

export default function DividendResultCard({ result }: Props) {
  return (
    <section className="rounded-3xl bg-slate-900 p-6 text-white shadow-lg">
      <h3 className="text-xl font-black">이번 달 배당 시뮬레이션 결과</h3>
      <div className="mt-6 grid grid-cols-1 gap-3 md:grid-cols-2">
        <div className="rounded-2xl bg-white/10 p-4">배당가능이익: {formatShortCurrency(result.revenue.distributableProfit)}</div>
        <div className="rounded-2xl bg-white/10 p-4">내 보유비율: {formatPercent(result.token.ownershipRatioPercent, 3)}</div>
        <div className="rounded-2xl bg-white/10 p-4">내 예상 배당금: {formatCurrency(result.dividend.investorDividend)}</div>
        <div className="rounded-2xl bg-white/10 p-4">월 수익률: {formatPercent(result.dividend.monthlyRoi)}</div>
      </div>
      <p className="mt-5 text-sm text-slate-300">{result.educationComment}</p>
    </section>
  );
}
