import { Bar, BarChart, CartesianGrid, ResponsiveContainer, Tooltip, XAxis, YAxis } from 'recharts';
import { MonthlyDividendData } from '../../types/dashboard';
import { formatCurrency } from '../../utils/formatters';

type Props = { data: MonthlyDividendData[] };

export default function MonthlyDividendChart({ data }: Props) {
  return (
    <section className="rounded-3xl border bg-white/80 p-6 shadow-sm">
      <h3 className="text-xl font-black text-slate-900">월별 배당 시뮬레이션</h3>
      <div className="mt-6 h-72">
        <ResponsiveContainer width="100%" height="100%">
          <BarChart data={data}>
            <CartesianGrid strokeDasharray="3 3" vertical={false} />
            <XAxis dataKey="month" />
            <YAxis tickFormatter={(value) => `${Math.round(Number(value) / 10000)}만`} />
            <Tooltip formatter={(value) => [formatCurrency(Number(value)), '예상 배당금']} />
            <Bar dataKey="investorDividend" name="예상 배당금" radius={[10, 10, 0, 0]} />
          </BarChart>
        </ResponsiveContainer>
      </div>
    </section>
  );
}
