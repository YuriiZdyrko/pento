defmodule Pento.FAQ.Question do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "questions" do
    field :answer, :string
    field :question, :string
    field :vote_count, :integer

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question, :answer, :vote_count])
    |> validate_required([:question, :answer, :vote_count])
  end

  def upvote_query(question) do
    from q in Pento.FAQ.Question,
      where: q.id == ^question.id,
      update: [inc: [vote_count: 1]]
  end
end
