import React from 'react';

export default function GroupSummary({data, onClick}) {

    return (
        <React.Fragment>
        <h1>Things to do</h1>
        {Object.keys(data).map(group => {
          return (
            <div className="todo" key={group} onClick={event => onClick(group.name)}>
              <div className="icon"><img src="/group.svg" alt="task group" /></div>
              <div className="summary">
                <div className="title">{group}</div>
                <div className="details">{data[group].completed} of {data[group].count} complete</div>
              </div>
            </div>
          )
        })}
      </React.Fragment>
    )
}
