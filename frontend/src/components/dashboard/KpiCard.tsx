type KpiCardProps = {
  title: string;
  value: string;
  description: string;
};

export default function KpiCard({ title, value, description }: KpiCardProps) {
  return (
    <article className="rounded-2xl border bg-white/80 p-5 shadow-sm">
      <p className="text-xs font-bold uppercase tracking-wide text-slate-500">{title}</p>
      <strong className="mt-3 block text-3xl font-black text-slate-900">{value}</strong>
      <p className="mt-2 text-sm leading-6 text-slate-500">{description}</p>
    </article>
  );
}
