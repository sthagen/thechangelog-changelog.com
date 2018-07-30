defmodule Changelog.NewsIssuePolicy do
  use Changelog.DefaultPolicy

  def create(actor), do: is_admin(actor)
  def index(actor), do: is_admin(actor)
  def schedule(actor), do: is_admin(actor)
  def show(actor, _), do: is_admin(actor)
  def update(actor, _), do: is_admin(actor)
  def publish(actor, _), do: is_admin(actor)
  def unpublish(actor, _), do: is_admin(actor)
  def delete(actor, _), do: is_admin(actor)
end