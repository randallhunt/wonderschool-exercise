import React, {useState} from 'react'
import { gql, useQuery} from '@apollo/client'
import GroupSummary from './GroupSummary'
import GroupDetails from './GroupDetails'
import { getSummary, getGroup } from './helpers'

const query = gql`
query {
  allTodos {
    id
    group
    task
    dependencies {
      id
    }
    completedAt
  }
}
`

const App = () => {
  const [group, setGroup] = useState(null)
  const {data} = useQuery(query)
  
  const summary = getSummary(data)
  const details = group ? getGroup(group) : null;

  // const count = (data && data.allTodos) ? data.allTodos.length : 0

  return (
    group ?
    // <React.Fragment>{group}</React.Fragment>
    <GroupDetails
      data={details}
      onChecked={() => {}}
      onUnchecked={() => {}}
      onBackClick={setGroup(null)}
    />
    :
    <GroupSummary data={summary} onClick={(g) => {console.log('go');setGroup(g) }} />
  )
}

export default App
