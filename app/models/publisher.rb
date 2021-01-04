class Publisher < ApplicationRecord

  has_many :names,
    -> { where(namable_scope: :name) },
    class_name: Name.to_s,
    as: :namable,
    extend: NamesExtension
  has_many :abbreviations,
    -> { where(namable_scope: :abbreviation) },
    class_name: Name.to_s,
    as: :namable,
    extend: NamesExtension

  accepts_nested_attributes_for :names
  accepts_nested_attributes_for :abbreviations

  after_initialize do
    names.build_blanks
    abbreviations.build_blanks
  end

  before_validation do
    names.mark_blanks_for_destruction
    abbreviations.mark_blanks_for_destruction
  end

  validates :names,
    length: {
      minimum: 1
    }
  validates :url,
    url: { allow_nil: true }

end
