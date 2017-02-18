class SearchForm
  include ActiveModel::Model
  attr_accessor  :name, :url, :article_id, :date
  
  ##部分一致させる
  def contains(arel_attribute, value)
    arel_attribute.matches("%#{escape_like(value)}%")
  end
  
  def bot_search(str)
    Bot.where("name like '%" + str + "%'  OR url like '%" + str + "%'  OR article_id like '%" + str + "%'  OR date like '%" + str + "%'") if name.present?
  end
  
end