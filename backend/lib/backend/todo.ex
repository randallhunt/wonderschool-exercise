defmodule Backend.Todo do
    use Ecto.Schema
    import Ecto.Changeset
    import Ecto.Query

    alias Backend.{Repo, Todo, Dependency}

schema "todos" do
    field :group, :string
    field :task, :string
    field :completed_at, :string

    many_to_many :dependencies,
                 Todo,
                 join_through: Dependency,
                 join_keys: [todo_id: :id, dependency_id: :id]

    many_to_many :reverse_dependencies,
                 Todo,
                 join_through: Dependency,
                 join_keys: [dependency_id: :id, todo_id: :id]

    # many_to_many :dependencies, Todo, join_through: "dependencies"

    # has_many :_dependencies, Dependency
    # has_many :dependencies, through: [:_dependencies, :dependency], on_replace: :delete

    # has_many :dependencies, Dependency
    # belongs_to :dependencies, Dependency, foreign_key: :depends_on
end

def all do
    preloads = [:dependencies, :reverse_dependencies]
    {:ok, Repo.all(from p in __MODULE__, order_by: [desc: p.id]), preload: preloads}
end

def find(id) do
    Repo.get(__MODULE__, id)
    |> Repo.preload(:dependencies)
end

def create!(attrs) do
    case create(attrs) do
        {:ok, todo}      -> todo
        {:error, reason} -> raise reason
    end
end

def create(attrs) do
    attrs
    |> changeset(attrs)
    |> Repo.insert
end

def update(%Todo{} = todo, attrs \\ %{}) do
    todo
    |> Repo.preload(:dependencies)
    |> Todo.changeset(attrs)
    |> Repo.update()
end

def changeset(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
end

def changeset(todo, attrs) do
    todo
    |> cast(attrs, [], [:group, :task, :completed_at])
    |> put_assoc(:dependencies, attrs[:dependencies])
    |> validate_required([:group, :task])
    # |> foreign_key_constraint(:dependencies)
end

end