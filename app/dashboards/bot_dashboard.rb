require "administrate/base_dashboard"

class BotDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::Text,
    url: Field::Text,
    article_id: Field::Number,
    date: Field::DateTime,
    xpath: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    word1: Field::Text,
    word2: Field::Text,
    word3: Field::Text,
    upper: Field::Text,
    lower: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :url,
    :article_id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :url,
    :article_id,
    :date,
    :xpath,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :url,
    :article_id,
    :date,
    :xpath,
    :word1,
    :word2,
    :word3,
    :upper,
    :lower,
  ].freeze

  # Overwrite this method to customize how bots are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(bot)
  #   "Bot ##{bot.id}"
  # end
end
