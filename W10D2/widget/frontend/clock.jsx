import React from 'react';

export default class Clock extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            time: new Date()
        };
        this.tick = this.tick.bind(this);
    }

    componentDidMount() {
        this.intervalId = setInterval(() => {
          this.tick();
          console.log('tick');
        }, 1000);
      }

    componentWillUnmount() {
    clearInterval(this.intervalId);
    }

    tick() {
    this.setState({time: new Date()});
    }

    render () {
        let hours = this.state.time.getHours();
        let minutes = this.state.time.getMinutes();
        let seconds = this.state.time.getSeconds();
        hours = (hours < 10) ? `0${hours}` : hours;
        minutes = (minutes < 10) ? `0${minutes}` : minutes;
        seconds = (seconds < 10) ? `0${seconds}` : seconds;

        return(
            <div className='clock'>
                <div id='clockbox'>
                    <h3>Mega-Cool Green Clock</h3>
                    <h4>{hours}:{minutes}:{seconds}</h4>
                </div>
                <div id='datebox'>
                    <p class='date'>Date: {this.state.time.toDateString()}</p>
                </div>
            </div>
            
        );
    }
};

