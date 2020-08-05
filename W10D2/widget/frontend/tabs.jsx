import React from 'react';

export default class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = {

        }
    }

    render () {
        let tabs = [
            {title: 'ice cream', content: "Rocky Road ice cream has peanut butter and jelly instead of marshmallows."},
            {title: 'shmeckels', content: "My name is Slip-Slippery Stair. I'll take ya down there for 25 shmeckels!"},
            {title: 'dogs', content: 'Snuffles was my slave name. You can call me Snowball, because my fur is pretty and white.'}
        ];

        return (
            <div id='tabs'>Tabs div, dawg</div>
        );
    }
}