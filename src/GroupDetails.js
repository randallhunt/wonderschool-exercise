import React from 'react'

export default function GroupDetails({group, onChecked, onUnchecked, onBackClick}) {

    return (
        <React.Fragment>
        <h1>{group.name}</h1>
        {Object.keys(group).map(todo => {
          return (
            <div className="todo">
              <div className="icon"><img src={todo.completed ? 'completed.svg' : 'incomplete.svg'} alt="task status" /></div>
              <div className="title">{todo.name}</div>
              <div className="summary">{todo.complete} of {group.total} complete</div>
            </div>
          )
        })}
      </React.Fragment>
    )
}
