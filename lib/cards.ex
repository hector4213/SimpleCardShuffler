defmodule Cards do
  @moduledoc """

    Learn about frequently used Modules such as Enum and List, Comprehensions.
    Pattern matching is elixir's replacement for variable assignment.
    Pattern matching is used anytime that we use the '=' sign and not just returing something
    from an expression.
  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do 
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
  {status, binary} = File.read(filename)
  :erlang.binary_to_term(binary)
  end
end
