defmodule Teamwork.Article do
    use Teamwork.Web, :model

    schema "articles" do
        field :title, :string
        field :content, :string
        field :image, :string
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:title, :content, :image])
        |> validate_required([:title, :content, :image])
    end
end