import React from 'react';
import Tile from './tile'

export default class Board extends React.Component{
    constructor(props){
        super(props);
    }

    render() {
        const grid = this.props.board.grid;
        return (
            <div className='grid'>
                {grid.map((row, i) => {
                    return (
                        row.map((tile, j) => {
                            return (
                            <div>
                                <Tile tile={tile} update={this.props.updateGame} key={[i, j]}/>
                            </div>
                            );
                        })
                    );
                })}
            </div>
        );
    }
}