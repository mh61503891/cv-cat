# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_25_000010) do

  create_table "attachments", force: :cascade do |t|
    t.string "attachable_type"
    t.integer "attachable_id"
    t.string "content_type", null: false
    t.bigint "byte_size", null: false
    t.binary "blob", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable"
    t.index ["byte_size"], name: "index_attachments_on_byte_size"
    t.index ["content_type"], name: "index_attachments_on_content_type"
  end

  create_table "authors", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locales", force: :cascade do |t|
    t.string "value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["value"], name: "index_locales_on_value", unique: true
  end

  create_table "names", force: :cascade do |t|
    t.string "value", null: false
    t.string "locale", null: false
    t.string "namable_type"
    t.integer "namable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["locale"], name: "index_names_on_locale"
    t.index ["namable_type", "namable_id"], name: "index_names_on_namable"
    t.index ["value"], name: "index_names_on_value"
  end

  create_table "paper_authors", force: :cascade do |t|
    t.integer "paper_id", null: false
    t.integer "author_id", null: false
    t.integer "order", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_paper_authors_on_author_id"
    t.index ["paper_id", "author_id", "order"], name: "index_paper_authors_on_paper_id_and_author_id_and_order", unique: true
    t.index ["paper_id"], name: "index_paper_authors_on_paper_id"
  end

  create_table "paper_keywords", force: :cascade do |t|
    t.integer "paper_id", null: false
    t.integer "keyword_id", null: false
    t.integer "order", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["keyword_id"], name: "index_paper_keywords_on_keyword_id"
    t.index ["paper_id", "keyword_id", "order"], name: "index_paper_keywords_on_paper_id_and_keyword_id_and_order", unique: true
    t.index ["paper_id"], name: "index_paper_keywords_on_paper_id"
  end

  create_table "papers", force: :cascade do |t|
    t.integer "publication_id", null: false
    t.string "pages"
    t.string "page_from"
    t.string "page_to"
    t.string "volume"
    t.string "number"
    t.string "doi"
    t.integer "year"
    t.integer "month"
    t.integer "day"
    t.date "received_on"
    t.date "accepted_on"
    t.date "published_on"
    t.date "released_on"
    t.date "revised_on"
    t.integer "open_access", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accepted_on"], name: "index_papers_on_accepted_on"
    t.index ["day"], name: "index_papers_on_day"
    t.index ["doi"], name: "index_papers_on_doi"
    t.index ["month"], name: "index_papers_on_month"
    t.index ["number"], name: "index_papers_on_number"
    t.index ["open_access"], name: "index_papers_on_open_access"
    t.index ["page_from"], name: "index_papers_on_page_from"
    t.index ["page_to"], name: "index_papers_on_page_to"
    t.index ["pages"], name: "index_papers_on_pages"
    t.index ["publication_id"], name: "index_papers_on_publication_id"
    t.index ["published_on"], name: "index_papers_on_published_on"
    t.index ["received_on"], name: "index_papers_on_received_on"
    t.index ["released_on"], name: "index_papers_on_released_on"
    t.index ["revised_on"], name: "index_papers_on_revised_on"
    t.index ["volume"], name: "index_papers_on_volume"
    t.index ["year"], name: "index_papers_on_year"
  end

  create_table "publications", force: :cascade do |t|
    t.string "issn_online"
    t.string "issn_print"
    t.string "issn_linking"
    t.string "issn_electronic"
    t.integer "publisher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["issn_electronic"], name: "index_publications_on_issn_electronic"
    t.index ["issn_linking"], name: "index_publications_on_issn_linking"
    t.index ["issn_online"], name: "index_publications_on_issn_online"
    t.index ["issn_print"], name: "index_publications_on_issn_print"
    t.index ["publisher_id"], name: "index_publications_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "uri"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uri"], name: "index_publishers_on_uri"
  end

  create_table "texts", force: :cascade do |t|
    t.string "value", null: false
    t.string "locale", null: false
    t.string "textable_type"
    t.integer "textable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["locale"], name: "index_texts_on_locale"
    t.index ["textable_type", "textable_id"], name: "index_texts_on_textable"
    t.index ["value"], name: "index_texts_on_value"
  end

  add_foreign_key "paper_authors", "authors"
  add_foreign_key "paper_authors", "papers"
  add_foreign_key "paper_keywords", "keywords"
  add_foreign_key "paper_keywords", "papers"
  add_foreign_key "papers", "publications"
  add_foreign_key "publications", "publishers"
end
