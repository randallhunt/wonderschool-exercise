export function getSummary(data) {
    if (!data || !data.allTodos) return {}

    let groups = {}
    for (let todo of data.allTodos) {
        if (!(todo.group in groups)) {
            groups[todo.group] = {
                completed: todo.completedAt || 0,
                count: 1,
                name: todo.group
            }
        } else {
            groups[todo.group].completed += (todo.completedAt || 0)
            groups[todo.group].count += 1
        }
        // console.log(todo)
    }
    return groups;
}

export function getGroup(group) {
    let todos = {};
    console.log(group)
    for (let todo in group) {
        console.log(todo)
    }
    return todos
}
