//
//  AdicionarViewController.swift
//  listadetarefas
//
//  Created by Anderson Matuchenko on 27/05/20.
//  Copyright © 2020 Anderson Matuchenko. All rights reserved.
//

import UIKit

class AdicionarViewController: UIViewController {

    @IBOutlet weak var txtTarefa: UITextField!
    var dados: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAdicionar_Click(_ sender: Any) {
        if let texto = txtTarefa.text {
            if texto != "" {
                let tarefa = TarefaUserDefaults()
                tarefa.salvar(tarefa: texto)
                txtTarefa.text = ""
                return
            }
        }
        showAlert(titulo: "Alerta", mensagem: "Texto não informado")

    }
    
    func showAlert(titulo: String, mensagem: String) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alerta, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
