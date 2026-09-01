import Square from './Square.jsx';

export default function Board({ squares, winningLine, onPlay }) {
  return (
    <div className="board" role="grid" aria-label="Tic tac toe board">
      {squares.map((value, i) => (
        <Square
          key={i}
          value={value}
          index={i}
          highlight={winningLine?.includes(i) ?? false}
          onClick={() => onPlay(i)}
        />
      ))}
    </div>
  );
}
