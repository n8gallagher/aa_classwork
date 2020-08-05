import React from 'react';
// import * as something from '../minesweeper.js';

export default class Tile extends React.Component{
    constructor(props){
        super(props);
        // this.state = {
        //     tile: this.props.tile
        // }

        this.handleClick = this.handleClick.bind(this);

        // this.isFlagged = this.props.tile.flagged;
        // this.isBombed = this.props.tile.bombed;
        // this.isExplored = this.props.tile.explored;
    }

    handleClick(event) {
        this.props.update(this.props.tile, event.altKey);
    }

    render () {
        let schmoop = "";
        let klass = '';
        if (this.props.tile.flagged){
            schmoop = '🚩';
            klass = 'flagged';
        } else if (this.props.tile.explored){
            klass = 'explored';
            if (this.props.tile.bombed){
                schmoop = '💣';
                klass = 'bombed';
            } else {
                schmoop = `${this.props.tile.adjacentBombCount()}`
            }
        }

        return(
            <div onClick={this.handleClick} className={`tile ${klass}`}>{schmoop}</div>
            
        );
    }

}