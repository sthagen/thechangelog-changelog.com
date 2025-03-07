defmodule ChangelogWeb.Admin.FeedView do
  use ChangelogWeb, :admin_view

  alias ChangelogWeb.{Admin, Home, PodcastView}

  def cover_options(pods), do: Home.FeedView.cover_options(pods)
end
