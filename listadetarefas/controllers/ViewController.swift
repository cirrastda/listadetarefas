//
//  ViewController.swift
//  listadetarefas
//
//  Created by Anderson Matuchenko on 27/05/20.
//  Copyright © 2020 Anderson Matuchenko. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var dados: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        reloadList()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="segueAdicionar" {
            let view = segue.destination as! AdicionarViewController;
            view.dados = self.dados
        }
        
    }
 
    func reloadList() {
        let tarefas = TarefaUserDefaults()
        dados  = tarefas.listar()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            
            TarefaUserDefaults().excluir(index: indexPath.row)
            self.reloadList()
        }
    }
    
       
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaTarefa = "cellTarefa"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaTarefa, for: indexPath)
        
        celula.textLabel?.text = dados[indexPath.row]
        return celula
    }

}

