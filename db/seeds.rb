# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'candidatos_2018.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
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
  
  c.save
  puts "#{c.nome_urna}, #{c.partido} saved!"
end

puts "Agora existem #{Candidato.count} registros na tabela candidatos."
