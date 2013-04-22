# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130422144129) do

  create_table "cursos", :force => true do |t|
    t.string   "nombre"
    t.string   "ficha"
    t.integer  "instructor_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "cursos", ["instructor_id"], :name => "index_cursos_on_instructor_id"

  create_table "estudiantes", :force => true do |t|
    t.string   "nombre"
    t.string   "cedula"
    t.string   "email"
    t.string   "direccion"
    t.date     "fcha_nacimineto"
    t.integer  "curso_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "estudiantes", ["curso_id"], :name => "index_estudiantes_on_curso_id"

  create_table "horarios", :force => true do |t|
    t.string   "job_horario_no",        :default => "1000"
    t.string   "deliver"
    t.string   "version"
    t.string   "onsite_review_close"
    t.string   "agency_review_close"
    t.date     "expected_deliver_date"
    t.string   "quote_values"
    t.date     "fecha"
    t.time     "hora"
    t.string   "aula"
    t.integer  "materia_id"
    t.integer  "curso_id"
    t.integer  "instructor_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "horarios", ["curso_id"], :name => "index_horarios_on_curso_id"
  add_index "horarios", ["instructor_id"], :name => "index_horarios_on_instructor_id"
  add_index "horarios", ["materia_id"], :name => "index_horarios_on_materia_id"

  create_table "instructores", :force => true do |t|
    t.string   "nombre"
    t.string   "cedula"
    t.string   "email"
    t.string   "direccion"
    t.integer  "materia_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "instructores", ["materia_id"], :name => "index_instructores_on_materia_id"

  create_table "materias", :force => true do |t|
    t.string   "nombre"
    t.string   "sigla"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ubicaciones", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

end
