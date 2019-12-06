defmodule Teamwork.ArticleController do
    use Teamwork.Web, :controller

    alias Teamwork.Article
  
    def index(conn, _params) do
      articles = Repo.all(Article)

      render conn, "index.html", articles: articles
    end

    def new(conn, params) do
      changeset = Article.changeset(%Article{}, %{})

      render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"article" => article}) do
      changeset = Article.changeset(%Article{}, article)

      case Repo.insert(changeset) do
        {:ok, _article} -> 
          conn
            |> put_flash(:info, "Article Created")
            |> redirect(to: article_path(conn, :index))

        {:error, changeset} -> 
          render conn, "new.html", changeset: changeset
      end
    end
  end
  