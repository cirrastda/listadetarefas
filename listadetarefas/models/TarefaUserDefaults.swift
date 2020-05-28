//
//  TarefaUserDefaults.swift
//  listadetarefas
//
//  Created by Anderson Matuchenko on 28/05/20.
//  Copyright © 2020 Anderson Matuchenko. All rights reserved.
//

import UIKit


class TarefaUserDefaults {
    let chave = "tarefas"
    func salvar(tarefa: String) {
        //
        var dados = self.listar()
        dados.append(tarefa)
        UserDefaults.standard.set(dados, forKey: chave)
    }
    
    func excluir(index: Int) {
        var dados = self.listar()
        dados.remove(at: index)
        UserDefaults.standard.set(dados, forKey: chave)
    }
    
    func listar() -> [String] {
        var dados: [String] = []
        if let tmpVar = UserDefaults.standard.object(forKey: chave) {
            dados = tmpVar as! [String]
        } else {
            dados = []
            //UserDefaults.standard.set(dados, forKey: "tarefas")
        }
        return dados
    }
}
