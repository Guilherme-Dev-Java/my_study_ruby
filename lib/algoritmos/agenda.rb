@agenda = [
    {:nome => "Guilherme", :telefone => "99990707"},
    {:nome => "Antonio", :telefone => "99991002"}
    ]

def all_contacts
    @agenda.each do |contato|
        puts "#{contato[:nome]} - #{contato[:telefone]}"
        puts "---------------------------"
    end
    puts "_______________________________"
end

def adicionar_contato
    print "Digite o nome do contato: "
        nome = gets.chomp
    print "Digite o numero do telefone: "
        telefone = gets.chomp

    @agenda << {:nome => nome, :telefone => telefone}
end

def buscar_contato(nome)
         contato_encontrado = @agenda.find {|contato| contato[:nome] == nome}
            
        if contato_encontrado
            puts "#{contato_encontrado[:nome]} - #{contato_encontrado[:telefone]}"
        else
            puts "Contato não encontrado." 
        end  
        puts "---------------------------"
end

def editar_contato(nome)
   
    @agenda.each do |contato|
        if contato[:nome].downcase == (nome.downcase)
            print "Deseja Alterar o nome: (para manter o nome aperte enter)"
            nome_salvo = contato[:nome]
            
            contato[:nome]= gets.chomp
            contato[:nome]= contato[:nome].empty? ? nome_salvo : contato[:nome]
            
            print "Deseja Alterar o telefone: (para manter o telefone aperte enter)"
            telefone_salvo = contato[:telefone]
            
            contato[:telefone]= gets.chomp
            contato[:telefone]= contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
        end
    end
end

def remover_contato(nome)
    excluido = @agenda.reject! {|contato| contato[:nome].upcase == nome.upcase}
    if excluido
        puts "Contato removido com sucesso!"
    else
        puts "Contato não encontrado."
    end

end

loop do
   
    puts "1. Visualizar Agenda\n2. Adicionar Contato\n3. Buscar Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"
    opcao = gets.chomp.to_i 

    case
        when opcao == 0
            puts "Até Logo!"
        break
        when opcao == 1
            all_contacts
        when opcao == 2
            adicionar_contato
        when opcao == 3
            print "Qual o nome do contato deseja buscar: "
            nome = gets.chomp
            buscar_contato(nome)
        when opcao == 4
            print "Qual Contato deseja editar: "
            nome = gets.chomp
            editar_contato(nome)
        when opcao == 5
            print "Qual Contato deseja remover: "
            nome = gets.chomp
            remover_contato(nome)
        else
            puts "Opção inválida!"

    end
    
end