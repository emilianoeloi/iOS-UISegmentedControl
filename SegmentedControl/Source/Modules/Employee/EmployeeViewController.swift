//
//  EmployeeViewController.swift
//  SegmentedControl
//
//  Created by Emiliano Barbosa on 16/05/21.
//

import UIKit

class EmployeeViewController: UIViewController {
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        encoder.keyEncodingStrategy = .convertToSnakeCase
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let employee = Employee(id: 0, name: "Emiliano", favoriteToy: Toy(id: 0, name: "Carrinho"))
        do {
            let data = try encoder.encode(employee)
            
            let string = String(data: data, encoding: .utf8)

            let sameEmployee = try decoder.decode(Employee.self, from: data)
        } catch {
            
        }
        
        

        
        // Do any additional setup after loading the view.
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
