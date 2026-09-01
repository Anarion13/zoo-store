import { useState } from 'react';
import Board from './Board.jsx';
import { calculateWinner } from './calculateWinner.js';

export default function Game() {
  const [history, setHistory] = useState([Array(9).fill(null)]);
  const [currentMove, setCurrentMove] = useState(0);

  const squares = history[currentMove];
  const xIsNext = currentMove % 2 === 0;
  const { winner, line } = calculateWinner(squares);
  const isDraw = !winner && squares.every(Boolean);

  function handlePlay(index) {
    if (squares[index] || winner) return;

    const next = squares.slice();
    next[index] = xIsNext ? 'X' : 'O';

    // Drop any "future" moves when playing after a time-travel jump.
    const nextHistory = [...history.slice(0, currentMove + 1), next];
    setHistory(nextHistory);
    setCurrentMove(nextHistory.length - 1);
  }

  function resetGame() {
    setHistory([Array(9).fill(null)]);
    setCurrentMove(0);
  }

  let status;
  if (winner) {
    status = `Winner: ${winner}`;
  } else if (isDraw) {
    status = "It's a draw";
  } else {
    status = `Next player: ${xIsNext ? 'X' : 'O'}`;
  }

  return (
    <div className="game">
      <h1 className="title">Tic Tac Toe</h1>

      <div className={`status ${winner ? 'status--win' : ''}`}>{status}</div>

      <Board squares={squares} winningLine={line} onPlay={handlePlay} />

      <button className="reset" onClick={resetGame}>
        New game
      </button>

      <ol className="history">
        {history.map((_, move) => (
          <li key={move}>
            <button
              className={move === currentMove ? 'move move--active' : 'move'}
              onClick={() => setCurrentMove(move)}
            >
              {move === 0 ? 'Go to game start' : `Go to move #${move}`}
            </button>
          </li>
        ))}
      </ol>
    </div>
  );
}
