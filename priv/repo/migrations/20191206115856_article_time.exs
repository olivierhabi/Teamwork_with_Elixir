defmodule Teamwork.Repo.Migrations.ArticleTime do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      timestamps()
    end
  end
end
