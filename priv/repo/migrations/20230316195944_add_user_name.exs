defmodule Pento.Repo.Migrations.AddUserName do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :username, :string, unique: true
    end
  end
end
