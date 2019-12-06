defmodule Teamwork.Repo.Migrations.CreateArticle1 do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :content, :string
      add :image, :string
    end
  end
end
