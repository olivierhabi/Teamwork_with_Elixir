defmodule Teamwork.ArticleController do
    use Teamwork.Web, :controller

    alias Teamwork.Article
  
    def index(conn, _params) do
      articles = Repo.all(Article)

      render conn, "index.html", articles: articles
    end

    def new(conn, _params) do
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

    def edit(conn, %{"id" => article_id}) do
      article = Repo.get(Article, article_id)
      changeset = Article.changeset(article)

      render conn, "edit.html", changeset: changeset, article: article
    end

    def update(conn, %{"id" => article_id, "article" => article}) do
      old_article = Repo.get(Article, article_id)
      changeset = Article.changeset(old_article, article)

      case Repo.update(changeset) do
        {:ok, _topic} ->
          conn
          |> put_flash(:info, "Article Updated")
          |> redirect(to: article_path(conn, :index))
        {:error, changeset} ->
          render conn, "edit.html", changeset: changeset, topic: old_article
      end
    end
  end
  