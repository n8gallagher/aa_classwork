import React from 'react';
import Clock from './clock';
import Tabs from './tabs';

class Root extends React.Component {
    constructor(props){
        super(props);
        this.state = {

        }
    };
    render (){

    
        return (
            <div>
               {<Clock />}
               {<Tabs />}
            </div>
        );
    }
}

export default Root;