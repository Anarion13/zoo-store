# Tic Tac Toe

A standalone React + Vite tic-tac-toe game. Independent of the zoo-store app.

## Run

```bash
cd tic-tac-toe
npm install
npm run dev
```

Opens on http://localhost:5174

## Build

```bash
npm run build     # output in dist/
npm run preview
```

## Features

- Two-player X / O on a 3×3 board
- Win and draw detection, with the winning line highlighted
- Move history / time travel — jump to any earlier position
- New game reset
- Keyboard accessible squares with per-cell aria labels

## Structure

| File | Purpose |
| --- | --- |
| `src/Game.jsx` | State: move history, current move, status text |
| `src/Board.jsx` | Renders the 3×3 grid |
| `src/Square.jsx` | Single cell button |
| `src/calculateWinner.js` | Winner + winning line detection |
| `src/styles.css` | Styling |
