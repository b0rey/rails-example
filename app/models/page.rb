class Page < ActiveRecord::Base
  validates :name, presence: true, format: { with: /\A[[[:alnum:]]_]+\z/, message: "[a-zA-Z0-9_], ДОПУСТИМЫ РУССКИЕ СИМВОЛЫ" }
  has_ancestry

  # Путь к текущему узлу
  # return: string
  def path
    result = "/"
    ancestors.each { |node|
      result += node.name + '/'
    }
    result += ( name || '' )
  end
end
