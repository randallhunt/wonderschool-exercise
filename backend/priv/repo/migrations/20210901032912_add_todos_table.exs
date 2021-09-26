defmodule Backend.Repo.Migrations.AddTodosTable do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :group, :string
      add :task, :string
      # add :dependencies, references(:todos)
      add :completed_at, :string, null: true
    end

    create table(:dependencies) do
        add :todo_id, references(:todos, on_delete: :nothing), primary_key: true
        add :dependency_id, references(:todos, on_delete: :nothing), primary_key: true
    end
  end
end
