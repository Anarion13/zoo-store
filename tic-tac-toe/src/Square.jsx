export default function Square({ value, index, highlight, onClick }) {
  const row = Math.floor(index / 3) + 1;
  const col = (index % 3) + 1;

  return (
    <button
      className={`square ${highlight ? 'square--win' : ''} ${value ? `square--${value.toLowerCase()}` : ''}`}
      onClick={onClick}
      disabled={Boolean(value)}
      aria-label={`Row ${row}, column ${col}${value ? `, ${value}` : ', empty'}`}
    >
      {value}
    </button>
  );
}
