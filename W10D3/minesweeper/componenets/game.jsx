import React from 'react';
import Board from './board';
import * as something from '../minesweeper.js';
export default class Game extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            board: new something.Board(6, 3)
        }
        this.updateGame = this.updateGame.bind(this);
        this.restartGame = this.restartGame.bind(this);
    }

    updateGame(tile, bool){
        console.log(bool)
        if (bool){
            tile.toggleFlag();
        } else {
            tile.explore();
        }

        this.setState({board: this.state.board});
    }

    restartGame() {
        this.setState({board: new something.Board(6, 5)})
    }

    render(){
        let moop = "";
        if (this.state.board.lost()){
            moop = 'You Lose';
        } else if (this.state.board.won()) {
            moop = 'You Win!';
        }
        return (
            <div>
                <p>{moop}</p>
                <Board board={this.state.board} updateGame={this.updateGame}/>
                <button onClick={this.restartGame}>Restart Game</button>
            </div>
        );
    }
}