defmodule Teamwork.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :content, :string
      add :image, :string
      

      timestamps()
    end
  end
end
