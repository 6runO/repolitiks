# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
puts "Apagando registros anteriores..."
Declarado.delete_all
Marcado.delete_all
Candidato.delete_all

puts "Criando novos registros..."

# Seed dos candidatos
csv_text = File.read(Rails.root.join('lib', 'seeds', 'presidentes.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: "UTF-8")
csv.each do |row|
  c = Candidato.new
  c.cpf = row['CPF']
  c.nome_candidato = row['NOME_CANDIDATO']
  c.email = row['EMAIL']
  c.nascimento = row['NASCIMENTO']
  c.grau_instrucao = row['GRAU_INSTRUCAO']
  c.ocupacao = row['OCUPACAO']
  c.partido = row['PARTIDO']
  c.cargo = row['CARGO']
  c.estado = row['ESTADO']
  c.nome_urna = row['NOME_URNA']
  c.ano_eleicao = row['ANO_ELEICAO']
  c.status_eleicao = row['ELEITO']
  c.sexo = row['SEXO']
  c.sq_candidato = row['SQ_CANDIDATO']

  # # Seed das fotos
  foto = row['SQ_CANDIDATO']
  file = "app/assets/images/fotos_2018/#{foto}.jpg"

  if File.exist?(file)
    file_open = File.open(file)
    c.photo.attach(io: file_open, filename: "#{foto}.jpg")
  else
    c.photo.attach(io: File.open("app/assets/images/foto_padrao.jpg"), filename: "foto_padrao.jpg")
  end

  # # Seed das propostas
  pdf = row['SQ_CANDIDATO']
  file_proposta = "app/assets/documents/Propostas_2018/#{pdf}.pdf"

  if File.exist?(file_proposta)
    proposta_open = File.open(file_proposta)
    c.proposta.attach(io: proposta_open, filename: "#{pdf}.pdf")
  end

  # Salvando seeds
  c.save!
  puts "#{c.nome_urna}, #{c.partido} saved!"
end

puts "Agora existem #{Candidato.count} registros na tabela candidatos."

# Seed dos bens
csv_text = File.read(Rails.root.join('lib', 'seeds', 'bem_candidato_2018.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: "UTF-8")
csv.each do |row|
  bem = Declarado.new
  bem.tipo = row['TIPO_BEM']
  bem.valor = row['BEM_VALOR'].to_f
  r_sq = row['SQ_CANDIDATO']
  bem.sq_candidato = r_sq
  candidato = Candidato.find_by(sq_candidato: r_sq)

  unless candidato.nil?
    bem.candidato = Candidato.find_by(sq_candidato: r_sq)
    bem.save!
    puts "Bens salvos"
  end
end
