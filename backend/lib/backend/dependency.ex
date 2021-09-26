defmodule Backend.Dependency do
    use Ecto.Schema

    # alias Backend.Todo

schema "dependencies" do
    field :todo_id, :id
    field :dependency_id, :id

    # field :depends_on, :integer

    # belongs_to :todo, Todo
    # belongs_to :dependency, Todo
end

def changeset(struct, params \\ %{}) do
    struct
    |> Ecto.Changeset.cast(params, [:todo_id, :dependency_id])
    |> Ecto.Changeset.unique_constraint(
        [:todo_id, :dependency_id],
        name: :dependencies_todo_id_dependency_id_index
    )
    |> Ecto.Changeset.unique_constraint(
        [:dependency_id, :todo_id],
        name: :dependencies_dependency_id_todo_id_index
    )
end

end