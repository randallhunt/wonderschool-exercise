# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Backend.Repo.insert!(%Backend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Backend.Todo

bank = Todo.create!(
    %{group: "Purchases", task: "Go to the bank", dependencies: [], completed_at: nil}
)
hammer = Todo.create!(
    %{group: "Purchases", task: "Buy hammer", dependencies: [], completed_at: nil}
)
Todo.update hammer, %{dependencies: [bank]}
wood = Todo.create!(
    %{group: "Purchases", task: "Buy wood", dependencies: [bank], completed_at: nil}
)
Todo.update wood, %{dependencies: [bank]}
nails = Todo.create!(
    %{group: "Purchases", task: "Buy nails", dependencies: [bank], created_at: nil}
)
paint = Todo.create!(
    %{group: "Purchases", task: "Buy paint", dependencies: [bank], created_at: nil}
)
fasten = Todo.create!(
    %{group: "Build Airplane", task: "Hammer nails into wood", dependencies: [hammer, wood, nails], created_at: nil}
)
wings = Todo.create!(
    %{group: "Build Airplane", task: "Paint wings", dependencies: [paint, fasten], created_at: nil}
)
snack = Todo.create!(
    %{group: "Build Airplane", task: "Have a snack", dependencies: [], created_at: nil}
)
