export function formatCurrency(value: number): string {
  return new Intl.NumberFormat('ko-KR').format(Math.round(value)) + '원';
}

export function formatShortCurrency(value: number): string {
  if (value >= 100000000) return `${(value / 100000000).toFixed(2).replace(/\.00$/, '')}억 원`;
  if (value >= 10000) return `${new Intl.NumberFormat('ko-KR').format(Math.round(value / 10000))}만 원`;
  return formatCurrency(value);
}

export function formatPercent(value: number, digits = 2): string {
  return `${value.toFixed(digits)}%`;
}

export function formatToken(value: number): string {
  return `${new Intl.NumberFormat('ko-KR').format(Math.round(value))}개`;
}
