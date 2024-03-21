//
//  SearchViewController.swift
//  JobSearchApp
//
//  Created by Карина Дьячина on 18.03.24.
//

import UIKit

class SearchController: UIViewController {
    
    
    let sharedSession = URLSession.shared
    let url = URL(string: "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14")!
    var vacancies: [Vacancies] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isUserInteractionEnabled = true
        setupTableView()
        makeDataTask()
        getRequest()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        tableView.register(VacanciesTableViewCell.self, forCellReuseIdentifier: "VacanciesTableViewCell")
        tableView.reloadData()
    }
    
    func getRequest() {
        NetworkManager.performGetRequest(url: url) { [weak self] result in
            switch result {
            case .success(let vacancies):
                self?.vacancies = vacancies
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func makeDataTask() {
        let dataTask = sharedSession.dataTask(with: URLRequest(url: url), completionHandler: { [weak self] data,_,_ in
            do {
                if let data = data {
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(json)
                    
                    self?.vacancies = try JSONDecoder().decode([Vacancies].self, from: data)
                    
                    DispatchQueue.main.async { [weak self] in
                        self?.tableView.reloadData()
                    }
                } else {
                    print("error")
                }
            }catch {
                print(error)
            }
        })
        dataTask.resume()
    }
    
}
extension SearchController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacancies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VacanciesTableViewCell", for: indexPath) as! VacanciesTableViewCell
        cell.configure(vacancies: vacancies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
